from pathlib import Path
import sys,json,hashlib,subprocess,time,datetime,ast
R=Path(__file__).resolve().parents[1];Q=R/'round19';load=lambda p:json.loads(p.read_text(encoding='utf-8'));dump=lambda p,x:p.write_text(json.dumps(x,indent=2),encoding='utf-8')
tree=ast.parse((Q/'tools/run19.py').read_text());steps=next(ast.literal_eval(n.value)for n in tree.body if isinstance(n,ast.Assign)and any(isinstance(t,ast.Name)and t.id=='steps'for t in n.targets));rows=load(Q/'state/pipeline.json');assert rows[-1]['step']==['identity19.py','core'] and rows[-1]['returncode']==1
for i,step in enumerate(steps[9:],9):
 for manifest in ['freeze_manifest.json','baseline_identity_amendment.json']:
  for p,sha in load(Q/'state'/manifest)['files'].items():assert hashlib.sha256(Path(p).read_bytes()).hexdigest()==sha,p
 source=R/'tools/identity19_overlay.py'if step[0]=='identity19.py'else Q/'tools'/step[0]
 log=Q/f'logs/resume3_{i:02d}_{step[0]}.log';assert not log.exists();st=time.perf_counter();print('FORMAL_RESUME',step,flush=True)
 with log.open('w',encoding='utf-8')as f:p=subprocess.run([sys.executable,'-B',str(source),*step[1:]],stdout=f,stderr=subprocess.STDOUT,creationflags=subprocess.CREATE_NO_WINDOW)
 rows.append(dict(step=list(step),returncode=p.returncode,wall_s=time.perf_counter()-st,log=str(log),executed_source=str(source),attempt='baseline_identity_disclosure',finished=datetime.datetime.now().astimezone().isoformat()));dump(Q/'state/pipeline.json',rows);print('END',step,p.returncode,flush=True);p.check_returncode()
