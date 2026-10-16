"""Structural packing opportunity for relation-legal configurations.
This is a bounded proxy, not a model of Vivado placement optimality.
"""
from pathlib import Path
import sys,itertools,json,time
sys.dont_write_bytecode=True
Q=Path(__file__).resolve().parents[1];R=Q.parent
sys.path.insert(0,str(R/'tools'))
import core
import networkx as nx
import numpy as np
CACHE={}

def compatible(a,b):
 sa,sb=set(a['ins']),set(b['ins']);u=sa|sb
 if len(u)<=5:return True
 if len(u)!=6:return False
 for six,five in [(a,b),(b,a)]:
  if six['k']!=6 or five['k']>5:continue
  for sel in set(six['ins'])-set(five['ins']):
   leaves=sorted(u-{sel});good=True
   for row in range(32):
    vals={x:(row>>i)&1 for i,x in enumerate(leaves)};vals[sel]=0
    av=(six['init']>>sum(vals[x]<<i for i,x in enumerate(six['ins'])))&1
    bv=(five['init']>>sum(vals[x]<<i for i,x in enumerate(five['ins'])))&1
    if av!=bv:good=False;break
   if good:return True
 return False

def packed_cost(ops,g,fixed=()):
 eff=core.effective_ops(ops);by={o['out']:o for o in eff};live=set();todo=[v for k,v in g['ports'].items()if k.startswith('Y[')]
 while todo:
  n=todo.pop()
  if n in live:continue
  live.add(n)
  if n in by:todo.extend(by[n]['ins'])
 eff=[o for o in eff if o['out']in live]
 lut={o['out']:o for o in eff if o['typ']=='lut'and o['k']>=2}
 fixed=tuple(sorted(tuple(sorted(p))for p in fixed if all(x in lut for x in p)))
 key=(tuple((o['out'],o['typ'],tuple(o['ins']),o.get('init',0))for o in eff),fixed)
 if key in CACHE:return CACHE[key]
 D=nx.DiGraph()
 for o in eff:
  D.add_node(o['out']);D.add_edges_from((i,o['out'])for i in o['ins'])
 assert nx.is_directed_acyclic_graph(D)
 anc={}
 for n in nx.topological_sort(D):anc[n]=set(D.predecessors(n)).union(*(anc[x]for x in D.predecessors(n)))
 reserved=set(x for p in fixed for x in p);assert len(reserved)==2*len(fixed)
 free=sorted(set(lut)-reserved);G=nx.Graph();G.add_nodes_from(free)
 for a,b in itertools.combinations(free,2):
  if a in anc[b]or b in anc[a]:continue
  if compatible(lut[a],lut[b]):G.add_edge(a,b,weight=1000+len(set(lut[a]['ins'])&set(lut[b]['ins'])))
 match=sorted(tuple(sorted(p))for p in nx.max_weight_matching(G,maxcardinality=True))
 while True:
  groups=fixed+tuple(match);owner={n:('pair',i)for i,p in enumerate(groups)for n in p}
  C=nx.DiGraph();C.add_edges_from((owner.get(u,u),owner.get(v,v))for u,v in D.edges()if owner.get(u,u)!=owner.get(v,v))
  bad=[s for s in nx.strongly_connected_components(C)if len(s)>1]
  if not bad:break
  nodes=set().union(*bad);remove=[p for i,p in enumerate(match)if ('pair',len(fixed)+i)in nodes]
  if not remove:
   result=(10**9,len(lut),sum(o['k']for o in lut.values()));CACHE[key]=result;return result
  p=min(remove,key=lambda p:(G.edges[p]['weight'],-p[0],-p[1]));match.remove(p)
 result=(len(lut)-len(fixed)-len(match),len(lut),sum(o['k']for o in lut.values()));CACHE[key]=result
 return result

def rank(ops,g,p,cf):
 new=core.replace_ops(ops,p,cf)
 return packed_cost(new,g,[(p['a_out'],p['b_out'])])

