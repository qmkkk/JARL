from pathlib import Path
import sys,json,csv,hashlib,re,shutil,subprocess,time,random,itertools,math,datetime
sys.dont_write_bytecode=True
from model13 import R,Q,load,dump,export
V=Path('E:/AMDDesignTools/2026.1/Vivado/bin');S=Q/'rtl';OUT=Q/'results/hardware';OUT.mkdir(exist_ok=True)
def execute(cmd,q,log):
 st=time.perf_counter()
 with(q/log).open('w',encoding='utf-8')as f:p=subprocess.run(cmd,cwd=q,stdout=f,stderr=subprocess.STDOUT,creationflags=subprocess.CREATE_NO_WINDOW)
 row={'argv':list(map(str,cmd)),'returncode':p.returncode,'wall_s':time.perf_counter()-st,'log':str(q/log)};f=Q/'state/hardware_commands.json';commands=load(f)if f.exists()else[];commands.append(row);dump(f,commands);p.check_returncode();return row
def simulation():
 entries=[e for e in load(S/'design_manifest.json')if not e['duplicate_of']];records=[]
 for gold in load(Q/'state/golden.json'):
  name=gold['case'];q=OUT/f'simulation_{name}';assert not q.exists();q.mkdir();shutil.copy2(S/f'{name}_golden.hex',q/f'{name}_golden.hex');(q/'run.tcl').write_text('run all\nquit\n');ee=[e for e in entries if e['case']==name];tb=gold['tb']
  execute([str(V/'xvlog.bat'),'--sv',*[str(S/(e['top']+'.v'))for e in ee],str(S/f'{tb}.sv'),str(V.parent/'data/verilog/src/glbl.v')],q,'compile.log')
  execute([str(V/'xelab.bat'),'--debug','typical','-L','unisims_ver','-L','unimacro_ver',tb,'glbl','-s','round_sim'],q,'elaborate.log')
  execute([str(V/'xsim.bat'),'round_sim','-tclbatch',(q/'run.tcl').as_posix()],q,'simulate.log')
  assert f'R13_PASS case={name} vectors={gold["vectors"]} designs={gold["designs"]}'in(q/'simulate.log').read_text()
  records.append(dict(gold,status='PASS'));dump(Q/'state/rtl_validation.json',records);print('RTL_PASS',name,gold['checks'],flush=True)
def route():
 entries=[e for e in load(S/'design_manifest.json')if not e['duplicate_of']and not e['inherited_physical']];rows=load(OUT/'ppa.json')if(OUT/'ppa.json').exists()else[]
 for entry in entries:
  top=entry['top']
  if any(r['top']==top for r in rows):continue
  q=OUT/top;phases=['synth','impl'];recovery={}
  assert hashlib.sha256((S/f'{top}.v').read_bytes()).hexdigest()==entry['sha256']
  if q.exists():
   old=q;q=OUT/(top+'_resume1');assert not q.exists();q.mkdir();cmds=load(Q/'state/hardware_commands.json');completed=[r for r in cmds if r['log']==str(old/'synth.log')and r['returncode']==0];assert len(completed)==1 and(old/'synth.dcp').exists()
   shutil.copy2(old/'synth.dcp',q/'synth.dcp');shutil.copy2(old/'util_synth.rpt',q/'util_synth.rpt');phases=['impl'];recovery=dict(resumed_from=str(old),synth_checkpoint_sha256=hashlib.sha256((old/'synth.dcp').read_bytes()).hexdigest(),reused_synth_seconds=completed[0]['wall_s']);dump(q/'recovery.json',recovery)
  else:q.mkdir()
  sl=q/'sources.txt';sl.write_text((S/f'{top}.v').as_posix()+'\n');st=time.perf_counter()
  for phase in phases:
   dump(Q/'state/progress.json',{'phase':phase,'top':top,'physical_complete':len(rows),'physical_planned':len(entries)})
   execute([str(V/'vivado.bat'),'-mode','batch','-nojournal','-nolog','-source',str(R/'tools/route_clocked.tcl'),'-tclargs',q.as_posix(),sl.as_posix(),top,'forbid',phase,(S/f'{entry["case"]}.xdc').as_posix()],q,phase+'.log')
  row=dict(entry,wall_s=time.perf_counter()-st+recovery.get('reused_synth_seconds',0),physical_directory=str(q),recovery=recovery);row.update(json.loads('{'+(q/'metrics.json').read_text().strip()+'}'));util=(q/'util_route.rpt').read_text()
  for key,pattern in [('LUT','Slice LUTs'),('FF','Slice Registers'),('DSP','DSPs')]:row[key]=int(re.search(r'\|\s*'+pattern+r'\*?\s*\|\s*(\d+)',util)[1])
  du=re.search(r'\|\s*using O5 and O6\s*\|\s*(\d+)',util);row['dual_output_LUTs']=int(du[1])if du else 0
  mt=re.search(r'WNS\(ns\).*?\n\s*-+.*?\n\s*([-\d.]+)\s+([-\d.]+)\s+(\d+)\s+(\d+)\s+([-\d.]+)\s+([-\d.]+)',(q/'timing_route.rpt').read_text(),re.S);assert mt
  for key,idx in [('WNS_ns',1),('TNS_ns',2),('WHS_ns',5),('THS_ns',6)]:row[key]=float(mt[idx])
  row['check_timing']={k:int(v)for k,v in re.findall(r'checking (\w+) \((\d+)\)',(q/'check_timing.rpt').read_text())};row['DRC_errors']=re.findall(r'\|\s*([A-Z0-9-]+)\s*\|\s*(?:Error|Critical Warning)\s*\|',(q/'drc.rpt').read_text());row['pass_registered_clock']=row['WNS_ns']>=0 and row['WHS_ns']>=0 and row['TNS_ns']==0 and row['THS_ns']==0 and not any(row['check_timing'].values())and not row['DRC_errors'];row['clock_ns']=next(c['clock_ns']for c in load(Q/'configs/plan.json')['cases']if c['name']==entry['case']);row['FF_period_ns']=row['clock_ns']-float(row['ff_slack_ns']);assert row['DSP']==0
  rows.append(row);dump(OUT/'ppa.json',rows);print(top,'LUT',row['LUT'],'WNS',row['WNS_ns'],'WCE',row['WCE'],flush=True)
 dump(OUT/'ppa.json',rows)
 dump(Q/'state/progress.json',dict(phase='ALL_CORE_EXPERIMENTS_COMPLETE',physical_jobs=len(rows),finished=datetime.datetime.now().astimezone().isoformat()))
if __name__=='__main__':{'export':export,'simulation':simulation,'route':route}[sys.argv[1]]()
