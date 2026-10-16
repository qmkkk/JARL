"""Prepare only after the complete R18 decision. Freeze-before-run is enforced."""
from pathlib import Path
import json,shutil,hashlib,datetime,ast
R=Path(__file__).resolve().parents[1];P=R/'round18';Q=R/'round19'
load=lambda p:json.loads(p.read_text(encoding='utf-8'));dump=lambda p,x:p.write_text(json.dumps(x,indent=2,ensure_ascii=False),encoding='utf-8');h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
assert load(P/'state/round_status.json')['status']=='COMPLETE';assert not Q.exists()
assert load(R/'configs/three_round_completion_20261015.json')['rounds']==[17,18,19]
for d in ['tools','configs','input','inputs','graphs','rtl','src','build','results/hardware','state','logs','reports']:(Q/d).mkdir(parents=True,exist_ok=True)
orig=[]
def cp(p,d):
 d.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(p,d);orig.append(dict(source=str(p),target=str(d),sha256=h(p)))
for p in(P/'input').rglob('*'):
 if p.is_file():cp(p,Q/'input'/p.relative_to(P/'input'))
plan=load(P/'configs/plan.json');plan.update(round=19,registered=datetime.datetime.now().astimezone().isoformat(),phase='FINITE_AUDIT_THEN_FROZEN_FORMAL_REPRODUCTION',parent_round=18,formal_scope='Regenerate authorbaseline and all4proposedvariants from frozen seeds andorder; independently verify exact canonical models againstR18; rerun all18core and9integrated physical models even if identical; repeat108application records. No newmethod/case/tuning.',stop='Finalauthorizedround; complete evidenceassessment and ZIP, then stop autonomousexperiments. NoR20.');plan['core_scope']='All18core models freshly implemented after freeze. Identical variants are still separately placed/routed; HDL may share one identical instance but reports retain identity.'
for im in plan['images']:im['path']=str(Q/'input/images'/Path(im['path']).name)
dump(Q/'configs/plan.json',plan)
for c in plan['cases']:
 n=c['name']
 for suf in ['_seed','_pairs']:cp(P/f'graphs/{n}{suf}.json',Q/f'graphs/{n}{suf}.json')
 cp(P/f'graphs/{n}_seed.json',Q/f'graphs/{n}.json')
 cp(P/f'results/{n}_methods.json',Q/f'results/{n}_methods.json');cp(P/f'state/{n}_replay_manifest.json',Q/f'state/{n}_replay_manifest.json');cp(P/f'rtl/{n}.xdc',Q/f'rtl/{n}.xdc')
for p in(P/'tools').glob('*.py'):
 if p.name=='run18.py':continue
 s=p.read_text(encoding='utf-8')
 for stem in ['common','oracle','configure','state','model','hardware','quadol','direct','validate_adapter','application','integration','analyze']:s=s.replace(stem+'18',stem+'19')
 s=s.replace('r18_','r19_').replace('R18_PASS','R19_PASS').replace('R18_COMPLETE','R19_COMPLETE').replace('round=18,','round=19,')
 if p.name=='state18.py':s=s.replace("['static_full','state_const5','state_exact']:run_case", "['static_full','state_const5','state_exact','state_window']:run_case")
 if p.name=='model18.py':
  s=s.replace("dup=seen.get(digest);seen.setdefault(digest,top)","dup=None;seen.setdefault(digest,top)")
 if p.name=='analyze18.py':s=s.replace("new_search=m!='state_window'","new_search=True")
 ast.parse(s);(Q/'tools'/p.name.replace('18.py','19.py')).write_text(s,encoding='utf-8')
cp(R/'tools/final_audit_template.py',Q/'tools/audit19.py');cp(R/'tools/formal_identity_template.py',Q/'tools/identity19.py')
for stem in ['proposal','select']:
 s=(R/f'round17/tools/{stem}17.py').read_text().replace('common17','common19');ast.parse(s);(Q/f'tools/{stem}19.py').write_text(s,encoding='utf-8')
run=(P/'tools/run18.py').read_text();a=run.index('steps=');b=run.index('\nrows=',a)
run=run[:a]+"steps=[('audit19.py',),('validate_adapter19.py',),('quadol19.py',),('proposal19.py','context'),('proposal19.py','optimize'),('select19.py',),('state19.py',),('model19.py','verify'),('model19.py','export'),('identity19.py','core'),('hardware19.py','simulation'),('hardware19.py','route'),('application19.py',),('integration19.py','prepare'),('identity19.py','application_and_integration'),('integration19.py','simulation'),('integration19.py','route'),('analyze19.py',),('identity19.py','final')]"+run[b:]
# Immutable input/source checks before every formal stage; generated results excluded.
run=run.replace('for i,step in enumerate(steps):',"for i,step in enumerate(steps):\n for name,sha in json.loads((Q/'state/freeze_manifest.json').read_text())['files'].items():\n  assert hashlib.sha256(Path(name).read_bytes()).hexdigest()==sha,('FROZEN_FILE_CHANGED',name)")
ast.parse(run);(Q/'tools/run19.py').write_text(run,encoding='utf-8');dump(Q/'state/physical_reuse_catalog.json',[]);dump(Q/'state/origins.json',orig);dump(Q/'state/engineering_repairs.json',[])
expected=dict(core=load(P/'rtl/design_manifest.json'),integration=load(P/'rtl/integration/manifest.json'),tables=load(P/'state/product_tables.json'),application=load(P/'state/application_results.json'))
dump(Q/'input/expected_round18.json',expected)
dump(Q/'state/input_hashes.json',{p.relative_to(Q).as_posix():h(p)for sub in ['configs','input','graphs','rtl']for p in(Q/sub).rglob('*')if p.is_file()})
files={str(p):h(p)for sub in ['configs','input','tools']for p in(Q/sub).rglob('*')if p.is_file()}
for c in plan['cases']:
 n=c['name']
 for p in [Q/f'graphs/{n}_seed.json',Q/f'graphs/{n}.json',Q/f'graphs/{n}_pairs.json',Q/f'state/{n}_replay_manifest.json',Q/f'rtl/{n}.xdc']:files[str(p)]=h(p)
for sub in ['tools','round2/tools','input/legacy_code']:
 for p in(R/sub).rglob('*'):
  if p.is_file()and p.suffix in ['.py','.tcl']:files[str(p)]=h(p)
dump(Q/'state/freeze_manifest.json',dict(status='PREPARED_PENDING_CORE_AUDIT',created=datetime.datetime.now().astimezone().isoformat(),files=files,policy='Audit must pass before formal computations. Model, candidateorder, sharedalgorithm,authorcode,configs,toolscripts andinputdata remain bytefrozen.'))
dump(Q/'state/progress.json',dict(phase='PREPARED_FINITE_CORE_AUDIT'))
c=load(R/'state/campaign.json');c.update(status='ROUND19_PREPARED_LAST_AUTHORIZED_ROUND',active_round=19,root=str(Q),latest_progress='round19/state/progress.json');dump(R/'state/campaign.json',c)
print('R19 readyforfiniteaudit; formal27physicalmodels,108applicationrecords; noautomaticR20')
