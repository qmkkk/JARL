from common16 import Q,load,dump,build
import copy
for c in load(Q/'configs/plan.json')['cases']:
 n=c['name'];g=load(Q/f'graphs/{n}_seed.json');q=copy.deepcopy(g)
 z=next(x['pins']['G']for x in q['cells']if x['type']=='GND');o=next(x['pins']['P']for x in q['cells']if x['type']=='VCC')
 k=c['quant_bits'];assert c['budget']==1<<k
 for i in range(k):q['ports'][f'Y[{i}]']=z
 q['ports'][f'Y[{k}]']=o
 build(q);dump(Q/f'graphs/{n}_midpoint.json',q)
print('MIDPOINT_GRAPHS_READY')
