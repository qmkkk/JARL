import sys,shutil
from common21 import Q,R,load,dump,build
c=next(c for c in load(Q/'configs/plan.json')['cases']if c['name']==sys.argv[2]);n=c['name'];phase=sys.argv[1]
if phase=='seed':
 from oracle21 import query
 g=load(Q/f'graphs/{n}_seed.json');ops,*_=build(g);rec=query(dict(c,name=c['family']+'_source'),g,ops,0);assert rec['WCE']==c['seed_budget'],rec;dump(Q/f'state/{c["family"]}_seed_check.json',rec)
elif phase=='context':
 import proposal21 as p
 first=next(x for x in load(Q/'configs/plan.json')['cases']if x['family']==c['family'])['name']
 if n==first:p.basis.context(c)
 else:
  for suffix in ['_pairs.json']:
   shutil.copy2(Q/f'graphs/{first}{suffix}',Q/f'graphs/{n}{suffix}')
  for i in range(len(load(Q/f'graphs/{n}_pairs.json'))):shutil.copy2(Q/f'results/{first}_pair{i}.csv',Q/f'results/{n}_pair{i}.csv')
  shutil.copy2(Q/f'state/{first}_pool.json',Q/f'state/{n}_pool.json')
  dump(Q/f'state/{n}_context_reuse.json',dict(source_case=first,reason='Same exact mapped source, complete domain, budget-independent forced-output table. Not new evaluations.'))
elif phase=='proposal':
 import proposal21 as p
 p.optimize(c)
 g=load(Q/f'graphs/{n}.json');ops,co,ins,*_=build(g);pairs=load(Q/f'graphs/{n}_pairs.json');records=load(Q/f'results/{n}_methods.json');ch,rejected=p.basis.matched(c,ops,co,ins,pairs,records,'numeric_window')
 dump(Q/f'state/{n}_replay_manifest.json',[dict(method='numeric_window',choices=ch,cycle_rejected_pairs=rejected)])
elif phase=='main':
 from state21 import run_case
 run_case(c,'state_window')
elif phase=='quadol':
 from quadol21 import run_case
 run_case(c)
elif phase=='serial_prepare':
 s=Q/'serial'
 for src,dst in [(f'graphs/{n}_seed.json',f'graphs/{n}_original.json'),(f'graphs/{n}_pairs.json',f'graphs/{n}_pairs.json'),(f'state/{n}_replay_manifest.json',f'state/{n}_replay_manifest.json')]:shutil.copy2(Q/src,s/dst)
elif phase=='serial_support':
 sys.path.insert(0,str(Q/'serial/tools'));from serial_support import run_case
 run_case(c)
elif phase=='serial_quadol':
 sys.path.insert(0,str(Q/'serial/tools'));from quadol_serial import run_case
 run_case(c)
else:raise ValueError(phase)
