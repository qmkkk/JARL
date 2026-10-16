from pathlib import Path
import sys,json,csv,hashlib,re,subprocess,itertools,random,math,time
sys.dont_write_bytecode=True
Q=Path(__file__).resolve().parents[1];R=Q.parent
sys.path.insert(0,str(R/'tools'))
import core
core.Q=Q
from core import load,dump,build,base_code,emit_ops,replace_ops,reorder,export_rtl,scalar,linux,native,run
METHODS=['seed','numeric_window']
from common12 import base_code,reference,vectors_for
core.Q=Q

def choices(n,method):
 mi=METHODS[1:].index(method);manifest=load(Q/f'state/{n}_replay_manifest.json')[mi];f=next(r for r in csv.DictReader((Q/f'results/{n}_replay.csv').open())if r['stage']=='final'and int(r['method'])==mi);mask=int(f['mask']);return[x for i,x in enumerate(manifest['choices'])if mask>>i&1]

def models(c):
 n=c['name'];g=load(Q/f'graphs/{n}_seed.json');ops,co,ins,nn,_=build(g);out={'seed':(g,ops,co,ins,nn)};pairs=load(Q/f'graphs/{n}_pairs.json');data=load(Q/f'results/{n}_methods.json')
 for m in METHODS[1:]:
  new=ops
  for pi,k in choices(n,m):new=replace_ops(new,pairs[pi],data[pi]['methods'][k])
  new=reorder(new,set(co)|set(ins));assert new is not None;out[m]=(g,new,co,ins,nn)
 return out

def verify():
 for c in load(Q/'configs/plan.json')['cases']:
  n=c['name'];mm=models(c);g=mm['seed'][0];s,_,_,_,nn,_=base_code(c,g);maximum=max(m[-1]for m in mm.values());s=[x.replace(f'constexpr int NN={nn},',f'constexpr int NN={maximum},')for x in s]
  for m,(gm,op,co,ins,nets)in mm.items():s.append(emit_ops(op,co,'eval_'+m))
  s.append('int main(){std::cout<<"method,inputs,WCE,seed_max_delta,witness_A,witness_B,witness_Y,MAE_at_lowbits_zero\\n";')
  for m in METHODS:
   s.append('''{U v[NN];uint32_t seed[64],out[64];U delta=0,wa=0,wb=0,wy=0;I wce=0;long double sae=0;
for(U base=0;base<N;base+=64){inputs(v,base);eval_seed(v);unpack(v,seed);inputs(v,base);EVAL(v);unpack(v,out);
for(int j=0;j<64;j++){U a,b,l,h;reference(base+j,a,b,l,h);if(seed[j]!=seed_expected(l))return 7;delta=std::max(delta,U(std::abs(I(seed[j])-I(out[j]))));I lo=std::abs(I(out[j])-I(l)),hi=std::abs(I(out[j])-I(h));sae+=lo;
if(lo>wce){wce=lo;wa=a;wb=b;wy=out[j];}if(hi>wce){wce=hi;wa=a+((U(1)<<T)-1);wb=b+((U(1)<<T)-1);wy=out[j];}}}
std::cout<<"LABEL,"<<N<<","<<wce<<","<<delta<<","<<wa<<","<<wb<<","<<wy<<","<<double(sae/N)<<std::endl;if((EXACT&&delta!=0)||wce>BUDGET)return 6;}
'''.replace('EVAL','eval_'+m).replace('LABEL',m).replace('BUDGET',str(c['budget'])).replace('EXACT','true'if m in ['seed','local_window']else 'false'))
  s.append('return 0;}');src=Q/f'src/{n}_verify.cpp';src.write_text('\n'.join(s));dump(Q/'state/progress.json',dict(phase='FULL_DOMAIN_VERIFY',case=n));native(src,[],Q/f'results/{n}_verify.csv');print('FULL_DOMAIN_PASS',n,flush=True)

