"""Post-round diagnostics of existing data; no new model or experiment."""
from core3 import Q,load,dump,METHODS,build
import csv,collections

def main():
 assert load(Q/'state/progress.json')['phase']=='ALL_CORE_EXPERIMENTS_COMPLETE'
 cases=[]
 for c in load(Q/'configs/plan.json')['cases']:
  n=c['name'];pairs=load(Q/f'graphs/{n}_pairs.json');records=load(Q/f'results/{n}_methods.json');manifest=load(Q/f'state/{n}_replay_manifest.json');replay=list(csv.DictReader((Q/f'results/{n}_replay.csv').open()));designs=[e for e in load(Q/'rtl/design_manifest.json')if e['case']==n];events=[]
  for mi,m in enumerate(METHODS):
   accepted={pi for e in designs if e['method']==m for pi,method in e['choices']};proposed={pi for pi,method in manifest[mi]['choices']};event=[]
   for r in replay:
    if int(r['method'])!=mi or r['stage']!='admission':continue
    pi=manifest[mi]['choices'][int(r['step'])][0]
    event.append(dict(pair=pi,candidate_class=pairs[pi]['candidate_class'],WCE=int(r['WCE']),seed_delta=int(r['seed_max_delta']),accepted=pi in accepted,witness_A=int(r['witness_A']),witness_B=int(r['witness_B']),witness_Y=int(r['witness_Y'])))
   events.append(dict(method=m,context_eligible=[r['pair']for r in records if r['methods'][m]is not None],proposed=sorted(proposed),accepted=sorted(accepted),cycle_rejected=manifest[mi]['cycle_rejected_pairs'],admission=event))
  strict=[]
  for i,p in enumerate(pairs):
   if p['candidate_class']!='strict_new':continue
   entries=list(csv.DictReader((Q/f'results/{n}_pair{i}.csv').open()));observed=len({int(r['row'])for r in entries})
   strict.append(dict(pair=i,a=p['a'],b=p['b'],fanin_sizes=[len(p['a_ins']),len(p['b_ins'])],common=p['shared'],union=p['union'],observed_context_rows=observed,possible_context_rows=1<<len(p['support']),eligible={m:records[i]['methods'][m]is not None for m in METHODS},proxy={m:records[i]['methods'][m]['proxy']if records[i]['methods'][m]else None for m in METHODS}))
  cases.append(dict(case=n,methods=events,strict_pairs=strict))
 dump(Q/'state/admission_diagnostic.json',dict(cases=cases,note='Pair eligibility uses registered context/menu. Rejected combined trials do not prove all functions of that pair infeasible. Witnesses are mathematical error witnesses; exact-output rejection may additionally use seed delta.'))
 print('diagnostic saved')
if __name__=='__main__':main()
