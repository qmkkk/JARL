from pathlib import Path
import json,csv
Q=Path(__file__).resolve().parents[1]
def load(p):return json.loads(p.read_text(encoding='utf-8'))
s=load(Q/'results/analysis_summary.json');p=load(Q/'results/physical_results_annotated.json');q=load(Q/'results/system_quality.json')
assert s['physical_endpoints']==24
print('SUMMARY',json.dumps({k:s[k]for k in ('rtl_checks','routed_checks','timing_pass','saif_match_range','main_dominated_points','source_integrity')}))
print('PHYSICAL: part,width,method,LUT,FF,CARRY,WNS,WHS,dynamicW')
for r in p:print(r['part'],r['width'],r['method'],r['route_LUT'],r['route_FF'],r['route_CARRY4'],r['WNS_ns'],r['WHS_ns'],r['dynamic_W'])
print('QUALITY ALL: width,method,RMSE,SNR,bias,WCE')
for r in s['quality_aggregate']:print(r['width'],r['method'],*[round(r[k],5)for k in ('RMSE','SNR_dB','bias','max_error')])
print('WORKLOAD SNR: width,block,Q,serial,old,main')
for w in (8,9,10):
 for b in range(6):print(w,b,*[round(next(r['SNR_dB']for r in q if(r['width'],r['block'],r['method'])==(w,b,m)),5)for m in ('quadol_wce','serial_then_quadol','state_window','quality_window')])
print('ZERO CONTRIBUTION: width,block,zeroCoeffTaps,componentRMSE,componentBias')
with(Q/'results/zero_operand_error_component.csv').open(encoding='utf-8-sig')as f:
 for r in csv.DictReader(f):
  if r['method']=='quality_window':print(r['width'],r['block'],r['zero_coeff_taps'],r['zero_product_contribution_RMSE'],r['zero_product_contribution_bias'])
