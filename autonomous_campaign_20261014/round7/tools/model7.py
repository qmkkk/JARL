from pathlib import Path
import sys,json,csv,hashlib,re,subprocess,itertools,random,math,time
sys.dont_write_bytecode=True
Q=Path(__file__).resolve().parents[1];R=Q.parent
sys.path.insert(0,str(R/'tools'))
import core
core.Q=Q
from core import load,dump,build,base_code,emit_ops,replace_ops,reorder,export_rtl,scalar,linux,native,run
METHODS=['abc_global']
from common7 import base_code,reference
core.Q=Q

def blif(g):
 ops,co,ins,nn,_=build(g);regs={c['name']for c in g['cells']if c['type'].startswith('FD')};logic=[o for o in ops if o['name']not in regs];drivers={o['out']for o in logic};boundary_inputs=sorted({n for o in logic for n in o['ins']}-drivers-set(co));sinks={n for c in g['cells']if c['name']in regs for pin,n in c['pins'].items()if pin in ['D','CE','R','S']}|{n for k,n in g['ports'].items()if k.startswith('Y[')};outputs=sorted(drivers&sinks)
 allowed_inputs=set(ins)|{c['pins']['Q']for c in g['cells']if c['name']in regs};assert set(boundary_inputs)<=allowed_inputs
 lines=['.model whole_comb','.inputs '+' '.join(f'n{n}'for n in boundary_inputs),'.outputs '+' '.join(f'n{n}'for n in outputs)]
 for n,b in co.items():lines += [f'.names n{n}']+(['1']if b else[])
 for o in logic:
  k=len(o['ins'])
  if o['typ']=='lut':init=o['init']
  else:
   def val(r):
    b=[(r>>i)&1 for i in range(k)]
    return {'or':lambda:b[0]|b[1],'andnot':lambda:b[0]&(1-b[1]),'xor':lambda:b[0]^b[1],'not':lambda:1-b[0],'mux':lambda:b[2]if b[0]else b[1]}[o['typ']]()
   init=sum(val(r)<<r for r in range(1<<k))
  if init in [0,(1<<(1<<k))-1]:lines += [f'.names n{o["out"]}']+(['1']if init else[]);continue
  lines.append('.names '+' '.join(f'n{n}'for n in o['ins']+[o['out']]))
  for r in range(1<<k):
   if init>>r&1:lines.append(''.join(str((r>>i)&1)for i in range(k))+' 1')
 lines.append('.end');return '\n'.join(lines)+'\n',dict(logic_nodes=len(logic),inputs=len(boundary_inputs),outputs=len(outputs),expanded_CARRY4=sum(c['type']=='CARRY4'for c in g['cells']))

def parse(g,path):
 text=path.read_text().replace('\\\n',' ');lines=[x.strip()for x in text.splitlines()if x.strip()and not x.lstrip().startswith('#')];names={};original_limit=build(g)[3];nextnet=original_limit;defs=[];i=0
 def net(s):
  nonlocal nextnet
  if re.fullmatch(r'n\d+',s)and int(s[1:])<original_limit:return int(s[1:])
  if s not in names:names[s]=nextnet;nextnet+=1
  return names[s]
 while i<len(lines):
  t=lines[i].split();i+=1
  if t[0] in ['.model','.inputs','.outputs','.end']:continue
  assert t[0]=='.names',t
  wires=t[1:];rows=[]
  while i<len(lines)and not lines[i].startswith('.'):rows.append(lines[i].split());i+=1
  k=len(wires)-1;assert 0<=k<=6,(k,wires);pol={r[-1]for r in rows};assert len(pol)<=1 and pol<={'0','1'}
  init=(1<<(1<<k))-1 if pol=={'0'}else 0
  for row in rows:
   pattern=row[0]if k else '';val=int(row[-1]);assert len(pattern)==k
   for r in range(1<<k):
    if all(ch=='-'or int(ch)==(r>>j&1)for j,ch in enumerate(pattern)):
     init=(init|(1<<r))if val else(init&~(1<<r))
  defs.append((wires,init,k))
 oldco=build(g)[1];cells=[c for c in g['cells']if c['type'].startswith('FD')or c['type']in ['GND','VCC']]
 for j,(wires,init,k)in enumerate(defs):
  out=net(wires[-1]);inputs=[net(x)for x in wires[:-1]]
  if out in oldco:
   assert k==0 and init==oldco[out];continue
  if k==0:
   cells.append(dict(name=f'abc_const_{j}',type='VCC'if init else'GND',pins={'P'if init else'G':out},props={}))
  else:cells.append(dict(name=f'abc_lut_{j}',type=f'LUT{k}',pins={**{f'I{i}':n for i,n in enumerate(inputs)},'O':out},props={'INIT':f"{1<<k}'h{init:x}"}))
 result=dict(g,cells=cells,n_nets=nextnet,origin='R7 ABC whole combinational resynthesis, registers preserved, CARRY4 expanded');build(result);return result

