from pathlib import Path
import sys,math
sys.dont_write_bytecode=True
Q=Path(__file__).resolve().parents[1];R=Q.parent
sys.path.insert(0,str(R/'tools'))
import core
core.Q=Q
from core import build,COMMON,load,dump

def base_code(c,g):
 ops,co,ins,nn,anc=build(g);w=c['width'];kind=c['kind'];s=[COMMON,'#include <cmath>',f'constexpr int NN={nn},BITS={c["domain_bits"]},T=0;', 'constexpr bool MUL=true;',f'constexpr U N=U(1)<<{c["domain_bits"]};','static void inputs(U*v,U base){'];ignored=[]
 for n,name in ins.items():
  bit=int(name[2:-1]);is_a=name[0]=='A'
  if kind=='sqrt':idx=bit+(0 if is_a else 16);active=idx<w
  else:idx=bit+(0 if is_a else w);active=bit<(w if is_a or kind=='div'else w+c['add_width'])
  s.append(f'v[{n}]='+(f'plane(base,{idx});'if active else'0;'))
  if not active:ignored.append(n)
 outputs=[n for k,n in g['ports'].items()if k.startswith('Y[')];assert not set(ignored)&set().union(*(anc.get(n,set())for n in outputs))
 s.append('}\nstatic void unpack(const U*v,uint32_t*out){std::fill(out,out+64,0);')
 for i in range(32):s.append(f'{{U b=v[{g["ports"][f"Y[{i}]"]}];while(b){{int j=__builtin_ctzll(b);out[j]|=uint32_t(1)<<{i};b&=b-1;}}}}')
 s.append('}\nstatic U root(U x){U y=std::sqrt(double(x));while((y+1)*(y+1)<=x)++y;while(y*y>x)--y;return y;}')
 ref={'sqrt':'a=x&65535;b=x>>16;low=root(x);','div':f'a=x&{(1<<w)-1};b=x>>{w};low=b?a/b:{(1<<w)-1};','mac':f'a=x&{(1<<w)-1};b=x>>{w};low=a*(b&{(1<<w)-1})+(b>>{w});'}[kind]
 s.append('static void reference(U x,U&a,U&b,U&low,U&high){'+ref+'high=low;}');s.append('static U seed_expected(U x){return '+('x'if c['budget']==0 else'(x|1)')+';}');return s,ops,co,ins,nn,anc

def reference(c,a,b):
 w=c['width'];mask=(1<<w)-1
 if c['kind']=='sqrt':return math.isqrt(((b<<16)|a)&mask)
 if c['kind']=='div':return(a&mask)//(b&mask)if b&mask else mask
 return(a&mask)*(b&mask)+(b>>w)

def vectors_for(c,rng):
 w=c['width'];mask=(1<<w)-1
 if c['kind']=='sqrt':
  vals={0,1,2,3,mask-1,mask};vals.update(rng.randrange(1<<w)for _ in range(4096));mx=1<<(w//2)
  vals.update(k*k+d for k in range(0,mx+1,max(1,mx//128))for d in [-1,0,1]if 0<=k*k+d<=mask)
  return{(x&65535,x>>16)for x in vals}
 av=[0,1,2,3,7,15,31,63,127,255,mask//2,mask-1,mask];bm=(1<<(w+c.get('add_width',0)))-1
 vv={(a,b)for a in av for b in av};vv.update((rng.randrange(mask+1),rng.randrange(bm+1))for _ in range(4096))
 if c['kind']=='mac':vv.update((a,b|(z<<w))for a in av for b in[0,1,mask]for z in[0,1,(1<<c['add_width'])-1])
 return vv
