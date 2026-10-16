"""Execute the unchanged finite serial matrix; overlap CPU prefix only, never Vivado."""
from pathlib import Path
import sys,json,ast,subprocess,time,datetime,hashlib
R=Path(__file__).resolve().parents[1];P=R/'round19';Q=P/'results/serial_claim_check'
load=lambda p:json.loads(p.read_text(encoding='utf-8'));dump=lambda p,x:p.write_text(json.dumps(x,indent=2),encoding='utf-8');h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
tree=ast.parse((Q/'tools/run_serial.py').read_text());steps=next(ast.literal_eval(n.value)for n in tree.body if isinstance(n,ast.Assign)and any(isinstance(t,ast.Name)and t.id=='steps'for t in n.targets))
phase=sys.argv[1];f=Q/'state/pipeline.json'
if phase=='cpu_prefix':
 assert not f.exists();rows=[];indices=range(5)
 dump(Q/'state/execution_scheduling.json',dict(status='CPU_PREFIX_OVERLAP_ONLY',script=str(Path(__file__)),sha256=h(Path(__file__)),reason='Independent C++/Python preparation in isolated serial directories overlaps primary integrated Vivado. All hardware waits for primary matrix completion. Same eleven fixed stages, inputs, code, limits and order; no new experiments or outcome-based changes.',prefix=list(range(5)),suffix=list(range(5,11))))
else:
 assert load(P/'state/analysis.json')['status'] in ['COMPLETE_AWAIT_SCORE','COMPLETE_SCORED'];rows=load(f);assert len(rows)==5 and all(x['returncode']==0 for x in rows);indices=range(5,11)
 assert load(Q/'state/execution_scheduling.json')['sha256']==h(Path(__file__))
for i in indices:
 step=steps[i]
 for name,sha in load(Q/'state/freeze_manifest.json')['files'].items():assert h(Path(name))==sha,name
 log=Q/f'logs/staged_{i:02d}_{step[0]}.log';assert not log.exists();st=time.perf_counter();print('SERIAL_FIXED_STAGE',step,flush=True)
 with log.open('w',encoding='utf-8')as out:p=subprocess.run([sys.executable,'-B',str(Q/'tools'/step[0]),*step[1:]],stdout=out,stderr=subprocess.STDOUT,creationflags=subprocess.CREATE_NO_WINDOW)
 rows.append(dict(step=list(step),returncode=p.returncode,wall_s=time.perf_counter()-st,log=str(log),phase=phase,finished=datetime.datetime.now().astimezone().isoformat()));dump(f,rows);print('END',step,p.returncode,flush=True);p.check_returncode()
if phase!='cpu_prefix':dump(Q/'state/completion.json',dict(status='COMPLETE',core_models=3,integrated_models=3,application_records=18))
print('SERIAL_PHASE_COMPLETE',phase,flush=True)
