from pathlib import Path
import json,datetime,hashlib,shutil
R=Path(__file__).resolve().parents[1];Q=R/'round8';assert not Q.exists()
def load(p):return json.loads(p.read_text())
def dump(p,x):p.write_text(json.dumps(x,indent=2,ensure_ascii=False),encoding='utf-8')
assert load(R/'round7/state/round_status.json')['status']=='COMPLETE'
for d in ['configs','state','reports','tools','inputs','graphs','rtl','src','logs','build','results/hardware']:(Q/d).mkdir(parents=True,exist_ok=True)
old=load(R/'round7/state/analysis.json');cases=load(R/'round7/configs/plan.json')['cases'];inherit=[];hashes={}
def remember(p):hashes[str(p)]=hashlib.sha256(p.read_bytes()).hexdigest()
for c in cases:
 n=c['name'];winner=next(x['best_passing_baseline']for x in old['cases']if x['case']==n);c['starting_method']=winner
 if winner=='abc_global':
  gr=R/'round7';graph=gr/f'graphs/{n}_abc_global.json';e=next(x for x in load(gr/'rtl/design_manifest.json')if x['case']==n);rtl=gr/f'rtl/{e["top"]}.v';p=next(x for x in load(gr/'results/hardware/ppa.json')if x['top']==e['top']);source_round=7
 else:
  gr=R/f'round{c["graph_round"]}';graph=gr/f'graphs/{n}_abc_exact.json';inh=next(x for x in load(R/'round7/state/inherited_results.json')if x['case']==n and x['method']=='abc_region');rtl=Path(inh['rtl']);p=inh['physical_result'];source_round=inh['source_round'];assert hashlib.sha256(rtl.read_bytes()).hexdigest()==inh['rtl_file_sha256']
 assert p['pass_registered_clock'] and p['clock_ns']==c['clock_ns']
 for dest in [Q/f'graphs/{n}.json',Q/f'graphs/{n}_seed.json']:shutil.copy2(graph,dest)
 xdc=R/f'round7/rtl/{n}.xdc';shutil.copy2(xdc,Q/f'rtl/{n}.xdc')
 for path in [graph,rtl,xdc]:remember(path)
 inherit.append(dict(case=n,method='seed',starting_method=winner,source_round=source_round,rtl=str(rtl),rtl_file_sha256=hashlib.sha256(rtl.read_bytes()).hexdigest(),physical_result=p,new_run=False))
plan=dict(round=8,registered=datetime.datetime.now().astimezone().isoformat(),question='Can contextual dual-output support resynthesis add physical value after the strongest verified ABC starting point, compared to a matched local-exact support solver?',cases=cases,methods=['seed','local_exact','relation'],baselines=['seed','local_exact'],innovations=['relation'],starting_selection='Frozen from completed R7: minimum LUT among timing-passing abc_region/abc_global; tie favors region. This is an input selection rule, not a new contribution.',local_exact='Preserve both original local truth tables on every union-input assignment, including unreachable assignments. Identical pin menu, support-completion solver, pool, budgets, objective and admission to relation.',relation='Preserve primary output function exactly; infer allowed pair values from whole circuit context. Identical R6 algorithm; no new mechanism or tuning.',candidates='8 union5 controls +16 strict independent LUT5/6 pairs with union6..8/shared<=4; degree cap4, deterministic R6 rank, no fill.',search='8 shared-five pinsets; selector1 or remaining union input; both output roles; retain8 and support-complete top2 via fixed1024 masks and two SAT traversal orders. Same matching and full-domain one-pass admission.',context='Complete <=16-bit domains. Deterministic65536-input proposal sample for24-bit MAC; full2^24 admission and final output equality required for both methods.',physical='Same route script/part/DSP0/2nsIO and R7 clocks. Inherit seed only if exported canonical RTL matches the hash-checked source; run every other distinct variant exactly once.',max_new_physical_jobs=12,validation='Full-domain mathematical and seed-output comparison for all18 variants, supplier HDL for every unique design, fixed clocks. No claim of actual Fmax, application throughput or arbitrary-input scalability.',stop='Complete the fixed six cases and all three methods before analysis and next-round choice. No new workloads or mechanisms mid-round.',score=dict(innovation=25,physical_gain=25,problem_coverage=20,correctness=20,cost=10))
remember(R/'tools/route_clocked.tcl');dump(Q/'configs/plan.json',plan);dump(Q/'state/inherited_results.json',inherit);dump(Q/'state/input_hashes.json',hashes);dump(Q/'state/engineering_repairs.json',[]);dump(Q/'state/progress.json',dict(phase='REGISTERED',round=8));dump(Q/'state/round_status.json',dict(status='REGISTERED',round=8))
c=load(R/'state/campaign.json');c.update(status='ROUND8_REGISTERED',active_round=8,root=str(Q),latest_progress='round8/state/progress.json');dump(R/'state/campaign.json',c);print('Round8 registered six fixed cases')
