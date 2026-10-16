"""Bounded witness-guided regeneration of the joint LUT6_2 function.
Original source contexts are proposals only. Every admission is checked over
the full effective input domain. No physical metrics enter this search.
"""
from pathlib import Path
import sys,json,csv,time,copy
sys.dont_write_bytecode=True
from common14 import Q,R,load,dump,build,base_code,reference
import core
from configure14 import configure
core.Q=Q

def values(g,ops,co,ins,nn,a,b,forced=None):
 v=[0]*nn;forced=forced or {}
 for n,val in co.items():v[n]=val
 for n,name in ins.items():v[n]=((a if name[0]=='A'else b)>>int(name[2:-1]))&1
 for op in ops:
  x=[v[n]for n in op['ins']];t=op['typ']
  if t=='lut':z=(op['init']>>sum(q<<j for j,q in enumerate(x)))&1
  elif t=='or':z=x[0]|x[1]
  elif t=='andnot':z=x[0]&(1-x[1])
  elif t=='xor':z=x[0]^x[1]
  elif t=='not':z=1-x[0]
  elif t=='mux':z=x[2]if x[0]else x[1]
  else:raise ValueError(t)
  v[op['out']]=forced.get(op['out'],z)
 return v,sum(v[g['ports'][f'Y[{i}]']]<<i for i in range(32))

def query(c,g,ops,index):
 n=c['name'];src=Q/f'src/{n}_q{index:03d}.cpp';out=Q/f'results/{n}_q{index:03d}.csv';assert not src.exists()and not out.exists()
 s,_,co,ins,nn,_=base_code(c,g);s.append(core.emit_ops(ops,co,'candidate'))
 s.append(r'''
int main(){U v[NN],wa=0,wb=0,wy=0;uint32_t out[64];I wce=-1;long double sae=0;
for(U base=0;base<N;base+=64){inputs(v,base);candidate(v);unpack(v,out);
for(int j=0;j<64;j++){U a,b,l,h;reference(base+j,a,b,l,h);I e=std::max(std::abs(I(out[j])-I(l)),std::abs(I(out[j])-I(h)));sae+=std::abs(I(out[j])-I(l));if(e>wce){wce=e;wa=a;wb=b;wy=out[j];}}}
std::cout<<"inputs,WCE,witness_A,witness_B,witness_Y,MAE\n"<<N<<","<<wce<<","<<wa<<","<<wb<<","<<wy<<","<<double(sae/N)<<std::endl;return 0;}
''')
 src.write_text('\n'.join(s));st=time.perf_counter();core.native(src,[],out);v=next(csv.DictReader(out.open()));rec={k:float(x)if k=='MAE'else int(x)for k,x in v.items()};rec.update(query=index,wall_with_compile_s=time.perf_counter()-st,source=str(src),result=str(out));return rec

def signature(cf):return tuple(cf['shared']),cf['select'],cf['mode'],cf['initA'],cf['initB']

