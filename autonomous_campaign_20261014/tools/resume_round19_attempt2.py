from pathlib import Path
import sys,json,hashlib,subprocess,time,datetime,ast
R=Path(__file__).resolve().parents[1];Q=R/'round19';load=lambda p:json.loads(p.read_text(encoding='utf-8'));dump=lambda p,x:p.write_text(json.dumps(x,indent=2,ensure_ascii=False),encoding='utf-8')
tree=ast.parse((Q/'tools/run19.py').read_text());steps=next(ast.literal_eval(n.value)for n in tree.body if isinstance(n,ast.Assign)and any(isinstance(t,ast.Name)and t.id=='steps'for t in n.targets));rows=load(Q/'state/pipeline.json');assert len(rows)==2 and all(x['step']==['audit19.py']and x['returncode']==1 for x in rows)
for i,step in enumerate(steps):
 for p,sha in load(Q/'state/freeze_manifest.json')['files'].items():assert hashlib.sha256(Path(p).read_bytes()).hexdigest()==sha,p
 log=Q/f'logs/resume2_{i:02d}_{step[0]}.log';assert not log.exists();st=time.perf_counter();print('FORMAL_RESUME',step,flush=True)
 with log.open('w',encoding='utf-8')as f:p=subprocess.run([sys.executable,'-B',str(Q/'tools'/step[0]),*step[1:]],stdout=f,stderr=subprocess.STDOUT,creationflags=subprocess.CREATE_NO_WINDOW)
 rows.append(dict(step=list(step),returncode=p.returncode,wall_s=time.perf_counter()-st,log=str(log),attempt='pre_freeze_version_capture_resume2',finished=datetime.datetime.now().astimezone().isoformat()));dump(Q/'state/pipeline.json',rows);print('END',step,p.returncode,flush=True);p.check_returncode()
