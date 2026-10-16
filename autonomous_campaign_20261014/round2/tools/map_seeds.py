from pathlib import Path
import sys,json,subprocess,time
sys.dont_write_bytecode=True
Q=Path(__file__).resolve().parents[1];R=Q.parent
sys.path.insert(0,str(R/'input/legacy_code'))
from edif_graph import read_edif
from netlist_preflight import build
V='E:/AMDDesignTools/2026.1/Vivado/bin/vivado.bat';rows=[]
def normalize(g):
 cells=[];count=0
 for c in g['cells']:
  if c['type']!='LUT6_2':cells.append(c);continue
  count+=1;tt=int(c['props']['INIT'].split("'h")[1],16)
  for k,output,init in [(5,'O5',tt&0xffffffff),(6,'O6',tt)]:
   pins={f'I{i}':c['pins'][f'I{i}']for i in range(k)};pins['O']=c['pins'][output];props=dict(c['props'],INIT=f"{1<<k}'h{init:x}",HLUTNM=f'original_dual_{count}')
   cells.append(dict(name=c['name']+'/'+output,type=f'LUT{k}',pins=pins,props=props))
 g['cells']=cells;g['normalized_dual_primitives']=count;return g
for c in json.loads((Q/'configs/plan.json').read_text())['cases']:
 n=c['name'];d=Q/'build'/('seed_'+n);d.mkdir(exist_ok=True);top=f'r2_{n}_seed';tcl=d/'map.tcl'
 tcl.write_text(f'''set_param general.maxThreads 4
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv {(Q/f'rtl/{top}_source.v').as_posix()}
synth_design -mode out_of_context -top {top} -part xc7a100tcsg324-1 -max_dsp 0
write_edif -force {(d/'source.edf').as_posix()}
report_utilization -file {(d/'util.rpt').as_posix()}
close_project
''')
 st=time.perf_counter()
 reused=(d/'source.edf').exists()
 if not reused:
  with(d/'map.log').open('w')as f:p=subprocess.run([V,'-mode','batch','-nolog','-nojournal','-source',str(tcl)],cwd=d,stdout=f,stderr=subprocess.STDOUT,creationflags=subprocess.CREATE_NO_WINDOW)
  p.check_returncode()
 g=normalize(read_edif(d/'source.edf'));build(g);(Q/f'graphs/{n}.json').write_text(json.dumps(g,indent=2));rows.append(dict(case=n,returncode=0,seconds=time.perf_counter()-st,reused_existing_edif=reused,normalized_dual_primitives=g['normalized_dual_primitives']));(Q/'state/source_mapping.json').write_text(json.dumps(rows,indent=2));print('seed mapped',n,len(g['cells']),flush=True)
