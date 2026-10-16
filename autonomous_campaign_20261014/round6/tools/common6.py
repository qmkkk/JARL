from pathlib import Path
import sys
sys.dont_write_bytecode=True
Q=Path(__file__).resolve().parents[1];R=Q.parent
sys.path.insert(0,str(R/'tools'))
import core
core.Q=Q
from core import load,dump,build,COMMON

def base_code(c,g):
 ops,co,ins,nn,anc=build(g);s=[COMMON,'#include <cmath>',f'constexpr int NN={nn},BITS={c["domain_bits"]},T=0;',f'constexpr bool MUL={str(c["domain_bits"]>16).lower()};',f'constexpr U N=U(1)<<{c["domain_bits"]};']
 s.append('static void inputs(U*v,U base){');ignored=[]
 for n,name in ins.items():
  bit=int(name[2:-1]);active=(name[0]=='A'and bit<(16 if c['kind']=='sqrt_exact'else 8))or(name[0]=='B'and c['kind']!='sqrt_exact'and bit<(16 if c['kind']=='mac'else 8));idx=bit+(8 if name[0]=='B'else 0)
  s.append(f'v[{n}]='+ (f'plane(base,{idx});'if active else'0;'))
  if not active:ignored.append(n)
 outputs=[n for k,n in g['ports'].items()if k.startswith('Y[')];assert not set(ignored)&set().union(*(anc.get(n,set())for n in outputs)),('unexpected ignored input dependency',c['name'])
 s.append('}\nstatic void unpack(const U*v,uint32_t*out){std::fill(out,out+64,0);')
 for i in range(32):s.append(f'{{U b=v[{g["ports"][f"Y[{i}]"]}];while(b){{int j=__builtin_ctzll(b);out[j]|=uint32_t(1)<<{i};b&=b-1;}}}}')
 s.append('}\nstatic U root(U x){U y=std::sqrt(double(x));while((y+1)*(y+1)<=x)++y;while(y*y>x)--y;return y;}')
 ref={'sqrt_exact':'a=x;b=0;low=root(a);','div':'a=x&255;b=x>>8;low=b?a/b:255;','absdiff':'a=x&255;b=x>>8;low=a>b?a-b:b-a;','mac':'a=x&255;b=x>>8;low=a*(b&255)+(b>>8);'}[c['kind']]
 s.append('static void reference(U x,U&a,U&b,U&low,U&high){'+ref+'high=low;}');s.append('static U seed_expected(U x){return '+('x'if c['kind']=='sqrt_exact'else'(x|1)')+';}');return s,ops,co,ins,nn,anc

def reference(c,a,b):
 import math
 return {'sqrt_exact':lambda:math.isqrt(a),'div':lambda:(a&255)//(b&255)if b&255 else 255,'absdiff':lambda:abs((a&255)-(b&255)),'mac':lambda:(a&255)*(b&255)+(b>>8)}[c['kind']]()
