from pathlib import Path
import json, shutil, hashlib, datetime
R=Path(__file__).resolve().parents[1]
P=R.parent/'literature_pilot_20261014'
Q=R/'round1'
for d in ['state','reports','configs','tools','input']:(R/d).mkdir(exist_ok=True)
for d in ['state','reports','configs','src','rtl','graphs','results','logs','build']:(Q/d).mkdir(parents=True,exist_ok=True)
def dump(p,x): p.write_text(json.dumps(x,indent=2,ensure_ascii=False),encoding='utf-8')
dest=R/'input/legacy_code';dest.mkdir(exist_ok=True)
for n in ['netlist_preflight.py','replay_replacements.py','export_pilot.py','edif_graph.py','optimize_tables.py']:
 shutil.copy2(P/'input/Project3_Round10_Preflight_20261014/code'/n,dest/n)
shutil.copy2(R.parent/'round10_work_20261014/tools/route_clocked.tcl',R/'tools/route_clocked.tcl')
shutil.copy2(P/'rtl/ooc_clocked.xdc',Q/'rtl/ooc_clocked.xdc')
old=P/'input/Project3_Round10_Preflight_20261014'
shutil.copy2(old/'results/graphs/r9_trunc4_forbid.json',Q/'graphs/mul12.json')
shutil.copy2(old/'code/trunc4_scan.cpp.pairs.json',Q/'graphs/mul12_inherited_pairs.json')
shutil.copy2(old/'rtl/design_manifest.json',Q/'graphs/inherited_design_manifest.json')
cases=[dict(name='mul12',kind='mul',t=4,bits=12,budget=1965825,source='inherited routed primitive graph; no new source mapping'),dict(name='mul13',kind='mul',t=3,bits=13,budget=917441,source='new registered 16-bit input truncated multiplier'),dict(name='sqrt12',kind='sqrt',t=0,bits=12,budget=1,source='new restoring unsigned integer square root'),dict(name='sqrt16',kind='sqrt',t=0,bits=16,budget=1,source='new restoring unsigned integer square root')]
# Truncation worst error at A=B=65535, with the represented high input fixed.
cases[1]['budget']=65535**2-((65535>>3)<<3)**2
for c in cases[1:]:
 name=c['name'];w=c['bits'];t=c['t']
 if c['kind']=='mul':body=f'wire [{2*w-1}:0] prod=a_q[15:{t}]*b_q[15:{t}];\nalways @(posedge clk) begin a_q<=A; b_q<=B; Y<={{prod,{2*t}\'b0}}; end'
 else:body=f'''function [15:0] isqrt(input [15:0] x);
reg [17:0] remv,trial; reg [15:0] rootv; integer i;
begin remv=0;rootv=0;for(i={w//2-1};i>=0;i=i-1)begin
remv=(remv<<2)|((x>>(2*i))&3);rootv=rootv<<1;trial=(rootv<<1)|1;
if(remv>=trial)begin remv=remv-trial;rootv=rootv+1;end end
isqrt=rootv;end endfunction
always @(posedge clk) begin a_q<=A; b_q<=B; Y<=isqrt(a_q); end'''
 (Q/f'rtl/{name}_source.v').write_text(f'module {name}_source(input wire clk,input wire [15:0] A,B,output reg [31:0] Y);\nreg [15:0] a_q,b_q;\n'+body+'\nendmodule\n')
plan=dict(round=1,registered=datetime.datetime.now().astimezone().isoformat(),question='Does a physical-structure cost on error-feasible completions increase real mapped resource benefit?',cases=cases,methods={'hd':'local-HD function generator with contextual tie-breaking; same menu, NOT complete author QUADOL','minimax':'contextual per-row minimax','support':'proposed budget-feasible common-support completion','physical':'proposed independent-half support and structural-cost completion'},baselines=['hd','minimax'],innovations=['support','physical'],selection='mul12 inherits the 9 minimax pairs; other cases use one fixed maximum matching of structurally eligible pairs, capped at 24 pairs; all methods use identical pair set',context='mul12 inherited exhaustive context; sqrt exhaustive; mul13 deterministic 2^16 samples for proposal only, final full-domain endpoint WCE replay for every admission',physical='one default Artix7 xc7a100tcsg324-1 implementation per unique final design, common 10ns clock, 2ns IO, DSP forbidden, all exporter attributes identical',max_physical_variants=16,score={'innovation':25,'physical_gain':25,'problem_coverage':20,'correctness':20,'cost':10},score_meaning='subjective assessment of evidence produced by this round, not publication odds; score only after all registered cases complete',algorithm_limits={'structural_pairs_new_cases':24,'selection_passes':1,'support_masks':32,'physical_half_support_mask_pairs':1024,'candidate_topology':'one minimax-chosen topology shared by completion variants; HD/minimax use same prescribed topology menu'},stop='finish matrix, analyze, score, register next scientifically justified round; freeze only after credible contribution support')
dump(Q/'configs/plan.json',plan)
dump(R/'state/campaign.json',dict(status='ROUND1_REGISTERED',active_round=1,root=str(Q),authorization='User: autonomous iteration, 100-point score after each round, automatically continue',roadmap=str(R.parent/'research_review/paper_roadmap_20261014/PAPER_ROADMAP_ZH.md'),rounds=[],schedules=False,delegation=False,manuscript=False))
files=list(dest.glob('*.py'))+list((Q/'rtl').glob('*'))+list((Q/'graphs').glob('*'))
dump(Q/'state/registered_inputs.json',{str(p.relative_to(R)):hashlib.sha256(p.read_bytes()).hexdigest() for p in files})
print('registered',[(c['name'],c['budget'])for c in cases])
