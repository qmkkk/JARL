from model7 import Q,R,load,dump
import json,csv,datetime,hashlib
def main():
 new=load(Q/'results/hardware/ppa.json');old=load(Q/'state/inherited_results.json');plan=load(Q/'configs/plan.json');assert len(new)==len(plan['cases'])==6 and len(old)==12;rows=[];summary=[]
 keys=['LUT','FF','CARRY4','DSP','WCE','clock_ns','WNS_ns','WHS_ns','FF_period_ns','pass_registered_clock','wall_s']
 for c in plan['cases']:
  n=c['name'];rr={}
  for m in plan['methods']:
   if m=='abc_global':
    p=next(x for x in new if x['case']==n);v=next(csv.DictReader((Q/f'results/{n}_verify.csv').open()));assert int(v['seed_max_delta'])==0 and int(v['WCE'])<=c['budget'];source=7
   else:
    inh=next(x for x in old if x['case']==n and x['method']==m);p=inh['physical_result'];source=inh['source_round']
   row=dict(case=n,method=m,source_round=source,new_physical_run=source==7,**{k:p[k]for k in keys});rows.append(row);rr[m]=row
  eligible=[m for m in ['abc_region','abc_global']if rr[m]['pass_registered_clock']];best=min(eligible,key=lambda m:rr[m]['LUT'])if eligible else None
  summary.append(dict(case=n,LUT={m:r['LUT']for m,r in rr.items()},CARRY4={m:r['CARRY4']for m,r in rr.items()},pass_timing={m:r['pass_registered_clock']for m,r in rr.items()},WNS_ns={m:r['WNS_ns']for m,r in rr.items()},best_passing_baseline=best,relation_gain_vs_best_passing_pct=100*(rr[best]['LUT']-rr['relation']['LUT'])/rr[best]['LUT']if best and rr['relation']['pass_registered_clock']else None))
 a=dict(round=7,status='COMPLETE_AWAIT_SCORE',completed=datetime.datetime.now().astimezone().isoformat(),rows=rows,cases=summary,new_physical_jobs=len(new),inherited_physical_results=len(old),new_full_domain_inputs=sum(int(next(csv.DictReader((Q/f'results/{c["name"]}_verify.csv').open()))['inputs'])for c in plan['cases']),abc=load(Q/'state/abc_validation.json'),hdl=load(Q/'state/rtl_validation.json'),engineering=load(Q/'state/engineering_repairs.json'),interpretation=plan['interpretation']);dump(Q/'state/analysis.json',a)
 with(Q/'reports/RESULTS.csv').open('w',newline='')as f:w=csv.DictWriter(f,fieldnames=list(rows[0]));w.writeheader();w.writerows(rows)
 hashes={p.relative_to(Q).as_posix():hashlib.sha256(p.read_bytes()).hexdigest()for sub in ['tools','configs','src','rtl','graphs','results','build']for p in(Q/sub).rglob('*')if p.is_file()and p.suffix in['.py','.tcl','.json','.cpp','.v','.sv','.xdc','.csv','.hex','.log','.rpt','.stderr','.blif']};dump(Q/'state/evidence_hashes.json',hashes);print(json.dumps(summary,indent=2))
if __name__=='__main__':main()
