from model4 import Q,R,load,dump,METHODS
import csv,json,datetime,hashlib

def main():
 designs=load(Q/'rtl/design_manifest.json');ppa=load(Q/'results/hardware/ppa.json');by={r['top']:r for r in ppa};assert len(ppa)==sum(not e['duplicate_of']for e in designs);rows=[];cases=[]
 for e in designs:
  p=by[e['duplicate_of']or e['top']];v=next(r for r in csv.DictReader((Q/f'results/{e["case"]}_verify.csv').open())if r['method']==e['method']);assert int(v['seed_max_delta'])==0 and int(v['WCE'])<=e['budget'];rows.append(dict(case=e['case'],method=e['method'],LUT=p['LUT'],FF=p['FF'],CARRY4=p['CARRY4'],DSP=p['DSP'],WCE=int(v['WCE']),seed_max_delta=int(v['seed_max_delta']),inputs=int(v['inputs']),clock_ns=p['clock_ns'],WNS_ns=p['WNS_ns'],WHS_ns=p['WHS_ns'],FF_period_ns=p['FF_period_ns'],pass_registered_clock=p['pass_registered_clock'],wall_s=p['wall_s']))
 for c in load(Q/'configs/plan.json')['cases']:
  rr={r['method']:r for r in rows if r['case']==c['name']};cases.append(dict(case=c['name'],LUT={m:r['LUT']for m,r in rr.items()},gain_vs_seed_pct=100*(rr['seed']['LUT']-rr['relation']['LUT'])/rr['seed']['LUT'],gain_vs_abc_pct=100*(rr['abc_exact']['LUT']-rr['relation']['LUT'])/rr['abc_exact']['LUT'],timing_pass={m:r['pass_registered_clock']for m,r in rr.items()},output_functions_identical=True))
 a=dict(round=4,status='COMPLETE_AWAIT_SCORE',completed=datetime.datetime.now().astimezone().isoformat(),rows=rows,cases=cases,full_domain_scans=len(rows),effective_inputs_evaluated=sum(r['inputs']for r in rows),unique_physical_jobs=len(ppa),hdl=load(Q/'state/rtl_validation.json'),abc=load(Q/'state/abc_validation.json'),engineering_repairs=load(Q/'state/engineering_repairs.json'),limits=load(Q/'configs/plan.json')['limits']);dump(Q/'state/analysis.json',a)
 with(Q/'reports/RESULTS.csv').open('w',newline='')as f:w=csv.DictWriter(f,fieldnames=list(rows[0]));w.writeheader();w.writerows(rows)
 hashes={p.relative_to(Q).as_posix():hashlib.sha256(p.read_bytes()).hexdigest()for sub in ['tools','configs','src','rtl','graphs','results','build']for p in(Q/sub).rglob('*')if p.is_file()and p.suffix in['.py','.tcl','.json','.cpp','.v','.sv','.xdc','.csv','.hex','.log','.rpt','.stderr','.blif']};dump(Q/'state/evidence_hashes.json',hashes);print(json.dumps(cases,indent=2))
if __name__=='__main__':main()
