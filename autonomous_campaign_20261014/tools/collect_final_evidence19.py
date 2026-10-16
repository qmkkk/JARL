"""Collect only after BOTH fixed formal matrices finish; no experiment starts here."""
from pathlib import Path
import json,csv,hashlib,math,datetime,ast
import numpy as np
R=Path(__file__).resolve().parents[1];Q=R/'round19';S=Q/'results/serial_claim_check'
load=lambda p:json.loads(p.read_text(encoding='utf-8'));dump=lambda p,x:p.write_text(json.dumps(x,indent=2,ensure_ascii=False),encoding='utf-8');h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
assert load(S/'state/completion.json')['status']=='COMPLETE'
schedule=load(S/'state/execution_scheduling.json');assert h(Path(schedule['script']))==schedule['sha256']
a=load(Q/'state/analysis.json');assert a['status'] in ['COMPLETE_AWAIT_SCORE','COMPLETE_SCORED']
checks=[]
for root,name in [(Q,'freeze_manifest.json'),(Q,'baseline_identity_amendment.json'),(S,'freeze_manifest.json'),(S,'generated_artifact_freeze.json')]:
 d=load(root/'state'/name)
 for p,sha in d['files'].items():assert h(Path(p))==sha,p
 checks.append(dict(check=str(root/'state'/name),files=len(d['files']),status='PASS'))
for p,sha in load(Q/'state/input_hashes.json').items():assert h(Q/p)==sha,p
for e in load(R/'state/campaign.json')['rounds']:assert h(Path(e['report']))==e['report_sha256'],e['round']
allowed={z['path']:z['new_sha256']for r in load(Q/'state/engineering_repairs.json')for z in r.get('changes',[])}
for p,sha in load(Q/'state/execution_source_hashes.json').items():assert h(Path(p))==allowed.get(p,sha),p
snapshot_updates=[]
for p,sha in load(Q/'state/evidence_hashes.json').items():
 current=h(Q/p)
 if current!=sha:
  assert p.startswith('results/serial_claim_check/state/') and Path(p).name in ['progress.json','pipeline.json','commands.json','hardware_commands.json'],p
  snapshot_updates.append(dict(path=p,primary_stage_sha256=sha,final_sha256=current,reason='Serial execution metadata advanced after primary-stage snapshot; original result/source bytes unchanged.'))
dump(Q/'state/evidence_snapshot_reconciliation.json',dict(status='PASS',original_primary_snapshot_preserved=True,expected_serial_progress_updates=snapshot_updates,final_authoritative_receipt='Delivered ZIP MANIFEST.json and adjacent verification.json'))
pipes=[]
for root,count in [(Q,19),(S,11)]:
 rows=load(root/'state/pipeline.json');effective={tuple(x['step']):x for x in rows};assert len(effective)==count and all(x['returncode']==0 for x in effective.values())
 pipes.append(dict(directory=str(root),effective_stages=count,records=len(rows),preserved_failed_attempts=sum(x['returncode']!=0 for x in rows),effective_wall_s=sum(x['wall_s']for x in effective.values())))
rows=[dict(r,study='primary')for r in a['rows']];sp={x['top']:x for x in load(S/'results/hardware/ppa.json')}
for e in load(S/'rtl/design_manifest.json'):
 p=sp[e['top']];v=next(x for x in csv.DictReader((S/f'results/{e["case"]}_verify.csv').open())if x['method']==e['method'])
 rows.append(dict(case=e['case'],method='serial_then_quadol',WCE=int(v['WCE']),MAE=float(v['MAE_at_lowbits_zero']),inputs=int(v['inputs']),budget=e['budget'],new_physical=True,study='serial_control',**{k:p[k]for k in ['LUT','FF','CARRY4','DSP','WNS_ns','WHS_ns','clock_ns','pass_registered_clock']},physical_directory=p['physical_directory']))
integ=[dict(r,study='primary')for r in a['integration']]+[dict(r,method='serial_then_quadol',study='serial_control')for r in load(S/'results/integration/ppa.json')]
apps=load(Q/'state/application_results.json')['rows']+[dict(r,method='serial_then_quadol')for r in load(S/'state/application_results.json')['rows']]
assert len(rows)==21 and len(integ)==12 and len(apps)==126
assert all(r['WCE']<=r['budget'] and r['pass_registered_clock'] for r in rows)
assert all(r['pass_registered_clock'] and r['DSP']==0 for r in integ)
for root in [Q,S]:
 for name in ['rtl_validation.json','integration_validation.json']:
  assert all(x['status']=='PASS'for x in load(root/'state'/name))
