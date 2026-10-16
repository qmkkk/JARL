from pathlib import Path
import sys,os,json,subprocess,time,datetime
Q=Path(__file__).resolve().parents[1]
def load(p):return json.loads(p.read_text(encoding='utf-8'))
def dump(p,x):p.write_text(json.dumps(x,indent=2,ensure_ascii=False),encoding='utf-8')
env=dict(os.environ,PYTHONUTF8='1',PYTHONHASHSEED='20261015',PYTHONDONTWRITEBYTECODE='1')
records=load(Q/'state/pipeline.json')if(Q/'state/pipeline.json').exists()else[]
def stage(key,args):
 if any(r['key']==key and r['returncode']==0 for r in records):return
 attempt=1+sum(r['key']==key for r in records);log=Q/f'logs/{key}_attempt{attempt}.log';assert not log.exists()
 dump(Q/'state/round_status.json',dict(round=21,status='RUNNING',phase=key,pid=os.getpid(),planned_cases=3,planned_endpoints=12,updated=datetime.datetime.now().astimezone().isoformat()))
 print('START',key,flush=True);st=time.perf_counter()
 with log.open('w',encoding='utf-8')as out:p=subprocess.run([sys.executable,'-X','utf8','-B',*map(str,args)],stdout=out,stderr=subprocess.STDOUT,env=env,creationflags=subprocess.CREATE_NO_WINDOW)
 records.append(dict(key=key,returncode=p.returncode,seconds=time.perf_counter()-st,log=str(log)));dump(Q/'state/pipeline.json',records)
 if p.returncode:dump(Q/'state/round_status.json',dict(round=21,status='ENGINEERING_INTERRUPTION',phase=key,log=str(log)));p.check_returncode()
 print('DONE',key,flush=True)
for c in load(Q/'configs/plan.json')['cases']:
 n=c['name']
 for phase in ['seed','context','proposal','main','quadol','serial_prepare','serial_support','serial_quadol']:stage(n+'_'+phase,[Q/'tools/worker21.py',phase,n])
 stage(n+'_quality',[Q/'tools/quality21.py',n])
stage('export',[Q/'tools/export21.py'])
stage('hardware',[Q/'tools/hardware21.py'])
dump(Q/'state/round_status.json',dict(round=21,status='ALL_EXPERIMENTS_COMPLETE_AWAIT_ANALYSIS',cases=3,endpoints=12,finished=datetime.datetime.now().astimezone().isoformat()))
