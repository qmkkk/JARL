from pathlib import Path
import sys,hashlib,json,random,csv
sys.dont_write_bytecode=True
Q=Path(__file__).resolve().parents[1];R=Q.parent
sys.path.insert(0,str(R/'tools'));import core
core.Q=Q
from core import load,dump,build,replace_ops,reorder,export_rtl,scalar
from common11 import reference,vectors_for
METHODS=['seed','quadol_wce','numeric_window']

def historical(c,method):
 old=R/f'round{c["source_round"]}';entries=load(old/'rtl/design_manifest.json');e=next(e for e in entries if e['case']==c['name']and e['method']==method);t=next(x for x in entries if x['top']==(e['duplicate_of']or e['top']));p=t['inherited_record']['physical_result']if t['inherited_physical']else next(p for p in load(old/'results/hardware/ppa.json')if p['top']==t['top']);path=old/'rtl'/(e['top']+'.v');assert hashlib.sha256(path.read_bytes()).hexdigest()==e['sha256'];assert p['clock_ns']==c['clock_ns']
 return old,e,p,path

def models(c):
 n=c['name'];g=load(Q/f'graphs/{n}_seed.json');ops,co,ins,nn,_=build(g);out={'seed':(g,ops,co,ins,nn)};h=load(Q/f'graphs/{n}_quadol_wce.json');o,k,i,sz,_=build(h);out['quadol_wce']=(h,o,k,i,sz)
 old,e,p,path=historical(c,'numeric_window');pairs=load(old/f'graphs/{n}_pairs.json');data=load(old/f'results/{n}_methods.json');new=ops
 for pi,m in e['choices']:new=replace_ops(new,pairs[pi],data[pi]['methods'][m])
 new=reorder(new,set(co)|set(ins));assert new is not None;out['numeric_window']=(g,new,co,ins,nn);return out

def export():
 entries=[];gold=[];S=Q/'rtl'
 for c in load(Q/'configs/plan.json')['cases']:
  n=c['name'];search=load(Q/f'state/{n}_search.json');assert search['status']=='COMPLETE';mm=models(c);local=[];seen={}
  for m in METHODS:
   top=f'r11_{n}_{m}';inherited=None
   if m=='quadol_wce':text=export_rtl(mm[m][0],[],[],{},top);v=search['selected_query'];wce=v['WCE'];witness=[v['witness_A'],v['witness_B']]
   else:
    old,e,p,path=historical(c,m);text=path.read_text().replace(f'module {e["top"]}(',f'module {top}(');v=next(x for x in load(old/'state/analysis.json')['rows']if x['case']==n and x['method']==m);wce=v['WCE'];witness=[0,0];inherited=dict(source_round=c['source_round'],rtl=str(path),rtl_file_sha256=hashlib.sha256(path.read_bytes()).hexdigest(),physical_result=p)
   canonical=text.replace(f'module {top}(', 'module canonical(');digest=hashlib.sha256(canonical.encode()).hexdigest();dup=seen.get(digest);seen.setdefault(digest,top);(S/f'{top}.v').write_text(text)
   e=dict(case=n,method=m,top=top,WCE=wce,budget=c['budget'],duplicate_of=dup,sha256=hashlib.sha256((S/f'{top}.v').read_bytes()).hexdigest(),canonical_sha256=digest,inherited_physical=bool(inherited),inherited_record=inherited,witness=witness);entries.append(e)
   if not dup:local.append(e)
  vectors=vectors_for(c,random.Random(20261015));vectors.add(tuple(entries[-2]['witness']));lines=[]
  for a,b in sorted(vectors):
   yy=[scalar(*mm[e['method']],a,b)for e in local];ref=reference(c,a,b);assert all(abs(y-ref)<=c['budget']for y in yy),(n,a,b,yy,ref);lines.append(' '.join(f'{x:08x}'for x in[a,b]+yy))
  (S/f'{n}_golden.hex').write_text('\n'.join(lines)+'\n');count=len(local);tb=f'tb_{n}';code=['`timescale 1ns/1ps',f'module {tb};','reg clk=0; always #5 clk=~clk;','reg [15:0] A=0,B=0;',f'wire [31:0] Y[0:{count-1}];',f'reg [31:0] expected[0:{count-1}];','reg [31:0] aa,bb; integer fd,rc,line_no=0,k;']
  for j,e in enumerate(local):code.append(f"{e['top']} u{j}(.clk(clk),.A(A),.B(B),.Y(Y[{j}]));")
  fmt=' '.join(['%h']*(count+2))+'\\n';args=['aa','bb']+[f'expected[{j}]'for j in range(count)];code+=['initial begin #200;',f'fd=$fopen("{n}_golden.hex","r"); if(fd==0) $fatal(1,"missing vectors");','while(!$feof(fd)) begin',f'rc=$fscanf(fd,"{fmt}",'+','.join(args)+');',f'if(rc=={count+2}) begin','@(negedge clk); A=aa[15:0]; B=bb[15:0]; repeat(2) @(posedge clk); #1;',f'for(k=0;k<{count};k=k+1) if(Y[k]!==expected[k]) $fatal(1,"Mismatch line=%0d design=%0d",line_no,k);','line_no=line_no+1; end else if(rc!=-1) $fatal(1,"Malformed vector");','end',f'$display("R11_PASS case={n} vectors=%0d designs={count}",line_no); $finish;','end','endmodule'];(S/f'{tb}.sv').write_text('\n'.join(code)+'\n');gold.append(dict(case=n,vectors=len(lines),designs=count,checks=count*len(lines),tb=tb))
 dump(S/'design_manifest.json',entries);dump(Q/'state/golden.json',gold);print('EXPORTED_18',flush=True)

if __name__=='__main__':export()
