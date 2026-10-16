"""Generate independently executable bit-parallel semantics from supplied EDIF.
Registers are evaluated at settled inputs with CE=1; this is a combinational
functional check, NOT a temporal timing simulation or vendor-formal result.
"""
import json,pathlib,re,collections,itertools,sys

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

def generate(g,path,t,pairs):
    ev,ops,const,ins,nin,anc=emit_eval(g);byname={op['name']:op for op in ops};filtered=[]
    for pair in pairs:
        a,b=byname[pair['a']],byname[pair['b']]
        if a['out'] in anc[b['out']] or b['out'] in anc[a['out']]:continue
        supp=sorted(set(a['ins'])|set(b['ins']));filtered.append(dict(pair, support=supp,a_out=a['out'],b_out=b['out'],a_ins=a['ins'],b_ins=b['ins'],a_init=a['init'],b_init=b['init']))
    s=[COMMON,ev,f'constexpr int T={t},W=16-T;',f'constexpr int NP={len(filtered)};']
    s.append('struct Pair{int a,b,k;int support[7];};')
    s.append('const Pair pairs[]={'+','.join('{%d,%d,%d,{%s}}'%(p['a_out'],p['b_out'],len(p['support']),','.join(map(str,p['support']))) for p in filtered)+'};')
    s.append('static void inputs(U* v,U base){')
    for n,name in ins.items():
        letter=name[0];bit=int(name[2:-1]);effective=bit-t+(0 if letter=='A' else 16-t)
        s.append(f'v[{n}]='+('0;' if bit<t else f'plane(base,{effective});'))
    s.append('}')
    s.append(r'''
int main(int argc,char**argv){
 if(argc<4){std::cerr<<"usage: binary pair_begin pair_end outprefix [log2samples]\n";return 2;}
 int begin=std::atoi(argv[1]),end=std::atoi(argv[2]);std::string prefix=argv[3];
 U N=U(1)<<(2*W), stride=1;
 if(argc>4){int lg=std::atoi(argv[4]);if(lg<2*W) stride=U(1)<<(2*W-lg);}
 U v[NN],orig[NN];uint32_t out[64];
 auto start=std::chrono::steady_clock::now();
 // Independently check the original extracted netlist over the requested input set.
 U fails=0,checked=0;
 for(U base=0;base<N;base+=64*stride){inputs(v,base);eval(v);unpack(v,out);
  for(int j=0;j<64;j++){U x=base+j,ah=x&((U(1)<<W)-1),bh=x>>W;U expected=(ah*bh)<<(2*T);fails+=(out[j]!=expected);checked++;}}
 std::cerr<<"original_netlist_checked="<<checked<<" mismatches="<<fails<<"\n"; if(fails)return 3;
 for(int pi=begin;pi<end&&pi<NP;pi++){
  auto ps=std::chrono::steady_clock::now();const auto&p=pairs[pi];int S=1<<p.k;
  I low[4][128],high[4][128];U counts[128]={};
  for(int q=0;q<4;q++)for(int r=0;r<S;r++){low[q][r]=std::numeric_limits<I>::max();high[q][r]=std::numeric_limits<I>::min();}
  for(U base=0;base<N;base+=64*stride){
   inputs(orig,base);eval(orig);int rows[64]={};
   for(int b=0;b<p.k;b++){U x=orig[p.support[b]];while(x){int j=__builtin_ctzll(x);rows[j]|=1<<b;x&=x-1;}}
   for(int j=0;j<64;j++)counts[rows[j]]++;
   for(int q=0;q<4;q++){
    inputs(v,base);eval(v,p.a,p.b,q);unpack(v,out);
    for(int j=0;j<64;j++){
     U x=base+j,ah=x&((U(1)<<W)-1),bh=x>>W;U a=ah<<T,b=bh<<T,r=(U(1)<<T)-1;
     I lo=I(out[j])-I((a+r)*(b+r)),hi=I(out[j])-I(a*b);int row=rows[j];
     low[q][row]=std::min(low[q][row],lo);high[q][row]=std::max(high[q][row],hi);
    }
   }
  }
  std::ofstream f(prefix+"_pair"+std::to_string(pi)+".csv");f<<"row,count,q,error_lo,error_hi\n";
  for(int row=0;row<S;row++)for(int q=0;q<4;q++)if(counts[row])f<<row<<","<<counts[row]<<","<<q<<","<<low[q][row]<<","<<high[q][row]<<"\n";
  auto sec=std::chrono::duration<double>(std::chrono::steady_clock::now()-ps).count();
  std::cerr<<"pair="<<pi<<" inputs="<<checked<<" seconds="<<sec<<"\n";
 }
 std::cerr<<"total_seconds="<<std::chrono::duration<double>(std::chrono::steady_clock::now()-start).count()<<"\n";
 return 0;
}
''')
    pathlib.Path(path).write_text('\n'.join(s));pathlib.Path(str(path)+'.pairs.json').write_text(json.dumps(filtered,indent=2));return len(filtered)

if __name__=='__main__':
    root=pathlib.Path(sys.argv[1]);graphs=root/'results/graphs'
    for t in [6,5,4]:
        name=f'r9_trunc{t}_forbid';g=json.loads((graphs/(name+'.json')).read_text());pairs=json.loads((graphs/(name+'_pairs.json')).read_text());out=root/'code'/f'trunc{t}_scan.cpp'
        print(t,generate(g,out,t,pairs))
