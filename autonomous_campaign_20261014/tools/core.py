from pathlib import Path
import sys,json,csv,itertools,collections,subprocess,time,math,hashlib
sys.dont_write_bytecode=True
import numpy as np
import networkx as nx
R=Path(__file__).resolve().parents[1];Q=R/'round1';P=R.parent/'literature_pilot_20261014'
sys.path.insert(0,str(R/'input/legacy_code'))
from netlist_preflight import build,COMMON
from edif_graph import candidates
from replay_replacements import replace_ops,reorder,emit_ops
from optimize_tables import truth
from export_pilot import export_rtl,scalar
def load(p):return json.loads(Path(p).read_text())
def dump(p,x):Path(p).write_text(json.dumps(x,indent=2,ensure_ascii=False),encoding='utf-8')
def linux(p):return '/mnt/'+str(Path(p).drive)[0].lower()+Path(p).as_posix()[2:]
def run(cmd,log):
 st=time.perf_counter()
 with Path(log).open('w')as f,Path(str(log)+'.stderr').open('w')as e:p=subprocess.run(cmd,stdout=f,stderr=e,creationflags=subprocess.CREATE_NO_WINDOW)
 rec={'command':cmd,'returncode':p.returncode,'seconds':time.perf_counter()-st,'log':str(log)}
 f=Q/'state/commands.json';a=load(f) if f.exists()else[];a.append(rec);dump(f,a);p.check_returncode();return rec
def native(src,args,out):
 binary=src.with_suffix('')
 run(['wsl','-d','Ubuntu','-u','k','--','g++','-O2','-std=c++17',linux(src),'-o',linux(binary)],src.with_suffix('.compile.log'))
 return run(['wsl','-d','Ubuntu','-u','k','--',linux(binary),*map(str,args)],out)
def base_code(c,g):
 ops,co,ins,nn,anc=build(g);s=[COMMON,'#include <cmath>',f'constexpr int NN={nn},BITS={c["bits"]},T={c["t"]};',f'constexpr bool MUL={str(c["kind"]=="mul").lower()};',f'constexpr U N=U(1)<<{2*c["bits"] if c["kind"]=="mul" else c["bits"]};']
 s.append('static void inputs(U*v,U base){')
 for n,name in ins.items():
  b=int(name[2:-1]);eb=b-c['t']+(0 if name[0]=='A' else c['bits'])
  active=(c['kind']=='mul' and b>=c['t']) or (c['kind']=='sqrt' and name[0]=='A' and b<c['bits'])
  s.append(f'v[{n}]='+ (f'plane(base,{eb});' if active else '0;'))
 s.append('}\nstatic void unpack(const U*v,uint32_t*out){std::fill(out,out+64,0);')
 for i in range(32):s.append(f'{{U b=v[{g["ports"][f"Y[{i}]"]}];while(b){{int j=__builtin_ctzll(b);out[j]|=uint32_t(1)<<{i};b&=b-1;}}}}')
 s.append('''}
static U root(U x){U y=std::sqrt(double(x));while((y+1)*(y+1)<=x)++y;while(y*y>x)--y;return y;}
static void reference(U x,U&a,U&b,U&low,U&high){if(MUL){U m=(U(1)<<BITS)-1,r=(U(1)<<T)-1;a=(x&m)<<T;b=(x>>BITS)<<T;low=a*b;high=(a+r)*(b+r);}else{a=x;b=0;low=high=root(x);}}
''')
 return s,ops,co,ins,nn,anc
def force_eval(ops,co):
 s=emit_ops(ops,co,'original').splitlines();out=[s[0].replace('(U* v)','(U* v,int n0=-1,int n1=-1,int q=0)')]
 for op,line in zip(ops,s[1+len(co):-1]):
  pass
 out=s[:1+len(co)];out[0]=out[0].replace('(U* v)','(U* v,int n0=-1,int n1=-1,int q=0)')
 for op in ops:
  out.extend(emit_ops([op],{},'one').splitlines()[1:-1])
  if op['typ']=='lut':out.append(f'if(n0=={op["out"]})v[{op["out"]}]=(q&1)?FULL:0;if(n1=={op["out"]})v[{op["out"]}]=(q&2)?FULL:0;')
 return '\n'.join(out+['}'])
