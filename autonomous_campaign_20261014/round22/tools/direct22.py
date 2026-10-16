"""Same pinned QUADOL topology lowering validated in R11, in this round's path.
Retains selector inversions and output buffers/inverters. No function search.
"""
from common22 import Q,load,dump
from core import export_rtl
import copy,itertools,hashlib
def quadol_rtl(c,g,top):
 n=c['name'];search=load(Q/f'state/{n}_search.json');h=copy.deepcopy(g);extra=[];removed=set();checks=0
 for pi in search['selected']:
  cells=sorted([x for x in g['cells']if x['name'].startswith(f'quadol_{pi}_')],key=lambda x:int(x['name'].rsplit('_',1)[1]));a,b=cells[:2];assert a['type']==b['type']=='LUT5';sh=[a['pins'][f'I{i}']for i in range(5)];assert sh==[b['pins'][f'I{i}']for i in range(5)]
  ta=int(a['props']['INIT'].split("'h")[1],16);tb=int(b['props']['INIT'].split("'h")[1],16);na,nb=a['pins']['O'],b['pins']['O'];removed|={a['name'],b['name']};mux=next((x for x in cells[2:]if x['type']=='LUT3'),None)
  if mux is None:
   upper,lower=ta,tb;ports=[f'.O6(v[{na}])',f'.O5(v[{nb}])'];selector="1'b1"
   for row in range(32):assert((upper>>row)&1)==((ta>>row)&1)and((lower>>row)&1)==((tb>>row)&1);checks+=1
  else:
   removed.add(mux['name']);mp=mux['pins'];assert mp['I2']==na and mp['I1']==nb;ms=mp['I0'];mt=int(mux['props']['INIT'].split("'h")[1],16);mo=mp['O'];bufs=[x for x in cells[2:]if x['type']=='LUT1'];plain={x['pins']['I0']for x in bufs if x['pins']['I0']!=mo};assert len(plain)<=1 and plain<={na,nb};lo_net=next(iter(plain))if plain else nb
   lower=ta if lo_net==na else tb;upper=tb if lo_net==na else ta
   def want(av,bv,sv):return(mt>>(4*av+2*bv+sv))&1
   flip=not all(want(av,bv,0)==(av if lo_net==na else bv)for av,bv in itertools.product([0,1],repeat=2))
   for av,bv,sv in itertools.product([0,1],repeat=3):
    sel=sv^flip;out=(bv if lo_net==na else av)if sel else(av if lo_net==na else bv);assert out==want(av,bv,sv);checks+=1
   if flip:sn=h['n_nets'];h['n_nets']+=1;extra.append(f'assign v[{sn}]=~v[{ms}];');selector=f'v[{sn}]'
   else:selector=f'v[{ms}]'
   ports=[f'.O6(v[{mo}])',f'.O5(v[{lo_net}])'if plain else'.O5()']
  pins=[f'.I{i}(v[{v}])'for i,v in enumerate(sh)]+[f'.I5({selector})']+ports
  extra.append(f"LUT6_2 #(.INIT(64'h{upper:08x}{lower:08x})) direct_quadol_{pi} ("+','.join(pins)+');')
 h['cells']=[x for x in h['cells']if x['name']not in removed];text=export_rtl(h,[],[],{},top)
 if extra:text=text.rsplit('endmodule',1)[0]+'\n'.join(extra)+'\nendmodule\n'
 dump(Q/f'state/{n}_direct_topology_contract.json',dict(case=n,status='PASS',selected_pairs=len(search['selected']),topology_truth_checks=checks,source_selected_graph_sha256=hashlib.sha256((Q/f'graphs/{n}_quadol_wce.json').read_bytes()).hexdigest()))
 return text