def complete(cf,cc,hh,bound,ops,g,p):
 allowed=cc<=bound;configs={}
 def keep(q):
  a=sum(int(v&1)<<r for r,v in enumerate(q));b=sum(int(v>>1)<<r for r,v in enumerate(q));w=int(cc[np.arange(32),q].max());hd=int(hh[np.arange(32),q].sum())
  configs[a,b]=dict(cf,initA=f'{a:08x}',initB=f'{b:08x}',wce=w,local_hd=hd)
 for ma,mb in itertools.product(range(32),repeat=2):
  for reverse in [False,True]:
   q=core.sat_assignment(allowed,ma,mb,reverse)
   if q is not None:keep(q)
 for x in [cf,core.common_complete(cf,cc,hh,bound)]:
  if x is not None:configs[int(x['initA'],16),int(x['initB'],16)]=x
 shortlist=sorted(configs.values(),key=lambda x:(core.structural_score(ops,g,p,x),x['wce'],x['local_hd'],x['initA'],x['initB']))[:24]
 best=min(shortlist,key=lambda x:(rank(ops,g,p,x),x['wce'],x['local_hd'],x['initA'],x['initB']))
 return dict(best,packing_proxy=list(rank(ops,g,p,best)),distinct_completions=len(configs),packing_scored_completions=len(shortlist))

def select(c,ops,co,ins,pairs,records,method,g):
 st=time.perf_counter();new=ops;fixed=[];selected=[];used=set();rejected=set();by={o['name']:o for o in ops};trace=[]
 pool={r['pair']for r in records if r['methods'][method]is not None}
 initial=packed_cost(new,g)
 while pool:
  current=packed_cost(new,g,fixed);candidates=[]
  for pi in sorted(pool):
   p=pairs[pi]
   if p['a']in used or p['b']in used:continue
   cf=records[pi]['methods'][method];changed=core.replace_ops(new,p,cf)
   union=[dict(o,ins=sorted(set(o['ins'])|set(by[o['name']]['ins'])))for o in changed]
   if core.reorder(union,set(co)|set(ins))is None:rejected.add(pi);continue
   fp=fixed+[(p['a_out'],p['b_out'])];cost=packed_cost(changed,g,fp)
   if cost<current:candidates.append((cost,pi,changed,fp))
  if not candidates:break
  cost,pi,new,fixed=min(candidates,key=lambda x:(x[0],x[1]));p=pairs[pi];used.update([p['a'],p['b']]);pool.remove(pi);selected.append((pi,method));trace.append(dict(pair=pi,before=list(current),after=list(cost)))
 core.dump(Q/f'state/{c["name"]}_packing_selection.json',dict(initial=list(initial),final=list(packed_cost(new,g,fixed)),selected=selected,trace=trace,seconds=time.perf_counter()-st,cache_entries=len(CACHE),scope='Pre-error-admission structural selection; physical truth is measured later'))
 return selected,sorted(rejected)

def finite_checks():
 def lut(n,ins,init=None):return dict(name=str(n),out=n,ins=ins,typ='lut',k=len(ins),init=sum((r.bit_count()%2)<<r for r in range(1<<len(ins)))if init is None else init)
 def g(ops):return dict(ports={f'Y[{i}]':o['out']for i,o in enumerate(ops)})
 checks=[]
 a=lut(20,list(range(5)));b=lut(21,list(range(5)),1)
 assert packed_cost([a,b],g([a,b]))[0]==1;checks.append('two5_shared=one_site')
 b=lut(21,list(range(5,10)));assert packed_cost([a,b],g([a,b]))[0]==2;checks.append('disjoint5=two_sites')
 a=lut(20,list(range(6)));b=lut(21,list(range(5)))
 assert packed_cost([a,b],g([a,b]))[0]==1;checks.append('six_xor_zero_cofactor_matches_five')
 b=lut(21,list(range(5)),1<<31);assert packed_cost([a,b],g([a,b]))[0]==2;checks.append('incompatible_cofactor_not_packed')
 ops=[lut(20,[0,1,2,3,4]),lut(21,[0,1,2,3]),lut(22,[1,2,3,5]),lut(23,[1,2,3,5,6])]
 assert packed_cost(ops,g(ops))[0]==2 and packed_cost(ops,g(ops),[(21,22)])[0]==3;checks.append('forcing_middle_pair_displaces_two_matches')
 core.dump(Q/'state/packing_oracle_checks.json',dict(status='PASS',checks=checks,scope='Five hand-derived correctness checks of the structural cost, not performance experiments'))
 print('PACKING_ORACLE_PASS',len(checks),flush=True)
if __name__=='__main__':finite_checks()
