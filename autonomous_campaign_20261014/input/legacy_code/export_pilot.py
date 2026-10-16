"""Export the admitted functional variants as physical FPGA primitives.
Generated HDL, testbench, and vectors are NOT simulated/synthesized here.
Do not infer placed LUT occupancy from emitted instance counts.
"""
import pathlib,json,sys,csv,random,itertools,re
from netlist_preflight import build
from replay_replacements import replace_ops,reorder

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

def main(root):
    rtl=root/'rtl';rtl.mkdir(exist_ok=True);manifest=[];models={}
    records=json.loads((root/'results/table_optimization.json').read_text())
    for t,budget in [(6,8253441),(5,4062209),(4,1965825)]:
        g=json.loads((root/f'results/graphs/r9_trunc{t}_forbid.json').read_text());ops,const,ins,nn,_=build(g)
        pairs=json.loads((root/f'code/trunc{t}_scan.cpp.pairs.json').read_text());data={r['pair']:r for r in records if r['t']==t}
        greedy=list(csv.DictReader(open(root/f'results/greedy{t}.csv')))
        configs=json.loads((root/f'results/greedy{t}_manifest.json').read_text())
        for label in ['original','simple_union','minimax']:
            choices=[];wce=budget
            if label!='original':
                final=[r for r in greedy if r['method']==label][-1];wce=int(final['retained_WCE']);mask=int(final['retained_mask'])
                cf=next(c for c in configs if c['name']=='matching_'+label)
                choices=[c for bit,c in enumerate(cf['choices']) if mask&(1<<bit)]
            top=f'r10_trunc{t}_{label}';text=export_rtl(g,choices,pairs,data,top);(rtl/(top+'.v')).write_text(text)
            new=[dict(op) for op in ops]
            for pi,m in choices:new=replace_ops(new,pairs[pi],data[pi]['methods'][m])
            new=reorder(new,set(const)|set(ins));assert new is not None
            models[top]=(g,new,const,ins,nn)
            manifest.append(dict(top=top,t=t,kind=label,choices=choices,WCE=wce,WCE_status='exact full reduced-domain primitive-network evaluation plus low-bit endpoint argument',HDL_simulation='NOT_RUN',physical='NOT_RUN',source='R9 supplied routed EDIF',emitted_merged_pairs=len(choices)))
        top=f'r10_trunc{t}_centered';C=budget//2;w=16-t
        text=f'''// Standard constant-centered truncation: strong baseline, not a new method.
module {top}(input wire clk,input wire [15:0] A,B,output reg [31:0] Y);
reg [15:0] a_q,b_q;
wire [{2*w-1}:0] product=a_q[15:{t}]*b_q[15:{t}];
wire [31:0] shifted={{product,{2*t}'b0}};
always @(posedge clk) begin a_q<=A; b_q<=B; Y<=shifted+32'd{C}; end
endmodule
'''
        (rtl/(top+'.v')).write_text(text);manifest.append(dict(top=top,t=t,kind='constant_centered',constant=C,WCE=budget-C,WCE_status='analytic; not new full HDL formal proof',HDL_simulation='NOT_RUN',physical='NOT_RUN',emitted_merged_pairs=0))
    vals=[0,1,15,16,31,32,63,64,255,256,32767,65534,65535]
    vectors=set(itertools.product(vals,vals));rng=random.Random(20261014)
    vectors.update((rng.randrange(65536),rng.randrange(65536)) for _ in range(1024))
    for t in [6,5,4]:
        for row in csv.DictReader(open(root/f'results/replay{t}.csv')):vectors.add((int(row['witness_A']),int(row['witness_B'])))
    vectors=sorted(vectors);gold=[];checks=0
    for a,b in vectors:
        yy=[]
        for entry in manifest:
            t=entry['t'];top=entry['top']
            if top in models:
                g,ops,co,ins,nn=models[top];y=scalar(g,ops,co,ins,nn,a,b)
            else:y=(((a>>t)*(b>>t))<<(2*t))+entry['constant']
            if entry['kind']=='original':assert y==(((a>>t)*(b>>t))<<(2*t))
            assert abs(y-a*b)<=entry['WCE'],(top,a,b,y,entry)
            yy.append(y);checks+=1
        gold.append([a,b]+yy)
    (rtl/'golden.hex').write_text('\n'.join(' '.join(f'{x:08x}' for x in row) for row in gold)+'\n')
    (rtl/'design_manifest.json').write_text(json.dumps(manifest,indent=2))
    (root/'results/scalar_golden_validation.json').write_text(json.dumps(dict(vectors=len(gold),designs=len(manifest),scalar_checks=checks,baseline_math_mismatches=0,sampled_budget_violations=0,method='scalar bit evaluator independent of bit-parallel evaluator; not vendor HDL simulation'),indent=2))
    n=len(manifest)
    tb=['`timescale 1ns/1ps','module tb_r10;', 'reg clk=0; always #5 clk=~clk;', 'reg [15:0] A=0,B=0;',f'wire [31:0] Y[0:{n-1}];',f'reg [31:0] expected[0:{n-1}];','reg [31:0] aa,bb; integer fd,rc,line_no=0,k;']
    for j,e in enumerate(manifest):tb.append(f"{e['top']} u{j}(.clk(clk),.A(A),.B(B),.Y(Y[{j}]));")
    tb += ['initial begin', 'fd=$fopen("golden.hex","r"); if(fd==0) $fatal(1,"golden.hex missing");','while(!$feof(fd)) begin']
    fmt=' '.join(['%h']*(n+2))+'\\n';args=['aa','bb']+[f'expected[{j}]' for j in range(n)]
    tb += [f'rc=$fscanf(fd,"{fmt}",'+','.join(args)+');',f'if(rc=={n+2}) begin','@(negedge clk); A=aa[15:0]; B=bb[15:0]; repeat(2) @(posedge clk); #1;',f'for(k=0;k<{n};k=k+1) if(Y[k]!==expected[k]) $fatal(1,"Mismatch line=%0d design=%0d got=%h expected=%h",line_no,k,Y[k],expected[k]);','line_no=line_no+1; end else if(rc!=-1) $fatal(1,"Malformed vector");','end',f'$display("R10_HDL_PASS vectors=%0d designs={n}",line_no); $finish;','end','endmodule']
    (rtl/'tb_r10.sv').write_text('\n'.join(tb)+'\n')
    print('generated',len(manifest),'designs;',len(gold),'golden vectors;',checks,'independent scalar checks; HDL/physical NOT_RUN')

if __name__=='__main__':main(pathlib.Path(sys.argv[1]))