def resynth():
 records=load(Q/'state/abc_validation.json')if(Q/'state/abc_validation.json').exists()else[]
 for c in load(Q/'configs/plan.json')['cases']:
  n=c['name']
  if any(r['case']==n for r in records):continue
  d=Q/f'build/abc_{n}'
  if d.exists():d=Q/f'build/abc_{n}_retry'
  assert not d.exists();d.mkdir();g=load(Q/f'graphs/{n}_seed.json');text,stats=blif(g);src=d/'source.blif';dst=d/'mapped.blif';src.write_text(text);exe=linux(Q/'inputs/abc_executable');cmd=f'read_blif {linux(src)}; strash; dc2; if -K 6; mfs2; print_stats; write_blif {linux(dst)}'
  dump(Q/'state/progress.json',dict(phase='ABC_EXACT',case=n));run(['wsl','-d','Ubuntu','-u','k','--',exe,'-c',cmd],d/'synthesis.log');assert dst.exists()
  run(['wsl','-d','Ubuntu','-u','k','--',exe,'-c',f'cec {linux(src)} {linux(dst)}'],d/'cec.log');log=(d/'cec.log').read_text();assert 'Networks are equivalent' in log,log
  mapped=parse(g,dst);dump(Q/f'graphs/{n}_abc_global.json',mapped);records.append(dict(case=n,region=stats,cec='PASS',mapped_LUTs=sum(re.fullmatch('LUT[1-6]',x['type'])is not None for x in mapped['cells']),carry_cells_preserved=sum(x['type']=='CARRY4'for x in mapped['cells']),source_sha256=hashlib.sha256(src.read_bytes()).hexdigest(),mapped_sha256=hashlib.sha256(dst.read_bytes()).hexdigest()));dump(Q/'state/abc_validation.json',records);print('ABC_PASS',n,stats,'mapped',records[-1]['mapped_LUTs'],flush=True)

