from pathlib import Path
import sys,json,subprocess,time,hashlib,re,traceback
sys.dont_write_bytecode=True
Q=Path(__file__).resolve().parents[1];V=Path('E:/AMDDesignTools/2026.1/Vivado/bin');O=Q/'results/hardware';O.mkdir(exist_ok=True)
def load(p):return json.loads(Path(p).read_text(encoding='utf-8'))
def dump(p,x):Path(p).write_text(json.dumps(x,indent=2,ensure_ascii=False),encoding='utf-8')
def read(p):return Path(p).read_text(errors='replace')
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
commands=load(Q/'state/execution_commands.json')if(Q/'state/execution_commands.json').exists()else[]
def execute(args,d,name,expect=None):
 attempt=1
 while (d/f'{name}_{attempt}.log').exists():attempt+=1
 log=d/f'{name}_{attempt}.log';start=time.perf_counter()
 with log.open('w')as f:p=subprocess.run(list(map(str,args)),cwd=d,stdout=f,stderr=subprocess.STDOUT,creationflags=subprocess.CREATE_NO_WINDOW)
 commands.append(dict(argv=list(map(str,args)),cwd=str(d),log=str(log),returncode=p.returncode,seconds=time.perf_counter()-start));dump(Q/'state/execution_commands.json',commands)
 p.check_returncode()
 if expect:assert expect in read(log),(str(log),'missing marker',expect)
 return log
def simulation(e,rtl,d,saif=False):
 d.mkdir(exist_ok=True)
 if(d/'PASS.json').exists():return load(d/'PASS.json')
 text=''
 if saif:text+=f'open_saif {(d/"activity.saif").as_posix()}\nlog_saif [get_objects -r /tb/dut/*]\n'
 text+='run all\n'
 if saif:text+='close_saif\n'
 text+='quit\n';(d/'run.tcl').write_text(text)
 execute([V/'xvlog.bat','--sv',rtl,e['tb'],V.parent/'data/verilog/src/glbl.v'],d,'compile')
 execute([V/'xelab.bat','--debug','typical','-L','unisims_ver','-L','unimacro_ver','tb','glbl','-s','fir_sim'],d,'elaborate')
 log=execute([V/'xsim.bat','fir_sim','-tclbatch',(d/'run.tcl').as_posix()],d,'simulate','R23_FIR_PASS checks=6144 latency=19 II=20')
 result=dict(status='PASS',top=e['top'],checks=6144,latency=19,II=20,routed=saif,log=str(log))
 if saif:assert(d/'activity.saif').stat().st_size>1000;result.update(saif_sha256=sha(d/'activity.saif'),saif_bytes=(d/'activity.saif').stat().st_size)
 dump(d/'PASS.json',result);return result
def metrics(e,part,d):
 r=dict(top=e['top'],width=e['width'],method=e['method'],part=part,clock_ns=15,II=20,latency=19,checks=6144)
 for phase in ['synth','route']:
  util=read(d/f'util_{phase}.rpt')
  for key,pattern in [('LUT','Slice LUTs'),('FF','Slice Registers'),('DSP','DSPs'),('CARRY4','CARRY4')]:
   m=re.search(r'\|\s*'+pattern+r'\*?\s*\|\s*(\d+)',util);r[f'{phase}_{key}']=int(m[1])if m else 0
 mt=re.search(r'WNS\(ns\).*?\n\s*-+.*?\n\s*([-\d.]+)\s+([-\d.]+)\s+(\d+)\s+(\d+)\s+([-\d.]+)\s+([-\d.]+)',read(d/'timing_route.rpt'),re.S);assert mt
 for key,i in [('WNS_ns',1),('TNS_ns',2),('WHS_ns',5),('THS_ns',6)]:r[key]=float(mt[i])
 r['check_timing']={k:int(v)for k,v in re.findall(r'checking (\w+) \((\d+)\)',read(d/'check_timing.rpt'))}
 r['DRC_errors']=re.findall(r'\|\s*([A-Z0-9-]+)\s*\|\s*(?:Error|Critical Warning)\s*\|',read(d/'drc.rpt'))
 r['timing_pass']=r['WNS_ns']>=0 and r['WHS_ns']>=0 and r['TNS_ns']==0 and r['THS_ns']==0 and not any(r['check_timing'].values())and not r['DRC_errors']
 for key,label in [('dynamic_W','Dynamic (W)'),('total_W','Total On-Chip Power (W)'),('static_W','Device Static (W)')]:
  m=re.search(r'\|\s*'+re.escape(label)+r'\s*\|\s*([\d.]+)',read(d/'power.rpt'));r[key]=float(m[1])if m else None
 r['power_report']=str(d/'power.rpt');r['annotation_report']=str(d/'saif_annotation.rpt');r['power_kind']='Routed functional activity estimate, not timing/glitch simulation or board measurement'
 assert r['route_DSP']==0
 return r
