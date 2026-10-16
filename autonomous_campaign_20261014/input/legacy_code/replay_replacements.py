"""Directly reinsert selected truth tables into a fresh primitive-network evaluation.
Does NOT reuse signature intervals to calculate WCE. Includes diagnostic simultaneous
maximum-match replacements; pairwise feasibility is never treated as joint safety.
"""
import pathlib,json,re,sys,networkx as nx
from netlist_preflight import build,COMMON,emit_eval

def replace_ops(ops,pair,conf):
    sh=conf['shared'];sel=conf['select'];a=int(conf['initA'],16);b=int(conf['initB'],16)
    six=dict(ins=sh+([sel] if sel is not None else []),init=((a<<32)|b) if sel is not None else a,k=6 if sel is not None else 5)
    five=dict(ins=sh,init=b,k=5)
    ca,cb=(six,five) if conf['mode']=='f6' else ((five,six) if conf['mode']=='g6' else (six,six))
    return [dict(op,**(ca if op['name']==pair['a'] else cb)) if op['name'] in [pair['a'],pair['b']] else dict(op) for op in ops]

def reorder(ops,known):
    left=ops.copy();done=set(known);out=[]
    while left:
        ready=[op for op in left if set(op['ins'])<=done]
        if not ready:return None
        out.extend(ready);done.update(op['out'] for op in ready);left=[op for op in left if op not in ready]
    return out

def emit_ops(ops,const,name):
    s=[f'static void {name}(U* v){{']
    for n,b in const.items():s.append(f'v[{n}]={"FULL" if b else "0"};')
    for op in ops:
        o=op['out'];xs=[f'v[{n}]' for n in op['ins']];t=op['typ']
        if t=='lut':s.append('{U x[]={'+','.join(xs)+'};'+f'v[{o}]=lut<0x{op["init"]:x}ULL,{op["k"]}>(x);'+'}')
        else:
            rhs={'or':lambda:xs[0]+'|'+xs[1],'andnot':lambda:xs[0]+'&~'+xs[1],'xor':lambda:xs[0]+'^'+xs[1],'not':lambda:'~'+xs[0],'mux':lambda:f'({xs[0]}&{xs[2]})|(~{xs[0]}&{xs[1]})'}[t]()
            s.append(f'v[{o}]={rhs};')
    s.append('}');return '\n'.join(s)

def generate(root,t):
    d=json.loads((root/'results/table_optimization.json').read_text());data={r['pair']:r for r in d if r['t']==t}
    g=json.loads((root/f'results/graphs/r9_trunc{t}_forbid.json').read_text());ops,const,ins,nn,anc=build(g)
    pairs=json.loads((root/f'code/trunc{t}_scan.cpp.pairs.json').read_text())
    budget={6:8253441,5:4062209,4:1965825}[t]
    variants=[dict(name='original',choices=[],expected=budget)]
    simple=lambda r:min(['weighted_hd','boolean_cofactor'],key=lambda k:(r['methods'][k]['wce'],k))
    chosen={6:[0,31],5:[0,20],4:[0,27]}[t]
    for pi in chosen:
        for m in ['minimax',simple(data[pi])]:variants.append(dict(name=f'pair{pi}_{m}',choices=[(pi,m)],expected=data[pi]['methods'][m]['wce']))
    for method in ['simple_union','minimax']:
        G=nx.Graph()
        for pi,r in sorted(data.items()):
            m=simple(r) if method=='simple_union' else method
            if r['methods'][m]['wce']<=budget:G.add_edge(r['a'],r['b'],pair=pi,weight=1<<(len(data)-pi))
        match=nx.max_weight_matching(G,maxcardinality=True)
        pis=sorted(G.edges[a,b]['pair'] for a,b in match)
        choices=[(pi,simple(data[pi]) if method=='simple_union' else method) for pi in pis]
        variants.append(dict(name='matching_'+method,choices=choices,expected=-1))
    s=[COMMON,f'constexpr int NN={nn},T={t},W=16-T;'];good=[]
    for variant in variants:
        new=[dict(op) for op in ops]
        for pi,m in variant['choices']:new=replace_ops(new,pairs[pi],data[pi]['methods'][m])
        new=reorder(new,set(const)|set(ins))
        if new is None:variant['status']='CYCLE_REJECTED';continue
        variant['status']='READY';name='variant'+str(len(good));variant['function']=name
        s.append(emit_ops(new,const,name));good.append(variant)
    _,*_=emit_eval(g)
    s.append('static void unpack(const U* v,uint32_t* out){std::fill(out,out+64,0);')
    for i in range(32):s.append(f'{{U b=v[{g["ports"][f"Y[{i}]"]}];while(b){{int j=__builtin_ctzll(b);out[j]|=uint32_t(1)<<{i};b&=b-1;}}}}')
    s.append('}\nstatic void inputs(U* v,U base){')
    for n,name in ins.items():
        bit=int(name[2:-1]);effective=bit-t+(0 if name[0]=='A' else 16-t)
        s.append(f'v[{n}]='+('0;' if bit<t else f'plane(base,{effective});'))
    s.append('}')
    s.append('using FN=void(*)(U*);\nFN fns[]={'+','.join(v['function'] for v in good)+'};')
    s.append('const char* names[]={'+','.join(json.dumps(v['name']) for v in good)+'};')
    s.append('const I expected[]={'+','.join(str(v['expected']) for v in good)+'};')
    s.append(r'''
int main(){
 std::cout<<"t,variant,effective_input_pairs,WCE,error_lo,error_hi,witness_A,witness_B,witness_Y,expected,pass\n";
 const U N=U(1)<<(2*W),mask=(U(1)<<W)-1,r=(U(1)<<T)-1;U v[NN];uint32_t out[64];bool all=true;
 for(unsigned k=0;k<sizeof(fns)/sizeof(fns[0]);k++){
 I elo=INT64_MAX,ehi=INT64_MIN,wce=-1;U wa=0,wb=0,wy=0;
 for(U base=0;base<N;base+=64){inputs(v,base);fns[k](v);unpack(v,out);
 for(int j=0;j<64;j++){U x=base+j,a=(x&mask)<<T,b=(x>>W)<<T;I lo=I(out[j])-I((a+r)*(b+r)),hi=I(out[j])-I(a*b);
 elo=std::min(elo,lo);ehi=std::max(ehi,hi);
 if(std::abs(lo)>wce){wce=std::abs(lo);wa=a+r;wb=b+r;wy=out[j];}
 if(std::abs(hi)>wce){wce=std::abs(hi);wa=a;wb=b;wy=out[j];}
 }}
 bool ok=expected[k]<0||wce==expected[k];all=all&&ok;
 std::cout<<T<<","<<names[k]<<","<<N<<","<<wce<<","<<elo<<","<<ehi<<","<<wa<<","<<wb<<","<<wy<<","<<expected[k]<<","<<ok<<"\n";
 }
 return all?0:4;
}
''')
    (root/f'code/trunc{t}_replay.cpp').write_text('\n'.join(s))
    (root/f'results/replay{t}_manifest.json').write_text(json.dumps(variants,indent=2))
    print(t,[(v['name'],v['status'],len(v['choices'])) for v in variants])

if __name__=='__main__':
    root=pathlib.Path(sys.argv[1])
    for t in [6,5,4]:generate(root,t)