def export():
 entries=[];gold=[];S=Q/'rtl'
 for c in load(Q/'configs/plan.json')['cases']:
  n=c['name'];mm=models(c);rows=list(csv.DictReader((Q/f'results/{n}_verify.csv').open()));local=[];seen={}
  for m in METHODS:
   top=f'r12_{n}_{m}';g=mm[m][0]
   pairs=load(Q/f'graphs/{n}_pairs.json');data={r['pair']:r for r in load(Q/f'results/{n}_methods.json')};selected=[]if m=='seed'else choices(n,m)
   text=export_rtl(g,selected,pairs,data,top)
   canonical=text.replace(f'module {top}(', 'module canonical(');digest=hashlib.sha256(canonical.encode()).hexdigest();dup=seen.get(digest);seen.setdefault(digest,top);(S/f'{top}.v').write_text(text);f=next(x for x in rows if x['method']==m);entry=dict(case=n,method=m,top=top,WCE=int(f['WCE']),budget=c['budget'],seed_max_delta=int(f['seed_max_delta']),duplicate_of=dup,sha256=hashlib.sha256((S/f'{top}.v').read_bytes()).hexdigest(),normalized_text_sha256=hashlib.sha256(text.encode()).hexdigest(),canonical_sha256=digest,choices=selected);entries.append(entry)
   catalog=load(Q/'state/physical_reuse_catalog.json');matches=[x for x in catalog if x['case']==n and x['canonical_sha256']==digest and x['physical_result']['clock_ns']==c['clock_ns']];entry['inherited_physical']=bool(matches)
   if matches:
    old=matches[0];assert hashlib.sha256(Path(old['rtl']).read_bytes()).hexdigest()==old['rtl_file_sha256'];entry['inherited_record']=old
   if not dup:local.append(entry)
  rng=random.Random(20261015);vectors=vectors_for(c,rng)
  vectors.update((int(f['witness_A']),int(f['witness_B']))for f in rows);lines=[]
  for a,b in sorted(vectors):
   ys=[scalar(*mm[e['method']],a,b)for e in local];ref=reference(c,a,b);assert all(abs(y-ref)<=c['budget']for y in ys);lines.append(' '.join(f'{x:08x}'for x in[a,b]+ys))
  (S/f'{n}_golden.hex').write_text('\n'.join(lines)+'\n');count=len(local);tb=f'tb_{n}';code=['`timescale 1ns/1ps',f'module {tb};','reg clk=0; always #5 clk=~clk;','reg [15:0] A=0,B=0;',f'wire [31:0] Y[0:{count-1}];',f'reg [31:0] expected[0:{count-1}];','reg [31:0] aa,bb; integer fd,rc,line_no=0,k;']
  for j,e in enumerate(local):code.append(f"{e['top']} u{j}(.clk(clk),.A(A),.B(B),.Y(Y[{j}]));")
  fmt=' '.join(['%h']*(count+2))+'\\n';args=['aa','bb']+[f'expected[{j}]'for j in range(count)];code+=['initial begin #200;',f'fd=$fopen("{n}_golden.hex","r"); if(fd==0) $fatal(1,"missing vectors");','while(!$feof(fd)) begin',f'rc=$fscanf(fd,"{fmt}",'+','.join(args)+');',f'if(rc=={count+2}) begin','@(negedge clk); A=aa[15:0]; B=bb[15:0]; repeat(2) @(posedge clk); #1;',f'for(k=0;k<{count};k=k+1) if(Y[k]!==expected[k]) $fatal(1,"Mismatch line=%0d design=%0d",line_no,k);','line_no=line_no+1; end else if(rc!=-1) $fatal(1,"Malformed vector");','end',f'$display("R12_PASS case={n} vectors=%0d designs={count}",line_no); $finish;','end','endmodule'];(S/f'{tb}.sv').write_text('\n'.join(code)+'\n');gold.append(dict(case=n,vectors=len(lines),designs=count,checks=count*len(lines),tb=tb))
 dump(S/'design_manifest.json',entries);dump(Q/'state/golden.json',gold);print('exported',len(entries),'designs',flush=True)

if __name__=='__main__':dict(verify=verify,export=export)[sys.argv[1]]()
