"""Prepare the human-authorized cross-structure round; never edit R1--R19."""
from pathlib import Path
import json, shutil, hashlib, datetime
R=Path(__file__).resolve().parents[1]; Q=R/'round20'
assert not Q.exists(), 'Do not overwrite an existing round'
for d in ['configs','tools','inputs','input/quadol_source','rtl','graphs','src','build','logs','results','state','reports']:
 (Q/d).mkdir(parents=True,exist_ok=True)
def dump(p,x): p.write_text(json.dumps(x,ensure_ascii=False,indent=2),encoding='utf-8')
now=datetime.datetime.now().astimezone().isoformat()
families=[
 dict(family='umul8',kind='mul',a_bits=8,b_bits=8,width=8,budgets=[1,4,16,64,256],clock_ns=15),
 dict(family='mac6_add4',kind='mac',a_bits=6,b_bits=10,width=6,add_width=4,budgets=[1,4,16,64,128],clock_ns=15),
 dict(family='dot2_u4',kind='dot',a_bits=8,b_bits=8,width=4,budgets=[1,2,4,8,16],clock_ns=15),
 dict(family='udiv8',kind='div',a_bits=8,b_bits=8,width=8,budgets=[1,2,4,8,16],clock_ns=30),
 dict(family='isqrt16',kind='sqrt',a_bits=16,b_bits=0,width=16,budgets=[1,2,4,8,16],clock_ns=30),
 dict(family='absdiff8',kind='absdiff',a_bits=8,b_bits=8,width=8,budgets=[1,2,4,8,16],clock_ns=15)]
cases=[]
for f in families:
 for bi,b in enumerate(f['budgets']):
  cases.append(dict(f,name=f['family']+'_b'+str(b),budget=b,budget_index=bi,domain_bits=16,seed_budget=0,flow='exact_rtl',cut=0,compensation=0))
plan=dict(round=20,created=now,status='REGISTERED_BEFORE_RESULTS',human_request='评估并开始后续迭代，补实验。直到达到上限为止',
 question='Does the frozen joint numeric-relation construction generalize across six arithmetic operators and five WCE budgets, against the two existing strong controls?',
 hypothesis='Joint pair construction exposes resource/accuracy tradeoffs unavailable to QUADOL or serial support reduction followed by QUADOL.',
 families=families,cases=cases,baselines=['quadol_wce','serial_then_quadol'],candidate='state_window',
 seed='Identical exact Vivado-mapped RTL within each family, shared across all budgets; seed is the starting representation, not a third comparison method. Different starting representation from R19 compensated MAC seeds.',
 algorithm='Unchanged R19 proposal/state/2SAT algorithm: 8 control +16 independent +16 dependent candidates; 8 pinsets; top2 completion; 1024 support masks in two orders; one pass; fixed initial matching.',
 input_domain='All 65536 input tuples per operator, exhaustive arithmetic WCE and MAE; no random-only admission.',
 source_order=[f['family']for f in families],
 physical_selection='All 90 method/budget endpoints synthesized; canonical RTL duplicates evaluated once with explicit provenance. Route middle budget (index2) for all six families and all three methods, irrespective of gains. No second FPGA/signed16/system claim from this round.',
 metrics=['LUT','FF','CARRY4','DSP','WCE','MAE','search time','candidate coverage','routed setup/hold on fixed middle-budget subset'],
 mechanism='Save every accepted pair and cases where both single-root edits violate the same WCE budget, but the joint edit passes. Report the actual count, including zero; never manufacture 20 windows.',
 score_rubric={'cross_structure_evidence':30,'fairness_and_correctness':25,'resource_accuracy_advantage':25,'mechanistic_explanation':20},
 stop_and_next='Complete all 30 cells and analyze once. Use results to choose next signed/scalable verification and real FIR experiments. Stop further mechanism tuning when remaining improvement lacks a concrete causal hypothesis; distinguish evidence ceiling from a global optimality proof.',
 no=['schedules','delegation','manuscript','other projects','historical mutation'])
dump(Q/'configs/plan.json',plan)
# Existing frozen kernels are copied, then only module names/path bindings adapted.
copied=[]
for name in ['common','proposal','configure','state','oracle','quadol','direct']:
 src=R/f'round19/tools/{name}19.py';dst=Q/f'tools/{name}20.py'
 s=src.read_text().replace('19 import','20 import')
 for mod in ['common','proposal','configure','state','oracle','quadol','direct']:
  s=s.replace(mod+'19',mod+'20')
 dst.write_text(s,encoding='utf-8');copied.append(dict(source=str(src),source_sha256=hashlib.sha256(src.read_bytes()).hexdigest(),target=str(dst)))
