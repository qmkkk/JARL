from pathlib import Path
import sys,json,csv,itertools,collections,time
sys.dont_write_bytecode=True
Q=Path(__file__).resolve().parents[1];R=Q.parent
sys.path.insert(0,str(R/'round2/tools'))
import core2 as basis
import core
basis.Q=Q;core.Q=Q
from core2 import load,dump,build,truth,np,structural_score,physical_complete
METHODS=['numeric_window'];basis.METHODS=METHODS
from common16 import base_code
basis.base_code=base_code;core.Q=Q;basis.Q=Q
def configure(pair,path,ops,g,budget):
 sup=pair['support'];rr=np.arange(1<<len(sup));f=np.array(pair['window_a_truth'])if 'window_a_truth'in pair else truth(pair['a_init'],pair['a_ins'],sup,rr);h=np.array(pair['window_b_truth'])if 'window_b_truth'in pair else truth(pair['b_init'],pair['b_ins'],sup,rr);cost=np.zeros((len(rr),4),dtype=np.int64);exact=cost.copy();local=np.ones_like(cost);local[rr,f+2*h]=0
 for r in csv.DictReader(path.open()):
  row,q=int(r['row']),int(r['q']);cost[row,q]=max(abs(int(r['error_lo'])),abs(int(r['error_hi'])));exact[row,q]=max(abs(int(r['seed_error_lo'])),abs(int(r['seed_error_hi'])))
 hd=np.stack([((q&1)!=f).astype(int)+((q>>1)!=h).astype(int)for q in range(4)],axis=1);common=set(pair['a_ins'])&set(pair['b_ins']);pinsets=sorted(itertools.combinations(sup,5),key=lambda sh:(-len(set(sh)&common),sh))[:8];pools={m:[]for m in METHODS};tested=0
 def conf(sh,sel,mode,q,cc,hh):
  return dict(shared=list(sh),select=sel,mode=mode,initA=f'{sum(int(v&1)<<r for r,v in enumerate(q)):08x}',initB=f'{sum(int(v>>1)<<r for r,v in enumerate(q)):08x}',wce=int(cc[np.arange(32),q].max()),local_hd=int(hh[np.arange(32),q].sum()))
 def quick(cf):
  a,b=core.deps(int(cf['initA'],16)),core.deps(int(cf['initB'],16));return(a.bit_count()+b.bit_count(),max(a.bit_count(),b.bit_count()),cf['wce'],cf['local_hd'],tuple(cf['shared']),-1 if cf['select']is None else cf['select'],cf['mode'],cf['initA'],cf['initB'])
 def retain(method,cf,cc,hh):
  pools[method].append((quick(cf),cf,cc,hh));pools[method].sort(key=lambda x:x[0]);del pools[method][8:]
 for sh in pinsets:
  idx=sum(((rr>>sup.index(n))&1)<<i for i,n in enumerate(sh));grp=np.argsort(idx,kind='stable').reshape(32,-1)
  for selector in [None]+sorted(set(sup)-set(sh)):
   sel=np.ones(len(rr),dtype=np.int64)if selector is None else(rr>>sup.index(selector))&1
   for mode in ['f6','g6']:
    tested+=1;cc=np.zeros((32,4),dtype=np.int64);ee=cc.copy();ll=cc.copy();hh=cc.copy()
    for ab in range(4):
     aa,bb=ab&1,ab>>1;o6=np.where(sel,aa,bb);q=o6+2*bb if mode=='f6'else bb+2*o6
     cc[:,ab]=cost[rr,q][grp].max(axis=1);ee[:,ab]=exact[rr,q][grp].max(axis=1);ll[:,ab]=local[rr,q][grp].max(axis=1);hh[:,ab]=hd[rr,q][grp].sum(axis=1)
    for method,cm,bound in [('numeric_window',cc,budget)]:
     if method=='numeric_pair'and pair['candidate_class']=='dependent_window':continue
     q=np.array([min(range(4),key=lambda a:(cm[r,a],hh[r,a],a))for r in range(32)]);cf=conf(sh,selector,mode,q,cm,hh)
     if cf['wce']<=bound:retain(method,cf,cm,hh)
 def structural_rank(cf):return(structural_score(ops,g,pair,cf),cf['wce'],cf['local_hd'],cf['initA'],cf['initB'])
 methods={};diag=dict(topologies=tested,retained_before_completion={m:len(pools[m])for m in METHODS})
 for method,pool in pools.items():
  pool.sort(key=lambda x:structural_rank(x[1]));configs=[x[1]for x in pool]
  if method!='serial':
   for _,cf,cc,hh in pool[:2]:configs.append(physical_complete(cf,cc,hh,0 if method=='local_window'else budget,ops,g,pair))
  best=min(configs,key=structural_rank)if configs else None
  if best:
   best['proxy']=list(structural_score(ops,g,pair,best));best['context_error_kind']='local_truth_change'if method=='local_window'else 'numeric_WCE'
   sh=best['shared'];idx=sum(((rr>>sup.index(n))&1)<<i for i,n in enumerate(sh));sel=np.ones(len(rr),dtype=np.int64)if best['select']is None else(rr>>sup.index(best['select']))&1;aa=np.array([(int(best['initA'],16)>>int(r))&1 for r in idx]);bb=np.array([(int(best['initB'],16)>>int(r))&1 for r in idx]);six=np.where(sel,aa,bb);nf,ng=(six,bb)if best['mode']=='f6'else(bb,six);best['first_A_only_sample_bound']=int(cost[rr,nf+2*h].max());best['first_B_only_sample_bound']=int(cost[rr,f+2*ng].max());best['both_single_edits_violate_sample_budget']=best['first_A_only_sample_bound']>budget and best['first_B_only_sample_bound']>budget
  methods[method]=best
 return methods,diag
