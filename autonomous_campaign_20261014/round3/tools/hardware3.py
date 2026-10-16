from pathlib import Path
import sys,json,csv,hashlib,re,shutil,subprocess,time,random,itertools,math,datetime
sys.dont_write_bytecode=True
from core3 import R,Q,load,dump,build,METHODS
from core2 import replace_ops,reorder,export_rtl,scalar
V=Path('E:/AMDDesignTools/2026.1/Vivado/bin');S=Q/'rtl';OUT=Q/'results/hardware';OUT.mkdir(exist_ok=True)
def seed_reference(c):
 if c['kind']=='sqrt':return lambda a,b:math.isqrt(a)|1
 old=R/'round1';n=c['name'];g=load(old/f'graphs/{n}.json');ops,co,ins,nn,_=build(g);pairs=load(old/f'graphs/{n}_pairs.json');data=load(old/f'results/{n}_methods.json');e=next(x for x in load(old/'rtl/design_manifest.json')if x['case']==n and x['method']=='physical')
 for pi,m in e['choices']:ops=replace_ops(ops,pairs[pi],data[pi]['methods'][m])
 ops=reorder(ops,set(co)|set(ins));return lambda a,b:scalar(g,ops,co,ins,nn,a,b)
def export():
 entries=[];models={};gold=[]
 for c in load(Q/'configs/plan.json')['cases']:
  name=c['name'];g=load(Q/f'graphs/{name}.json');ops,co,ins,nn,_=build(g);pairs=load(Q/f'graphs/{name}_pairs.json');data={r['pair']:r for r in load(Q/f'results/{name}_methods.json')};manifest=load(Q/f'state/{name}_replay_manifest.json');rows=list(csv.DictReader((Q/f'results/{name}_replay.csv').open()));seen={};local=[]
  for mi,m in enumerate(METHODS):
   final=next(r for r in rows if int(r['method'])==mi and r['stage']=='final');mask=int(final['mask']);choices=[x for j,x in enumerate(manifest[mi]['choices'])if mask>>j&1];top=f'r3_{name}_{m}';rtl=export_rtl(g,choices,pairs,data,top);canonical=export_rtl(g,choices,pairs,data,'canonical');digest=hashlib.sha256(canonical.encode()).hexdigest();duplicate=seen.get(digest);seen.setdefault(digest,top)
   (S/f'{top}.v').write_text(rtl);new=ops
   for pi,meth in choices:new=replace_ops(new,pairs[pi],data[pi]['methods'][meth])
   new=reorder(new,set(co)|set(ins));assert new is not None
   e=dict(case=name,method=m,top=top,choices=choices,WCE=int(final['WCE']),budget=c['budget'],duplicate_of=duplicate,sha256=hashlib.sha256(rtl.encode()).hexdigest(),canonical_sha256=digest)
   entries.append(e)
   if duplicate is None:models[top]=(g,new,co,ins,nn);local.append(e)
  rng=random.Random(20261014)
  if c['kind']=='mul':
   vals=[0,1,7,8,15,16,31,32,255,256,32767,32768,65534,65535];vectors=set(itertools.product(vals,vals));vectors.update((rng.randrange(65536),rng.randrange(65536))for _ in range(2048))
  else:
   limit=1<<c['bits'];vectors={(a,0)for a in range(limit)}if c['bits']==12 else{(rng.randrange(limit),0)for _ in range(2048)}
   vectors.update((a,0)for y in range(math.isqrt(limit-1)+1)for a in [y*y-1,y*y,y*y+1]if 0<=a<limit)
  vectors.update((int(r['witness_A']),int(r['witness_B']))for r in rows)
  lines=[];seed_expected=seed_reference(c)
  for a,b in sorted(vectors):
   yy=[];ref=a*b if c['kind']=='mul'else math.isqrt(a)
   for e in local:
    y=scalar(*models[e['top']],a,b);assert abs(y-ref)<=e['WCE'],(e,a,b,y,ref)
    if e['method']=='seed':assert y==seed_expected(a,b),('seed lineage mismatch',name,a,b,y,seed_expected(a,b))
    yy.append(y)
   lines.append(' '.join(f'{v:08x}'for v in [a,b]+yy))
  (S/f'{name}_golden.hex').write_text('\n'.join(lines)+'\n');n=len(local);tb=f'tb_{name}'
  text=['`timescale 1ns/1ps',f'module {tb};','reg clk=0; always #5 clk=~clk;','reg [15:0] A=0,B=0;',f'wire [31:0] Y[0:{n-1}];',f'reg [31:0] expected[0:{n-1}];','reg [31:0] aa,bb; integer fd,rc,line_no=0,k;']
  for j,e in enumerate(local):text.append(f"{e['top']} u{j}(.clk(clk),.A(A),.B(B),.Y(Y[{j}]));")
  fmt=' '.join(['%h']*(n+2))+'\\n';args=['aa','bb']+[f'expected[{j}]'for j in range(n)]
  text+=['initial begin #200;',f'fd=$fopen("{name}_golden.hex","r"); if(fd==0) $fatal(1,"missing vectors");','while(!$feof(fd)) begin',f'rc=$fscanf(fd,"{fmt}",'+','.join(args)+');',f'if(rc=={n+2}) begin','@(negedge clk); A=aa[15:0]; B=bb[15:0]; repeat(2) @(posedge clk); #1;',f'for(k=0;k<{n};k=k+1) if(Y[k]!==expected[k]) $fatal(1,"Mismatch line=%0d design=%0d got=%h expected=%h",line_no,k,Y[k],expected[k]);','line_no=line_no+1; end else if(rc!=-1) $fatal(1,"Malformed vector");','end',f'$display("R3_PASS case={name} vectors=%0d designs={n}",line_no); $finish;','end','endmodule']
  (S/f'{tb}.sv').write_text('\n'.join(text)+'\n');gold.append(dict(case=name,vectors=len(lines),designs=n,checks=n*len(lines),tb=tb))
 dump(S/'design_manifest.json',entries);dump(Q/'state/golden.json',gold);print('exported',len(entries),'variants;',sum(not e['duplicate_of']for e in entries),'unique',flush=True)
