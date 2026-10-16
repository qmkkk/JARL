from pathlib import Path
import sys,json,csv,itertools,collections,time
sys.dont_write_bytecode=True
Q=Path(__file__).resolve().parents[1];R=Q.parent
sys.path.insert(0,str(R/'round2/tools'))
import core2 as basis
import core
basis.Q=Q;core.Q=Q
from core2 import load,dump,build,truth,np,structural_score,physical_complete
METHODS=['numeric_window','packing_window'];basis.METHODS=METHODS
GENERATED=['packing_window']
from packing13 import rank as packing_rank, complete as physical_complete, select as packing_select
from common13 import base_code
basis.base_code=base_code;core.Q=Q;basis.Q=Q
native_original=basis.native
def replace_once(s,a,b,count=1):
 assert s.count(a)==count,(a,s.count(a));return s.replace(a,b)
def native(src,args,out):
 s=src.read_text()
 if src.name.endswith('_contexts.cpp'):
  s=replace_once(s,'uint32_t out[64];','uint32_t out[64],seedout[64];')
  s=replace_once(s,'I lo[4][256],hi[4][256];','I lo[4][256],hi[4][256],exlo[4][256],exhi[4][256];')
  s=replace_once(s,'hi[q][r]=INT64_MIN;','hi[q][r]=INT64_MIN;exlo[q][r]=INT64_MAX;exhi[q][r]=INT64_MIN;')
  s=replace_once(s,'original(orig);unpack(orig,out);int rows[64]={};','original(orig);unpack(orig,out);std::copy(out,out+64,seedout);int rows[64]={};')
  s=replace_once(s,'hi[q][r]=std::max(hi[q][r],I(out[j])-I(l));','hi[q][r]=std::max(hi[q][r],I(out[j])-I(l));I delta=I(out[j])-I(seedout[j]);exlo[q][r]=std::min(exlo[q][r],delta);exhi[q][r]=std::max(exhi[q][r],delta);')
  s=replace_once(s,'row,count,q,error_lo,error_hi\\n','row,count,q,error_lo,error_hi,seed_error_lo,seed_error_hi\\n')
  s=replace_once(s,'<<hi[q][r]<<"\\n";','<<hi[q][r]<<","<<exlo[q][r]<<","<<exhi[q][r]<<"\\n";')
 elif src.name.endswith('_replay.cpp'):
  s=replace_once(s,'static I check(', 'static U last_change=0;\nstatic I check(')
  s=replace_once(s,'uint32_t out[64];I wce','uint32_t out[64],seedout[64];last_change=0;I wce')
  s=replace_once(s,'inputs(v,base);if(method==0)','inputs(v,base);original(v);unpack(v,seedout);inputs(v,base);if(method==0)')
  s=replace_once(s,'reference(base+j,a,b,l,h);I el=','reference(base+j,a,b,l,h);last_change=std::max(last_change,U(std::abs(I(out[j])-I(seedout[j]))));I el=')
  s=replace_once(s,'<<double(sae/N)<<std::endl','<<double(sae/N)<<","<<last_change<<std::endl')
  s=replace_once(s,'MAE_at_lowbits_zero\\n','MAE_at_lowbits_zero,seed_max_delta\\n')
  c=next(c for c in load(Q/'configs/plan.json')['cases']if src.name==c['name']+'_replay.cpp');b=c['budget']
  for mi in []:
   s=replace_once(s,f'if(check({mi},proposed,"admission",j)<={b})',f'if(check({mi},proposed,"admission",j)<={b}&&last_change==0)')
   s=replace_once(s,f'if(check({mi},mask,"final",-1)>{b})',f'if(check({mi},mask,"final",-1)>{b}||last_change!=0)')
 if src.name.endswith('_replay.cpp'):s=replace_once(s,'if(method==0)eval0(v,mask);else if(method==1)eval1(v,mask);else eval2(v,mask);','if(method==0)eval0(v,mask);else eval1(v,mask);')
 src.write_text(s);return native_original(src,args,out)