def main():
 entries=load(Q/'rtl/design_manifest.json');plan=load(Q/'configs/plan.json')
 for e in entries:
  for key in ['rtl','tb','gold']:assert sha(e[key])==e[key+'_sha256']
 sim=[]
 for e in entries:
  dump(Q/'state/progress.json',dict(phase='RTL_CORRECTNESS',top=e['top'],complete=len(sim),total=12))
  sim.append(simulation(e,e['rtl'],O/('rtl_'+e['top'])));dump(Q/'state/rtl_validation.json',sim);print('RTL_PASS',e['top'],flush=True)
 results=[]
 for part in plan['devices']:
  for e in entries:
   d=O/(part+'__'+e['top']);d.mkdir(exist_ok=True)
   dump(Q/'state/progress.json',dict(phase='PHYSICAL_AND_ACTIVITY',top=e['top'],part=part,complete=len(results),total=24))
   if not(d/'route.complete').exists():
    args=[V/'vivado.bat','-mode','batch','-nojournal','-nolog','-source',Q/'tools/physical23.tcl','-tclargs',d.as_posix(),Path(e['rtl']).as_posix(),e['top'],part,(Q/'rtl/system.xdc').as_posix()]
    try:execute(args,d,'physical','R23_ROUTE_COMPLETE')
    except subprocess.CalledProcessError:
     errors=re.findall(r'^ERROR:.*$',read(Path(commands[-1]['log'])),re.M)
     known=[['ERROR: [Common 17-69] Command failed: Vivado Synthesis failed'],['ERROR: [Synth 20-411]']]
     if [x.strip() for x in errors] not in known or len(list(d.glob('physical*.log')))>1:raise
     execute(args,d,'physical_retry','R23_ROUTE_COMPLETE')
    (d/'route.complete').write_text(e['rtl_sha256'])
   simulation(e,d/'routed.v',d/'sim',True)
   if not(d/'power.complete').exists():
    execute([V/'vivado.bat','-mode','batch','-nojournal','-nolog','-source',Q/'tools/power23.tcl','-tclargs',d.as_posix()],d,'power','R23_POWER_COMPLETE');(d/'power.complete').write_text('complete')
   r=metrics(e,part,d);results.append(r);dump(Q/'results/physical_results.json',results);print('ENDPOINT_COMPLETE',len(results),part,e['top'],'LUT',r['route_LUT'],'timing',r['timing_pass'],flush=True)
 dump(Q/'state/execution_complete.json',dict(status='ALL_REGISTERED_EXECUTION_COMPLETE',rtl_designs=12,physical_endpoints=len(results),rtl_checks=sum(x['checks']for x in sim),routed_checks=sum(x['checks']for x in results)))
 dump(Q/'state/progress.json',dict(phase='ALL_REGISTERED_EXECUTION_COMPLETE',complete=24,total=24));print('ALL_R23_EXECUTION_COMPLETE',flush=True)
if __name__=='__main__':
 try:main()
 except Exception:
  dump(Q/'state/execution_error.json',dict(status='ENGINEERING_ERROR',traceback=traceback.format_exc()));raise
