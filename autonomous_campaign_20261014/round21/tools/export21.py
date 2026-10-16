from common21 import Q,R,load,dump,build,reference,vectors_for
import core,sys,hashlib,random
from direct21 import quadol_rtl
from stats21 import stats
sys.path.insert(0,str(Q/'serial/tools'))
from direct_serial import quadol_rtl as serial_rtl
core.Q=Q
S=Q/'rtl';plan=load(Q/'configs/plan.json');entries=[];models={};seen={};integer_metrics=[]
for c in plan['cases']:
 n=c['name'];g=load(Q/f'graphs/{n}_seed.json');ops,co,ins,nn,_=build(g);pairs=load(Q/f'graphs/{n}_pairs.json');records=load(Q/f'results/{n}_methods.json');data={r['pair']:r for r in records}
 for method in ['quadol_wce','serial_then_quadol','state_window','quality_window']:
  top=f'r21_{n}_{method}'
  if method in ['state_window','quality_window']:
   state=load(Q/f'state/{n}_{method}_state.json');selected=state['accepted'];new=ops
   for pi,m in selected:new=core.replace_ops(new,pairs[pi],data[pi]['methods'][m])
   new=core.reorder(new,set(co)|set(ins));assert new is not None;mm=(g,new,co,ins,nn)
   text=core.export_rtl(g,selected,pairs,data,top)
   quality=load(Q/f'state/{n}_quality_window_state.json');metric=quality['initial'if method=='state_window'else'final']
  else:
   root=Q/'serial'if method=='serial_then_quadol'else Q;gg=load(root/f'graphs/{n}_quadol_wce.json');mm=(gg,*build(gg)[:4]);text=(serial_rtl if method=='serial_then_quadol'else quadol_rtl)(c,gg,top)
   metric=stats(c,gg,mm[1],'final_'+method)
   assert metric['WCE']==load(root/f'state/{n}_search.json')['selected_query']['WCE']
  (S/f'{top}.v').write_text(text);canonical=text.replace(f'module {top}(', 'module canonical(');digest=hashlib.sha256(canonical.encode()).hexdigest();key=(n,c['clock_ns'],digest);dup=seen.get(key);seen.setdefault(key,top);models[top]=mm
  entry=dict(case=n,family=n,budget=c['budget'],budget_index=0,method=method,top=top,clock_ns=c['clock_ns'],route_registered=True,duplicate_of=dup,canonical_sha256=digest,sha256=hashlib.sha256((S/f'{top}.v').read_bytes()).hexdigest(),**metric);entries.append(entry);integer_metrics.append(entry)
dump(S/'design_manifest.json',entries);dump(Q/'results/integer_metrics.json',integer_metrics)
gold=[]
for c in plan['cases']:
 n=c['name'];ee=[e for e in entries if e['case']==n];vv=vectors_for(c,random.Random(20261015));vv.update((e['witness_A'],e['witness_B'])for e in ee);lines=[]
 for a,b in sorted(vv):
  yy=[core.scalar(*models[e['top']],a,b)for e in ee];ref=reference(c,a,b);assert all(abs(y-ref)<=e['WCE']for y,e in zip(yy,ee));lines.append(' '.join(f'{x:08x}'for x in[a,b]+yy))
 (S/f'{n}_golden.hex').write_text('\n'.join(lines)+'\n');tb=f'tb_r21_{n}';count=len(ee)
 code=['`timescale 1ns/1ps',f'module {tb};','reg clk=0;always #5 clk=~clk;','reg [15:0] A=0,B=0;',f'wire[31:0] Y[0:{count-1}];',f'reg[31:0] expected[0:{count-1}];','reg[31:0] aa,bb;integer fd,rc,line_no=0,k;']
 for i,e in enumerate(ee):code.append(f'{e["top"]} u{i}(.clk(clk),.A(A),.B(B),.Y(Y[{i}]));')
 fmt=' '.join(['%h']*(count+2))+'\\n';args=['aa','bb']+[f'expected[{i}]'for i in range(count)]
 code+=['initial begin #200;',f'fd=$fopen("{n}_golden.hex","r");if(fd==0)$fatal(1,"missing");','while(!$feof(fd))begin',f'rc=$fscanf(fd,"{fmt}",'+','.join(args)+');',f'if(rc=={count+2})begin','@(negedge clk);A=aa[15:0];B=bb[15:0];repeat(2)@(posedge clk);#1;',f'for(k=0;k<{count};k=k+1)if(Y[k]!==expected[k])$fatal(1,"line%0d method%0d",line_no,k);','line_no=line_no+1;end else if(rc!=-1)$fatal(1,"malformed");end',f'$display("R21_PASS family={n} vectors=%0d designs={count}",line_no);$finish;end','endmodule']
 (S/f'{tb}.sv').write_text('\n'.join(code)+'\n');gold.append(dict(family=n,tb=tb,vectors=len(lines),designs=count,checks=count*len(lines)))
dump(Q/'state/golden.json',gold);print('EXPORTED',len(entries),'unique',sum(e['duplicate_of']is None for e in entries),flush=True)