def prepare_context(c):
 n=c['name'];g=load(Q/f'graphs/{n}.json');s,ops,co,ins,nn,anc=base_code(c,g);by={o['name']:o for o in ops}
 if n=='mul12':
  allp=load(Q/'graphs/mul12_inherited_pairs.json');designs=load(Q/'graphs/inherited_design_manifest.json');ids=[pi for pi,m in next(d['choices']for d in designs if d['t']==4 and d['kind']=='minimax')]
  pairs=[]
  for i,pi in enumerate(ids):
   p=allp[pi];p['inherited_pair']=pi;pairs.append(p)
   import shutil
   shutil.copy2(P/f'input/Project3_Round10_Preflight_20261014/results/t4_pair{pi}.csv',Q/f'results/{n}_pair{i}.csv')
  dump(Q/f'graphs/{n}_pairs.json',pairs);print('mul12 inherited contexts',len(pairs),flush=True);return
 allp=[]
 for p in candidates(g):
  a,b=by[p['a']],by[p['b']]
  if a['out'] in anc[b['out']] or b['out'] in anc[a['out']]:continue
  allp.append(dict(p,support=sorted(set(a['ins'])|set(b['ins'])),a_out=a['out'],b_out=b['out'],a_ins=a['ins'],b_ins=b['ins'],a_init=a['init'],b_init=b['init']))
 G=nx.Graph()
 for i,p in enumerate(allp):G.add_edge(p['a'],p['b'],idx=i,weight=1<<(len(allp)-i))
 mat=nx.max_weight_matching(G,maxcardinality=True);ids=sorted(G.edges[a,b]['idx']for a,b in mat)[:24];pairs=[allp[i]for i in ids]
 dump(Q/f'graphs/{n}_pairs.json',pairs)
 s.append(force_eval(ops,co));s.append('struct Pair{int a,b,k;int inputs[8];};\nstatic const Pair pairs[]={'+','.join('{%d,%d,%d,{%s}}'%(p['a_out'],p['b_out'],len(p['support']),','.join(map(str,p['support'])))for p in pairs)+'};')
 s.append(f'constexpr int NP={len(pairs)};')
 s.append(r'''
int main(int argc,char**argv){std::string prefix=argv[1];U v[NN],orig[NN];uint32_t out[64];U blocks=MUL?std::min(N/64,U(1024)):N/64;
for(int pi=0;pi<NP;pi++){auto&p=pairs[pi];int S=1<<p.k;I lo[4][256],hi[4][256];U counts[256]={};for(int q=0;q<4;q++)for(int r=0;r<S;r++){lo[q][r]=INT64_MAX;hi[q][r]=INT64_MIN;}
for(U bi=0;bi<blocks;bi++){U base=MUL?((bi*U(104729))%(N/64))*64:bi*64;inputs(orig,base);original(orig);unpack(orig,out);int rows[64]={};
for(int j=0;j<64;j++){U a,b,l,h;reference(base+j,a,b,l,h);if(out[j]!=l){std::cerr<<"EXACT_SOURCE_MISMATCH "<<base+j<<" got "<<out[j]<<" expected "<<l<<std::endl;return 3;}}
for(int k=0;k<p.k;k++){U v=orig[p.inputs[k]];while(v){int j=__builtin_ctzll(v);rows[j]|=1<<k;v&=v-1;}}for(int j=0;j<64;j++)counts[rows[j]]++;
for(int q=0;q<4;q++){inputs(v,base);original(v,p.a,p.b,q);unpack(v,out);for(int j=0;j<64;j++){U a,b,l,h;reference(base+j,a,b,l,h);int r=rows[j];lo[q][r]=std::min(lo[q][r],I(out[j])-I(h));hi[q][r]=std::max(hi[q][r],I(out[j])-I(l));}}}
std::ofstream f(prefix+"_pair"+std::to_string(pi)+".csv");f<<"row,count,q,error_lo,error_hi\n";for(int r=0;r<S;r++)if(counts[r])for(int q=0;q<4;q++)f<<r<<","<<counts[r]<<","<<q<<","<<lo[q][r]<<","<<hi[q][r]<<"\n";
std::cout<<"context_pair="<<pi<<" inputs="<<blocks*64<<std::endl;}
}
''')
 src=Q/f'src/{n}_contexts.cpp';src.write_text('\n'.join(s));native(src,[linux(Q/f'results/{n}')],Q/f'logs/{n}_contexts.log');print(n,'contexts complete',len(pairs),flush=True)
