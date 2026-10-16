from core import R,Q,load,dump
import datetime,hashlib,shutil,json
T=R/'round2';assert not T.exists()
for sub in ['configs','state','src','rtl','graphs','results','logs','build','reports','tools']:(T/sub).mkdir(parents=True,exist_ok=True)
cases=load(Q/'configs/plan.json')['cases']
for c in cases:
 c['clock_ns']=10 if c['kind']=='mul'else 25
 c['seed']='R1 physical-cost final RTL'if c['kind']=='mul'else 'analytic odd-root: 2*isqrt(x>>2)+1, WCE<=1'
 c.pop('source',None)
plan=dict(round=2,registered=datetime.datetime.now().astimezone().isoformat(),question='Can joint output-relation and shared-pin selection create lower-cost implementations beyond strong seeds and sequential single-output changes?',cases=cases,methods=['seed','serial','joint'],baselines=['seed','serial'],innovations=['joint'],seed_evidence='R1 four full-domain sqrt functions exactly equal isqrt(x)|1; preserve multiplier improvements, explicitly start from simple reduced-width odd sqrt',candidates=dict(max_pairs_per_case=24,min_original_LUT_inputs=4,max_original_LUT_inputs=6,union_range=[5,8],shared_inputs_max=4,independent_roots=True,exclude_existing_hlut_pairs=True,per_node_candidate_degree_cap=4,rank='descending shared count, ascending union size, ascending topological depth then names; no result-dependent replacement'),function_search=dict(shared_pins='all 5-subsets of boundary union',selector='constant one for both methods: same two LUT5 capacity',serial='both A-then-B and B-then-A; first change must itself satisfy global WCE, then optimize second; select structural-cost-best legal combination',joint='choose both outputs from their joint allowed relation, then independent-half support 2-SAT on top two structural candidate topologies',half_support_masks=1024,topologies_completed=2,selection='same maximum-weight matching based on structural cost then one full-domain sequential admission pass, skip dependency cycles'),context='full sqrt domains; deterministic 2^16 sampled multiplier points for proposals only; final full-domain network replay plus low-bit endpoint extrema for every admission',max_physical_variants=12,physical='same Artix7 part, DSP forbidden, one default route per unique design, per-case common clock 10ns multiplier /25ns sqrt, 2ns IO, same export attributes',score=load(Q/'configs/plan.json')['score'],score_meaning='subjective evidence/progress assessment, not publication odds',stop='complete fixed matrix, analyze and score; then independently register next round justified by evidence; no direction changes during the round',known_limits=['serial is an explicitly described local relation-aware reference, not a claimed reproduction of the complete ASPDAC2017/QUADOL+ author flow','mathematical quantizer is included as sqrt seed; it is a baseline, not claimed innovation','do not claim general optimality, throughput, application quality, or state-of-the-art superiority from this screen'])
dump(T/'configs/plan.json',plan)
for c in cases:
 n=c['name']
 if c['kind']=='mul':
  source=(Q/f'rtl/r1_{n}_physical.v').read_text().replace(f'module r1_{n}_physical(',f'module r2_{n}_seed(')
 else:
  k=c['bits']-2
  source=f'''module r2_{n}_seed(input wire clk,input wire[15:0]A,B,output reg[31:0]Y);
reg[15:0] a_q;
function[15:0] isqrt(input[15:0]x);
reg[17:0] remv,trial;reg[15:0] rootv;integer i;
begin remv=0;rootv=0;for(i={k//2-1};i>=0;i=i-1)begin
remv=(remv<<2)|((x>>(2*i))&3);rootv=rootv<<1;trial=(rootv<<1)|1;
if(remv>=trial)begin remv=remv-trial;rootv=rootv+1;end
end isqrt=rootv;end endfunction
always @(posedge clk)begin a_q<=A;Y<=(isqrt(a_q[{c['bits']-1}:2])<<1)|1;end
endmodule
'''
 (T/f'rtl/r2_{n}_seed_source.v').write_text(source)
 xdc=(Q/'rtl/ooc_clocked.xdc').read_text().replace('10.000',f'{c["clock_ns"]:.3f}')
 # Avoid relying on a particular decimal spelling in the inherited constraint.
 import re
 xdc=re.sub(r'(-period\s+)\S+',lambda m:m[1]+str(c['clock_ns']),xdc)
 (T/f'rtl/{n}.xdc').write_text(xdc)
hashes={p.relative_to(T).as_posix():hashlib.sha256(p.read_bytes()).hexdigest()for p in T.rglob('*')if p.is_file()};dump(T/'state/registered_inputs.json',hashes)
campaign=load(R/'state/campaign.json');campaign.update(status='ROUND2_REGISTERED',active_round=2,root=str(T),latest_progress='round2/state/progress.json');dump(R/'state/campaign.json',campaign);print('ROUND2 REGISTERED',str(T))
