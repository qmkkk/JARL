from common21 import Q,R,load,dump,build
import sys,time,subprocess,hashlib
sys.path.insert(0,str(R/'input/legacy_code'))
from edif_graph import read_edif
V='E:/AMDDesignTools/2026.1/Vivado/bin/vivado.bat'
def normalize(g):
 cells=[]; count=0
 for c in g['cells']:
  if c['type']!='LUT6_2':cells.append(c);continue
  count+=1;tt=int(c['props']['INIT'].split("'h")[1],16)
  for k,output,init in [(5,'O5',tt&0xffffffff),(6,'O6',tt)]:
   pins={f'I{i}':c['pins'][f'I{i}']for i in range(k)};pins['O']=c['pins'][output]
   cells.append(dict(name=c['name']+'/'+output,type=f'LUT{k}',pins=pins,props=dict(c['props'],INIT=f"{1<<k}'h{init:x}",HLUTNM=f'original_dual_{count}')))
 g['cells']=cells;g['normalized_dual_primitives']=count;return g

plan=load(Q/'configs/plan.json');rows=load(Q/'state/source_mapping.json')if(Q/'state/source_mapping.json').exists()else[]
for f in plan['families']:
 n=f['family']
 if any(r['family']==n for r in rows):continue
 d=Q/'build'/('source_'+n);d.mkdir();top=n+'_source';src=Q/f'rtl/{top}.v'
 assert hashlib.sha256(src.read_bytes()).hexdigest()==load(Q/'state/input_hashes.json')[src.relative_to(Q).as_posix()]
 tcl=d/'map.tcl';tcl.write_text(f'''set_param general.maxThreads 4
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv {src.as_posix()}
synth_design -mode out_of_context -top {top} -part xc7a100tcsg324-1 -max_dsp 0
write_edif -force {(d/'source.edf').as_posix()}
report_utilization -file {(d/'util.rpt').as_posix()}
close_project
''')
 dump(Q/'state/progress.json',dict(phase='SOURCE_SYNTH',family=n));st=time.perf_counter()
 with(d/'map.log').open('w')as out:p=subprocess.run([V,'-mode','batch','-nolog','-nojournal','-source',str(tcl)],cwd=d,stdout=out,stderr=subprocess.STDOUT,creationflags=subprocess.CREATE_NO_WINDOW)
 p.check_returncode();g=normalize(read_edif(d/'source.edf'));build(g)
 dump(Q/f'graphs/{n}_source.json',g)
 for c in plan['cases']:
  if c['family']==n:
   for tail in ['', '_seed']:dump(Q/f'graphs/{c["name"]}{tail}.json',g)
 rows.append(dict(family=n,seconds=time.perf_counter()-st,normalized_dual_primitives=g['normalized_dual_primitives'],graph_sha256=hashlib.sha256((Q/f'graphs/{n}_source.json').read_bytes()).hexdigest()))
 dump(Q/'state/source_mapping.json',rows);print('SOURCE_PASS',n,len(g['cells']),flush=True)
