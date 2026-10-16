"""Post-hoc diagnostic of ideal exact dual-output packing; not a new method run."""
from core2 import Q,R,load,dump,build,replace_ops,reorder,truth,np,nx
from core import effective_ops
import itertools
def pack(ops,g,co,ins):
 ops=effective_ops(ops);drivers={o['out']:o for o in ops};live=set();stack=[v for k,v in g['ports'].items()if k.startswith('Y[')]
 while stack:
  n=stack.pop()
  if n in live:continue
  live.add(n)
  if n in drivers:stack.extend(drivers[n]['ins'])
 ordered=reorder(ops,set(co)|set(ins));anc={n:set()for n in set(co)|set(ins)}
 for o in ordered:anc[o['out']]=set(o['ins'])|set().union(*(anc[n]for n in o['ins']))
 lut=[o for o in ops if o['typ']=='lut'and o['out']in live and o['k']>=2];G=nx.Graph();G.add_nodes_from(o['name']for o in lut)
 for a,b in itertools.combinations(lut,2):
  if a['out']in anc[b['out']]or b['out']in anc[a['out']]:continue
  aa,bb=set(a['ins']),set(b['ins']);u=sorted(aa|bb)
  if len(u)>6:continue
  yes=max(a['k'],b['k'])<=5 and len(u)<=5
  if not yes:
   rows=np.arange(1<<len(u));f=truth(a['init'],a['ins'],u,rows);h=truth(b['init'],b['ins'],u,rows)
   if np.array_equal(f,h):yes=True
   else:
    for six,five,fs,ff in [(a,b,f,h),(b,a,h,f)]:
     if six['k']!=6 or five['k']>5 or not set(five['ins'])<=set(six['ins']):continue
     for sel in set(six['ins'])-set(five['ins']):
      zero=((rows>>u.index(sel))&1)==0
      if np.array_equal(fs[zero],ff[zero]):yes=True;break
  if yes:G.add_edge(a['name'],b['name'])
 match=nx.max_weight_matching(G,maxcardinality=True)
 return dict(live_nontrivial_luts=len(lut),exact_compatible_edges=G.number_of_edges(),maximum_matching=len(match),ideal_LUT_sites=len(lut)-len(match),matching=sorted(sorted(e)for e in match))
def main():
 manifest=load(Q/'rtl/design_manifest.json');records=[]
 for e in manifest:
  n=e['case'];g=load(Q/f'graphs/{n}.json');ops,co,ins,*_=build(g);pairs=load(Q/f'graphs/{n}_pairs.json');data=load(Q/f'results/{n}_methods.json')
  for pi,m in e['choices']:ops=replace_ops(ops,pairs[pi],data[pi]['methods'][m])
  ops=reorder(ops,set(co)|set(ins));r=dict(case=n,method=e['method'],**pack(ops,g,co,ins));records.append(r);print(n,e['method'],r['ideal_LUT_sites'],r['maximum_matching'],flush=True)
 dump(Q/'state/packing_diagnostic.json',dict(scope='ideal compatibility matching, not a physical result; no placement/carry restrictions, constant propagation or free inversions are modelled; diagnostic only, does not change the registered selection',rows=records))
if __name__=='__main__':main()
