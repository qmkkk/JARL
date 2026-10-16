"""Equal-work streaming dot product with included control and exact accumulator."""
from pathlib import Path
import sys,json,hashlib,random,re,time,shutil
from model18 import Q,R,load,dump
from hardware18 import execute,V
import numpy as np
S=Q/'rtl/integration';OUT=Q/'results/integration';METHODS=['seed','quadol_wce','state_window']
def prepare():
 S.mkdir(exist_ok=True);OUT.mkdir(exist_ok=True);entries=[];gold=[]
 for c in load(Q/'configs/plan.json')['cases']:
  n=c['name'];w=c['width'];rng=random.Random(20261018+w);blocks=[]
  for bi in range(128):
   pairs=[(rng.randrange(1<<w),rng.randrange(1<<w))for _ in range(16)]
   if bi<4:pairs=[((1<<w)-1 if bi&1 else 0,(1<<w)-1 if bi&2 else 0)]*16
   blocks.append(pairs)
  dump(S/f'{n}_input_blocks.json',blocks);tables={m:np.fromfile(Q/f'results/product_tables/{n}_{m}.bin',dtype='<u4').reshape(1<<w,1<<w)for m in METHODS};refs=[[sum(int(t[b,a])for a,b in block)for m,t in tables.items()]for block in blocks]
  for m in METHODS:
   coretop=f'r18_{n}_{m}';top=f'r18_dot16_{n}_{m}';text=f'''module {top}(input wire clk,input wire reset,input wire valid,input wire start,input wire last,input wire[15:0] A,B,output reg[31:0] Y,output reg done);
wire[31:0] product;
{coretop} core(.clk(clk),.A(A),.B({{{16-w}'b0,B[{w-1}:0]}}),.Y(product));
reg v0,v1,s0,s1,l0,l1;reg[31:0] acc;
always @(posedge clk) begin
 if(reset)begin v0<=0;v1<=0;s0<=0;s1<=0;l0<=0;l1<=0;acc<=0;Y<=0;done<=0;end
 else begin
  v0<=valid;v1<=v0;s0<=start;s1<=s0;l0<=last;l1<=l0;done<=0;
  if(v1)begin acc<=s1?product:acc+product;if(l1)begin Y<=s1?product:acc+product;done<=1;end end
 end
end
endmodule
''';p=S/f'{top}.v';p.write_text(text);xdc=S/f'{top}.xdc';xdc.write_text('create_clock -period 15.0 -name clk [get_ports clk]\nset_input_delay 2.0 -clock clk [get_ports {A* B* reset valid start last}]\nset_output_delay 2.0 -clock clk [get_ports {Y* done}]\nset_property HD.CLK_SRC BUFGCTRL_X0Y0 [get_ports clk]\n');entries.append(dict(case=n,method=m,top=top,coretop=coretop,rtl=str(p),core_rtl=str(Q/f'rtl/{coretop}.v'),sha256=hashlib.sha256(p.read_bytes()).hexdigest(),clock_ns=15,block_length=16,accumulator_width=32))
  # Fixed cycle stimuli and independent complete-block expectations, with bubbles/back-to-back blocks.
  stimuli=[];due={};cycle=0
  for bi,block in enumerate(blocks):
   for j,(a,b)in enumerate(block):
    if bi%3==1 and j%5==2:stimuli.append((0,0,0,0,0));cycle+=1
    stimuli.append((1,int(j==0),int(j==15),a,b))
    if j==15:due[cycle+2]=refs[bi]
    cycle+=1
  stimuli += [(0,0,0,0,0)]*4;lines=[]
  for cy,st in enumerate(stimuli):lines.append(' '.join(map(str,[*st,int(cy in due),*due.get(cy,[0]*len(METHODS))])))
  path=S/f'{n}_vectors.txt';path.write_text('\n'.join(lines)+'\n');tb=f'tb_dot16_{n}';code=['`timescale 1ns/1ps',f'module {tb};','reg clk=0;always #5 clk=~clk;reg reset=1,valid=0,start=0,last=0;reg[15:0] A=0,B=0;wire[31:0]Y[0:2];wire done[0:2];integer fd,rc,cy=0,j,v,s,l,a,b,ed;reg[31:0]e[0:2];']
  for j,m in enumerate(METHODS):code.append(f'r18_dot16_{n}_{m} u{j}(.clk(clk),.reset(reset),.valid(valid),.start(start),.last(last),.A(A),.B(B),.Y(Y[{j}]),.done(done[{j}]));')
  code += ['initial begin #200;repeat(4)@(posedge clk);@(negedge clk);reset=0;',f'fd=$fopen("{n}_vectors.txt","r");if(fd==0)$fatal(1,"missing");','while(!$feof(fd))begin',r'rc=$fscanf(fd,"%d %d %d %d %d %d %d %d %d\n",v,s,l,a,b,ed,e[0],e[1],e[2]);'.replace('\\"','"'), 'if(rc==9)begin valid=v;start=s;last=l;A=a;B=b;@(posedge clk);#1;','for(j=0;j<3;j=j+1)begin if(done[j]!==ed[0])$fatal(1,"done cycle %0d model %0d",cy,j);if(ed&&Y[j]!==e[j])$fatal(1,"sum cycle %0d model %0d",cy,j);end','cy=cy+1;@(negedge clk);end else if(rc!=-1)$fatal(1,"bad input");end',f'$display("DOT_PASS {n} cycles=%0d",cy);$finish;end endmodule'];(S/f'{tb}.sv').write_text('\n'.join(code)+'\n');gold.append(dict(case=n,tb=tb,cycles=len(stimuli),blocks=len(blocks),models=3,done_checks=3*len(stimuli),sum_checks=3*len(blocks)))
 dump(S/'manifest.json',entries);dump(S/'golden.json',gold);print('INTEGRATION_PREPARED',len(entries),flush=True)
