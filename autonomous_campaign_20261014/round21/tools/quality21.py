"""One registered fixed-support quality pass; no new topology search."""
from common21 import Q,R,load,dump,build,base_code,reference
import core,csv,copy,time,random,sys
from oracle21 import values
from stats21 import stats
from candidate_quality_tables import optimize_half_tables
from quality_context_codegen import tail


def run_case(c):
 n=c['name'];g=load(Q/f'graphs/{n}_seed.json');seedops,co,ins,nn,_=build(g);pairs=load(Q/f'graphs/{n}_pairs.json');records=load(Q/f'results/{n}_methods.json');selected=load(Q/f'state/{n}_state_window_state.json')['accepted'];current=seedops
 for pi,m in selected:current=core.replace_ops(current,pairs[pi],records[pi]['methods'][m])
 current=core.reorder(current,set(co)|set(ins));assert current is not None
 last=stats(c,g,current,'quality_initial');initial=last;history=[];choices=[];start=time.perf_counter()
 for ordinal,(pi,m)in enumerate(selected):
  p=pairs[pi];cf=copy.deepcopy(records[pi]['methods'][m]);entry=dict(pair=pi,ordinal=ordinal,old_configuration=cf)
  ancestry={x:set()for x in set(co)|set(ins)}
  for op in current:ancestry[op['out']]=set(op['ins'])|set().union(*(ancestry[x]for x in op['ins']))
  roots={p['a_out'],p['b_out']};assert not any(x in roots or roots&ancestry[x]for x in p['support'])
  dump(Q/'state/progress.json',dict(phase='QUALITY_COMPLETION',case=n,window=ordinal,planned=len(selected)))
  src=Q/f'src/{n}_quality_context{ordinal}.cpp';out=Q/f'results/{n}_quality_context{ordinal}.csv';assert not src.exists()
  s=base_code(c,g)[0]+['#include <string>',core.force_eval(current,co),tail(p['support'],p['a_out'],p['b_out'],c['budget'])]
  src.write_text('\n'.join(s));core.native(src,[],out)
  table={(int(row['row']),int(row['q'])):{k:int(v)for k,v in row.items()}for row in csv.DictReader(out.open())}
  assert sum(r['count']for (row,q),r in table.items()if q==0)==1<<c['domain_bits']
  probes={0,1,(1<<c['domain_bits'])-1};rng=random.Random(20261015+pi);probes.update(rng.randrange(1<<c['domain_bits'])for _ in range(5))
  for x in probes:
   a=x&((1<<c['width'])-1);b=x>>c['width'];v,_=values(g,current,co,ins,nn,a,b);row=sum(v[net]<<j for j,net in enumerate(p['support']))
   for q in range(4):
    _,y=values(g,current,co,ins,nn,a,b,{p['a_out']:q&1,p['b_out']:q>>1});err=y-reference(c,a,b);rec=table[row,q];assert rec['error_lo']<=err<=rec['error_hi']
  cc=[[0]*4 for _ in range(32)];costs=[[0]*4 for _ in range(32)]
  for row in range(1<<len(p['support'])):
   nets={net:(row>>i)&1 for i,net in enumerate(p['support'])};idx=sum(nets[x]<<i for i,x in enumerate(cf['shared']));selector=1 if cf['select']is None else nets[cf['select']]
   for ab in range(4):
    aa,bb=ab&1,ab>>1;six=aa if selector else bb;q=six+2*bb if cf['mode']=='f6'else bb+2*six
    if(row,q)in table:
     r=table[row,q];cc[idx][ab]=max(cc[idx][ab],abs(r['error_lo']),abs(r['error_hi']));costs[idx][ab]+=r['SSE']
  incumbent=[((int(cf['initA'],16)>>r)&1)+2*((int(cf['initB'],16)>>r)&1)for r in range(32)]
  solved=optimize_half_tables(cc,costs,c['budget'],core.deps(int(cf['initA'],16)),core.deps(int(cf['initB'],16)),incumbent)
  assert solved['incumbent_cost']==last['SSE'],('CONTEXT_INCUMBENT_MISMATCH',n,pi,solved['incumbent_cost'],last['SSE'])
  entry.update(context=str(out),solver=solved,scalar_forced_checks=4*len(probes));chosen=cf
  if solved['status']=='NON_ORIENTABLE':entry['status']='KEEP_NON_ORIENTABLE'
  elif not solved['improved']:entry['status']='KEEP_ALREADY_OPTIMAL_FIXED_ENERGY'
  else:
   newcf=dict(cf,initA=solved['initA'],initB=solved['initB'],wce=max(cc[r][q]for r,q in enumerate(solved['q'])),quality_objective='full_domain_SSE',fixed_support=True)
   oldproxy=core.structural_score(current,g,p,cf);newproxy=core.structural_score(current,g,p,newcf);entry.update(old_proxy=list(oldproxy),new_proxy=list(newproxy))
   if newproxy>oldproxy:entry['status']='KEEP_PROXY_INCREASE'
   else:
    changed=core.reorder(core.replace_ops(current,p,newcf),set(co)|set(ins));assert changed is not None
    checked=stats(c,g,changed,f'quality_accept{ordinal}');assert checked['SSE']==solved['cost'] and checked['SSE']<last['SSE'];assert checked['WCE']<=c['budget']
    current=changed;last=checked;chosen=newcf;entry.update(status='ACCEPTED_QUALITY',full_check=checked)
  records[pi]['methods']['quality_window']=copy.deepcopy(chosen);choices.append([pi,'quality_window']);history.append(entry)
  dump(Q/f'state/{n}_quality_partial.json',dict(initial=initial,history=history,current=last));print(n,pi,entry['status'],flush=True)
 final=stats(c,g,current,'quality_final');assert final['SSE']<=initial['SSE'];dump(Q/f'results/{n}_methods.json',records)
 dump(Q/f'state/{n}_quality_window_state.json',dict(status='COMPLETE',case=n,initial=initial,final=final,accepted=choices,quality_changes=sum(h['status']=='ACCEPTED_QUALITY'for h in history),history=history,seconds=time.perf_counter()-start))
 print('QUALITY_CASE_COMPLETE',n,flush=True)

if __name__=='__main__':run_case(next(c for c in load(Q/'configs/plan.json')['cases']if c['name']==sys.argv[1]))
