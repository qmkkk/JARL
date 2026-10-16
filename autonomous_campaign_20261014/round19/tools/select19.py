from common19 import Q,load,dump,build
import sys
from pathlib import Path
sys.path.insert(0,str(Q.parent/'round2/tools'))
from core2 import matched
for c in load(Q/'configs/plan.json')['cases']:
 n=c['name'];g=load(Q/f'graphs/{n}.json');ops,co,ins,*_=build(g);pairs=load(Q/f'graphs/{n}_pairs.json');records=load(Q/f'results/{n}_methods.json');ch,rejected=matched(c,ops,co,ins,pairs,records,'numeric_window')
 dump(Q/f'state/{n}_replay_manifest.json',[dict(method='numeric_window',choices=ch,cycle_rejected_pairs=rejected)]);print('FIXED_INITIAL_MATCHING',n,len(ch),flush=True)
