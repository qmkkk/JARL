from pathlib import Path
import json,hashlib,shutil,datetime,random,struct
R=Path(__file__).resolve().parents[1];Q=R/'round22';assert not Q.exists()
for d in ['configs','inputs','input/quadol_source','src','tools','rtl','graphs','state','results','reports','logs','build','formal']: (Q/d).mkdir(parents=True,exist_ok=True)
def dump(p,x):p.write_text(json.dumps(x,indent=2,ensure_ascii=False),encoding='utf-8')
plan=dict(round=22,registered=datetime.datetime.now().astimezone().isoformat(),question='Does the unchanged dual-output relation search transfer to directly implemented published signed16 FABM circuits under exact function-preserving SAT admission?',claim_scope='Optimization relative to the approximate FABM reference function, NOT exact multiplication; sampling is proposal generation only. This is a scalability/transfer experiment, not a new SAT or exact-resynthesis novelty claim.',cases=[dict(name=f'fabm16_f{f}',family=f'fabm16_f{f}',approximate_bit=f,clock_ns=15,budget=0)for f in [12,15,18]],methods=['author','quadol_exact','state_formal'],baseline_definition='Two baselines: pinned published FABM with identical registered interface; pinned QUADOL MinHD=0 implementation candidates with maximum-cardinality matching. QUADOL exact restriction follows the exact-function task; no claim of outperforming all approximate QUADOL fronts.',sample_count=65536,sample_seed=20261015,pool=dict(control=8,independent=16,dependent=16,max_degree=4),search=dict(pinsets=8,retained=8,completed=2,passes=1,disjoint_accepted=True,timeout_seconds_per_sat=10,max_counterexamples_per_window=2),proof='Each proposal: Boolean graph SAT exact equivalence to initial reference. Final endpoints: actual exported primitive RTL combinational equivalence to original author RTL, boundary-register structure checked. Timeout is unproven, no admission.',hardware='All 9 endpoints vendor HDL validated, synthesized, and routed at 15 ns on xc7a100tcsg324-1, DSP forbidden, identical constraints; canonical duplicates reused transparently.',fixed_analysis='Complete all 3 cases before comparisons. Keep all counterexamples, timeouts, no-benefit results. No adaptive parameter/candidate expansion.',score_rubric=dict(transfer=30,physical_gain=30,formal_correctness=25,scaling_cost=15),stopping_rule='One fixed pass and finite refinement only. Positive physical evidence supports transfer; otherwise retain a boundary, proceed to useful system evidence without endlessly optimizing this source.')
dump(Q/'configs/plan.json',plan)
author=R/'literature_sources_20261015/signed_multiplier_author/FABM/16 x 16/sources'
shutil.copytree(author,Q/'inputs/author',dirs_exist_ok=True)
shutil.copy2(R/'literature_sources_20261015/signed_multiplier_author/receipt.json',Q/'inputs/author_receipt.json')
for p in (R/'round21/input/quadol_source').glob('*'):
 if p.is_file():shutil.copy2(p,Q/'input/quadol_source'/p.name)
for name in ['common','proposal','configure','quadol','direct','hardware']:
 text=(R/f'round21/tools/{name}21.py').read_text(encoding='utf-8').replace('common21','common22').replace('R21','R22').replace('r21_','r22_')
 (Q/f'tools/{name}22.py').write_text(text,encoding='utf-8')
common="""from pathlib import Path
import sys
sys.dont_write_bytecode=True
Q=Path(__file__).resolve().parents[1];R=Q.parent
sys.path.insert(0,str(R/'tools'))
import core
core.Q=Q
from core import load,dump,build,COMMON
def base_code(*args):raise RuntimeError('Use sampled_context22, not exhaustive common code')
def reference(*args):raise RuntimeError('Reference is pinned author circuit, not multiplication')
"""
(Q/'tools/common22.py').write_text(common)
for c in plan['cases']:
 n=c['name'];body='\n'.join(p.read_text()for p in sorted((Q/'inputs/author').glob('*.v'))if p.name!='top.v')
 body+=f'\nmodule {n}_source(input wire clk,input wire[15:0] A,B,output reg[31:0] Y);reg[15:0] aq,bq;wire[31:0] prod;Approxi_Multi #(.approximate_bit({c["approximate_bit"]})) u(.a(aq),.b(bq),.product(prod));always @(posedge clk)begin aq<=A;bq<=B;Y<=prod;end endmodule\n'
 (Q/f'rtl/{n}_source.v').write_text(body)
 (Q/f'rtl/{n}.xdc').write_text(f'create_clock -name clk -period {c["clock_ns"]} [get_ports clk]\nset_input_delay -clock clk -max 0 [get_ports {{A[*] B[*]}}]\nset_input_delay -clock clk -min 0 [get_ports {{A[*] B[*]}}]\nset_output_delay -clock clk -max 0 [get_ports {{Y[*]}}]\nset_output_delay -clock clk -min 0 [get_ports {{Y[*]}}]\n')
rng=random.Random(plan['sample_seed']);edge=[0,1,2,3,127,128,255,256,32767,32768,65534,65535];samples=[a|(b<<16)for a in edge for b in edge]
samples += [rng.getrandbits(32)for _ in range(plan['sample_count']-len(samples))]
(Q/'inputs/samples.bin').write_bytes(struct.pack('<'+'I'*len(samples),*samples))
dump(Q/'state/input_hashes.json',{p.relative_to(Q).as_posix():hashlib.sha256(p.read_bytes()).hexdigest()for root in ['inputs','configs','input','rtl']for p in (Q/root).rglob('*')if p.is_file()})
dump(Q/'state/round_status.json',dict(status='REGISTERED',plan_sha256=hashlib.sha256((Q/'configs/plan.json').read_bytes()).hexdigest()))
for p in [R/'AGENTS.md',R.parent/'AGENTS.md']:
 old=p.read_text(encoding='utf-8');p.write_text('LATEST ROUND22 (2026-10-15): R21 complete, score88, positive quality at unchanged physical resources. Execute fixed round22/configs/plan.json direct signed16 transfer and formal admission; finish all9 endpoints before comparison. Preserve historical rounds. No schedules/delegation/manuscript/other projects.\n\n'+old,encoding='utf-8')
state=json.loads((R/'state/campaign.json').read_text());state.update(status='ROUND22_REGISTERED',active_round=22,last_score=88);dump(R/'state/campaign.json',state)
print(Q)
