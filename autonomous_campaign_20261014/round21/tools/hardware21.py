from common21 import Q,R,load,dump
from pathlib import Path
import subprocess,time,shutil,hashlib,re,json
V=Path('E:/AMDDesignTools/2026.1/Vivado/bin');S=Q/'rtl';O=Q/'results/hardware';O.mkdir(exist_ok=True)
entries=load(S/'design_manifest.json');commands=load(Q/'state/hardware_commands.json')if(Q/'state/hardware_commands.json').exists()else[]
def execute(args,d,name):
 log=d/name;assert not log.exists();st=time.perf_counter()
 with log.open('w')as out:p=subprocess.run(list(map(str,args)),cwd=d,stdout=out,stderr=subprocess.STDOUT,creationflags=subprocess.CREATE_NO_WINDOW)
 commands.append(dict(argv=list(map(str,args)),log=str(log),returncode=p.returncode,wall_s=time.perf_counter()-st));dump(Q/'state/hardware_commands.json',commands);p.check_returncode()
sim=load(Q/'state/rtl_validation.json')if(Q/'state/rtl_validation.json').exists()else[]
for gold in load(Q/'state/golden.json'):
 name=gold['family']
 if any(r['family']==name for r in sim):continue
 d=O/f'simulation_{name}';d.mkdir();ee=[e for e in entries if e['family']==name];shutil.copy2(S/f'{name}_golden.hex',d/f'{name}_golden.hex');(d/'run.tcl').write_text('run all\nquit\n')
 execute([V/'xvlog.bat','--sv',*[S/(e['top']+'.v')for e in ee],S/(gold['tb']+'.sv'),V.parent/'data/verilog/src/glbl.v'],d,'compile.log')
 execute([V/'xelab.bat','--debug','typical','-L','unisims_ver','-L','unimacro_ver',gold['tb'],'glbl','-s','round_sim'],d,'elaborate.log')
 execute([V/'xsim.bat','round_sim','-tclbatch',(d/'run.tcl').as_posix()],d,'simulate.log')
 assert f'R21_PASS family={name} vectors={gold["vectors"]} designs={gold["designs"]}'in(d/'simulate.log').read_text();sim.append(dict(gold,status='PASS'));dump(Q/'state/rtl_validation.json',sim);print('HDL_PASS',name,flush=True)
unique=[e for e in entries if not e['duplicate_of']];bytop={e['top']:e for e in entries};route_tops={e['duplicate_of']or e['top']for e in entries if e['route_registered']}
# One serial Vivado process amortizes startup cost; every design has its own directory.
tcl=['set_param general.maxThreads 4']
for e in unique:
 top=e['top'];d=O/top;d.mkdir(exist_ok=True)
 assert hashlib.sha256((S/f'{top}.v').read_bytes()).hexdigest()==e['sha256']
 if(d/'synth.done').exists():continue
 tcl += [f'create_project -in_memory -part xc7a100tcsg324-1',f'read_verilog -sv {(S/f"{top}.v").as_posix()}',f'synth_design -mode out_of_context -top {top} -part xc7a100tcsg324-1 -max_dsp 0',f'read_xdc {(S/(e["case"]+".xdc")).as_posix()}',f'report_utilization -file {(d/"util_synth.rpt").as_posix()}',f'write_checkpoint -force {(d/"synth.dcp").as_posix()}',f'set f [open {(d/"synth.done").as_posix()} w]',f'puts $f "{top}"','close $f','close_project',f'puts "R21_SYNTH_PASS {top}"']
if len(tcl)>1:
 # Windows Vivado2026.1 left a locked realtime directory between in-memory
 # projects in the batch attempt. Use the previously validated isolated flow.
 # Retain that failed attempt and the completed first checkpoint, no deletes.
 for e in unique:
  top=e['top'];d=O/top
  if(d/'synth.done').exists():continue
  sl=d/'sources.txt';sl.write_text((S/f'{top}.v').as_posix()+'\n')
  attempt=1
  while(d/f'synth_isolated{attempt}.log').exists():attempt+=1
  dump(Q/'state/progress.json',dict(phase='SYNTH_ISOLATED',top=top,complete=len(list(O.glob('*/synth.done'))),planned=len(unique)))
  args=[V/'vivado.bat','-mode','batch','-nojournal','-nolog','-source',R/'tools/route_clocked.tcl','-tclargs',d.as_posix(),sl.as_posix(),top,'forbid','synth',(S/f'{e["case"]}.xdc').as_posix()]
  try:
   execute(args,d,f'synth_isolated{attempt}.log')
  except subprocess.CalledProcessError:
   raw=(d/f'synth_isolated{attempt}.log').read_text(errors='replace')
   errors=[line for line in raw.splitlines()if line.startswith('ERROR:')]
   # One exact-command retry only for the observed non-diagnostic transient.
   # Never retry a named synthesis error or change source/constraints/strategy.
   if attempt!=1 or errors!=['ERROR: [Common 17-69] Command failed: Vivado Synthesis failed']:raise
   execute(args,d,'synth_isolated2.log')
  (d/'synth.done').write_text(top+'\n');print('SYNTH_PASS',top,flush=True)
