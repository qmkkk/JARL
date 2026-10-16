from model15 import Q,R,load,dump,METHODS
import csv,datetime,hashlib,json
assert load(Q/'state/progress.json')['phase']=='ALL_CORE_EXPERIMENTS_COMPLETE'
designs=load(Q/'rtl/design_manifest.json');ppa=load(Q/'results/hardware/ppa.json');by={p['top']:p for p in ppa};entries={e['top']:e for e in designs};plan=load(Q/'configs/plan.json');cases={c['name']:c for c in plan['cases']};rows=[]
assert len(ppa)==sum(not e['duplicate_of']and not e['inherited_physical']for e in designs)
for e in designs:
 c=cases[e['case']];t=entries[e['duplicate_of']or e['top']];p=by[t['top']];v=next(x for x in csv.DictReader((Q/f'results/{e["case"]}_verify.csv').open())if x['method']==e['method']);assert int(v['WCE'])<=c['budget']
 rows.append(dict(case=e['case'],method=e['method'],budget=c['budget'],new_physical_run=True,reused_identical_rtl=bool(e['duplicate_of']),WCE=int(v['WCE']),seed_max_delta=int(v['seed_max_delta']),MAE=float(v['MAE_at_lowbits_zero']),inputs=int(v['inputs']),**{k:p[k]for k in['LUT','FF','CARRY4','DSP','WNS_ns','WHS_ns','clock_ns','pass_registered_clock','wall_s']},physical_top=p['top'],physical_directory=p.get('physical_directory')))
summaries=[];search={n:load(Q/f'state/{n}_search.json')for n in cases}
for n,c in cases.items():
 rr={r['method']:r for r in rows if r['case']==n};strong=min(rr[m]['LUT']for m in METHODS[:2]if rr[m]['pass_registered_clock'])
 summaries.append(dict(case=n,LUT={m:r['LUT']for m,r in rr.items()},WCE={m:r['WCE']for m,r in rr.items()},FF={m:r['FF']for m,r in rr.items()},CARRY4={m:r['CARRY4']for m,r in rr.items()},WNS_ns={m:r['WNS_ns']for m,r in rr.items()},timing_pass={m:r['pass_registered_clock']for m,r in rr.items()},gain_vs_strong_baseline_pct=100*(strong-rr['numeric_window']['LUT'])/strong if rr['numeric_window']['pass_registered_clock']else None))
a=dict(round=15,status='COMPLETE_AWAIT_SCORE',completed=datetime.datetime.now().astimezone().isoformat(),rows=rows,cases=summaries,effective_final_inputs=sum(r['inputs']for r in rows),quadol_search=search,replay_inputs=sum(sum(int(x['inputs'])for x in csv.DictReader((Q/f'results/{n}_replay.csv').open()))for n in cases),new_physical_jobs=len(ppa),hdl=load(Q/'state/rtl_validation.json'),engineering_repairs=load(Q/'state/engineering_repairs.json'),scope=plan['hypothesis']);assert len(a['hdl'])==3;dump(Q/'state/analysis.json',a)
with(Q/'reports/RESULTS.csv').open('w',newline='')as f:w=csv.DictWriter(f,fieldnames=list(rows[0]));w.writeheader();w.writerows(rows)
dump(Q/'state/evidence_hashes.json',{p.relative_to(Q).as_posix():hashlib.sha256(p.read_bytes()).hexdigest()for sub in ['tools','configs','src','rtl','graphs','results','build']for p in(Q/sub).rglob('*')if p.is_file()and p.suffix in ['.py','.tcl','.json','.cpp','.v','.sv','.xdc','.csv','.hex','.log','.rpt','.stderr']});print(json.dumps(summaries,indent=2))