def run_case(c):
 n=c['name'];st=time.perf_counter();g=load(Q/f'graphs/{n}.json');ops,co,ins,nn,_=build(g);current=ops;pairs=load(Q/f'graphs/{n}_pairs.json');records=load(Q/f'results/{n}_methods.json');selected=load(Q/f'state/{n}_replay_manifest.json')[0]['choices'];accepted=[];history=[];checks=[];refinements=0;lim=load(Q/'configs/plan.json')['limits']
 for pi,_ in selected:
  p=pairs[pi];cf=copy.deepcopy(records[pi]['methods']['numeric_window']);table={(int(x['row']),int(x['q'])):{k:int(v)for k,v in x.items()}for x in csv.DictReader((Q/f'results/{n}_pair{pi}.csv').open())};seen=set();events=[];status='REJECTED';initial=signature(cf)
  for attempt in range(lim['refinements_per_pair']+1):
   if cf is None:status='NO_PROPOSAL';break
   sig=signature(cf)
   if sig in seen:status='REPEATED_PROPOSAL';break
   seen.add(sig);changed=core.reorder(core.replace_ops(current,p,cf),set(co)|set(ins))
   if changed is None:status='CYCLIC_PROPOSAL';break
   assert len(checks)<lim['full_checks_per_case_max']
   dump(Q/'state/progress.json',dict(phase='WITNESS_REPAIR',case=n,pair=pi,attempt=attempt,full_checks=len(checks),refinements=refinements))
   rec=query(c,g,changed,len(checks));checks.append(dict(rec,pair=pi,attempt=attempt));ev=dict(attempt=attempt,configuration=cf,full_check=rec);events.append(ev)
   if rec['WCE']<=c['budget']:
    current=changed;accepted.append([pi,'repair_window']);records[pi]['methods']['repair_window']=cf;status='ACCEPTED_REPAIRED'if sig!=initial else'ACCEPTED_ORIGINAL';break
   a,b=rec['witness_A'],rec['witness_B'];basevals,basey=values(g,current,co,ins,nn,a,b);cv,cy=values(g,changed,co,ins,nn,a,b);assert cy==rec['witness_Y'];ref=reference(c,a,b);assert abs(cy-ref)==rec['WCE']
   row=sum(basevals[x]<<i for i,x in enumerate(p['support']));chosen_q=cv[p['a_out']]+2*cv[p['b_out']];out4=[values(g,current,co,ins,nn,a,b,{p['a_out']:q&1,p['b_out']:q>>1})[1]for q in range(4)];assert out4[chosen_q]==cy
   ev['witness']=dict(A=a,B=b,reference=ref,base_output=basey,support_row=row,selected_q=chosen_q,joint_outputs=out4,forbidden_q=[q for q,y in enumerate(out4)if abs(y-ref)>c['budget']],independent_scalar_matches_native=True)
   if attempt==lim['refinements_per_pair']or refinements==lim['refinements_per_case']:status='REJECTED_FINITE_CAP';break
   seed=core.scalar(g,ops,co,ins,nn,a,b)
   for q,y in enumerate(out4):
    e=y-ref;d=y-seed;key=(row,q)
    if key in table:
     x=table[key];x.update(count=x['count']+1,error_lo=min(x['error_lo'],e),error_hi=max(x['error_hi'],e),seed_error_lo=min(x['seed_error_lo'],d),seed_error_hi=max(x['seed_error_hi'],d))
    else:table[key]=dict(row=row,count=1,q=q,error_lo=e,error_hi=e,seed_error_lo=d,seed_error_hi=d)
   path=Q/f'results/{n}_refine_pair{pi}_{attempt+1}.csv';assert not path.exists()
   with path.open('w',newline='')as f:
    w=csv.DictWriter(f,fieldnames=['row','count','q','error_lo','error_hi','seed_error_lo','seed_error_hi']);w.writeheader();w.writerows(table[k]for k in sorted(table))
   t=time.perf_counter();mm,diag=configure(p,path,current,g,c['budget']);cf=mm['numeric_window'];ev['regeneration']=dict(seconds=time.perf_counter()-t,context=str(path),diagnostic=diag);refinements+=1
  history.append(dict(pair=pi,status=status,attempts=events));dump(Q/f'state/{n}_repair_partial.json',dict(case=n,history=history,accepted=accepted,refinements=refinements,checks=checks));print(n,pi,status,'checks',len(events),flush=True)
 final=query(c,g,current,len(checks));assert final['WCE']<=c['budget'];checks.append(dict(final,stage='final'));dump(Q/f'results/{n}_methods.json',records)
 result=dict(case=n,status='COMPLETE',accepted=accepted,history=history,refinements=refinements,checks=checks,final=final,seconds=time.perf_counter()-st,recovered=sum(h['status']=='ACCEPTED_REPAIRED'for h in history),scope='Historical sample proposal constraints plus current-circuit witness constraints; bounded synthesis, fresh full-domain admission after every accepted edit')
 dump(Q/f'state/{n}_repair.json',result);print('REPAIR_CASE_COMPLETE',n,flush=True)

if __name__=='__main__':
 for c in load(Q/'configs/plan.json')['cases']:run_case(c)
 dump(Q/'state/progress.json',dict(phase='ALL_FIVE_REPAIR_SEARCHES_COMPLETE'))
