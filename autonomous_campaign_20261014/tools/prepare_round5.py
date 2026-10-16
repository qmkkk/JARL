from pathlib import Path
import json,hashlib,shutil,datetime
R=Path(__file__).resolve().parents[1];Q=R/'round5';assert not Q.exists()
for d in ['configs','state','tools','reports','rtl','inputs','results/hardware']:(Q/d).mkdir(parents=True,exist_ok=True)
def dump(p,x):p.write_text(json.dumps(x,indent=2,ensure_ascii=False),encoding='utf-8')
cases=[];entries=[];hashes={};old=json.loads((R/'round4/rtl/design_manifest.json').read_text())
for base,clocks in [('sqrt12',[8.0,10.0,12.5]),('sqrt16',[12.5,16.667,20.0])]:
 for clock in clocks:
  tag=str(clock).replace('.','p');case=f'{base}_c{tag}';cases.append(dict(name=case,base_case=base,clock_ns=clock,budget=1));xdc=(R/f'round4/rtl/{base}.xdc').read_text();assert '25' in xdc
  # Replace the period only; all input/output constraints remain identical.
  import re
  xdc,count=re.subn(r'(create_clock[^\n]*-period\s+)25(?:\.0)?\b',lambda m:m[1]+str(clock),xdc);assert count==1
  (Q/f'rtl/{case}.xdc').write_text(xdc)
  for method in ['abc_exact','relation']:
   e=next(e for e in old if e['case']==base and e['method']==method);src=R/f'round4/rtl/{e["top"]}.v';text=src.read_text();dst=Q/f'rtl/{e["top"]}.v'
   if not dst.exists():shutil.copy2(src,dst)
   assert dst.read_bytes()==src.read_bytes();hashes[str(src)]=hashlib.sha256(src.read_bytes()).hexdigest()
   entries.append(dict(e,case=case,base_case=base,job=f'{e["top"]}_c{tag}',clock_ns=clock,duplicate_of=None,verification='R4 exact RTL bytes; all formal/scalar/HDL results inherited, not new R5 functional runs'))
plan=dict(round=5,registered=datetime.datetime.now().astimezone().isoformat(),question='Does the R4 routed path advantage yield better timing-closed core design points under common tight clocks?',cases=cases,baselines=['abc_exact'],innovations=['relation'],methods=['abc_exact','relation'],scope='Fixed four R4 RTL functions; no algorithm or architecture changes. Twelve common-clock physical builds.',checks='Same R4 physical flow/part, DSP forbidden, unchanged 2ns IO constraints; all setup,hold,DRC,check_timing criteria. Failed timing is a result, not a tool failure.',limits=['one tool implementation per design point, not placement robustness','highest passing registered frequency is not exact Fmax','kernel timing estimates, not measured board/application throughput','new runs are physical only; functional verification inherited by byte identity'],stop='Finish all 12 jobs, analyze and score, then decide next justified round; no bisection, extra clock or directive search',score=dict(innovation=25,physical_gain=25,problem_coverage=20,correctness=20,cost=10))
dump(Q/'configs/plan.json',plan);dump(Q/'rtl/design_manifest.json',entries);dump(Q/'state/input_hashes.json',hashes);dump(Q/'state/progress.json',dict(phase='REGISTERED',round=5));dump(Q/'state/round_status.json',dict(status='REGISTERED',round=5));c=json.loads((R/'state/campaign.json').read_text());c.update(status='ROUND5_REGISTERED',active_round=5,root=str(Q),latest_progress='round5/state/progress.json');dump(R/'state/campaign.json',c)
s=(R/'round4/tools/hardware4.py').read_text();s=s.replace('from model4 import R,Q,load,dump,export',"Q=Path(__file__).resolve().parents[1];R=Q.parent\ndef load(p):return json.loads(Path(p).read_text())\ndef dump(p,x):Path(p).write_text(json.dumps(x,indent=2,ensure_ascii=False),encoding='utf-8')")
s=s.replace("q=OUT/top;assert not q.exists()","q=OUT/entry['job'];assert not q.exists()")
s=s.replace("{'export':export,'simulation':simulation,'route':route}[sys.argv[1]]()","{'route':route}[sys.argv[1]]()")
(Q/'tools/hardware5.py').write_text(s);print('Round5 registered:',len(entries),'physical jobs')
