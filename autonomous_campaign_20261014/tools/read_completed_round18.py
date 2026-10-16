from pathlib import Path
import json,numpy as np
R=Path(__file__).resolve().parents[1];Q=R/'round18';load=lambda p:json.loads(p.read_text());a=load(Q/'state/analysis.json');assert a['status']=='COMPLETE_AWAIT_SCORE';assert load(Q/'state/progress.json')['phase']=='ALL_REGISTERED_EXPERIMENTS_COMPLETE'
for c in load(Q/'configs/plan.json')['cases']:
 n=c['name'];print('\nCORE',n)
 for r in a['rows']:
  if r['case']==n:print({k:r[k]for k in ['method','LUT','FF','CARRY4','WCE','MAE','WNS_ns','pass_registered_clock']})
 print('INTEGRATION')
 for r in a['integration']:
  if r['case']==n:print({k:r[k]for k in ['method','LUT','FF','CARRY4','WNS_ns','pass_registered_clock']})
 print('ABLATION',a['ablation'][n])
apps=load(Q/'state/application_results.json')['rows']
for task in ['alpha_blend','binomial16']:
 print('\nAPPLICATION',task)
 for c in load(Q/'configs/plan.json')['cases']:
  for m in ['seed','quadol_wce','state_window']:
   rr=[r for r in apps if r['case']==c['name']and r['method']==m and r['task']==task];mse=np.mean([r['RMSE']**2 for r in rr]);print(c['width'],m,'PSNR',float(10*np.log10(255**2/mse))if mse else 'inf','SSIM',float(np.mean([r['SSIM']for r in rr])),'MAE',float(np.mean([r['MAE']for r in rr])),'MAX',max(r['max_error']for r in rr),'BIAS',float(np.mean([r['bias']for r in rr])))
print('HDL',a['hdl']);print('INTEGRATION_HDL',a['integration_hdl']);print('QUADOL',[(s['case'],s['candidate_pairs'],s['queries'],s['invalid_graphs'])for s in a['quadol']])
