from pathlib import Path
import sys, math
sys.dont_write_bytecode=True
Q=Path(__file__).resolve().parents[1]; R=Q.parent
sys.path.insert(0,str(R/'tools'))
import core
core.Q=Q
from core import build, COMMON, load, dump

def ref_expression(c):
 w=c['width']; m=(1<<w)-1
 return {'mul':'a*b','mac':f'a*(b&{m})+(b>>{w})','dot':'(a&15)*(b&15)+(a>>4)*(b>>4)','div':f'b?a/b:{m}','sqrt':'root(a)','absdiff':'a>=b?a-b:b-a'}[c['kind']]

def base_code(c,g):
 ops,co,ins,nn,anc=build(g); ab,bb=c['a_bits'],c['b_bits']
 s=[COMMON,'#include <cmath>',f'constexpr int NN={nn},BITS={c["domain_bits"]},T=0;', 'constexpr bool MUL=true;',f'constexpr U N=U(1)<<{c["domain_bits"]};','static void inputs(U*v,U base){']; ignored=[]
 for n,name in ins.items():
  bit=int(name[2:-1]); isa=name[0]=='A'; active=bit<(ab if isa else bb); idx=bit+(0 if isa else ab)
  s.append(f'v[{n}]='+(f'plane(base,{idx});'if active else'0;'))
  if not active:ignored.append(n)
 outputs=[n for k,n in g['ports'].items()if k.startswith('Y[')]
 assert not set(ignored)&set().union(*(anc.get(n,set())for n in outputs))
 s.append('}\nstatic void unpack(const U*v,uint32_t*out){std::fill(out,out+64,0);')
 for i in range(32):s.append(f'{{U b=v[{g["ports"][f"Y[{i}]"]}];while(b){{int j=__builtin_ctzll(b);out[j]|=uint32_t(1)<<{i};b&=b-1;}}}}')
 s.append('}\nstatic U root(U x){U y=std::sqrt(double(x));while((y+1)*(y+1)<=x)++y;while(y*y>x)--y;return y;}')
 s.append(f'static void reference(U x,U&a,U&b,U&low,U&high){{a=x&{(1<<ab)-1};b=x>>{ab};low=({ref_expression(c)});high=low;}}')
 s.append('static U seed_expected(U a,U b,U x){return x;}')
 return s,ops,co,ins,nn,anc

def reference(c,a,b):
 a &= (1<<c['a_bits'])-1; b &= (1<<c['b_bits'])-1; w=c['width'];k=c['kind']
 if k=='mul':return a*b
 if k=='mac':return a*(b&((1<<w)-1))+(b>>w)
 if k=='dot':return (a&15)*(b&15)+(a>>4)*(b>>4)
 if k=='div':return a//b if b else (1<<w)-1
 if k=='sqrt':return math.isqrt(a)
 if k=='absdiff':return abs(a-b)
 raise ValueError(k)

def vectors_for(c,rng):
 am=(1<<c['a_bits'])-1;bm=(1<<c['b_bits'])-1
 vals={0,1,2,3,7,15,31,63,127,255,am//2,am-1,am}
 vv={(a,b)for a in vals if 0<=a<=am for b in vals if 0<=b<=bm}
 vv.update((rng.randrange(am+1),rng.randrange(bm+1))for _ in range(1024))
 if c['kind']=='sqrt':vv.update((i*i+d,0)for i in range(256)for d in [-1,0,1]if 0<=i*i+d<=am)
 return vv
