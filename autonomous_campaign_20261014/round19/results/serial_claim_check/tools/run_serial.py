from pathlib import Path
import json,hashlib,subprocess,sys,time,datetime
Q=Path(__file__).resolve().parents[1];P=Q.parents[1]
load=lambda p:json.loads(p.read_text(encoding='utf-8'))
assert load(P/'state/analysis.json')['status'] in ['COMPLETE_AWAIT_SCORE','COMPLETE_SCORED']
steps=[('serial_support.py',),('validate_adapter_serial.py',),('quadol_serial.py',),('model_serial.py','verify'),('model_serial.py','export'),('hardware_serial.py','simulation'),('hardware_serial.py','route'),('application_serial.py',),('integration_serial.py','prepare'),('integration_serial.py','simulation'),('integration_serial.py','route')]
rows=[]
for i,step in enumerate(steps):
 for n,sha in load(Q/'state/freeze_manifest.json')['files'].items():assert hashlib.sha256(Path(n).read_bytes()).hexdigest()==sha,n
 log=Q/f'logs/pipeline_{i:02d}_{step[0]}.log';assert not log.exists();t=time.perf_counter();print('FINAL_SERIAL_CONTROL',step,flush=True)
 with log.open('w',encoding='utf-8')as f:p=subprocess.run([sys.executable,'-B',str(Q/'tools'/step[0]),*step[1:]],stdout=f,stderr=subprocess.STDOUT,creationflags=subprocess.CREATE_NO_WINDOW)
 rows.append(dict(step=list(step),returncode=p.returncode,wall_s=time.perf_counter()-t,log=str(log),finished=datetime.datetime.now().astimezone().isoformat()));(Q/'state/pipeline.json').write_text(json.dumps(rows,indent=2),encoding='utf-8');p.check_returncode()
(Q/'state/completion.json').write_text(json.dumps(dict(status='COMPLETE',core_models=3,integrated_models=3,application_records=18),indent=2),encoding='utf-8');print('FINAL_SERIAL_CONTROL_COMPLETE',flush=True)
