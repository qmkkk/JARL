"""Analyze only after the entire registered R20 matrix is complete."""
from common20 import Q,R,load,dump
import csv,collections,hashlib,datetime
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
assert load(Q/'state/round_status.json')['status']=='ALL_EXPERIMENTS_COMPLETE_AWAIT_ANALYSIS'
plan=load(Q/'configs/plan.json');synth=load(Q/'results/hardware/synthesis_all.json');route=load(Q/'results/hardware/route_all.json');mechanism=load(Q/'results/mechanism_windows.json');sim=load(Q/'state/rtl_validation.json')
exact={r['top']:r for r in load(Q/'results/precision_reconciliation/exact_metrics.json')}
for record in synth+route:
 metric=exact[record['top']];assert record['WCE']==metric['WCE']
 record.update(MAE=metric['MAE'],SAE=metric['SAE'],MSE=metric['MSE'],SSE=metric['SSE'])
assert len(synth)==90 and len(route)==18 and len(sim)==6
rows=[];wins=ties=losses=0
for c in plan['cases']:
 ee={e['method']:e for e in synth if e['case']==c['name']};m=ee['state_window'];bb=[ee[k]for k in ['quadol_wce','serial_then_quadol']];best=min(bb,key=lambda r:(r['LUT'],r['MAE'],r['method']));gain=(best['LUT']-m['LUT'])/best['LUT']*100 if best['LUT']else 0
 wins+=gain>0;ties+=gain==0;losses+=gain<0
 allbase=[r for r in synth if r['family']==c['family']and r['method']!='state_window']
 def dominates(a,b,keys):return all(a[k]<=b[k]for k in keys)and any(a[k]<b[k]for k in keys)
 rows.append(dict(case=c['name'],family=c['family'],budget=c['budget'],quadol_LUT=ee['quadol_wce']['LUT'],serial_LUT=ee['serial_then_quadol']['LUT'],main_LUT=m['LUT'],main_FF=m['FF'],main_CARRY4=m['CARRY4'],main_WCE=m['WCE'],main_MAE=m['MAE'],best_baseline=best['method'],best_baseline_WCE=best['WCE'],best_baseline_MAE=best['MAE'],same_budget_LUT_gain_pct=gain,main_dominated_in_LUT_WCE=any(dominates(b,m,['LUT','WCE'])for b in allbase),main_dominated_in_LUT_MAE=any(dominates(b,m,['LUT','MAE'])for b in allbase),main_strictly_dominates_a_baseline_in_LUT_WCE=any(dominates(m,b,['LUT','WCE'])for b in allbase)))
dump(Q/'results/comparison.json',rows)
with(Q/'results/comparison.csv').open('w',newline='',encoding='utf-8')as out:
 w=csv.DictWriter(out,fieldnames=list(rows[0]));w.writeheader();w.writerows(rows)
fig,axes=plt.subplots(2,3,figsize=(14,8),constrained_layout=True)
for ax,f in zip(axes.flat,plan['families']):
 for method,label in [('quadol_wce','QUADOL-WCE'),('serial_then_quadol','Serial + QUADOL'),('state_window','Joint numeric relation')]:
  rr=sorted([r for r in synth if r['family']==f['family']and r['method']==method],key=lambda r:r['WCE']);ax.plot([r['WCE']for r in rr],[r['LUT']for r in rr],'o-',label=label)
 ax.set_title(f['family']);ax.set_xlabel('Exhaustive WCE');ax.set_ylabel('Synthesized LUTs');ax.grid(alpha=.25)
axes.flat[0].legend(fontsize=8);fig.savefig(Q/'reports/resource_WCE.png',dpi=180);plt.close(fig)
fig,axes=plt.subplots(2,3,figsize=(14,8),constrained_layout=True)
for ax,f in zip(axes.flat,plan['families']):
 for method,label in [('quadol_wce','QUADOL-WCE'),('serial_then_quadol','Serial + QUADOL'),('state_window','Joint numeric relation')]:
  rr=sorted([r for r in synth if r['family']==f['family']and r['method']==method],key=lambda r:r['MAE']);ax.plot([r['MAE']for r in rr],[r['LUT']for r in rr],'o-',label=label)
 ax.set_title(f['family']);ax.set_xlabel('Exhaustive MAE');ax.set_ylabel('Synthesized LUTs');ax.grid(alpha=.25)