def deps(tt,k=5):return sum(int(any(((tt>>r)^(tt>>(r^(1<<b))))&1 for r in range(1<<k)))<<b for b in range(k))
def tables(pair,path,cf=None):
 sup=pair['support'];rr=np.arange(1<<len(sup),dtype=np.int64);f=truth(pair['a_init'],pair['a_ins'],sup,rr);g=truth(pair['b_init'],pair['b_ins'],sup,rr);cost=np.zeros((len(rr),4),dtype=np.int64)
 for row in csv.DictReader(path.open()):cost[int(row['row']),int(row['q'])]=max(abs(int(row['error_lo'])),abs(int(row['error_hi'])))
 hd=np.stack([((q&1)!=f).astype(int)+((q>>1)!=g).astype(int)for q in range(4)],axis=1)
 def convert(cf):
  sh=cf['shared'];idx=sum(((rr>>sup.index(n))&1)<<i for i,n in enumerate(sh));sel=np.ones(len(rr),dtype=np.int64)if cf['select']is None else(rr>>sup.index(cf['select']))&1
  cc=np.zeros((32,4),dtype=np.int64);hh=cc.copy()
  for ab in range(4):
   a,b=ab&1,ab>>1;o6=np.where(sel,a,b);o5=np.full(len(rr),b);q=o6+2*o5 if cf['mode']=='f6'else(o5+2*o6 if cf['mode']=='g6'else 3*o6)
   for r in range(32):
    ss=np.flatnonzero(idx==r);cc[r,ab]=cost[ss,q[ss]].max();hh[r,ab]=hd[ss,q[ss]].sum()
  return cc,hh
 if cf is not None:return convert(cf)
 best={};saved={}
 for shared in itertools.combinations(sorted(set(pair['a_ins'])&set(pair['b_ins'])),5):
  for sel in [None]+sorted(set(sup)-set(shared)):
   for mode in ['f6','g6','clone6']:
    cf=dict(shared=list(shared),select=sel,mode=mode);cc,hh=convert(cf)
    for method in ['hd','minimax']:
     choices=[min(range(4),key=lambda q:(int(hh[r,q]),int(cc[r,q]),q)if method=='hd'else(int(cc[r,q]),int(hh[r,q]),q))for r in range(32)]
     w=int(cc[np.arange(32),choices].max());h=int(hh[np.arange(32),choices].sum());score=(h,w)if method=='hd'else(w,h)
     if method not in best or score<best[method]:
      best[method]=score;saved[method]=dict(cf,initA=f'{sum((q&1)<<r for r,q in enumerate(choices)):08x}',initB=f'{sum((q>>1)<<r for r,q in enumerate(choices)):08x}',wce=w,local_hd=h)
 return saved
def common_complete(cf,cc,hh,bound):
 old=np.array([((int(cf['initA'],16)>>r)&1)+2*((int(cf['initB'],16)>>r)&1)for r in range(32)]);best=None;ans=None
 for m in sorted(range(32),key=lambda x:(x.bit_count(),x)):
  values=np.zeros(32,dtype=int);valid=True
  for group in sorted(set(r&m for r in range(32))):
   rows=np.array([r for r in range(32)if r&m==group]);allow=np.flatnonzero((cc[rows]<=bound).all(axis=0))
   if not len(allow):valid=False;break
   q=min(allow,key=lambda q:(int(cc[rows,q].max()),int(hh[rows,q].sum()),int(np.sum(old[rows]!=q)),int(q)));values[rows]=q
  if valid:
   a=sum(int(q&1)<<r for r,q in enumerate(values));b=sum(int(q>>1)<<r for r,q in enumerate(values));score=((deps(a)|deps(b)).bit_count(),int(cc[np.arange(32),values].max()),int(hh[np.arange(32),values].sum()),int(np.sum(old!=values)),a,b)
   if best is None or score<best:best=score;ans=dict(cf,initA=f'{a:08x}',initB=f'{b:08x}',wce=score[1],local_hd=score[2])
 return ans
