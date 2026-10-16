from pathlib import Path
import subprocess,sys,json,datetime,hashlib,time
sys.dont_write_bytecode=True
Q=Path(__file__).resolve().parents[1]
steps=[('audit19.py',),('validate_adapter19.py',),('quadol19.py',),('proposal19.py','context'),('proposal19.py','optimize'),('select19.py',),('state19.py',),('model19.py','verify'),('model19.py','export'),('identity19.py','core'),('hardware19.py','simulation'),('hardware19.py','route'),('application19.py',),('integration19.py','prepare'),('identity19.py','application_and_integration'),('integration19.py','simulation'),('integration19.py','route'),('analyze19.py',),('identity19.py','final')]
rows=[]
(Q/'state/execution_source_hashes.json').write_text(json.dumps({str(p):hashlib.sha256(p.read_bytes()).hexdigest()for d in ['tools','configs']for p in(Q/d).rglob('*')if p.is_file()},indent=2))
for i,step in enumerate(steps):
 for name,sha in json.loads((Q/'state/freeze_manifest.json').read_text())['files'].items():
  assert hashlib.sha256(Path(name).read_bytes()).hexdigest()==sha,('FROZEN_FILE_CHANGED',name)
 log=Q/f'logs/pipeline_{i:02d}_{step[0]}.log';assert not log.exists();cmd=[sys.executable,'-B',str(Q/'tools'/step[0]),*step[1:]];print('BEGIN',step,flush=True);st=time.perf_counter()
 with log.open('w',encoding='utf-8')as f:p=subprocess.run(cmd,stdout=f,stderr=subprocess.STDOUT,creationflags=subprocess.CREATE_NO_WINDOW)
 rows.append(dict(step=list(step),returncode=p.returncode,wall_s=time.perf_counter()-st,log=str(log),finished=datetime.datetime.now().astimezone().isoformat()));(Q/'state/pipeline.json').write_text(json.dumps(rows,indent=2));print('END',step,p.returncode,flush=True);p.check_returncode()