axes.flat[0].legend(fontsize=8);fig.savefig(Q/'reports/resource_MAE.png',dpi=180);plt.close(fig)
joint=[m for m in mechanism if m['both_single_edits_fail']]
details=[];families_seen=set()
for m in sorted(joint,key=lambda x:(x['case'].split('_b')[0],x['budget'],x['pair'])):
 fam=m['case'].split('_b')[0]
 if fam in families_seen and len(details)>=3:continue
 n=m['case'];p=load(Q/f'graphs/{n}_pairs.json')[m['pair']];h=next(h for h in load(Q/f'state/{n}_state_window_state.json')['history']if h['pair']==m['pair']);cf=m['configuration'];tab={}
 for row in csv.DictReader(open(h['context']['path'])):
  r,q=int(row['row']),int(row['q']);tab[r,q]=dict(count=int(row['count']),lo=int(row['error_lo']),hi=int(row['error_hi']))
 best_a=best_b=None
 for r in sorted({r for r,q in tab}):
  sup=p['support'];values={net:(r>>i)&1 for i,net in enumerate(sup)}
  olda=(p['a_init']>>sum(values[x]<<i for i,x in enumerate(p['a_ins'])))&1;oldb=(p['b_init']>>sum(values[x]<<i for i,x in enumerate(p['b_ins'])))&1
  ix=sum(values[x]<<i for i,x in enumerate(cf['shared']));aa=(int(cf['initA'],16)>>ix)&1;bb=(int(cf['initB'],16)>>ix)&1;sel=1 if cf['select']is None else values[cf['select']];six=aa if sel else bb;newa,newb=(six,bb)if cf['mode']=='f6'else(bb,six)
  qa,qb,qboth=newa+2*oldb,olda+2*newb,newa+2*newb
  bound=lambda q:max(abs(tab[r,q]['lo']),abs(tab[r,q]['hi']))
  record=dict(support_row=r,reachable_inputs=tab[r,0]['count'],original_q=olda+2*oldb,new_q=qboth,A_only_q=qa,B_only_q=qb,A_only_bound=bound(qa),B_only_bound=bound(qb),joint_row_bound=bound(qboth),allowed_q=[q for q in range(4)if bound(q)<=m['budget']],errors={str(q):tab[r,q]for q in range(4)})
  if best_a is None or record['A_only_bound']>best_a['A_only_bound']:best_a=record
  if best_b is None or record['B_only_bound']>best_b['B_only_bound']:best_b=record
 assert best_a['A_only_bound']>m['budget']and best_b['B_only_bound']>m['budget']
 details.append(dict(m,A_counterfactual=best_a,B_counterfactual=best_b,scope='Full-domain reachable support-row certificates; the two maxima may occur on different primary inputs. Not a universal impossibility proof for every serial algorithm.'));families_seen.add(fam)
 if len(details)==5:break
dump(Q/'results/detailed_joint_cases.json',details)
summary=dict(status='COMPLETE_AWAIT_RESEARCH_DECISION',cells=30,endpoints=90,exhaustive_inputs_per_endpoint=65536,unique_synthesized=len(load(Q/'results/hardware/synthesis_unique.json')),routed_registered=18,routed_unique=len(load(Q/'results/hardware/route_unique.json')),routed_timing_pass=sum(r['pass_registered_clock']for r in route),same_budget_wins=wins,same_budget_ties=ties,same_budget_losses=losses,positive_families=sorted({r['family']for r in rows if r['same_budget_LUT_gain_pct']>0}),max_same_budget_gain_pct=max(r['same_budget_LUT_gain_pct']for r in rows),accepted_window_occurrences=len(mechanism),distinct_family_pair_windows=len({(m['case'].split('_b')[0],m['pair'])for m in mechanism}),joint_only_occurrences=len(joint),joint_only_distinct_windows=len({(m['case'].split('_b')[0],m['pair'])for m in joint}),hdl_checks=sum(g['checks']for g in sim),finished=datetime.datetime.now().astimezone().isoformat())
dump(Q/'state/analysis.json',summary)
family_rows=[]
for f in plan['families']:
 family=f['family'];rr=[r for r in rows if r['family']==family];pr=[r for r in route if r['family']==family]
 main=next(r for r in pr if r['method']=='state_window');baselines=[r for r in pr if r['method']!='state_window'];best=min(baselines,key=lambda x:(x['LUT'],x['MAE']))
 gains=[r['same_budget_LUT_gain_pct']for r in rr]
 family_rows.append(dict(family=family,positive_budgets=sum(g>0 for g in gains),tied_budgets=sum(g==0 for g in gains),negative_budgets=sum(g<0 for g in gains),best_synth_gain_pct=max(gains),mean_synth_gain_pct=sum(gains)/len(gains),undominated_WCE_points=sum(not r['main_dominated_in_LUT_WCE']for r in rr),undominated_MAE_points=sum(not r['main_dominated_in_LUT_MAE']for r in rr),route_budget=main['budget'],routed_main_LUT=main['LUT'],routed_best_baseline_LUT=best['LUT'],routed_gain_pct=100*(best['LUT']-main['LUT'])/best['LUT']if best['LUT']else 0,routed_all_timing_pass=all(r['pass_registered_clock']for r in pr),routed_main_WNS_ns=main['WNS_ns'],routed_best_baseline_WNS_ns=best['WNS_ns'],routed_main_MAE=main['MAE'],routed_best_baseline_MAE=best['MAE']))
dump(Q/'results/family_summary.json',family_rows)
timing=[]
for c in plan['cases']:
 n=c['name'];main=load(Q/f'state/{n}_state_window_state.json');baseline=load(Q/f'state/{n}_search.json');serial=load(Q/f'serial/state/{n}_search.json')
 timing.append(dict(case=n,main_wall_s=main['seconds'],main_accepted=len(main['accepted']),main_attempted=len(main['history']),main_forced_evaluations=main['forced_output_evaluations'],quadol_queries=baseline['queries'],quadol_evaluation_wall_s=baseline['full_eval_wall_s'],quadol_candidates=baseline['candidate_pairs'],serial_quadol_queries=serial['queries'],serial_quadol_eval_wall_s=serial['full_eval_wall_s']))
dump(Q/'results/search_diagnostics.json',timing)
print(summary)
