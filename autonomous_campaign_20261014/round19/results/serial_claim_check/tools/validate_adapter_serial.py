"""Independent author-MSB truth evaluation versus exported primitive LSB pins."""
from quadol_serial import Q,load,dump,enumerate_candidates,changed_graph,build
import itertools
records=[]
for c in load(Q/'configs/plan.json')['cases']:
 n=c['name'];g=load(Q/f'graphs/{n}_seed.json');d,orig=enumerate_candidates(g);checks=0
 for pi,p in enumerate(d.lut62):
  for im,impl in enumerate(p.implement):
   h=changed_graph(g,d,orig,[pi],[im]);cells=[x for x in h['cells']if x['name'].startswith(f'quadol_{pi}_')];assert len(cells)==len(impl)
   for l,cell in zip(impl,cells):
    for values in itertools.product([0,1],repeat=l.size):
     # Author BLIF truth table: first port is the most significant variable.
     idx=0
     for b in values:idx=2*idx+b
     expected=l.tt[idx];net_values={cell['pins'][f'I{l.size-1-j}']:b for j,b in enumerate(values)}
     bit=sum(net_values[cell['pins'][f'I{j}']]<<j for j in range(l.size));actual=(int(cell['props']['INIT'].split("'h")[1],16)>>bit)&1
     assert actual==expected,(n,pi,im,l.name,values);checks+=1
 records.append(dict(case=n,author_pairs=len(d.lut62),truth_assignment_checks=checks,status='PASS'))
dump(Q/'state/adapter_contract.json',dict(method='All generated implementation LUT assignments; independent author MSB-first table lookup vs primitive INIT/pin interpretation. Whole-network math and vendor HDL are separate.',cases=records));print('AUTHOR_BIT_ORDER_CONTRACT_PASS',sum(x['truth_assignment_checks']for x in records))
