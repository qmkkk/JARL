from pathlib import Path
import sys,json,csv,itertools,collections,time
sys.dont_write_bytecode=True
Q=Path(__file__).resolve().parents[1];R=Q.parent
sys.path.insert(0,str(R/'round2/tools'))
import core2 as basis
import core
basis.Q=Q;core.Q=Q
from core2 import load,dump,build,truth,np,structural_score,physical_complete
METHODS=['exact_joint','serial','budget_joint'];basis.METHODS=METHODS
def candidates(c):
 n=c['name'];g=load(Q/f'graphs/{n}.json');ops,co,ins,nn,anc=build(g);old=R/'round2';oldpairs=load(old/f'graphs/{n}_pairs.json');entry=next(e for e in load(old/'rtl/design_manifest.json')if e['case']==n and e['method']=='joint');ids=[pi for pi,m in entry['choices']];ids+=(i for i in range(len(oldpairs))if i not in ids)
 controls=[dict(oldpairs[i],candidate_class='control',r2_pair=i)for i in ids[:8]];depth={n:0 for n in set(co)|set(ins)}
 for o in ops:depth[o['out']]=1+max(depth[x]for x in o['ins'])
 lut=[o for o in ops if o['typ']=='lut'and 5<=o['k']<=6];pool=[]
 for a,b in itertools.combinations(lut,2):
  aa,bb=set(a['ins']),set(b['ins']);u=aa|bb;common=aa&bb
  if not(6<=len(u)<=8 and len(common)<=4):continue
  if a['out']in anc[b['out']]or b['out']in anc[a['out']]:continue
  if a.get('props',{}).get('HLUTNM') and a.get('props',{}).get('HLUTNM')==b.get('props',{}).get('HLUTNM')and a['name'].rsplit('/',1)[0]==b['name'].rsplit('/',1)[0]:continue
  pool.append(dict(a=a['name'],b=b['name'],a_out=a['out'],b_out=b['out'],a_ins=a['ins'],b_ins=b['ins'],a_init=a['init'],b_init=b['init'],support=sorted(u),shared=len(common),union=len(u),depth=max(depth[a['out']],depth[b['out']]),candidate_class='strict_new'))
 pool.sort(key=lambda p:(-(len(p['a_ins'])+len(p['b_ins'])),-p['shared'],p['union'],p['depth'],p['a'],p['b']));degree=collections.Counter(x for p in controls for x in[p['a'],p['b']]);chosen=[]
 for p in pool:
  if degree[p['a']]>=4 or degree[p['b']]>=4:continue
  chosen.append(p);degree.update([p['a'],p['b']])
  if len(chosen)==16:break
 pairs=controls+chosen;dump(Q/f'graphs/{n}_pairs.json',pairs);dump(Q/f'state/{n}_pool.json',dict(controls=len(controls),strict_available=len(pool),strict_registered=len(chosen),total=len(pairs)));return g,pairs
basis.candidates=candidates
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
  c=next(c for c in load(Q/'configs/plan.json')['cases']if src.name.startswith(c['name']+'_'));b=c['budget']
  s=replace_once(s,f'if(check(0,proposed,"admission",j)<={b})',f'if(check(0,proposed,"admission",j)<={b}&&last_change==0)')
  s=replace_once(s,f'if(check(0,mask,"final",-1)>{b})',f'if(check(0,mask,"final",-1)>{b}||last_change!=0)')
 src.write_text(s);return native_original(src,args,out)
