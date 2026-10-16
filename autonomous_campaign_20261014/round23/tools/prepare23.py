from pathlib import Path
import sys,json,hashlib,random,re
import numpy as np
from scipy.signal import firwin,chirp
sys.dont_write_bytecode=True
Q=Path(__file__).resolve().parents[1];R=Q.parent;OLD=R/'round21'
sys.path.insert(0,str(OLD/'tools'))
from common21 import core,base_code,build,load,dump
sys.path.insert(0,str(R/'tools'))
from fir_system_harness import fir_rtl
core.Q=Q
plan=load(Q/'configs/plan.json')
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def savehex(p,values,bits):p.write_text(''.join(f'{int(v)&((1<<bits)-1):0{(bits+3)//4}x}\n' for v in values))
def sign_wrapper(top,base,w):
 return f'''module {top}(input wire clk,input wire [15:0] A,B,output reg [31:0] Y);
wire [15:0] ma=A[15]?-A:A,mb=B[15]?-B:B;
wire [31:0] p;
{base} u(.clk(clk),.A({{{16-w}'b0,ma[{w-1}:0]}}),.B({{{16-w}'b0,mb[{w-1}:0]}}),.Y(p));
reg s1,s2;
always @(posedge clk)begin s1<=A[15]^B[15];s2<=s1;Y<=s2?-$signed(p):$signed(p);end
endmodule
'''
def tbtext(top,w,gold):
 coeff=(Q/f'inputs/w{w}_coeff.hex').as_posix();samples=(Q/f'inputs/w{w}_samples.hex').as_posix()
 return f'''`timescale 1ns/1ps
module tb;
reg clk=0;always #7.5 clk=~clk;
reg reset=1,coeff_we=0,sample_valid=0;
reg [3:0] coeff_addr=0;
reg signed [{w-1}:0] coeff_data=0,sample_data=0;
wire sample_ready,result_valid;wire signed [39:0] result;
{top} dut(.*);
reg [{w-1}:0] coeffs[0:95];reg [{w-1}:0] samples[0:6143];reg [39:0] gold[0:6143];
integer block_no,i,j,n,checks=0;
initial begin
$readmemh("{coeff}",coeffs);$readmemh("{samples}",samples);$readmemh("{gold.as_posix()}",gold);
#500;
for(block_no=0;block_no<6;block_no=block_no+1)begin
@(negedge clk);reset=1;coeff_we=0;sample_valid=0;
repeat(4)@(posedge clk);
@(negedge clk);reset=0;
for(j=0;j<16;j=j+1)begin coeff_we=1;coeff_addr=j;coeff_data=coeffs[block_no*16+j];@(negedge clk);end
coeff_we=0;#1;
for(i=0;i<1024;i=i+1)begin
if(!sample_ready)$fatal(1,"not ready");
sample_valid=1;sample_data=samples[block_no*1024+i];
@(posedge clk);#1;
@(negedge clk);sample_valid=0;
repeat(19)@(posedge clk);#1;
n=block_no*1024+i;
if(!result_valid || !sample_ready || result!==gold[n])$fatal(1,"mismatch n=%0d got=%0d expected=%0d valid=%0b",n,$signed(result),$signed(gold[n]),result_valid);
checks=checks+1;
@(negedge clk);
end
end
$display("R23_FIR_PASS checks=%0d latency=19 II=20",checks);$finish;
end
initial begin #3000000;$fatal(1,"timeout");end
endmodule
'''