def execute(cmd,q,log):
 st=time.perf_counter()
 with(q/log).open('w',encoding='utf-8')as f:p=subprocess.run(cmd,cwd=q,stdout=f,stderr=subprocess.STDOUT,creationflags=subprocess.CREATE_NO_WINDOW)
 row={'argv':list(map(str,cmd)),'returncode':p.returncode,'wall_s':time.perf_counter()-st,'log':str(q/log)};f=Q/'state/hardware_commands.json';commands=load(f)if f.exists()else[];commands.append(row);dump(f,commands);p.check_returncode();return row
def simulation():
 entries=[e for e in load(S/'design_manifest.json')if not e['duplicate_of']];records=[]
 for gold in load(Q/'state/golden.json'):
  name=gold['case'];q=OUT/f'simulation_{name}';assert not q.exists();q.mkdir();shutil.copy2(S/f'{name}_golden.hex',q/f'{name}_golden.hex');(q/'run.tcl').write_text('run all\nquit\n');ee=[e for e in entries if e['case']==name];tb=gold['tb']
  execute([str(V/'xvlog.bat'),'--sv',*[str(S/(e['top']+'.v'))for e in ee],str(S/f'{tb}.sv'),str(V.parent/'data/verilog/src/glbl.v')],q,'compile.log')
  execute([str(V/'xelab.bat'),'--debug','typical','-L','unisims_ver','-L','unimacro_ver',tb,'glbl','-s','round_sim'],q,'elaborate.log')
  execute([str(V/'xsim.bat'),'round_sim','-tclbatch',(q/'run.tcl').as_posix()],q,'simulate.log')
  assert f'R3_PASS case={name} vectors={gold["vectors"]} designs={gold["designs"]}'in(q/'simulate.log').read_text()
  records.append(dict(gold,status='PASS'));dump(Q/'state/rtl_validation.json',records);print('RTL_PASS',name,gold['checks'],flush=True)
def route():
 entries=[e for e in load(S/'design_manifest.json')if not e['duplicate_of']];rows=[]
 for entry in entries:
  top=entry['top'];q=OUT/top;assert not q.exists();q.mkdir();sl=q/'sources.txt';sl.write_text((S/f'{top}.v').as_posix()+'\n');st=time.perf_counter()
  for phase in ['synth','impl']:
   dump(Q/'state/progress.json',{'phase':phase,'top':top,'physical_complete':len(rows),'physical_planned':len(entries)})
   execute([str(V/'vivado.bat'),'-mode','batch','-nojournal','-nolog','-source',str(R/'tools/route_clocked.tcl'),'-tclargs',q.as_posix(),sl.as_posix(),top,'forbid',phase,(S/f'{entry["case"]}.xdc').as_posix()],q,phase+'.log')
  row=dict(entry,wall_s=time.perf_counter()-st);row.update(json.loads('{'+(q/'metrics.json').read_text().strip()+'}'));util=(q/'util_route.rpt').read_text()
  for key,pattern in [('LUT','Slice LUTs'),('FF','Slice Registers'),('DSP','DSPs')]:row[key]=int(re.search(r'\|\s*'+pattern+r'\*?\s*\|\s*(\d+)',util)[1])
  du=re.search(r'\|\s*using O5 and O6\s*\|\s*(\d+)',util);row['dual_output_LUTs']=int(du[1])if du else 0
  mt=re.search(r'WNS\(ns\).*?\n\s*-+.*?\n\s*([-\d.]+)\s+([-\d.]+)\s+(\d+)\s+(\d+)\s+([-\d.]+)\s+([-\d.]+)',(q/'timing_route.rpt').read_text(),re.S);assert mt
  for key,idx in [('WNS_ns',1),('TNS_ns',2),('WHS_ns',5),('THS_ns',6)]:row[key]=float(mt[idx])
  row['check_timing']={k:int(v)for k,v in re.findall(r'checking (\w+) \((\d+)\)',(q/'check_timing.rpt').read_text())};row['DRC_errors']=re.findall(r'\|\s*([A-Z0-9-]+)\s*\|\s*(?:Error|Critical Warning)\s*\|',(q/'drc.rpt').read_text());row['pass_registered_clock']=row['WNS_ns']>=0 and row['WHS_ns']>=0 and row['TNS_ns']==0 and row['THS_ns']==0 and not any(row['check_timing'].values())and not row['DRC_errors'];row['clock_ns']=next(c['clock_ns']for c in load(Q/'configs/plan.json')['cases']if c['name']==entry['case']);row['FF_period_ns']=row['clock_ns']-float(row['ff_slack_ns']);assert row['DSP']==0
  rows.append(row);dump(OUT/'ppa.json',rows);print(top,'LUT',row['LUT'],'WNS',row['WNS_ns'],'WCE',row['WCE'],flush=True)
 dump(Q/'state/progress.json',dict(phase='ALL_CORE_EXPERIMENTS_COMPLETE',physical_jobs=len(rows),finished=datetime.datetime.now().astimezone().isoformat()))
if __name__=='__main__':{'export':export,'simulation':simulation,'route':route}[sys.argv[1]]()