basis.native=native
def configure(pair,path,ops,g,budget):
 sup=pair['support'];rr=np.arange(1<<len(sup));f=np.array(pair['window_a_truth'])if 'window_a_truth'in pair else truth(pair['a_init'],pair['a_ins'],sup,rr);h=np.array(pair['window_b_truth'])if 'window_b_truth'in pair else truth(pair['b_init'],pair['b_ins'],sup,rr);cost=np.zeros((len(rr),4),dtype=np.int64);exact=cost.copy();local=np.ones_like(cost);local[rr,f+2*h]=0
 for r in csv.DictReader(path.open()):
  row,q=int(r['row']),int(r['q']);cost[row,q]=max(abs(int(r['error_lo'])),abs(int(r['error_hi'])));exact[row,q]=max(abs(int(r['seed_error_lo'])),abs(int(r['seed_error_hi'])))
 hd=np.stack([((q&1)!=f).astype(int)+((q>>1)!=h).astype(int)for q in range(4)],axis=1);common=set(pair['a_ins'])&set(pair['b_ins']);pinsets=sorted(itertools.combinations(sup,5),key=lambda sh:(-len(set(sh)&common),sh))[:8];pools={m:[]for m in GENERATED};tested=0
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
    for method,cm,bound in [('packing_window',cc,budget)]:
     if method=='numeric_pair'and pair['candidate_class']=='dependent_window':continue
     q=np.array([min(range(4),key=lambda a:(cm[r,a],hh[r,a],a))for r in range(32)]);cf=conf(sh,selector,mode,q,cm,hh)
     if cf['wce']<=bound:retain(method,cf,cm,hh)
 def structural_rank(cf):return(packing_rank(ops,g,pair,cf),cf['wce'],cf['local_hd'],cf['initA'],cf['initB'])
 methods={};diag=dict(topologies=tested,retained_before_completion={m:len(pools[m])for m in GENERATED})
 for method,pool in pools.items():
  pool.sort(key=lambda x:structural_rank(x[1]));configs=[x[1]for x in pool]
  if method!='serial':
   for _,cf,cc,hh in pool[:2]:configs.append(physical_complete(cf,cc,hh,0 if method=='local_window'else budget,ops,g,pair))
  best=min(configs,key=structural_rank)if configs else None
  if best:
   best['proxy']=list(structural_score(ops,g,pair,best));best['packing_proxy']=list(packing_rank(ops,g,pair,best));best['context_error_kind']='local_truth_change'if method=='local_window'else 'numeric_WCE'
   sh=best['shared'];idx=sum(((rr>>sup.index(n))&1)<<i for i,n in enumerate(sh));sel=np.ones(len(rr),dtype=np.int64)if best['select']is None else(rr>>sup.index(best['select']))&1;aa=np.array([(int(best['initA'],16)>>int(r))&1 for r in idx]);bb=np.array([(int(best['initB'],16)>>int(r))&1 for r in idx]);six=np.where(sel,aa,bb);nf,ng=(six,bb)if best['mode']=='f6'else(bb,six);best['first_A_only_sample_bound']=int(cost[rr,nf+2*h].max());best['first_B_only_sample_bound']=int(cost[rr,f+2*ng].max());best['both_single_edits_violate_sample_budget']=best['first_A_only_sample_bound']>budget and best['first_B_only_sample_bound']>budget
  methods[method]=best
 return methods,diag
def optimize(c):
 n=c['name'];g=load(Q/f'graphs/{n}.json');ops,*_=build(g);pairs=load(Q/f'graphs/{n}_pairs.json');records=[];st=time.perf_counter();old=load(Q/f'inputs/{n}_original_methods.json')
 for i,p in enumerate(pairs):
  t=time.perf_counter();methods,diag=configure(p,Q/f'results/{n}_pair{i}.csv',ops,g,c['budget']);assert old[i]['pair']==i;methods['numeric_window']=old[i]['methods']['numeric_window'];records.append(dict(pair=i,methods=methods,diagnostic=diag,seconds=time.perf_counter()-t));print(n,i,p['candidate_class'],{m:cf is not None for m,cf in methods.items()},flush=True)
 dump(Q/f'results/{n}_methods.json',records);dump(Q/f'state/{n}_optimize.json',dict(seconds=time.perf_counter()-st,pairs=len(pairs),eligible={m:sum(r['methods'][m]is not None for r in records)for m in METHODS}))
matched_original=basis.matched
def matched(c,ops,co,ins,pairs,records,method):
 if method=='packing_window':return packing_select(c,ops,co,ins,pairs,records,method,load(Q/f'graphs/{c["name"]}.json'))
 return matched_original(c,ops,co,ins,pairs,records,method)
basis.matched=matched

if __name__=='__main__':
 phase=sys.argv[1]
 for c in load(Q/'configs/plan.json')['cases']:
  if len(sys.argv)>2 and c['name']not in sys.argv[2:]:continue
  dump(Q/'state/progress.json',dict(phase=phase,case=c['name']));{'optimize':optimize,'replay':basis.replay}[phase](c)
