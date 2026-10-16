"""Export every endpoint plus independent scalar/HDL checks; no outcome selection."""
from common20 import Q,R,load,dump,build,reference,vectors_for
import core,sys,hashlib,random,csv
from direct20 import quadol_rtl
sys.path.insert(0,str(Q/'serial/tools'))
from direct_serial import quadol_rtl as serial_rtl
core.Q=Q
S=Q/'rtl';plan=load(Q/'configs/plan.json');entries=[];models={};seen={};mechanism=[]
for c in plan['cases']:
 n=c['name'];g=load(Q/f'graphs/{n}_seed.json');ops,co,ins,nn,_=build(g);pairs=load(Q/f'graphs/{n}_pairs.json');records=load(Q/f'results/{n}_methods.json');st=load(Q/f'state/{n}_state_window_state.json');new=ops
 for pi,m in st['accepted']:new=core.replace_ops(new,pairs[pi],records[pi]['methods'][m])
 new=core.reorder(new,set(co)|set(ins));assert new is not None
 gm=load(Q/f'graphs/{n}_quadol_wce.json');go=load(Q/f'serial/graphs/{n}_quadol_wce.json')
 mm={'state_window':(g,new,co,ins,nn),'quadol_wce':(gm,*build(gm)[:4]),'serial_then_quadol':(go,*build(go)[:4])}
 results={'state_window':st['final'],'quadol_wce':load(Q/f'state/{n}_search.json')['selected_query'],'serial_then_quadol':load(Q/f'serial/state/{n}_search.json')['selected_query']}
 for m in ['quadol_wce','serial_then_quadol','state_window']:
  top=f'r20_{n}_{m}';gg=mm[m][0]
  if m=='quadol_wce':text=quadol_rtl(c,gg,top)
  elif m=='serial_then_quadol':text=serial_rtl(c,gg,top)
  else:text=core.export_rtl(g,st['accepted'],pairs,{r['pair']:r for r in records},top)
  canonical=text.replace(f'module {top}(', 'module canonical(');digest=hashlib.sha256(canonical.encode()).hexdigest()
  # Same family clock and canonical netlist are required for any physical reuse.
  key=(c['family'],c['clock_ns'],digest);dup=seen.get(key);seen.setdefault(key,top)
  (S/f'{top}.v').write_text(text);r=results[m];assert r['WCE']<=c['budget']
  entries.append(dict(case=n,family=c['family'],budget=c['budget'],budget_index=c['budget_index'],method=m,top=top,WCE=r['WCE'],MAE=r['MAE'],clock_ns=c['clock_ns'],inputs=r['inputs'],canonical_sha256=digest,sha256=hashlib.sha256((S/f'{top}.v').read_bytes()).hexdigest(),duplicate_of=dup,route_registered=c['budget_index']==2,witness_A=r['witness_A'],witness_B=r['witness_B']))
  models[top]=mm[m]
 for h in st['history']:
  if h['status']=='ACCEPTED':
   cf=h['configuration'];p=pairs[h['pair']]
   mechanism.append(dict(case=n,budget=c['budget'],pair=h['pair'],candidate_class=p['candidate_class'],support=len(p['support']),shared=p['shared'],both_flattened_output_changes_fail=cf.get('both_single_edits_violate_sample_budget',False),both_single_edits_fail=p['candidate_class']!='dependent_window'and cf.get('both_single_edits_violate_sample_budget',False),interpretation='For dependent windows the per-output counterfactual holds the other flattened output fixed; it is not a proof about a literal first-root-only RTL edit. Serial control is the actual sequential comparison.',first_A_bound=cf.get('first_A_only_sample_bound'),first_B_bound=cf.get('first_B_only_sample_bound'),joint_WCE=h['full_check']['WCE'],configuration=cf))
dump(S/'design_manifest.json',entries);dump(Q/'results/mechanism_windows.json',mechanism)
gold=[]
for f in plan['families']:
 name=f['family'];c=next(c for c in plan['cases']if c['family']==name);ee=[e for e in entries if e['family']==name];vectors=vectors_for(c,random.Random(20261015));vectors.update((e['witness_A'],e['witness_B'])for e in ee);lines=[]
 for a,b in sorted(vectors):
  yy=[core.scalar(*models[e['top']],a,b)for e in ee];ref=reference(c,a,b)
  for y,e in zip(yy,ee):assert abs(y-ref)<=e['WCE'],(e['top'],a,b,y,ref,e['WCE'])
  lines.append(' '.join(f'{x:08x}'for x in [a,b]+yy))
 (S/f'{name}_golden.hex').write_text('\n'.join(lines)+'\n');tb=f'tb_r20_{name}';count=len(ee)
 code=['`timescale 1ns/1ps',f'module {tb};','reg clk=0; always #5 clk=~clk;','reg [15:0] A=0,B=0;',f'wire [31:0] Y[0:{count-1}];',f'reg [31:0] expected[0:{count-1}];','reg [31:0] aa,bb; integer fd,rc,line_no=0,k;']
 for j,e in enumerate(ee):code.append(f"{e['top']} u{j}(.clk(clk),.A(A),.B(B),.Y(Y[{j}]));")
 fmt=' '.join(['%h']*(count+2))+'\\n';args=['aa','bb']+[f'expected[{j}]'for j in range(count)]
 code+=['initial begin #200;',f'fd=$fopen("{name}_golden.hex","r"); if(fd==0) $fatal(1,"missing vectors");','while(!$feof(fd)) begin',f'rc=$fscanf(fd,"{fmt}",'+','.join(args)+');',f'if(rc=={count+2}) begin','@(negedge clk); A=aa[15:0]; B=bb[15:0]; repeat(2) @(posedge clk); #1;',f'for(k=0;k<{count};k=k+1) if(Y[k]!==expected[k]) $fatal(1,"Mismatch line=%0d design=%0d",line_no,k);','line_no=line_no+1; end else if(rc!=-1) $fatal(1,"Malformed vector");','end',f'$display("R20_PASS family={name} vectors=%0d designs={count}",line_no); $finish;','end','endmodule']
 (S/f'{tb}.sv').write_text('\n'.join(code)+'\n');gold.append(dict(family=name,tb=tb,vectors=len(lines),designs=count,checks=len(lines)*count))
dump(Q/'state/golden.json',gold)
print('EXPORT_COMPLETE endpoints',len(entries),'unique',sum(e['duplicate_of']is None for e in entries),'scalar_checks',sum(g['checks']for g in gold),flush=True)