shutil.copytree(R/'round19/input/quadol_source',Q/'input/quadol_source',dirs_exist_ok=True)
serial=Q/'serial'
for d in ['tools','configs','graphs','state','src','results','logs','build','input/quadol_source']:(serial/d).mkdir(parents=True,exist_ok=True)
for name in ['serial_support.py','quadol_serial.py','oracle_serial.py','direct_serial.py']:
 src=R/'round19/results/serial_claim_check/tools'/name;s=src.read_text().replace('R=Q.parents[2]','R=Q.parents[1]');(serial/'tools'/name).write_text(s)
shutil.copytree(R/'round19/input/quadol_source',serial/'input/quadol_source',dirs_exist_ok=True)
dump(serial/'configs/plan.json',plan)
dump(Q/'state/reused_code_provenance.json',copied)
# Exact independent arithmetic specifications, registered input hashes.
for f in families:
 n=f['family'];k=f['kind'];a=f['a_bits'];b=f['b_bits'];w=f['width']
 decl=f'reg [{a-1}:0] ar;\n'+(f'reg [{b-1}:0] br;\n'if b else'')
 if k=='mul':expr='ar * br';extra=''
 elif k=='mac':expr=f'ar * br[{w-1}:0] + br[{b-1}:{w}]';extra=''
 elif k=='dot':expr="{24'b0,ar[3:0]} * {24'b0,br[3:0]} + {24'b0,ar[7:4]} * {24'b0,br[7:4]}";extra=''
 elif k=='div':expr="br == 0 ? 32'd255 : ar / br";extra=''
 elif k=='absdiff':expr='ar >= br ? ar-br : br-ar';extra=''
 else:
  extra='function [7:0] isqrt; input [15:0] v; integer i; reg [15:0] rr,trial; reg [31:0] square; begin rr=0; for(i=7;i>=0;i=i-1) begin trial=rr | (16\'b1 << i); square=trial*trial; if(square<=v) rr=trial; end isqrt=rr[7:0]; end endfunction\n';expr='isqrt(ar)'
 code=f'module {n}_source(input clk,input [15:0] A,B,output reg [31:0] Y);\n{decl}{extra}wire [31:0] q={expr};\nalways @(posedge clk) begin ar<=A[{a-1}:0];'+(f'br<=B[{b-1}:0];'if b else'')+'Y<=q;end\nendmodule\n'
 (Q/f'rtl/{n}_source.v').write_text(code)
 for c in [c for c in cases if c['family']==n]:
  (Q/f'rtl/{c["name"]}.xdc').write_text(f'create_clock -name clk -period {f["clock_ns"]} [get_ports clk]\nset_input_delay 2 -clock clk [get_ports {{A[*] B[*]}}]\nset_output_delay 2 -clock clk [get_ports {{Y[*]}}]\nset_property HD.CLK_SRC BUFGCTRL_X0Y0 [get_ports clk]\n')
dump(Q/'state/input_hashes.json',{str(p.relative_to(Q)).replace('\\','/'):hashlib.sha256(p.read_bytes()).hexdigest()for p in (Q/'rtl').glob('*')})
dump(Q/'state/round_status.json',dict(status='PREPARING',created=now,complete_cells=0,planned_cells=30,previous_rounds_read_only=True))
old=R/'state/campaign.json';shutil.copy2(old,Q/'inputs/campaign_before_resume.json');s=json.loads(old.read_text());s.update(status='RESUMED_BY_HUMAN',active_round=20,root=str(Q),next_round_authorized=True,latest_progress='round20/state/round_status.json',completion_policy=plan['stop_and_next']);s['resumed_at']=now;s['human_request']=plan['human_request'];dump(old,s)
instruction='LATEST HUMAN RESUME (2026-10-15, evidence/advantage ceiling): User explicitly requested further Project3 iteration and supplementary experiments after evaluating two screenshots. R20 is authorized; read round20/configs/plan.json. Complete each fixed round before comparative analysis, score it, and proceed only with evidence-based material research/evidence work. Preserve R1--R19/frozen sources/ZIP. Prior R19 stop is superseded by this new request. No schedules, delegation, manuscript, other projects or succession. Screenshot checklists do not prove journal readiness. Stop when evidence is sufficient or additional improvement lacks a supported causal route; do not equate this with mathematical global optimality.\n\n'
for p in [R/'AGENTS.md',R.parent/'AGENTS.md']:p.write_text(instruction+p.read_text(encoding='utf-8'),encoding='utf-8')
(Q/'AGENTS.md').write_text('Project3 R20 only. Parent Project10 status does not change scope. Read configs/plan.json. Fixed complete matrix; two baselines, unchanged main algorithm; preserve every outcome. No schedules/delegation/manuscript. Fresh paths only.\n')
print(Q)
