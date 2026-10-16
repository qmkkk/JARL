from pathlib import Path
import json,datetime,hashlib,shutil
R=Path(__file__).resolve().parents[1];Q=R/'round10'
def load(p):return json.loads(p.read_text())
def dump(p,x):p.write_text(json.dumps(x,indent=2,ensure_ascii=False),encoding='utf-8')
assert load(R/'round9/state/round_status.json')['status']=='COMPLETE'
assert not Q.exists()
for d in ['configs','state','reports','tools','inputs','graphs','rtl','src','logs','build','results/hardware']:(Q/d).mkdir(parents=True)
cases=[dict(name='sqrt20_odd',kind='sqrt',width=20,domain_bits=20,budget=1,clock_ns=25.0,starting_method='abc_global'),dict(name='sqrt20_exact',kind='sqrt',width=20,domain_bits=20,budget=0,clock_ns=30.0,starting_method='abc_global'),dict(name='sqrt24_exact',kind='sqrt',width=24,domain_bits=24,budget=0,clock_ns=40.0,starting_method='abc_global'),dict(name='div10_odd',kind='div',width=10,domain_bits=20,budget=1,clock_ns=35.0,starting_method='abc_region'),dict(name='mac9_add6_odd',kind='mac',width=9,add_width=6,domain_bits=24,budget=1,clock_ns=12.5,starting_method='abc_region')]
plan=dict(round=10,registered=datetime.datetime.now().astimezone().isoformat(),question='Do the R9 numerical relation windows retain incremental physical value on larger exact and bounded-error arithmetic cores without enlarging the candidate search budget?',cases=cases,methods=['seed','local_window','numeric_pair','numeric_window'],baselines=['seed','local_window'],innovations=['numeric_pair','numeric_window'],hypotheses={'numeric_pair':'R9 numerical relation independent-pair ablation, unchanged mechanism','numeric_window':'R9 proposed main-model candidate, same pair-plus-dependent-window construction and solver; test transfer without retuning'},candidate_budget='Independent: at most8 union5 control plus16 LUT5/6 union6..8 shared<=4 pairs, degreecap4, same R6/R8 ordering. Dependent: at most16 direct two-root windows, same R9 ordering and degreecap4. No replacement based on results.',search='Same8 shared-five pinsets; selector1 or remaining input; two output roles; retain8, support-complete top2,1024 masks,two traversal orders; same matching and one-pass admission.',context='Deterministic65536 proposal inputs for every new case, stride104729 across64-input blocks. All admissions and final results enumerate the full2^20 or2^24 domain; no sampled correctness claims.',input_layout='All source interfaces remain A[15:0],B[15:0],Y[31:0]. sqrt input is low-width bits of {B,A}; div A[9:0]/B[9:0] with div0=1023; MAC A[8:0]*B[8:0]+B[14:9]. Seed output is exact when budget0, math|1 otherwise.',starting_graph='Fresh Vivado no-DSP source synthesis. Pinned ABC strash;dc2;if-K6;mfs2; whole combinational graph for sqrt, carry-preserving region for div/MAC, fixed by R7 findings before new measurements. ABC CEC required. These are fixed flows, not a claim of optimal mapping.',physical='Fresh implementation of every canonical-distinct model at its fixed clock; samepartxc7a100tcsg324-1,DSP0,2nsIO,4threads; no clock/directive search. Larger-case clocks are prespecified area-oriented clocks, not Fmax claims.',hdl='Independent scalar evaluation/math plus vendor HDL:4096 deterministic random vectors, arithmetic boundary grids,128 uniformly spaced sqrt square boundaries and native worst-case witnesses; two-cycle interface.',max_new_physical_jobs=20,stop='Complete all five cases and all four methods before analysis/score/next selection. No new mechanism, candidate budget or workload substitution within round.',scope='Main-model scale screen, not formal frozen evidence; full QUADOL/SOTA workflow comparison and application/timing robustness remain open. No manuscript or schedules.',score=dict(innovation=25,physical_gain=25,problem_coverage=20,correctness=20,cost=10))
dump(Q/'configs/plan.json',plan);hashes={}
for c in cases:
 n=c['name'];w=c['width'];top=n+'_source';head=f'module {top}(input wire clk,input wire[15:0] A,B,output reg[31:0] Y);\n';odd='|1'if c['budget']else''
 if c['kind']=='sqrt':
  body=f'''reg[{w-1}:0]x_q;
function[{w//2-1}:0] isqrt(input[{w-1}:0]x);
reg[{w+1}:0] remv,trial;reg[{w-1}:0]rootv;integer i;
begin remv=0;rootv=0;for(i={w//2-1};i>=0;i=i-1)begin
remv=(remv<<2)|((x>>(2*i))&3);rootv=rootv<<1;trial=(rootv<<1)|1;
if(remv>=trial)begin remv=remv-trial;rootv=rootv+1;end
end isqrt=rootv;end endfunction
always @(posedge clk)begin x_q<={{B,A}};Y<=isqrt(x_q){odd};end
'''
 elif c['kind']=='div':body=f"reg[{w-1}:0]a_q,b_q;wire[{w-1}:0]q=(b_q==0)?{w}'d{(1<<w)-1}:(a_q/b_q);\nalways @(posedge clk)begin a_q<=A[{w-1}:0];b_q<=B[{w-1}:0];Y<=q{odd};end\n"
 else:body=f"reg[{w-1}:0]a_q;reg[{w+c['add_width']-1}:0]b_q;wire[{2*w-1}:0]p=a_q*b_q[{w-1}:0];wire[{2*w-1}:0]q=p+b_q[{w+c['add_width']-1}:{w}];\nalways @(posedge clk)begin a_q<=A[{w-1}:0];b_q<=B[{w+c['add_width']-1}:0];Y<=q{odd};end\n"
 src=Q/f'rtl/{top}.v';src.write_text(head+body+'endmodule\n');hashes[str(src)]=hashlib.sha256(src.read_bytes()).hexdigest()
 (Q/f'rtl/{n}.xdc').write_text(f"create_clock -period {c['clock_ns']} -name clk [get_ports clk]\nset_input_delay 2.0 -clock clk [get_ports {{A* B*}}]\nset_output_delay 2.0 -clock clk [get_ports Y*]\nset_property HD.CLK_SRC BUFGCTRL_X0Y0 [get_ports clk]\n")
src=R/'round7/inputs/abc_executable';shutil.copy2(src,Q/'inputs/abc_executable');hashes[str(src)]=hashlib.sha256(src.read_bytes()).hexdigest()
dump(Q/'state/input_hashes.json',hashes);dump(Q/'state/physical_reuse_catalog.json',[]);dump(Q/'state/engineering_repairs.json',[]);dump(Q/'state/progress.json',dict(phase='REGISTERED',round=10));dump(Q/'state/round_status.json',dict(status='REGISTERED',round=10))
c=load(R/'state/campaign.json');c.update(status='ROUND10_REGISTERED',active_round=10,root=str(Q),latest_progress='round10/state/progress.json');dump(R/'state/campaign.json',c);print('Round10 registered: five larger cases, unchanged method,20 models maximum')
