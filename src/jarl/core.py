import csv, itertools
import numpy as np
from .netlist import build, COMMON
from .rewriting import replace_ops, reorder, emit_ops
from .truth_tables import truth
from .rtl import export_rtl, scalar
from .runtime import load, dump, native


def force_eval(ops,co):
 s=emit_ops(ops,co,'original').splitlines();out=[s[0].replace('(U* v)','(U* v,int n0=-1,int n1=-1,int q=0)')]
 for op,line in zip(ops,s[1+len(co):-1]):
  pass
 out=s[:1+len(co)];out[0]=out[0].replace('(U* v)','(U* v,int n0=-1,int n1=-1,int q=0)')
 for op in ops:
  out.extend(emit_ops([op],{},'one').splitlines()[1:-1])
  if op['typ']=='lut':out.append(f'if(n0=={op["out"]})v[{op["out"]}]=(q&1)?FULL:0;if(n1=={op["out"]})v[{op["out"]}]=(q&2)?FULL:0;')
 return '\n'.join(out+['}'])

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
