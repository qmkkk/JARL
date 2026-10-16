from pathlib import Path
import subprocess,sys,json,hashlib,datetime,time
R=Path(__file__).resolve().parents[1];Q=R/'round18';load=lambda p:json.loads(p.read_text());dump=lambda p,x:p.write_text(json.dumps(x,indent=2,ensure_ascii=False),encoding='utf-8')
rows=load(Q/'state/pipeline.json');assert rows[-1]['step']==['integration18.py','simulation']and rows[-1]['returncode']==1
allowed={z['path']:z['new_sha256']for rec in load(Q/'state/engineering_repairs.json')for z in rec['changes']}
for p,sha in load(Q/'state/execution_source_hashes.json').items():assert hashlib.sha256(Path(p).read_bytes()).hexdigest()==allowed.get(p,sha),p
for i,step in enumerate([('integration18.py','simulation'),('integration18.py','route'),('analyze18.py',)]):
 log=Q/f'logs/resume1_{i}_{step[0]}.log';assert not log.exists();st=time.perf_counter();print('RESUME',step,flush=True)
 with log.open('w',encoding='utf-8')as f:p=subprocess.run([sys.executable,'-B',str(Q/'tools'/step[0]),*step[1:]],stdout=f,stderr=subprocess.STDOUT,creationflags=subprocess.CREATE_NO_WINDOW)
 rows.append(dict(step=list(step),returncode=p.returncode,wall_s=time.perf_counter()-st,log=str(log),attempt='startup_gsr_resume1',finished=datetime.datetime.now().astimezone().isoformat()));dump(Q/'state/pipeline.json',rows);print('END',step,p.returncode,flush=True);p.check_returncode()
