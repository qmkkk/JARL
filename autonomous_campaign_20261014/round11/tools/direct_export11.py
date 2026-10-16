"""Material fairness repair: lower author writer's selected topology directly to LUT6_2.
No configuration regeneration: use recorded selected graph, not Python set tie order.
"""
from model11 import Q,R,load,dump,export_rtl
from pathlib import Path
import copy,hashlib,shutil,itertools,datetime
D=Q/'direct_primitive';assert not D.exists()
for name in ['tools','configs','rtl','state','logs','results/hardware']:(D/name).mkdir(parents=True,exist_ok=True)
shutil.copy2(Q/'configs/plan.json',D/'configs/plan.json')
for p in(Q/'rtl').iterdir():
 if p.is_file():shutil.copy2(p,D/'rtl'/p.name)
for name in ['golden.json']:shutil.copy2(Q/'state'/name,D/'state'/name)
entries=load(Q/'rtl/design_manifest.json');contracts=[]
for c in load(Q/'configs/plan.json')['cases']:
 n=c['name'];search=load(Q/f'state/{n}_search.json');g=load(Q/f'graphs/{n}_quadol_wce.json');h=copy.deepcopy(g);extra=[];removed=set();checks=0
 for pi in search['selected']:
  cells=sorted([x for x in g['cells']if x['name'].startswith(f'quadol_{pi}_')],key=lambda x:int(x['name'].rsplit('_',1)[1]));a,b=cells[:2];assert a['type']==b['type']=='LUT5';sh=[a['pins'][f'I{i}']for i in range(5)];assert sh==[b['pins'][f'I{i}']for i in range(5)]
  ta=int(a['props']['INIT'].split("'h")[1],16);tb=int(b['props']['INIT'].split("'h")[1],16);na,nb=a['pins']['O'],b['pins']['O'];removed|={a['name'],b['name']}
  mux=next((x for x in cells[2:]if x['type']=='LUT3'),None)
  if mux is None:
   upper,lower=ta,tb;ports=[f'.O6(v[{na}])',f'.O5(v[{nb}])'];selector="1'b1"
   # Keep original output buffers/inverters, allowing normal Vivado absorption.
   for row in range(32):assert((upper>>row)&1)==((ta>>row)&1)and((lower>>row)&1)==((tb>>row)&1);checks+=1
  else:
   removed.add(mux['name']);mp=mux['pins'];assert mp['I2']==na and mp['I1']==nb;ms=mp['I0'];mt=int(mux['props']['INIT'].split("'h")[1],16);mo=mp['O'];bufs=[x for x in cells[2:]if x['type']=='LUT1'];plain={x['pins']['I0']for x in bufs if x['pins']['I0']!=mo};assert len(plain)<=1 and plain<={na,nb};lo_net=next(iter(plain))if plain else nb
   lower=ta if lo_net==na else tb;upper=tb if lo_net==na else ta
   # Determine whether the source mux at S=0 selects the required lower half.
   def want(av,bv,sv):return(mt>>(4*av+2*bv+sv))&1
   flip=not all(want(av,bv,0)==(av if lo_net==na else bv)for av,bv in itertools.product([0,1],repeat=2))
   for av,bv,sv in itertools.product([0,1],repeat=3):
    sel=sv^flip;out=(bv if lo_net==na else av)if sel else(av if lo_net==na else bv);assert out==want(av,bv,sv);checks+=1
   if flip:sn=h['n_nets'];h['n_nets']+=1;extra.append(f'assign v[{sn}]=~v[{ms}];');selector=f'v[{sn}]'
   else:selector=f'v[{ms}]'
   ports=[f'.O6(v[{mo}])',f'.O5(v[{lo_net}])'if plain else'.O5()']
  pins=[f'.I{i}(v[{v}])'for i,v in enumerate(sh)]+[f'.I5({selector})']+ports
  extra.append(f"LUT6_2 #(.INIT(64'h{upper:08x}{lower:08x})) direct_quadol_{pi} ("+','.join(pins)+');')
 h['cells']=[x for x in h['cells']if x['name']not in removed];e=next(e for e in entries if e['case']==n and e['method']=='quadol_wce');top=e['top'];text=export_rtl(h,[],[],{},top)
 if extra:text=text.rsplit('endmodule',1)[0]+'\n'.join(extra)+'\nendmodule\n'
 p=D/'rtl'/f'{top}.v';p.write_text(text);contracts.append(dict(case=n,selected_pairs=len(search['selected']),topology_truth_checks=checks,status='PASS',source_selected_graph_sha256=hashlib.sha256((Q/f'graphs/{n}_quadol_wce.json').read_bytes()).hexdigest()))
for c in load(Q/'configs/plan.json')['cases']:
 seen={}
 for e in[e for e in entries if e['case']==c['name']]:
  p=D/'rtl'/(e['top']+'.v');text=p.read_text();sha=hashlib.sha256(text.replace(f'module {e["top"]}(','module canonical(').encode()).hexdigest();e['sha256']=hashlib.sha256(p.read_bytes()).hexdigest();e['canonical_sha256']=sha;e['duplicate_of']=seen.get(sha);seen.setdefault(sha,e['top'])
dump(D/'rtl/design_manifest.json',entries);dump(D/'state/topology_contract.json',contracts);dump(D/'state/progress.json',dict(phase='DIRECT_PRIMITIVE_REGISTERED'))
# Testbench remains identical: ports, method order and all output values are unchanged.
stub="from pathlib import Path\nimport sys,json\nQ=Path(__file__).resolve().parents[1];R=Q.parents[1]\ndef load(p):return json.loads(Path(p).read_text())\ndef dump(p,x):Path(p).write_text(json.dumps(x,indent=2,ensure_ascii=False),encoding='utf-8')\ndef export():raise RuntimeError('Already exported from preserved graphs')\n"
(D/'tools/model11.py').write_text(stub);shutil.copy2(Q/'tools/hardware11.py',D/'tools/hardware11.py')
repair=dict(time=datetime.datetime.now().astimezone().isoformat(),issue='Author BLIF implementation was first exported as separate LUT5/MUX/LUT1 primitives while the main model explicitly uses LUT6_2; physical remapping may depend on representation.',repair='Export the SAME recorded final candidate functions directly as LUT6_2, retain necessary selector inversion and output inverter/buffer logic, validate local topology and rerun vendor HDL plus physical implementation. No search, algorithm, workload or WCE change.',preserved='All first primitive-expansion results remain in round11/results/hardware and original RTL; direct_primitive is separate.',status='DIRECT_HDL_AND_PHYSICAL_PENDING')
a=load(Q/'state/engineering_repairs.json');a.append(repair);dump(Q/'state/engineering_repairs.json',a);print('DIRECT_EXPORT_READY',sum(x['selected_pairs']for x in contracts))
