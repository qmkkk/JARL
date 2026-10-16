"""Serial, resumable fixed matrix. No overlapping build writers or hidden schedules."""
from pathlib import Path
import os,sys,json,subprocess,time,datetime,traceback
Q=Path(__file__).resolve().parents[1]
def load(p):return json.loads(p.read_text(encoding='utf-8'))
def dump(p,x):p.write_text(json.dumps(x,indent=2,ensure_ascii=False),encoding='utf-8')
plan=load(Q/'configs/plan.json');env=dict(os.environ,PYTHONUTF8='1',PYTHONHASHSEED='20261015',PYTHONDONTWRITEBYTECODE='1')
f=Q/'state/pipeline.json';records=load(f)if f.exists()else[]
def stage(key,args):
 if any(r['key']==key and r['returncode']==0 for r in records):return
 attempt=sum(r['key']==key for r in records)+1;log=Q/'logs'/f'{key}_attempt{attempt}.log';assert not log.exists()
 dump(Q/'state/round_status.json',dict(status='RUNNING',phase=key,planned_cells=30,complete_cells=sum(r['key'].endswith('_serial_quadol')and r['returncode']==0 for r in records),pid=os.getpid(),updated=datetime.datetime.now().astimezone().isoformat()))
 st=time.perf_counter();print('START',key,flush=True)
 with log.open('w',encoding='utf-8')as out:p=subprocess.run([sys.executable,'-X','utf8','-B',*map(str,args)],stdout=out,stderr=subprocess.STDOUT,env=env,creationflags=subprocess.CREATE_NO_WINDOW)
 records.append(dict(key=key,returncode=p.returncode,wall_s=time.perf_counter()-st,log=str(log),finished=datetime.datetime.now().astimezone().isoformat()));dump(f,records)
 if p.returncode:
  dump(Q/'state/round_status.json',dict(status='ENGINEERING_INTERRUPTION',phase=key,log=str(log),complete_cells=sum(r['key'].endswith('_serial_quadol')and r['returncode']==0 for r in records),planned_cells=30));p.check_returncode()
 print('DONE',key,flush=True)
for c in plan['cases']:
 n=c['name']
 if c['budget_index']==0:stage(c['family']+'_seed',[Q/'tools/worker20.py','seed',n])
 for phase in ['context','proposal','main','quadol','serial_prepare','serial_support','serial_quadol']:stage(n+'_'+phase,[Q/'tools/worker20.py',phase,n])
stage('export',[Q/'tools/export20.py'])
stage('hardware',[Q/'tools/hardware20.py'])
dump(Q/'state/round_status.json',dict(status='ALL_EXPERIMENTS_COMPLETE_AWAIT_ANALYSIS',complete_cells=30,planned_cells=30,finished=datetime.datetime.now().astimezone().isoformat()))
