"""Read completed full current-context tables; no new circuit experiments."""
from pathlib import Path
import sys,csv,json
sys.dont_write_bytecode=True
R=Path(__file__).resolve().parents[1];Q=R/'round16';sys.path.insert(0,str(Q/'tools'))
from model16 import load,dump,choices
from core import truth,np
assert load(Q/'state/round_status.json')['status']=='COMPLETE'
out=[]
for c in load(Q/'configs/plan.json')['cases']:
 n=c['name'];pp=load(Q/f'graphs/{n}_pairs.json');dd=load(Q/f'results/{n}_methods.json');details=[]
 for pi,m in choices(n,'state_window'):
  p=pp[pi];cf=dd[pi]['methods'][m];sup=p['support'];rr=np.arange(1<<len(sup));f=np.array(p['window_a_truth'])if 'window_a_truth'in p else truth(p['a_init'],p['a_ins'],sup,rr);g=np.array(p['window_b_truth'])if 'window_b_truth'in p else truth(p['b_init'],p['b_ins'],sup,rr)
  table={(int(x['row']),int(x['q'])):{k:int(v)for k,v in x.items()}for x in csv.DictReader((Q/f'results/{n}_current_pair{pi}.csv').open())};cost={k:max(abs(x['error_lo']),abs(x['error_hi']))for k,x in table.items()};seen=sorted({r for r,q in cost});nonrect=[];joint=[];changed=[];elo=10**30;ehi=-10**30;constant_selector_wce=[0,0]
  for r in seen:
   allow=[q for q in range(4)if cost[(r,q)]<=c['budget']];A={q&1 for q in allow};B={q>>1 for q in allow}
   if len(allow)<len(A)*len(B):nonrect.append(r)
   idx=sum(((r>>sup.index(v))&1)<<i for i,v in enumerate(cf['shared']));a=(int(cf['initA'],16)>>idx)&1;b=(int(cf['initB'],16)>>idx)&1;sel=1 if cf['select']is None else(r>>sup.index(cf['select']))&1;o6=a if sel else b;nf,ng=(o6,b)if cf['mode']=='f6'else(b,o6);q=nf+2*ng;elo=min(elo,table[(r,q)]['error_lo']);ehi=max(ehi,table[(r,q)]['error_hi']);assert cost[(r,q)]<=c['budget']
   if q!=int(f[r]+2*g[r]):changed.append(r)
   for force in [0,1]:
    fixed_six=a if force else b;fq=fixed_six+2*b if cf['mode']=='f6'else b+2*fixed_six;constant_selector_wce[force]=max(constant_selector_wce[force],cost[(r,fq)])
   if cost[(r,int(nf+2*g[r]))]>c['budget']and cost[(r,int(f[r]+2*ng))]>c['budget']:joint.append(r)
  details.append(dict(pair=pi,candidate_class=p['candidate_class'],nonconstant_selector=cf['select']is not None,full_reachable_rows=len(seen),nonrectangular_rows=nonrect,changed_reachable_rows=changed,both_single_changes_invalid_same_support_row=joint,signed_error_interval_after_acceptance=[elo,ehi],fixed_half_tables_constant_selector_WCE=constant_selector_wce if cf['select']is not None else None))
 out.append(dict(case=n,accepted=len(details),nonconstant_selector=sum(d['nonconstant_selector']for d in details),nonrectangular_pairs=sum(bool(d['nonrectangular_rows'])for d in details),same_support_row_joint_necessity_pairs=sum(bool(d['both_single_changes_invalid_same_support_row'])for d in details),final_signed_error_interval=details[-1]['signed_error_interval_after_acceptance']if details else None,details=details))
dump(Q/'state/posthoc_full_relation_attribution.json',dict(scope='Complete-domain current-network relation tables for accepted R16 edits. Single-output necessity concerns fixed support rows and fixed other function; not a global proof against alternative serial synthesis or a physical-causality ablation.',cases=out))
print(json.dumps([{k:v for k,v in x.items()if k!='details'}for x in out],indent=2))