def models(c):
 n=c['name'];g=load(Q/f'graphs/{n}_seed.json');ops,co,ins,nn,_=build(g);out={'seed':(g,ops,co,ins,nn)};ga=load(Q/f'graphs/{n}_abc_global.json');oa,ca,ia,na,_=build(ga);out['abc_global']=(ga,oa,ca,ia,na);return out

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
std::cout<<"LABEL,"<<N<<","<<wce<<","<<delta<<","<<wa<<","<<wb<<","<<wy<<","<<double(sae/N)<<std::endl;if(delta!=0||wce>BUDGET)return 6;}
'''.replace('EVAL','eval_'+m).replace('LABEL',m).replace('BUDGET',str(c['budget'])))
  s.append('return 0;}');src=Q/f'src/{n}_verify.cpp';src.write_text('\n'.join(s));dump(Q/'state/progress.json',dict(phase='FULL_DOMAIN_VERIFY',case=n));native(src,[],Q/f'results/{n}_verify.csv');print('FULL_DOMAIN_PASS',n,flush=True)

def export():
 entries=[];gold=[];S=Q/'rtl'
 for c in load(Q/'configs/plan.json')['cases']:
  n=c['name'];mm=models(c);rows=list(csv.DictReader((Q/f'results/{n}_verify.csv').open()));local=[];seen={}
  for m in METHODS:
   top=f'r7_{n}_{m}';g=mm[m][0]
   text=export_rtl(g,[],[],{},top)
   canonical=text.replace(f'module {top}(', 'module canonical(');digest=hashlib.sha256(canonical.encode()).hexdigest();dup=seen.get(digest);seen.setdefault(digest,top);(S/f'{top}.v').write_text(text);f=next(x for x in rows if x['method']==m);entry=dict(case=n,method=m,top=top,WCE=int(f['WCE']),budget=c['budget'],seed_max_delta=int(f['seed_max_delta']),duplicate_of=dup,sha256=hashlib.sha256((S/f'{top}.v').read_bytes()).hexdigest(),normalized_text_sha256=hashlib.sha256(text.encode()).hexdigest(),canonical_sha256=digest,choices=[]);entries.append(entry)
   if not dup:local.append(entry)
  rng=random.Random(20261014)
  if c['kind']in ['sqrt','sqrt_exact']:vectors={(a,0)for a in range(1<<c['domain_bits'])}
  else:
   vals=[0,1,2,3,7,15,16,31,32,63,64,127,128,254,255];vectors=set(itertools.product(vals,vals));vectors.update((rng.randrange(256),rng.randrange(65536 if c['kind']=='mac'else 256))for _ in range(4096))
   if c['kind']=='mac':vectors.update((a,b|(z<<8))for a,b,z in itertools.product(vals,[0,1,127,255],[0,1,127,255]))
  vectors.update((int(f['witness_A']),int(f['witness_B']))for f in rows);lines=[]
  for a,b in sorted(vectors):
   ys=[scalar(*mm[e['method']],a,b)for e in local];assert len(set(ys))==1;ref=reference(c,a,b);assert abs(ys[0]-ref)<=c['budget'];lines.append(' '.join(f'{x:08x}'for x in[a,b]+ys))
  (S/f'{n}_golden.hex').write_text('\n'.join(lines)+'\n');count=len(local);tb=f'tb_{n}';code=['`timescale 1ns/1ps',f'module {tb};','reg clk=0; always #5 clk=~clk;','reg [15:0] A=0,B=0;',f'wire [31:0] Y[0:{count-1}];',f'reg [31:0] expected[0:{count-1}];','reg [31:0] aa,bb; integer fd,rc,line_no=0,k;']
  for j,e in enumerate(local):code.append(f"{e['top']} u{j}(.clk(clk),.A(A),.B(B),.Y(Y[{j}]));")
  fmt=' '.join(['%h']*(count+2))+'\\n';args=['aa','bb']+[f'expected[{j}]'for j in range(count)];code+=['initial begin #200;',f'fd=$fopen("{n}_golden.hex","r"); if(fd==0) $fatal(1,"missing vectors");','while(!$feof(fd)) begin',f'rc=$fscanf(fd,"{fmt}",'+','.join(args)+');',f'if(rc=={count+2}) begin','@(negedge clk); A=aa[15:0]; B=bb[15:0]; repeat(2) @(posedge clk); #1;',f'for(k=0;k<{count};k=k+1) if(Y[k]!==expected[k]) $fatal(1,"Mismatch line=%0d design=%0d",line_no,k);','line_no=line_no+1; end else if(rc!=-1) $fatal(1,"Malformed vector");','end',f'$display("R7_PASS case={n} vectors=%0d designs={count}",line_no); $finish;','end','endmodule'];(S/f'{tb}.sv').write_text('\n'.join(code)+'\n');gold.append(dict(case=n,vectors=len(lines),designs=count,checks=count*len(lines),tb=tb))
 dump(S/'design_manifest.json',entries);dump(Q/'state/golden.json',gold);print('exported',len(entries),'designs',flush=True)

if __name__=='__main__':dict(resynth=resynth,verify=verify,export=export)[sys.argv[1]]()