def sat_assignment(allowed,ma,mb,reverse=False):
 ga=sorted(set(r&ma for r in range(32)));gb=sorted(set(r&mb for r in range(32)));ia={x:i for i,x in enumerate(ga)};ib={x:i+len(ga)for i,x in enumerate(gb)};nv=len(ga)+len(gb);adj=[[]for _ in range(2*nv)];rev=[[]for _ in adj]
 for r in range(32):
  a,b=ia[r&ma],ib[r&mb]
  for q in range(4):
   if allowed[r,q]:continue
   av,bv=q&1,q>>1
   for x,y in [(2*a+av,2*b+1-bv),(2*b+bv,2*a+1-av)]:adj[x].append(y);rev[y].append(x)
 seen=set();order=[]
 def dfs(x):
  seen.add(x)
  for y in adj[x]:
   if y not in seen:dfs(y)
  order.append(x)
 for x in (reversed(range(2*nv))if reverse else range(2*nv)):
  if x not in seen:dfs(x)
 comp=[-1]*(2*nv)
 def visit(x,c):
  comp[x]=c
  for y in rev[x]:
   if comp[y]<0:visit(y,c)
 for x in reversed(order):
  if comp[x]<0:visit(x,max(comp)+1)
 if any(comp[2*i]==comp[2*i+1]for i in range(nv)):return None
 vals=[int(comp[2*i+1]>comp[2*i])for i in range(nv)];q=np.array([vals[ia[r&ma]]+2*vals[ib[r&mb]]for r in range(32)])
 assert allowed[np.arange(32),q].all()
 return q
def effective_ops(ops):
 out=[]
 for op in ops:
  if op['typ']!='lut':out.append(op);continue
  mask=deps(op['init'],op['k']);indices=[b for b in range(op['k'])if mask>>b&1];init=0
  for r in range(1<<len(indices)):
   old=sum(((r>>i)&1)<<b for i,b in enumerate(indices));init|=((op['init']>>old)&1)<<r
  out.append(dict(op,ins=[op['ins'][b]for b in indices],init=init,k=len(indices)))
 return out
def structural_score(ops,g,p,cf):
 changed=effective_ops(replace_ops(ops,p,cf));drivers={o['out']:o for o in changed};live=set();stack=[n for k,n in g['ports'].items()if k.startswith('Y[')]
 while stack:
  n=stack.pop()
  if n in live:continue
  live.add(n)
  if n in drivers:stack.extend(drivers[n]['ins'])
 luts=[o for o in changed if o['out']in live and o['typ']=='lut'and o['k']>=2]
 # Count a legal merged pair once if both nontrivial outputs survive.
 sites=len(luts)-int(all(any(o['out']==p[k]for o in luts)for k in ['a_out','b_out']))
 edge=sum(o['k']for o in luts);merged=[o for o in changed if o['name']in[p['a'],p['b']]]
 return sites,edge,sum(o['k']for o in merged),max(o['k']for o in merged)
def physical_complete(cf,cc,hh,bound,ops,g,p):
 allowed=cc<=bound;configs={}
 def keep(q):
  a=sum(int(v&1)<<r for r,v in enumerate(q));b=sum(int(v>>1)<<r for r,v in enumerate(q));w=int(cc[np.arange(32),q].max());h=int(hh[np.arange(32),q].sum());conf=dict(cf,initA=f'{a:08x}',initB=f'{b:08x}',wce=w,local_hd=h);configs[a,b]=conf
 for ma,mb in itertools.product(range(32),repeat=2):
  for reverse in [False,True]:
   q=sat_assignment(allowed,ma,mb,reverse)
   if q is not None:keep(q)
 for base in [cf,common_complete(cf,cc,hh,bound)]:
  if base is not None:configs[int(base['initA'],16),int(base['initB'],16)]=base
 # Fast structural scoring, no physical-tool search: all distinct small functions.
 best=min(configs.values(),key=lambda x:(structural_score(ops,g,p,x),x['wce'],x['local_hd'],x['initA'],x['initB']))
 return dict(best,proxy=list(structural_score(ops,g,p,best)),distinct_completions=len(configs))
def optimize(c):
 n=c['name'];pairs=load(Q/f'graphs/{n}_pairs.json');g=load(Q/f'graphs/{n}.json');ops,*_=build(g);records=[];st=time.perf_counter()
 for i,p in enumerate(pairs):
  methods=tables(p,Q/f'results/{n}_pair{i}.csv');mm=methods['minimax'];cc,hh=tables(p,Q/f'results/{n}_pair{i}.csv',mm)
  # Same single-pair bound as minimax whenever feasible, retaining the successful pilot mechanism.
  if mm['wce']<=c['budget']:
   methods['support']=common_complete(mm,cc,hh,mm['wce']);methods['physical']=physical_complete(mm,cc,hh,mm['wce'],ops,g,p)
  else:methods['support']=None;methods['physical']=None
  records.append({'pair':i,'methods':methods})
 dump(Q/f'results/{n}_methods.json',records);dump(Q/f'state/{n}_optimize.json',{'seconds':time.perf_counter()-st,'pairs':len(pairs),'eligible':sum(x['methods']['support']is not None for x in records)});print(n,'optimized',len(records),'pairs',flush=True)
