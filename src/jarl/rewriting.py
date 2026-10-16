import networkx as nx
from .netlist import build, COMMON, emit_eval

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
