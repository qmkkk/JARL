"""Post-hoc analysis of completed raw proposal contexts, not fresh runs.
Sample-only relations do not prove global don't-cares or causal necessity.
"""
from pathlib import Path
import sys,csv,json,hashlib
sys.dont_write_bytecode=True
R=Path(__file__).resolve().parents[1];Q=R/'round15';sys.path.insert(0,str(Q/'tools'))
from model15 import load,dump,choices
from core import truth,np
assert load(Q/'state/round_status.json')['status']=='COMPLETE'
out=[]
for c in load(Q/'configs/plan.json')['cases']:
 n=c['name'];pp=load(Q/f'graphs/{n}_pairs.json');dd=load(Q/f'results/{n}_methods.json');details=[]
 for pi,m in choices(n,'numeric_window'):
  p=pp[pi];cf=dd[pi]['methods'][m];sup=p['support'];rr=np.arange(1<<len(sup));f=np.array(p['window_a_truth'])if 'window_a_truth'in p else truth(p['a_init'],p['a_ins'],sup,rr);g=np.array(p['window_b_truth'])if 'window_b_truth'in p else truth(p['b_init'],p['b_ins'],sup,rr)
  table=list(csv.DictReader((Q/f'results/{n}_pair{pi}.csv').open()));cost={(int(x['row']),int(x['q'])):max(abs(int(x['error_lo'])),abs(int(x['error_hi'])))for x in table};seen=sorted({r for r,q in cost});nonrect=[];joint=[];changed=[]
  for r in seen:
   allow=[q for q in range(4)if cost[(r,q)]<=c['budget']];A={q&1 for q in allow};B={q>>1 for q in allow}
   if len(allow)<len(A)*len(B):nonrect.append(r)
   idx=sum(((r>>sup.index(v))&1)<<i for i,v in enumerate(cf['shared']));a=(int(cf['initA'],16)>>idx)&1;b=(int(cf['initB'],16)>>idx)&1;sel=1 if cf['select']is None else(r>>sup.index(cf['select']))&1;o6=a if sel else b;nf,ng=(o6,b)if cf['mode']=='f6'else(b,o6);q=nf+2*ng
   if q!=int(f[r]+2*g[r]):changed.append(r)
   if cost[(r,q)]<=c['budget']and cost[(r,int(nf+2*g[r]))]>c['budget']and cost[(r,int(f[r]+2*ng))]>c['budget']:joint.append(r)
  details.append(dict(pair=pi,candidate_class=p['candidate_class'],nonconstant_selector=cf['select']is not None,sampled_reachable_rows=len(seen),nonrectangular_rows=nonrect,changed_sample_rows=changed,both_single_changes_invalid_same_row=joint))
 out.append(dict(case=n,accepted=len(details),nonconstant_selector=sum(d['nonconstant_selector']for d in details),nonrectangular_pairs=sum(bool(d['nonrectangular_rows'])for d in details),same_row_joint_necessity_pairs=sum(bool(d['both_single_changes_invalid_same_row'])for d in details),details=details))
dump(Q/'state/posthoc_proposal_relation_attribution.json',dict(scope='R15 already-completed accepted choices evaluated against historical seed proposal sample tables. Not current-network full-domain necessity or physical causality.',cases=out))
print(json.dumps([{k:v for k,v in x.items()if k!='details'}for x in out],indent=2))