def replay(c):
 n=c['name'];g=load(Q/f'graphs/{n}.json');pairs=load(Q/f'graphs/{n}_pairs.json');records=load(Q/f'results/{n}_methods.json');s,ops,co,ins,nn,_=base_code(c,g);s.append(emit_ops(ops,co,'original'));methods=['hd','minimax','support','physical'];by={o['name']:o for o in ops};man=[]
 for mi,m in enumerate(methods):
  chosen=[(r['pair'],m)for r in records if r['methods'][m]is not None and r['methods'][m]['wce']<=c['budget']]
  new=ops
  for pi,_ in chosen:new=replace_ops(new,pairs[pi],records[pi]['methods'][m])
  # A single evaluation order must satisfy both arms of every conditional.
  # Ordering only the replacement network could read a stale old-only input.
  newby={o['name']:o for o in new}
  union=[dict(o,ins=sorted(set(o['ins'])|set(by[o['name']]['ins'])))for o in new]
  ordered=reorder(union,set(co)|set(ins));assert ordered is not None,'cycle in fixed matching dependency union'
  new=[newby[o['name']]for o in ordered]
  index={pairs[pi][key]:j for j,(pi,_)in enumerate(chosen)for key in ['a','b']};s.append(f'static void eval{mi}(U*v,U mask){{')
  for k,b in co.items():s.append(f'v[{k}]={"FULL"if b else"0"};')
  for op in new:
   code=''.join(emit_ops([op],{},'x').splitlines()[1:-1])
   if op['name']in index:code=f'if(mask&(U(1)<<{index[op["name"]]})){{'+code+'}else{'+''.join(emit_ops([by[op['name']]],{},'x').splitlines()[1:-1])+'}'
   s.append(code)
  s.append('}');man.append({'method':m,'choices':chosen})
 s.append('''
static I check(int method,U mask,const char*stage,int step){U v[NN];uint32_t out[64];I wce=-1,lo=INT64_MAX,hi=INT64_MIN;U wa=0,wb=0,wy=0,errors=0;long double sae=0;
for(U base=0;base<N;base+=64){inputs(v,base);if(method<0)original(v);else if(method==0)eval0(v,mask);else if(method==1)eval1(v,mask);else if(method==2)eval2(v,mask);else eval3(v,mask);unpack(v,out);
for(int j=0;j<64;j++){U a,b,l,h;reference(base+j,a,b,l,h);I el=I(out[j])-I(h),eh=I(out[j])-I(l);lo=std::min(lo,el);hi=std::max(hi,eh);if(std::abs(el)>wce){wce=std::abs(el);wa=a+((U(1)<<T)-1);wb=b+((U(1)<<T)-1);wy=out[j];}if(std::abs(eh)>wce){wce=std::abs(eh);wa=a;wb=b;wy=out[j];}errors+=(out[j]!=l);sae+=std::abs(eh);if(method<0&&out[j]!=l){std::cerr<<"EXACT_MISMATCH";exit(5);}}}
std::cout<<method<<","<<stage<<","<<step<<","<<mask<<","<<N<<","<<wce<<","<<lo<<","<<hi<<","<<wa<<","<<wb<<","<<wy<<","<<errors<<","<<double(sae/N)<<std::endl;return wce;}
int main(){std::cout<<"method,stage,step,mask,inputs,WCE,error_lo,error_hi,witness_A,witness_B,witness_Y,error_count_at_lowbits_zero,MAE_at_lowbits_zero\\n";check(-1,0,"exact",-1);
''')
 for mi,d in enumerate(man):
  count=len(d['choices']);s.append(f'{{U mask=0;for(int j=0;j<{count};j++){{U proposed=mask|(U(1)<<j);if(check({mi},proposed,"admission",j)<={c["budget"]})mask=proposed;}}check({mi},mask,"final",-1);}}')
 s.append('return 0;}');src=Q/f'src/{n}_replay.cpp';src.write_text('\n'.join(s));dump(Q/f'state/{n}_replay_manifest.json',man);native(src,[],Q/f'results/{n}_replay.csv');print(n,'full-domain replay complete',flush=True)
def main():
 phase=sys.argv[1];plan=load(Q/'configs/plan.json')
 for c in plan['cases']:
  dump(Q/'state/progress.json',{'phase':phase,'case':c['name']})
  {'context':prepare_context,'optimize':optimize,'replay':replay}[phase](c)
if __name__=='__main__':main()
