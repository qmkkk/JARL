"""One fixed pass of state-conditioned joint LUT6_2 resynthesis.
Full input-domain context generation is experimental, not a scalability claim.
"""
import csv,time,copy,json,random
from common17 import Q,R,load,dump,build,base_code,reference
import core
from configure17 import configure
from oracle17 import values,query
core.Q=Q

def context(c,g,seedops,ops,co,ins,nn,p,pi):
 n=c['name'];path=Q/f'results/{n}_current_pair{pi}.csv';src=Q/f'src/{n}_current_pair{pi}.cpp';assert not path.exists()and not src.exists()
 ancestry={x:set()for x in set(co)|set(ins)}
 for op in ops:ancestry[op['out']]=set(op['ins'])|set().union(*(ancestry[x]for x in op['ins']))
 roots={p['a_out'],p['b_out']}
 if any(x in roots or roots&ancestry[x]for x in p['support']):return None,dict(status='DEPENDENT_SUPPORT_REJECTED')
 s,*_=base_code(c,g);s+=[core.emit_ops(seedops,co,'seed_reference'),core.force_eval(ops,co)]
 s.append('static const int support[]={'+','.join(map(str,p['support']))+'};')
 s.append(f'constexpr int K={len(p["support"])},S=1<<K,AOUT={p["a_out"]},BOUT={p["b_out"]};constexpr I BUDGET={c["budget"]};')
 s.append(r'''
int main(){U v[NN],orig[NN];uint32_t out[64],seed[64];I lo[4][256],hi[4][256],dl[4][256],dh[4][256];U count[256]={};
for(int q=0;q<4;q++)for(int r=0;r<S;r++){lo[q][r]=dl[q][r]=INT64_MAX;hi[q][r]=dh[q][r]=INT64_MIN;}
for(U base=0;base<N;base+=64){inputs(orig,base);seed_reference(orig);unpack(orig,seed);inputs(orig,base);original(orig);unpack(orig,out);int rows[64]={};
 for(int j=0;j<64;j++){U a,b,l,h;reference(base+j,a,b,l,h);if(seed[j]!=seed_expected(a,b,l))return 3;if(std::abs(I(out[j])-I(l))>BUDGET)return 4;}
 for(int k=0;k<K;k++){U b=orig[support[k]];while(b){int j=__builtin_ctzll(b);rows[j]|=1<<k;b&=b-1;}}
 for(int j=0;j<64;j++)count[rows[j]]++;
 for(int q=0;q<4;q++){inputs(v,base);original(v,AOUT,BOUT,q);unpack(v,out);
  for(int j=0;j<64;j++){U a,b,l,h;reference(base+j,a,b,l,h);int r=rows[j];I e=I(out[j])-I(l),d=I(out[j])-I(seed[j]);lo[q][r]=std::min(lo[q][r],e);hi[q][r]=std::max(hi[q][r],e);dl[q][r]=std::min(dl[q][r],d);dh[q][r]=std::max(dh[q][r],d);}}
}
std::cout<<"row,count,q,error_lo,error_hi,seed_error_lo,seed_error_hi\n";
for(int r=0;r<S;r++)if(count[r])for(int q=0;q<4;q++)std::cout<<r<<","<<count[r]<<","<<q<<","<<lo[q][r]<<","<<hi[q][r]<<","<<dl[q][r]<<","<<dh[q][r]<<"\n";
return 0;}
''')
 src.write_text('\n'.join(s));t=time.perf_counter();core.native(src,[],path);table={(int(x['row']),int(x['q'])):{k:int(v)for k,v in x.items()}for x in csv.DictReader(path.open())};N=1<<c['domain_bits'];assert sum(x['count']for(r,q),x in table.items()if q==0)==N
 rng=random.Random(20261016+pi);probes={0,1,N//2,N-1};probes.update(rng.randrange(N)for _ in range(4));checked=0
 for x in sorted(probes):
  a,b=(x&65535,x>>16)if c['kind']=='sqrt'else(x&((1<<c['width'])-1),x>>c['width'])
  val,yy=values(g,ops,co,ins,nn,a,b);row=sum(val[n]<<k for k,n in enumerate(p['support']));ref=reference(c,a,b);assert abs(yy-ref)<=c['budget']
  for q in range(4):
   _,y=values(g,ops,co,ins,nn,a,b,{p['a_out']:q&1,p['b_out']:q>>1});e=y-ref;rec=table[(row,q)];assert rec['error_lo']<=e<=rec['error_hi'];checked+=1
 return path,dict(status='FULL_DOMAIN',input_count=N,forced_output_evaluations=4*N,reachable_rows=len(table)//4,independent_scalar_probes=checked,wall_with_compile_s=time.perf_counter()-t,path=str(path))

def run_case(c):
 n=c['name'];st=time.perf_counter();g=load(Q/f'graphs/{n}_seed.json');seedops,co,ins,nn,_=build(g);current=seedops;pairs=load(Q/f'graphs/{n}_pairs.json');records=load(Q/f'results/{n}_methods.json');selected=load(Q/f'state/{n}_replay_manifest.json')[0]['choices'];accepted=[];history=[];checks=[]
 assert len(selected)<=40
 used=set()
 for pi,_ in selected:
  p=pairs[pi];assert not used&{p['a'],p['b']};used.update([p['a'],p['b']]);dump(Q/'state/progress.json',dict(phase='STATE_CONDITIONED_RELATION',case=n,pair=pi,completed=len(history),planned=len(selected)))
  path,ctx=context(c,g,seedops,current,co,ins,nn,p,pi);ev=dict(pair=pi,context=ctx)
  if path is None:ev['status']='DEPENDENT_SUPPORT_REJECTED'
  else:
   t=time.perf_counter();mm,diag=configure(p,path,current,g,c['budget']);cf=mm['numeric_window'];ev.update(solve_seconds=time.perf_counter()-t,diagnostic=diag,configuration=cf)
   if cf is None:ev['status']='NO_FEASIBLE_COMPLETION'
   else:
    changed=core.reorder(core.replace_ops(current,p,cf),set(co)|set(ins))
    if changed is None:ev['status']='CYCLIC_PROPOSAL'
    else:
     rec=query(c,g,changed,len(checks));checks.append(dict(rec,pair=pi));ev['full_check']=rec
     assert rec['WCE']<=c['budget'],('FULL_CONTEXT_CONTRACT_FAILURE',n,pi,rec)
     current=changed;accepted.append([pi,'state_window']);records[pi]['methods']['state_window']=copy.deepcopy(cf);ev['status']='ACCEPTED'
  history.append(ev);dump(Q/f'state/{n}_state_partial.json',dict(case=n,history=history,accepted=accepted,checks=checks));print(n,pi,ev['status'],flush=True)
 final=query(c,g,current,len(checks));checks.append(dict(final,stage='final'));assert final['WCE']<=c['budget'];dump(Q/f'results/{n}_methods.json',records)
 dump(Q/f'state/{n}_state.json',dict(case=n,status='COMPLETE',accepted=accepted,history=history,checks=checks,final=final,seconds=time.perf_counter()-st,context_input_count=sum(h['context'].get('input_count',0)for h in history),forced_output_evaluations=sum(h['context'].get('forced_output_evaluations',0)for h in history),independent_scalar_probes=sum(h['context'].get('independent_scalar_probes',0)for h in history)))
 print('STATE_CASE_COMPLETE',n,flush=True)

if __name__=='__main__':
 for c in load(Q/'configs/plan.json')['cases']:run_case(c)
 dump(Q/'state/progress.json',dict(phase='ALL_STATE_SEARCHES_COMPLETE'))
