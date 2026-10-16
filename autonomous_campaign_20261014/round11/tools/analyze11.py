from model11 import Q,R,load,dump,METHODS
import csv,datetime,hashlib
D=Q/'direct_primitive'
assert load(D/'state/progress.json')['phase']=='ALL_CORE_EXPERIMENTS_COMPLETE'
entries=load(D/'rtl/design_manifest.json');ppa=load(D/'results/hardware/ppa.json');ee={e['top']:e for e in entries};by={p['top']:p for p in ppa};rows=[];cases=[]
for c in load(Q/'configs/plan.json')['cases']:
 n=c['name'];search=load(Q/f'state/{n}_search.json');rr={}
 for e in [e for e in entries if e['case']==n]:
  t=ee[e['duplicate_of']or e['top']];inherit=t['inherited_physical'];p=t['inherited_record']['physical_result']if inherit else by[t['top']]
  r=dict(case=n,method=e['method'],WCE=e['WCE'],source_round=t['inherited_record']['source_round']if inherit else 11,reused_identical_rtl=bool(e['duplicate_of']),new_physical=not inherit,**{k:p[k]for k in['LUT','FF','CARRY4','DSP','clock_ns','WNS_ns','WHS_ns','pass_registered_clock','wall_s']});rows.append(r);rr[e['method']]=r
 best=min([m for m in METHODS[:2]if rr[m]['pass_registered_clock']],key=lambda m:rr[m]['LUT']);cases.append(dict(case=n,search=search,LUT={m:x['LUT']for m,x in rr.items()},WNS_ns={m:x['WNS_ns']for m,x in rr.items()},WCE={m:x['WCE']for m,x in rr.items()},timing_pass={m:x['pass_registered_clock']for m,x in rr.items()},best_baseline=best,main_gain_pct=100*(rr[best]['LUT']-rr['numeric_window']['LUT'])/rr[best]['LUT']if rr['numeric_window']['pass_registered_clock']else None))
a=dict(round=11,status='COMPLETE_AWAIT_SCORE',completed=datetime.datetime.now().astimezone().isoformat(),rows=rows,cases=cases,new_physical_jobs=len(ppa),prior_expanded_primitive_physical_jobs=len(load(Q/'results/hardware/ppa.json')),primary_encoding='direct LUT6_2 with required selector/output inversions',hdl=load(D/'state/rtl_validation.json'),topology_contract=load(D/'state/topology_contract.json'),adapter_contract=load(Q/'state/adapter_contract.json'),engineering_repairs=load(Q/'state/engineering_repairs.json'),limits=load(Q/'configs/plan.json')['scope']);assert len(a['hdl'])==6;dump(Q/'state/analysis.json',a)
with(Q/'reports/RESULTS.csv').open('w',newline='')as f:w=csv.DictWriter(f,fieldnames=list(rows[0]));w.writeheader();w.writerows(rows)
dump(Q/'state/evidence_hashes.json',{p.relative_to(Q).as_posix():hashlib.sha256(p.read_bytes()).hexdigest()for sub in['tools','input','configs','graphs','src','rtl','results','build','direct_primitive']for p in(Q/sub).rglob('*')if p.is_file()and p.suffix in['.py','.json','.cpp','.v','.sv','.xdc','.csv','.hex','.txt','.rpt','.log','.stderr']});dump(Q/'state/progress.json',dict(phase='ALL_CORE_EXPERIMENTS_COMPLETE_DIRECT_ENCODING',completed=a['completed']));print('ROUND11_COMPLETE',len(cases),'cases')