gains=[];quality=[]
for c in load(Q/'configs/plan.json')['cases']:
 n=c['name'];rr={r['method']:r for r in rows if r['case']==n};ii={r['method']:r for r in integ if r['case']==n}
 baselines=['seed','quadol_wce','serial_then_quadol'];best=min(baselines,key=lambda m:rr[m]['LUT']);best_i=min(baselines,key=lambda m:ii[m]['LUT'])
 gains.append(dict(case=n,width=c['width'],budget=c['budget'],best_core_baseline=best,baseline_LUT=rr[best]['LUT'],proposed_LUT=rr['state_window']['LUT'],core_gain_pct=100*(1-rr['state_window']['LUT']/rr[best]['LUT']),best_integration_baseline=best_i,baseline_integrated_LUT=ii[best_i]['LUT'],proposed_integrated_LUT=ii['state_window']['LUT'],integration_gain_pct=100*(1-ii['state_window']['LUT']/ii[best_i]['LUT'])))
 for task in ['alpha_blend','binomial16']:
  for m in rr:
   ar=[r for r in apps if r['case']==n and r['method']==m and r['task']==task];assert len(ar)==3
   mse=sum(r['RMSE']**2*r['pixels']for r in ar)/sum(r['pixels']for r in ar)
   quality.append(dict(case=n,width=c['width'],task=task,method=m,pooled_PSNR_dB=10*math.log10(255**2/mse)if mse else None,mean_SSIM=sum(r['SSIM']for r in ar)/3,MAE=sum(r['MAE']for r in ar)/3,bias=sum(r['bias']for r in ar)/3,max_error=max(r['max_error']for r in ar)))
# Recheck mathematical composition using final tables (including regenerated baseline and serial control).
composition=[]
for root in [Q,S]:
 tables={(x['case'],x['method']):x for x in load(root/'state/product_tables.json')}
 for e in load(root/'rtl/integration/manifest.json'):
  n=e['case'];c=next(c for c in load(Q/'configs/plan.json')['cases']if c['name']==n);tab=tables[n,e['method']];p=Path(tab['path']);assert h(p)==tab['sha256'];t=np.fromfile(p,dtype='<u4').reshape(1<<c['width'],1<<c['width'])
  blocks=load(root/f'rtl/integration/{n}_input_blocks.json');errs=[]
  assert blocks==load(Q/f'rtl/integration/{n}_input_blocks.json')
  for block in blocks:
   target=sum(aa*bb for aa,bb in block);approx=sum(int(t[bb,aa])for aa,bb in block);assert 0<=target<2**32 and 0<=approx<2**32;err=abs(target-approx);assert err<=16*c['budget'];errs.append(err)
  composition.append(dict(case=n,method=e['method']if root==Q else 'serial_then_quadol',blocks=len(blocks),observed_max_error=max(errs),proved_bound=16*c['budget'],status='PASS'))
costs=[]
for c in load(Q/'configs/plan.json')['cases']:
 n=c['name']
 for m in ['static_full','state_const5','state_exact','state_window']:
  st=load(Q/f'state/{n}_{m}_state.json');costs.append(dict(case=n,method=m,wall_s=st['seconds'],accepted=len(st['accepted']),context_input_evaluations=st['context_input_count'],forced_output_evaluations=st['forced_output_evaluations'],independent_admission_inputs=sum(x['inputs']for x in st['checks']),independent_scalar_probes=st['independent_scalar_probes']))
 for root,label in [(Q,'quadol_wce'),(S,'serial_then_quadol')]:
  st=load(root/f'state/{n}_search.json');costs.append(dict(case=n,method=label,queries=st['queries'],full_inputs=st['full_inputs'],oracle_wall_s=st['full_eval_wall_s'],candidate_pairs=st['candidate_pairs']))
 st=load(S/f'state/{n}_serial.json');costs.append(dict(case=n,method='serial_support_stage',wall_s=st['seconds'],roots=st['roots'],reduced_roots=sum(x['new_support']<x['old_support']for x in st['history']),independent_admission_inputs=sum(x['inputs']for x in st['checks'])+st['final']['inputs']))
hdl=[r for root in [Q,S]for r in load(root/'state/rtl_validation.json')];ihdl=[r for root in [Q,S]for r in load(root/'state/integration_validation.json')]
out=dict(status='COMPLETE_COLLECTED',created=datetime.datetime.now().astimezone().isoformat(),core=rows,integration=integ,application=apps,quality=quality,gains=gains,composition=composition,checks=checks,pipelines=pipes,costs=costs,
 counts=dict(formal_core_models=21,formal_integrated_models=12,fresh_physical_jobs=33,application_records=126,final_domain_model_input_evaluations=sum(x['inputs']for x in rows),core_hdl_comparisons=sum(x['checks']for x in hdl),integration_done_checks=sum(x['done_checks']for x in ihdl),integration_sum_checks=sum(x['sum_checks']for x in ihdl)),
 all_formal_clocks_pass=True,all_historical_reports_unchanged=True,all_original_frozen_files_unchanged=True)
dump(Q/'state/final_tables.json',out)
for name,data in [('FINAL_CORE.csv',rows),('FINAL_INTEGRATED.csv',integ),('FINAL_QUALITY.csv',quality),('FINAL_GAINS.csv',gains)]:
 keys=list(dict.fromkeys(k for r in data for k in r))
 with(Q/'reports'/name).open('w',newline='',encoding='utf-8')as f:w=csv.DictWriter(f,fieldnames=keys);w.writeheader();w.writerows(data)
print(json.dumps(dict(counts=out['counts'],gains=gains,pipelines=pipes),indent=2))