def simulation():
 records=[];entries=load(S/'manifest.json')
 for g in load(S/'golden.json'):
  n=g['case'];q=OUT/f'simulation_{n}';q=q if not q.exists()else OUT/f'simulation_{n}_resume1';assert not q.exists();q.mkdir();shutil.copy2(S/f'{n}_vectors.txt',q/f'{n}_vectors.txt');(q/'run.tcl').write_text('run all\nquit\n');ee=[e for e in entries if e['case']==n]
  execute([str(V/'xvlog.bat'),'--sv',*[p for e in ee for p in [e['core_rtl'],e['rtl']]],str(S/f'{g["tb"]}.sv'),str(V.parent/'data/verilog/src/glbl.v')],q,'compile.log');execute([str(V/'xelab.bat'),'--debug','typical','-L','unisims_ver','-L','unimacro_ver',g['tb'],'glbl','-s','dot_sim'],q,'elaborate.log');execute([str(V/'xsim.bat'),'dot_sim','-tclbatch',(q/'run.tcl').as_posix()],q,'simulate.log');assert f'DOT_PASS {n} cycles={g["cycles"]}'in(q/'simulate.log').read_text();records.append(dict(g,status='PASS'));dump(Q/'state/integration_validation.json',records);print('DOT_HDL_PASS',n,flush=True)
def route():
 rows=[]
 for e in load(S/'manifest.json'):
  top=e['top'];q=OUT/top;assert not q.exists();q.mkdir();sl=q/'sources.txt';sl.write_text(Path(e['core_rtl']).as_posix()+'\n'+Path(e['rtl']).as_posix()+'\n');st=time.perf_counter()
  for phase in ['synth','impl']:
   dump(Q/'state/progress.json',dict(phase='INTEGRATED_'+phase,top=top,completed=len(rows),planned=9));execute([str(V/'vivado.bat'),'-mode','batch','-nojournal','-nolog','-source',str(R/'tools/route_clocked.tcl'),'-tclargs',q.as_posix(),sl.as_posix(),top,'forbid',phase,(S/f'{top}.xdc').as_posix()],q,phase+'.log')
  row=dict(e,wall_s=time.perf_counter()-st,physical_directory=str(q));row.update(json.loads('{'+(q/'metrics.json').read_text().strip()+'}'));util=(q/'util_route.rpt').read_text()
  for key,label in [('LUT','Slice LUTs'),('FF','Slice Registers'),('DSP','DSPs')]:row[key]=int(re.search(r'\|\s*'+label+r'\*?\s*\|\s*(\d+)',util)[1])
  mt=re.search(r'WNS\(ns\).*?\n\s*-+.*?\n\s*([-\d.]+)\s+([-\d.]+)\s+(\d+)\s+(\d+)\s+([-\d.]+)\s+([-\d.]+)',(q/'timing_route.rpt').read_text(),re.S);assert mt
  for k,i in [('WNS_ns',1),('TNS_ns',2),('WHS_ns',5),('THS_ns',6)]:row[k]=float(mt[i])
  row['check_timing']={k:int(v)for k,v in re.findall(r'checking (\w+) \((\d+)\)',(q/'check_timing.rpt').read_text())};row['DRC_errors']=re.findall(r'\|\s*([A-Z0-9-]+)\s*\|\s*(?:Error|Critical Warning)\s*\|',(q/'drc.rpt').read_text());row['pass_registered_clock']=row['WNS_ns']>=0 and row['WHS_ns']>=0 and row['TNS_ns']==row['THS_ns']==0 and not any(row['check_timing'].values())and not row['DRC_errors'];assert row['DSP']==0;rows.append(row);dump(Q/'results/integration/ppa.json',rows);print('DOT_ROUTED',top,flush=True)
 dump(Q/'state/progress.json',dict(phase='ALL_REGISTERED_EXPERIMENTS_COMPLETE',core_models=18,integration_models=9))
if __name__=='__main__':dict(prepare=prepare,simulation=simulation,route=route)[sys.argv[1]]()