def main():
 # Register all signal construction before evaluating any method.
 definition=dict(rounding='numpy.rint ties-to-even, no DC correction',coefficient_scale='2^(width-1)-1',signal_clip='[-1,1], quantized with same scale',multitone='0.55*sin(2*pi*.035*n)+.25*sin(2*pi*.17*n)+.15*sin(2*pi*.33*n)',chirp='0.85*scipy.signal.chirp(n,f0=.01,f1=.45,t1=1023,method=linear)',noise='default_rng(20261015).normal(0,.22,1024); +.25 from512; +.6 at128; -.6 at768; clip[-1,1]',filter='scipy.signal.firwin(16, cutoff, window=hamming), default fs=2, scale=True',signed_zero='No added zero bypass or correction: sign-magnitude of unchanged frozen unsigned circuit, including zero-operand offsets.')
 dp=Q/'configs/stimulus_definition.json'
 if dp.exists():assert load(dp)==definition
 else:dump(dp,definition)
 n=np.arange(1024);rng=np.random.default_rng(20261015)
 noise=rng.normal(0,.22,1024);noise[512:]+=.25;noise[128]+=.6;noise[768]-=.6
 signals=[.55*np.sin(2*np.pi*.035*n)+.25*np.sin(2*np.pi*.17*n)+.15*np.sin(2*np.pi*.33*n),.85*chirp(n,f0=.01,f1=.45,t1=1023),np.clip(noise,-1,1)]
 filters=[firwin(16,.2,window='hamming'),firwin(16,[.18,.38],window='hamming',pass_zero=False)]
 inputs={};input_manifest=[]
 for c in plan['cases']:
  w=c['width'];scale=(1<<(w-1))-1
  coeff=np.asarray([np.rint(f*scale) for f in filters],dtype=np.int64);ss=np.asarray([np.rint(np.clip(s,-1,1)*scale)for s in signals],dtype=np.int64)
  coeff6=np.repeat(coeff,3,axis=0);samples6=np.tile(ss,(2,1))
  cp=Q/f'inputs/w{w}_coeff.hex';sp=Q/f'inputs/w{w}_samples.hex'
  savehex(cp,coeff6.ravel(),w);savehex(sp,samples6.ravel(),w)
  inputs[w]=(coeff6,samples6)
  input_manifest.extend(dict(path=str(p),sha256=sha(p))for p in [cp,sp])
 dump(Q/'inputs/stimulus_manifest.json',input_manifest)
 source_manifest=load(OLD/'rtl/design_manifest.json');cases=load(OLD/'configs/plan.json')['cases'];entries=[];metrics=[];verification=[]
 for c23 in plan['cases']:
  w=c23['width'];c=next(c for c in cases if c['width']==w);name=c['name'];seed=load(OLD/f'graphs/{name}_seed.json')
  original,co,ins,nn,_=build(seed);pairs=load(OLD/f'graphs/{name}_pairs.json');records={r['pair']:r for r in load(OLD/f'results/{name}_methods.json')}
  coeff6,samples6=inputs[w]
  for method in plan['methods']:
   top=f'r23_fir{w}_{method}';base=f'r21_{name}_{method}';source=OLD/f'rtl/{base}.v';oldentry=next(e for e in source_manifest if e['top']==base);assert sha(source)==oldentry['sha256']
   if method in ['state_window','quality_window']:
    g=seed;ops=original
    for pi,m in load(OLD/f'state/{name}_{method}_state.json')['accepted']:ops=core.replace_ops(ops,pairs[pi],records[pi]['methods'][m])
    ops=core.reorder(ops,set(co)|set(ins));mm=(g,ops,co,ins,nn)
   else:
    rr=OLD/'serial'if method=='serial_then_quadol'else OLD;g=load(rr/f'graphs/{name}_quadol_wce.json');mm=(g,*build(g)[:4]);ops=mm[1]
   tablepath=Q/f'results/{top}_unsigned.u32'
   if not tablepath.exists():
    code,*_=base_code(c,g);code+=[core.emit_ops(ops,mm[2],'evaluate'),f'int main(int argc,char**argv){{U v[NN];uint32_t y[64];std::ofstream out(argv[1],std::ios::binary);for(U x=0;x<(U(1)<<{2*w});x+=64){{inputs(v,x);evaluate(v);unpack(v,y);out.write(reinterpret_cast<char*>(y),sizeof(y));}}return !out.good();}}']
    src=Q/f'src/{top}_table.cpp';src.write_text('\n'.join(code));core.native(src,[core.linux(tablepath)],Q/f'logs/{top}_table.log')
   table=np.fromfile(tablepath,dtype='<u4').reshape(1<<w,1<<w).astype(np.int64)
   vrng=random.Random(20261015+w);points={(0,0),(0,(1<<w)-1),((1<<w)-1,0),((1<<w)-1,(1<<w)-1),(1<<(w-1),1<<(w-1))};points.update((vrng.randrange(1<<w),vrng.randrange(1<<w))for _ in range(256))
   for a,b in points:assert int(table[b,a])==core.scalar(*mm,a,b),(top,a,b)
   a=np.arange(1<<w,dtype=np.int64);delta=table-a[:,None]*a[None,:];assert np.max(np.abs(delta))<=c['budget']
   verification.append(dict(top=top,unsigned_inputs=table.size,scalar_checks=len(points),slice_WCE=int(np.abs(delta).max()),sha256=sha(tablepath)))
   outputs=[]
   for block,(cc,ss) in enumerate(zip(coeff6,samples6)):
    exact=np.convolve(ss,cc)[:1024];out=np.zeros(1024,dtype=np.int64)
    for tap in range(16):
     delayed=np.r_[np.zeros(tap,dtype=np.int64),ss[:1024-tap]];sign=np.where((delayed<0)^(cc[tap]<0),-1,1);out+=sign*table[abs(cc[tap]),np.abs(delayed)]
    err=out-exact;assert np.abs(err).max()<=16*c['budget'];assert np.abs(out).max()<(1<<39)
    outputs.extend(out.tolist());sse=int(err@err);energy=int(exact@exact)
    metrics.append(dict(width=w,method=method,block=block,filter=plan['system']['filters'][block//3],signal=plan['system']['signals'][block%3],samples=1024,MAE=float(np.abs(err).mean()),RMSE=float(np.sqrt(sse/1024)),bias=float(err.mean()),max_error=int(np.abs(err).max()),SSE=sse,reference_energy=energy,SNR_dB=float(10*np.log10(energy/sse))if sse else None))
   gold=Q/f'inputs/{top}_gold.hex';savehex(gold,outputs,40)
   wrapper=sign_wrapper(top+'_signed',base,w)
   fir=fir_rtl(top,top+'_signed',16,3).replace('signed [15:0] coeff_data',f'signed [{w-1}:0] coeff_data').replace('signed [15:0] sample_data',f'signed [{w-1}:0] sample_data').replace('reg signed [15:0] history',f'reg signed [{w-1}:0] history').replace('reg signed [15:0] coeff',f'reg signed [{w-1}:0] coeff')
   # Explicit signed extension: conditional concatenation avoids unsigned ?: rules.
   fir=fir.replace("issue?history[index[3:0]]:16'b0",f"issue?{{{{{16-w}{{history[index[3:0]][{w-1}]}}}},history[index[3:0]]}}:16'b0").replace("issue?coeff[index[3:0]]:16'b0",f"issue?{{{{{16-w}{{coeff[index[3:0]][{w-1}]}}}},coeff[index[3:0]]}}:16'b0")
   rtl=Q/f'rtl/{top}.v';rtl.write_text(source.read_text()+'\n'+wrapper+fir)
   tb=Q/f'rtl/{top}_tb.sv';tb.write_text(tbtext(top,w,gold))
   entries.append(dict(top=top,width=w,method=method,source=str(source),source_sha256=sha(source),rtl=str(rtl),rtl_sha256=sha(rtl),tb=str(tb),tb_sha256=sha(tb),gold=str(gold),gold_sha256=sha(gold),clock_ns=15,samples=6144))
   print('PREPARED',top,flush=True)
 dump(Q/'rtl/design_manifest.json',entries);dump(Q/'results/system_quality.json',metrics);dump(Q/'state/table_verification.json',verification)
 (Q/'rtl/system.xdc').write_text('create_clock -name clk -period 15 [get_ports clk]\nset_input_delay 2 -clock clk [get_ports {reset coeff_we coeff_addr[*] coeff_data[*] sample_valid sample_data[*]}]\nset_output_delay 2 -clock clk [get_ports {sample_ready result_valid result[*]}]\nset_property HD.CLK_SRC BUFGCTRL_X0Y0 [get_ports clk]\n')
 dump(Q/'state/prepared.json',dict(status='PREPARED',designs=len(entries),physical_endpoints=24,quality_rows=len(metrics),independent_signed_oracle=True,latency='19 and II20 asserted by HDL testbench, not yet passed'))
 print('PREPARE_ALL_COMPLETE',flush=True)
if __name__=='__main__':main()
