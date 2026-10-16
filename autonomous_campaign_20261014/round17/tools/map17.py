from common17 import Q,R,load,dump,build
import sys,time,subprocess,hashlib
sys.path.insert(0,str(R/'input/legacy_code'))
from edif_graph import read_edif
V='E:/AMDDesignTools/2026.1/Vivado/bin/vivado.bat'

def normalize(g):
 cells=[];count=0
 for c in g['cells']:
  if c['type']!='LUT6_2':cells.append(c);continue
  count+=1;tt=int(c['props']['INIT'].split("'h")[1],16)
  for k,output,init in [(5,'O5',tt&0xffffffff),(6,'O6',tt)]:
   pins={f'I{i}':c['pins'][f'I{i}']for i in range(k)};pins['O']=c['pins'][output];cells.append(dict(name=c['name']+'/'+output,type=f'LUT{k}',pins=pins,props=dict(c['props'],INIT=f"{1<<k}'h{init:x}",HLUTNM=f'original_dual_{count}')))
 g['cells']=cells;g['normalized_dual_primitives']=count;return g

rows=[]
for c in load(Q/'configs/plan.json')['cases']:
 n=c['name'];inherited=Q/f'graphs/{n}_inherited.json'
 if inherited.exists():
  g=load(inherited);row=dict(case=n,new_source_mapping=False,source=str(inherited),source_sha256=hashlib.sha256(inherited.read_bytes()).hexdigest())
 else:
  d=Q/'build'/('source_'+n);assert not d.exists();d.mkdir();top=n+'_source';src=Q/f'rtl/{top}.v';assert hashlib.sha256(src.read_bytes()).hexdigest()==load(Q/'state/input_hashes.json')[src.relative_to(Q).as_posix()]
  tcl=d/'map.tcl';tcl.write_text(f'''set_param general.maxThreads 4
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv {src.as_posix()}
synth_design -mode out_of_context -top {top} -part xc7a100tcsg324-1 -max_dsp 0
write_edif -force {(d/'source.edf').as_posix()}
report_utilization -file {(d/'util.rpt').as_posix()}
close_project
''');dump(Q/'state/progress.json',dict(phase='SOURCE_SYNTH',case=n));st=time.perf_counter()
  with(d/'map.log').open('w')as f:p=subprocess.run([V,'-mode','batch','-nolog','-nojournal','-source',str(tcl)],cwd=d,stdout=f,stderr=subprocess.STDOUT,creationflags=subprocess.CREATE_NO_WINDOW)
  p.check_returncode();g=normalize(read_edif(d/'source.edf'));row=dict(case=n,new_source_mapping=True,seconds=time.perf_counter()-st,normalized_dual_primitives=g['normalized_dual_primitives'])
 build(g);dump(Q/f'graphs/{n}.json',g);dump(Q/f'graphs/{n}_seed.json',g);rows.append(row);dump(Q/'state/source_mapping.json',rows);print('SOURCE_PASS',n,len(g['cells']),flush=True)
