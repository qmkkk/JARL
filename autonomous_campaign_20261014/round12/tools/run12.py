from pathlib import Path
import subprocess,sys,json,datetime,hashlib,time
sys.dont_write_bytecode=True
Q=Path(__file__).resolve().parents[1]
steps=[('abc12.py',),('core12.py','context'),('core12.py','optimize'),('core12.py','replay'),('model12.py','verify'),('model12.py','export'),('hardware12.py','simulation'),('hardware12.py','route'),('analyze12.py',)]
rows=[]
(Q/'state/execution_source_hashes.json').write_text(json.dumps({str(p):hashlib.sha256(p.read_bytes()).hexdigest()for d in ['tools','configs']for p in(Q/d).rglob('*')if p.is_file()},indent=2))
for i,step in enumerate(steps):
 log=Q/f'logs/pipeline_{i:02d}_{step[0]}.log';assert not log.exists();cmd=[sys.executable,'-B',str(Q/'tools'/step[0]),*step[1:]];print('BEGIN',step,flush=True);st=time.perf_counter()
 with log.open('w',encoding='utf-8')as f:p=subprocess.run(cmd,stdout=f,stderr=subprocess.STDOUT,creationflags=subprocess.CREATE_NO_WINDOW)
 rows.append(dict(step=list(step),returncode=p.returncode,wall_s=time.perf_counter()-st,log=str(log),finished=datetime.datetime.now().astimezone().isoformat()));(Q/'state/pipeline.json').write_text(json.dumps(rows,indent=2));print('END',step,p.returncode,flush=True);p.check_returncode()
