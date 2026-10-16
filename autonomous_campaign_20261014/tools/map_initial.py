from pathlib import Path
import sys,json,subprocess,time
sys.dont_write_bytecode=True
R=Path(__file__).resolve().parents[1];Q=R/'round1'
sys.path.insert(0,str(R/'input/legacy_code'))
from edif_graph import read_edif,candidates
V='E:/AMDDesignTools/2026.1/Vivado/bin/vivado.bat'
plan=json.loads((Q/'configs/plan.json').read_text())
logs=[]
for c in plan['cases'][1:]:
 n=c['name'];d=Q/'build'/('source_'+n);d.mkdir(exist_ok=False)
 tcl=d/'map.tcl';tcl.write_text(f'''set_param general.maxThreads 4
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv {(Q/f'rtl/{n}_source.v').as_posix()}
synth_design -mode out_of_context -top {n}_source -part xc7a100tcsg324-1 -max_dsp 0
write_edif -force {(d/'source.edf').as_posix()}
report_utilization -file {(d/'util.rpt').as_posix()}
close_project
''')
 start=time.perf_counter()
 with (d/'map.log').open('w')as f:p=subprocess.run([V,'-mode','batch','-nolog','-nojournal','-source',str(tcl)],cwd=d,stdout=f,stderr=subprocess.STDOUT,creationflags=subprocess.CREATE_NO_WINDOW)
 logs.append(dict(case=n,returncode=p.returncode,seconds=time.perf_counter()-start));(Q/'state/source_mapping.json').write_text(json.dumps(logs,indent=2));p.check_returncode()
 g=read_edif(d/'source.edf');cs=candidates(g)
 (Q/f'graphs/{n}.json').write_text(json.dumps(g,indent=2));(Q/f'graphs/{n}_structural_pairs.json').write_text(json.dumps(cs,indent=2))
 print(n,len(g['cells']),'cells',len(cs),'structural pairs',flush=True)
