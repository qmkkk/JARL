from pathlib import Path
import json,datetime,hashlib
R=Path(__file__).resolve().parents[1];Q=R/'round6';assert not Q.exists()
for d in ['configs','state','reports','tools','inputs','graphs','rtl','src','logs','build','results/hardware']:(Q/d).mkdir(parents=True,exist_ok=True)
def dump(p,x):p.write_text(json.dumps(x,indent=2,ensure_ascii=False),encoding='utf-8')
cases=[dict(name='sqrt16_exact',kind='sqrt_exact',domain_bits=16,budget=0,clock_ns=25.0),dict(name='div8_odd',kind='div',domain_bits=16,budget=1,clock_ns=25.0),dict(name='absdiff8_odd',kind='absdiff',domain_bits=16,budget=1,clock_ns=10.0),dict(name='mac8_odd',kind='mac',domain_bits=24,budget=1,clock_ns=10.0)]
plan=dict(round=6,registered=datetime.datetime.now().astimezone().isoformat(),question='Does fixed support-constrained joint relation resynthesis generalize beyond quantized square root?',cases=cases,methods=['seed','abc_exact','relation'],baselines=['seed','abc_exact'],innovations=['relation'],source='Fresh deterministic registered RTL: exact sqrt16; div8 (division by zero =255), absdiff8 and 8x8+8 MAC with output OR1. OR1 changes mathematical integer output by at most1; MAC result fits16 bits.',relation='Same exact-output relation, pin menu, support masks and structural objective as R3; no timing-aware new mechanism.',candidates='Up to8 ordinary pairs with input union5 plus16 strict pairs with both LUT5/6, common<=4, union6..8. Independent roots, exclude known original dual primitive, degree cap4. Rank ordinary by shared inputs then depth/names; strict by summed fanins, shared inputs, union,depth/names. No fill for undersized pools.',search='At most8 shared-five pinsets preserving common inputs first; selector1 or remaining union input; both output roles. Retain8 configurations and complete top2 by1024 independent-half support masks. Same matching and whole-domain one-pass admission as R3.',context='Complete16-bit domains; deterministic2^16 proposal sample for24-bit MAC, then full2^24 final admission. All proposed replacements must preserve seed output exactly.',abc='Same pinned binary and exact LUT-region recipe as R4; preserve non-LUT architecture and verify region CEC.',validation='Fresh seed graph/math full-domain check, all final outputs equivalent to seed, vendor HDL, same clocks/part/IO constraints and DSP forbidden. Compare physical LUTs, not primitive instance counts.',max_physical_variants=12,stop='Finish all four cases and all three methods, analyze and score; no new mechanism or workload substitution mid-round.',score=dict(innovation=25,physical_gain=25,problem_coverage=20,correctness=20,cost=10),scope_limits=['small arithmetic cores, not complete application or board measurements','ABC remains a carry-preserving regional control, not every state-of-the-art mapper','full-domain cost is measured; no scalability claim to arbitrary large inputs'])
dump(Q/'configs/plan.json',plan);hashes={}
for c in cases:
 n=c['name'];top=n+'_source';head=f'module {top}(input wire clk,input wire[15:0] A,B,output reg[31:0] Y);\n'
 if c['kind']=='sqrt_exact':
  body='''reg[15:0] a_q;
function[15:0] isqrt(input[15:0]x);
reg[17:0] remv,trial;reg[15:0] rootv;integer i;
begin remv=0;rootv=0;for(i=7;i>=0;i=i-1)begin
remv=(remv<<2)|((x>>(2*i))&3);rootv=rootv<<1;trial=(rootv<<1)|1;
if(remv>=trial)begin remv=remv-trial;rootv=rootv+1;end
end isqrt=rootv;end endfunction
always @(posedge clk)begin a_q<=A;Y<=isqrt(a_q);end
'''
 elif c['kind']=='div':body="reg[7:0]a_q,b_q;wire[7:0]q=(b_q==0)?8'd255:(a_q/b_q);\nalways @(posedge clk)begin a_q<=A[7:0];b_q<=B[7:0];Y<={24'd0,(q|8'd1)};end\n"
 elif c['kind']=='absdiff':body="reg[7:0]a_q,b_q;wire[7:0]q=(a_q>=b_q)?(a_q-b_q):(b_q-a_q);\nalways @(posedge clk)begin a_q<=A[7:0];b_q<=B[7:0];Y<={24'd0,(q|8'd1)};end\n"
 else:body="reg[7:0]a_q;reg[15:0]b_q;wire[15:0]p=a_q*b_q[7:0];wire[15:0]q=p+{8'd0,b_q[15:8]};\nalways @(posedge clk)begin a_q<=A[7:0];b_q<=B;Y<={16'd0,(q|16'd1)};end\n"
 src=Q/f'rtl/{n}_source.v';src.write_text(head+body+'endmodule\n');hashes[str(src)]=hashlib.sha256(src.read_bytes()).hexdigest();(Q/f'rtl/{n}.xdc').write_text(f"create_clock -period {c['clock_ns']} -name clk [get_ports clk]\nset_input_delay 2.0 -clock clk [get_ports {{A* B*}}]\nset_output_delay 2.0 -clock clk [get_ports Y*]\nset_property HD.CLK_SRC BUFGCTRL_X0Y0 [get_ports clk]\n")
import shutil
src=R/'round4/inputs/abc_executable';shutil.copy2(src,Q/'inputs/abc_executable');hashes[str(src)]=hashlib.sha256(src.read_bytes()).hexdigest();dump(Q/'state/input_hashes.json',hashes);dump(Q/'state/progress.json',dict(phase='REGISTERED',round=6));dump(Q/'state/round_status.json',dict(status='REGISTERED',round=6))
c=json.loads((R/'state/campaign.json').read_text());c.update(status='ROUND6_REGISTERED',active_round=6,root=str(Q),latest_progress='round6/state/progress.json');dump(R/'state/campaign.json',c);print('Round6 registered')