basis.native=native
def configure(pair,path,ops,g,budget):
 sup=pair['support'];rr=np.arange(1<<len(sup));f=truth(pair['a_init'],pair['a_ins'],sup,rr);h=truth(pair['b_init'],pair['b_ins'],sup,rr);cost=np.zeros((len(rr),4),dtype=np.int64);exact=cost.copy()
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
    tested+=1;cc=np.zeros((32,4),dtype=np.int64);ee=cc.copy();hh=cc.copy()
    for ab in range(4):
     aa,bb=ab&1,ab>>1;o6=np.where(sel,aa,bb);q=o6+2*bb if mode=='f6'else bb+2*o6
     cc[:,ab]=cost[rr,q][grp].max(axis=1);ee[:,ab]=exact[rr,q][grp].max(axis=1);hh[:,ab]=hd[rr,q][grp].sum(axis=1)
    for method,cm,bound in [('exact_joint',ee,0),('budget_joint',cc,budget)]:
     q=np.array([min(range(4),key=lambda a:(cm[r,a],hh[r,a],a))for r in range(32)]);cf=conf(sh,selector,mode,q,cm,hh)
     if cf['wce']<=bound:retain(method,cf,cm,hh)
    # Serial reference uses exactly the same pin and output-role menu.
    if selector is None:
     for first_output in [0,1]:
      vv=[];first_w=0
      for rows in grp:
       other=h[rows]if first_output==0 else f[rows]
       def fk(bit):
        qs=bit+2*other if first_output==0 else other+2*bit
        return(int(cost[rows,qs].max()),int(hd[rows,qs].sum()),bit)
       v=min([0,1],key=fk);first_w=max(first_w,fk(v)[0]);vv.append(v)
      if first_w>budget:continue
      choices=[]
      for r,v in enumerate(vv):
       # Map actual output positions to the A/B half table roles.
       first_half=first_output if mode=='f6'else 1-first_output
       opts=[v+2*b for b in [0,1]]if first_half==0 else[a+2*v for a in [0,1]]
       choices.append(min(opts,key=lambda q:(cc[r,q],hh[r,q],q)))
      cf=conf(sh,selector,mode,np.array(choices),cc,hh)
      if cf['wce']<=budget:retain('serial',dict(cf,serial_order=f'output{first_output}_first',first_intermediate_WCE=first_w),cc,hh)
    else:
     six_output=0 if mode=='f6'else 1;five_output=1-six_output
     for first in ['six','five']:
      first_output=six_output if first=='six'else five_output;groups=np.argsort(idx+32*sel,kind='stable').reshape(64,-1)if first=='six'else grp;vv=[];first_w=0
      for rows in groups:
       other=h[rows]if first_output==0 else f[rows]
       def fk(bit):
        qs=bit+2*other if first_output==0 else other+2*bit
        return(int(cost[rows,qs].max()),int(hd[rows,qs].sum()),bit)
       v=min([0,1],key=fk);first_w=max(first_w,fk(v)[0]);vv.append(v)
      if first_w>budget:continue
      if first=='six':q=np.array(vv[32:])+2*np.array(vv[:32])
      else:q=np.array([min([2*v,2*v+1],key=lambda a:(cc[r,a],hh[r,a],a))for r,v in enumerate(vv)])
      cf=conf(sh,selector,mode,q,cc,hh)
      if cf['wce']<=budget:retain('serial',dict(cf,serial_order=f'{first}_first',first_intermediate_WCE=first_w),cc,hh)
 def structural_rank(cf):return(structural_score(ops,g,pair,cf),cf['wce'],cf['local_hd'],cf['initA'],cf['initB'])
 methods={};diag=dict(topologies=tested,retained_before_completion={m:len(pools[m])for m in METHODS})
 for method,pool in pools.items():
  pool.sort(key=lambda x:structural_rank(x[1]));configs=[x[1]for x in pool]
  if method!='serial':
   for _,cf,cc,hh in pool[:2]:configs.append(physical_complete(cf,cc,hh,0 if method=='exact_joint'else budget,ops,g,pair))
  best=min(configs,key=structural_rank)if configs else None
  if best:
   best['proxy']=list(structural_score(ops,g,pair,best));best['context_error_kind']='change_from_seed'if method=='exact_joint'else 'numeric_WCE'
   sh=best['shared'];idx=sum(((rr>>sup.index(n))&1)<<i for i,n in enumerate(sh));sel=np.ones(len(rr),dtype=np.int64)if best['select']is None else(rr>>sup.index(best['select']))&1;aa=np.array([(int(best['initA'],16)>>int(r))&1 for r in idx]);bb=np.array([(int(best['initB'],16)>>int(r))&1 for r in idx]);six=np.where(sel,aa,bb);nf,ng=(six,bb)if best['mode']=='f6'else(bb,six);best['first_A_only_sample_bound']=int(cost[rr,nf+2*h].max());best['first_B_only_sample_bound']=int(cost[rr,f+2*ng].max());best['both_single_edits_violate_sample_budget']=best['first_A_only_sample_bound']>budget and best['first_B_only_sample_bound']>budget
  methods[method]=best
 return methods,diag
def optimize(c):
 n=c['name'];g=load(Q/f'graphs/{n}.json');ops,*_=build(g);pairs=load(Q/f'graphs/{n}_pairs.json');records=[];st=time.perf_counter()
 for i,p in enumerate(pairs):
  t=time.perf_counter();methods,diag=configure(p,Q/f'results/{n}_pair{i}.csv',ops,g,c['budget']);records.append(dict(pair=i,methods=methods,diagnostic=diag,seconds=time.perf_counter()-t));print(n,i,p['candidate_class'],{m:cf is not None for m,cf in methods.items()},flush=True)
 dump(Q/f'results/{n}_methods.json',records);dump(Q/f'state/{n}_optimize.json',dict(seconds=time.perf_counter()-st,pairs=len(pairs),eligible={m:sum(r['methods'][m]is not None for r in records)for m in METHODS}))
if __name__=='__main__':
 phase=sys.argv[1]
 for c in load(Q/'configs/plan.json')['cases']:
  dump(Q/'state/progress.json',dict(phase=phase,case=c['name']));{'context':basis.context,'optimize':optimize,'replay':basis.replay}[phase](c)
