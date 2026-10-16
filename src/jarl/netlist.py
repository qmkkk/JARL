import json, pathlib, re, collections, itertools, sys

def build(g):
    ops=[];const={};inputnets={};nin=g['n_nets']
    for name,n in g['ports'].items():
        if re.fullmatch('[AB]\\[\\d+\\]',name): inputnets[n]=name
    const[g['ports']['clk']]=0
    for c in g['cells']:
        if c['type'] in ['GND','VCC']:const[c['pins'].get('G',c['pins'].get('P'))]=int(c['type']=='VCC')
    for c in g['cells']:
        p=c['pins'];t=c['type'];name=c['name']
        if t in ['GND','VCC']:continue
        if re.fullmatch('LUT[1-6]',t):
            k=int(t[-1]);ins=[p[f'I{i}'] for i in range(k)];raw=c['props']['INIT'];init=int(raw.split("'h")[1],16)
            ops.append(dict(name=name,typ='lut',ins=ins,out=p['O'],init=init,k=k,props=c['props']))
        elif t.startswith('FD'):
            assert const.get(p['CE'])==1,(t,p)
            typ='or' if t=='FDSE' else 'andnot'
            ops.append(dict(name=name,typ=typ,ins=[p['D'],p['S' if t=='FDSE' else 'R']],out=p['Q']))
        elif t=='CARRY4':
            cc=nin;nin+=1;ops.append(dict(name=name+'/ci',typ='or',ins=[p['CI'],p['CYINIT']],out=cc))
            for i in range(4):
                ops.append(dict(name=name+f'/o{i}',typ='xor',ins=[p[f'S{i}'],cc],out=p[f'O{i}']))
                ops.append(dict(name=name+f'/co{i}',typ='mux',ins=[p[f'S{i}'],p[f'DI{i}'],cc],out=p[f'CO{i}']))
                cc=p[f'CO{i}']
        elif t=='INV':ops.append(dict(name=name,typ='not',ins=[p['I']],out=p['O']))
        else:raise ValueError(t)
    done=set(const)|set(inputnets);ordered=[]
    while ops:
        now=[x for x in ops if set(x['ins'])<=done]
        assert now,('cycle/missing drivers',ops[:5],done)
        ordered.extend(now);done|={x['out'] for x in now};ops=[x for x in ops if x not in now]
    drivers={op['out']:op for op in ordered};anc={n:set() for n in const.keys()|inputnets.keys()}
    for op in ordered:anc[op['out']]=set(op['ins'])|set().union(*(anc.get(n,set()) for n in op['ins']))
    return ordered,const,inputnets,nin,anc

COMMON=r'''
#include <array>
#include <vector>
#include <cstdint>
#include <algorithm>
#include <iostream>
#include <fstream>
#include <limits>
#include <chrono>
#include <cstdlib>
using U=uint64_t; using I=int64_t;
constexpr U FULL=~U(0);
template<U T,int K> inline U lut(const U* x) {
 if constexpr (T==0) return 0;
 else if constexpr (T==(FULL>>(64-(1<<K)))) return FULL;
 else if constexpr(K==0) return (T&1)?FULL:0;
 else {
  constexpr int H=1<<(K-1);
  constexpr U MASK=(H==64)?FULL:((U(1)<<H)-1);
  constexpr U L=T&MASK,R=T>>H;
  if constexpr (L==R) return lut<L,K-1>(x);
  else return (lut<L,K-1>(x)&~x[K-1])|(lut<R,K-1>(x)&x[K-1]);
 }
}
static U plane(U base,int bit){
 static const U lo[6]={0xaaaaaaaaaaaaaaaaULL,0xccccccccccccccccULL,0xf0f0f0f0f0f0f0f0ULL,0xff00ff00ff00ff00ULL,0xffff0000ffff0000ULL,0xffffffff00000000ULL};
 return bit<6?lo[bit]:((base>>bit)&1?FULL:0);
}
'''

def emit_eval(g):
    ops,const,ins,nin,anc=build(g)
    s=[f'constexpr int NN={nin};','static void eval(U* v,int fn0=-1,int fn1=-1,int q=0){']
    for n,b in const.items():s.append(f'v[{n}]={"FULL" if b else "0"};')
    for op in ops:
        o=op['out'];xs=[f'v[{n}]' for n in op['ins']];t=op['typ']
        if t=='lut':s.append('{ U x[]={' + ','.join(xs)+'};'+f'v[{o}]=lut<0x{op["init"]:x}ULL,{op["k"]}>(x);'+'}')
        else:
            rhs={'or':lambda:xs[0]+'|'+xs[1],'andnot':lambda:xs[0]+'&~'+xs[1],'xor':lambda:xs[0]+'^'+xs[1],'not':lambda:'~'+xs[0],'mux':lambda:f'({xs[0]}&{xs[2]})|(~{xs[0]}&{xs[1]})'}[t]()
            s.append(f'v[{o}]={rhs};')
        if t=='lut':s.append(f'if(fn0=={o})v[{o}]=(q&1)?FULL:0; if(fn1=={o})v[{o}]=(q&2)?FULL:0;')
    s+=['}', 'static void unpack(const U* v,uint32_t* out){std::fill(out,out+64,0);']
    for i in range(32):
        n=g['ports'][f'Y[{i}]'];s.append(f'{{U b=v[{n}];while(b){{int j=__builtin_ctzll(b);out[j]|=uint32_t(1)<<{i};b&=b-1;}}}}')
    s.append('}')
    return '\n'.join(s),ops,const,ins,nin,anc
