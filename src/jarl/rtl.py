from .netlist import build
from .rewriting import replace_ops, reorder

def export_rtl(g,choices,pairs,data,top):
    skip=set();merges=[]
    for pi,m in choices:
        p=pairs[pi];cf=data[pi]['methods'][m];skip.update([p['a'],p['b']]);merges.append((pi,p,cf))
    s=['// GENERATED; vendor HDL simulation and physical implementation: NOT_RUN.',
       '// Same registered boundary as source EDIF; no DONT_TOUCH or placement constraints.',
       f'module {top}(input wire clk,input wire [15:0] A,B,output wire [31:0] Y);',f'wire [{g["n_nets"]-1}:0] v;']
    for name,n in g['ports'].items():s.append(f'assign '+(f'{name}=v[{n}];' if name.startswith('Y[') else f'v[{n}]={name};'))
    for i,c in enumerate(g['cells']):
        if c['name'] in skip:continue
        typ=c['type'];p=c['pins'];pr=c['props'];params={k:v for k,v in pr.items() if k in ['INIT','IS_C_INVERTED']}
        ps='#('+','.join(f'.{k}({v})' for k,v in params.items())+')' if params else ''
        if typ=='CARRY4':
            ports={k:'{'+','.join(f'v[{p[k+str(j)]}]' for j in [3,2,1,0])+'}' for k in ['CO','O','DI','S']}
            ports.update({k:f'v[{p[k]}]' for k in ['CI','CYINIT']})
        else:ports={k:f'v[{n}]' for k,n in p.items()}
        s.append(f'{typ} {ps} c{i} ('+','.join(f'.{k}({v})' for k,v in ports.items())+');')
    for pi,p,cf in merges:
        sh=cf['shared'];sel="1'b1" if cf['select'] is None else f'v[{cf["select"]}]'
        ports=[f'.I{i}(v[{n}])' for i,n in enumerate(sh)]+[f'.I5({sel})']
        if cf['mode']=='f6':ports += [f'.O6(v[{p["a_out"]}])',f'.O5(v[{p["b_out"]}])']
        elif cf['mode']=='g6':ports += [f'.O5(v[{p["a_out"]}])',f'.O6(v[{p["b_out"]}])']
        else:
            ports += [f'.O6(v[{p["a_out"]}])','.O5()'];s.append(f'assign v[{p["b_out"]}]=v[{p["a_out"]}];')
        s.append(f"LUT6_2 #(.INIT(64'h{cf['initA']}{cf['initB']})) merge_{pi} ("+','.join(ports)+');')
    s.append('endmodule');return '\n'.join(s)+'\n'

def scalar(g,ops,const,ins,nn,a,b):
    v=[0]*nn
    for n,val in const.items():v[n]=val
    for n,name in ins.items():v[n]=((a if name[0]=='A' else b)>>int(name[2:-1]))&1
    for op in ops:
        x=[v[n] for n in op['ins']];t=op['typ']
        if t=='lut':ans=(op['init']>>sum(q<<j for j,q in enumerate(x)))&1
        elif t=='or':ans=x[0]|x[1]
        elif t=='andnot':ans=x[0]&(1-x[1])
        elif t=='xor':ans=x[0]^x[1]
        elif t=='not':ans=1-x[0]
        elif t=='mux':ans=x[2] if x[0] else x[1]
        else:raise ValueError(t)
        v[op['out']]=ans
    return sum(v[g['ports'][f'Y[{i}]']]<<i for i in range(32))