rows=[]
for e in unique:
 d=O/e['top'];util=(d/'util_synth.rpt').read_text();r=dict(e)
 for key,pattern in [('LUT','Slice LUTs'),('FF','Slice Registers'),('DSP','DSPs')]:r[key]=int(re.search(r'\|\s*'+pattern+r'\*?\s*\|\s*(\d+)',util)[1])
 cc=re.search(r'\|\s*CARRY4\s*\|\s*(\d+)',util);r['CARRY4']=int(cc[1])if cc else 0
 assert r['DSP']==0;rows.append(r)
dump(O/'synthesis_unique.json',rows);index={r['top']:r for r in rows};dump(O/'synthesis_all.json',[dict(e,**{k:index[e['duplicate_of']or e['top']][k]for k in ['LUT','FF','CARRY4','DSP']},physical_source=e['duplicate_of']or e['top'])for e in entries])
route=load(O/'route_unique.json')if(O/'route_unique.json').exists()else[]
for top in sorted(route_tops):
 if any(r['top']==top for r in route):continue
 e=bytop[top];d=O/top;sl=d/'sources.txt';sl.write_text((S/f'{top}.v').as_posix()+'\n')
 dump(Q/'state/progress.json',dict(phase='ROUTE_FIXED_SUBSET',top=top,complete=len(route),planned=len(route_tops)))
 execute([V/'vivado.bat','-mode','batch','-nojournal','-nolog','-source',R/'tools/route_clocked.tcl','-tclargs',d.as_posix(),sl.as_posix(),top,'forbid','impl',(S/f'{e["case"]}.xdc').as_posix()],d,'route.log')
 r=dict(e);r.update(json.loads('{'+(d/'metrics.json').read_text().strip()+'}'));util=(d/'util_route.rpt').read_text()
 for key,pattern in [('LUT','Slice LUTs'),('FF','Slice Registers'),('DSP','DSPs')]:r[key]=int(re.search(r'\|\s*'+pattern+r'\*?\s*\|\s*(\d+)',util)[1])
 mt=re.search(r'WNS\(ns\).*?\n\s*-+.*?\n\s*([-\d.]+)\s+([-\d.]+)\s+(\d+)\s+(\d+)\s+([-\d.]+)\s+([-\d.]+)',(d/'timing_route.rpt').read_text(),re.S);assert mt
 for key,idx in [('WNS_ns',1),('TNS_ns',2),('WHS_ns',5),('THS_ns',6)]:r[key]=float(mt[idx])
 r['check_timing']={k:int(v)for k,v in re.findall(r'checking (\w+) \((\d+)\)',(d/'check_timing.rpt').read_text())};r['DRC_errors']=re.findall(r'\|\s*([A-Z0-9-]+)\s*\|\s*(?:Error|Critical Warning)\s*\|',(d/'drc.rpt').read_text());r['pass_registered_clock']=r['WNS_ns']>=0 and r['WHS_ns']>=0 and r['TNS_ns']==0 and r['THS_ns']==0 and not any(r['check_timing'].values())and not r['DRC_errors'];route.append(r);dump(O/'route_unique.json',route);print('ROUTE_PASS',top,'LUT',r['LUT'],'timing',r['pass_registered_clock'],flush=True)
index={r['top']:r for r in route};dump(O/'route_all.json',[{**index[e['duplicate_of']or e['top']],**e,'physical_source':e['duplicate_of']or e['top']}for e in entries if e['route_registered']])
print('ALL_R21_HARDWARE_COMPLETE',flush=True)
