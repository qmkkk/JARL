from pathlib import Path
import subprocess,sys,json,time,datetime,hashlib
Q=Path(__file__).resolve().parents[1]
assert json.loads((Q/'state/progress.json').read_text())['phase']=='ALL_SIX_SEARCHES_COMPLETE'
steps=[('validate_adapter11.py',),('model11.py',),('hardware11.py','simulation'),('hardware11.py','route'),('analyze11.py',)]
records=[]
for i,step in enumerate(steps):
 log=Q/'logs'/f'completion_{i:02d}_{step[0]}.log';assert not log.exists();st=time.perf_counter();print('BEGIN',step,flush=True)
 with log.open('w')as f:p=subprocess.run([sys.executable,'-B',str(Q/'tools'/step[0]),*step[1:]],stdout=f,stderr=subprocess.STDOUT,creationflags=subprocess.CREATE_NO_WINDOW)
 records.append(dict(step=step,returncode=p.returncode,wall_s=time.perf_counter()-st,log=str(log),finished=datetime.datetime.now().astimezone().isoformat()));(Q/'state/completion_pipeline.json').write_text(json.dumps(records,indent=2));print('END',step,p.returncode,flush=True);p.check_returncode()
