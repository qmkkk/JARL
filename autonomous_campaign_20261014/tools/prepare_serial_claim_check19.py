"""One finite missing causal control; never changes the frozen main experiment."""
from pathlib import Path
import json,hashlib,shutil,ast,datetime
R=Path(__file__).resolve().parents[1];P=R/'round19';Q=P/'results/serial_claim_check';load=lambda p:json.loads(p.read_text(encoding='utf-8'));dump=lambda p,x:p.write_text(json.dumps(x,indent=2,ensure_ascii=False),encoding='utf-8');h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
assert load(P/'state/freeze_manifest.json')['status']=='FROZEN_AUDIT_PASSED';assert not Q.exists()
for d in ['tools','configs','input','graphs','rtl','src','build','results/hardware','state','logs','reports']:(Q/d).mkdir(parents=True,exist_ok=True)
plan=load(P/'configs/plan.json');plan.update(round=19,substudy='FINAL_FINITE_SERIAL_CAUSAL_CONTROL',registered=datetime.datetime.now().astimezone().isoformat(),reason='Original paper roadmap explicitly identified independent support reduction followedbyQUADOL as necessary to distinguish joint generation from staged existing operations. This essential formal control was missing from the initial final manifest. Main19matrix/model remain frozen; no newdirection or fourthround.',baseline_label='Serial single-output support reduction then pinned author QUADOL-WCE',baseline_status='Transparent controlled serial method plus actual author code; not a claim to reproduce ASPDAC2017 wire-removal paper or all QUADOL+ variants.',method='Same original candidate roots and order as main; for each single root rebuild full current two-choice WCE relation; enumerate all subsets of its own original pins, choose minimum support thenWCE/HD/mask; independent complete-domain admission. Onepass, then unchangedauthorQUADOL-WCE and16endpoint protections.',methods=['quadol_wce'],formal_baseline_policy='Additional necessary final-paper causal control, not an exploratory thirdbaseline disguised by regrouping. All initial two-baseline results retained; final table includes serialcontrol explicitly.',scope='3coremodels+3same16term integratedmodels+18image records; independent full-domain/HDL andfixedclockPPA. No parametersearch, retryoptimization orfollowup.',stop='After this control and original19finish, finalassessandstop. No round20.');plan['integration']['methods']=['quadol_wce'];plan['application']['methods']='serialcontrolonly; identical data/quality formulas';plan['core_scope']='Three serialcontrolmodels only; compare after all original19+control jobs complete.'
for im in plan['images']:im['path']=str(Q/'input/images'/Path(im['path']).name)
shutil.copytree(P/'input/quadol_source',Q/'input/quadol_source');shutil.copytree(P/'input/images',Q/'input/images');dump(Q/'configs/plan.json',plan)
for c in plan['cases']:
 n=c['name'];shutil.copy2(P/f'graphs/{n}_seed.json',Q/f'graphs/{n}_original.json');shutil.copy2(P/f'graphs/{n}_pairs.json',Q/f'graphs/{n}_pairs.json');shutil.copy2(P/f'state/{n}_replay_manifest.json',Q/f'state/{n}_replay_manifest.json');shutil.copy2(P/f'rtl/{n}.xdc',Q/f'rtl/{n}.xdc')
def save(n,s):ast.parse(s);(Q/'tools'/n).write_text(s,encoding='utf-8')
for stem in ['common','oracle','quadol','direct','validate_adapter','hardware','application','integration']:
 s=(P/f'tools/{stem}19.py').read_text(encoding='utf-8')
 for st in ['common','oracle','quadol','direct','validate_adapter','model','hardware','application','integration']:s=s.replace(st+'19',st+'_serial')
 s=s.replace('R=Q.parent','R=Q.parents[2]').replace('r19_','s19_').replace('R19_PASS','SERIAL_PASS')
 if stem=='quadol':
  s=s.replace('int(not selected)','0').replace("assert seed['WCE']==c['seed_budget']","assert seed['WCE']==load(Q/f'state/{n}_serial.json')['final']['WCE']")
 if stem=='application':s=s.replace('assert len(rows)==108','assert len(rows)==18')
 if stem=='integration':
  s=s.replace("METHODS=['seed','quadol_wce','state_window']","METHODS=['quadol_wce']").replace('Y[0:2]','Y[0:0]').replace('done[0:2]','done[0:0]').replace('e[0:2]','e[0:0]').replace('%d %d %d %d %d %d %d %d %d','%d %d %d %d %d %d %d').replace('e[0],e[1],e[2]','e[0]').replace('rc==9','rc==7').replace('j<3','j<1').replace('models=3,done_checks=3*len(stimuli),sum_checks=3*len(blocks)','models=1,done_checks=len(stimuli),sum_checks=len(blocks)').replace('planned=9','planned=3').replace('core_models=18,integration_models=9','core_models=3,integration_models=3')
 save(stem+'_serial.py',s)
s=(R/'round15/tools/model15.py').read_text(encoding='utf-8').replace('common15','common_serial').replace('direct15','direct_serial').replace('R=Q.parent','R=Q.parents[2]').replace('r15_','s19_').replace('R15_PASS','SERIAL_PASS').replace('seed_expected(l)','seed_expected(a,b,l)').replace("METHODS=['quantized','quadol_wce','numeric_window']","METHODS=['quadol_wce']")
a=s.index('def choices');b=s.index('def unpack_method');s=s[:a]+'''def choices(n,method):return []
def models(c):
 n=c['name'];g=load(Q/f'graphs/{n}_original.json');ops,co,ins,nn,_=build(g);out={'seed':(g,ops,co,ins,nn)};gm=load(Q/f'graphs/{n}_quadol_wce.json');op,k,i,sz,_=build(gm);out['quadol_wce']=(gm,op,k,i,sz);return out

'''+s[b:];s=s.replace("pairs=load(Q/f'graphs/{n}_pairs.json');data={r['pair']:r for r in load(Q/f'results/{n}_methods.json')}","pairs=[];data={}");save('model_serial.py',s)
shutil.copy2(R/'tools/serial_support_template19.py',Q/'tools/serial_support.py')
dump(Q/'state/physical_reuse_catalog.json',[]);dump(Q/'state/engineering_repairs.json',[]);dump(Q/'state/progress.json',dict(phase='REGISTERED_WAITING_FOR_MAIN19_COMPLETE'))
run='''from pathlib import Path
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
''';save('run_serial.py',run)
files={str(p):h(p)for sub in ['tools','configs','input','graphs','rtl']for p in(Q/sub).rglob('*')if p.is_file()};files.update({str(Q/f'state/{c["name"]}_replay_manifest.json'):h(Q/f'state/{c["name"]}_replay_manifest.json')for c in plan['cases']});dump(Q/'state/freeze_manifest.json',dict(status='FROZEN_BEFORE_EXECUTION',registered=plan['registered'],files=files));dump(P/'state/final_manifest_supplement.json',dict(status='REGISTERED_PENDING',path=str(Q),reason=plan['reason'],scope=plan['scope'],no_more_supplements=True,main_frozen_files_unchanged=True));print('Final19serialcontrol registered beforeanycontrolresult; mainfrozenmatrix unchanged')
