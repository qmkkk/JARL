from pathlib import Path
import json,shutil,hashlib,datetime
R=Path(__file__).resolve().parents[1];Q=R/'round21';assert not Q.exists()
def load(p):return json.loads(p.read_text(encoding='utf-8'))
def dump(p,x):p.write_text(json.dumps(x,ensure_ascii=False,indent=2),encoding='utf-8')
assert load(R/'round20/state/final_decision.json')['status']=='COMPLETE_ANALYZED'
for sub in ['configs','tools','inputs','input/quadol_source','rtl','graphs','src','build','logs','results','state','reports','serial/tools','serial/configs','serial/graphs','serial/state','serial/src','serial/results','serial/logs','serial/build','serial/input/quadol_source']:(Q/sub).mkdir(parents=True,exist_ok=True)
cases=[];provenance=[]
for old in load(R/'round19/configs/plan.json')['cases']:
 c=dict(old);n=old['name']+'_mse';S=c['removed_max'];C=max(S-c['budget'],min(c['budget'],(S+2)//4));w=c['width']
 c.update(name=n,family=n,a_bits=w,b_bits=w+c['add_width'],budget_index=0,compensation=C,seed_budget=max(C,S-C),original_compensation=old['compensation'])
 cases.append(c);src=R/f'round17/rtl/{old["name"]}_source.v';text=src.read_text();needle=f"{2*w}'d{old['compensation']}";assert text.count(needle)==1
 text=text.replace(old['name']+'_source',n+'_source').replace(needle,f"{2*w}'d{C}");dst=Q/f'rtl/{n}_source.v';dst.write_text(text)
 provenance.append(dict(source=str(src),sha256=hashlib.sha256(src.read_bytes()).hexdigest(),target=str(dst),only_semantic_change=f'compensation {old["compensation"]}->{C}'))
 (Q/f'rtl/{n}.xdc').write_text(f'create_clock -name clk -period {c["clock_ns"]} [get_ports clk]\nset_input_delay 2 -clock clk [get_ports {{A[*] B[*]}}]\nset_output_delay 2 -clock clk [get_ports {{Y[*]}}]\nset_property HD.CLK_SRC BUFGCTRL_X0Y0 [get_ports clk]\n')
plan=dict(round=21,registered=datetime.datetime.now().astimezone().isoformat(),status='FIXED_BEFORE_EXPERIMENTS',
 question='Does joint numerical construction retain an advantage after cheap analytical bias correction, and can fixed-support global-MSE function completion improve its quality without losing physical savings?',
 cases=cases,families=cases,baselines=['quadol_wce','serial_then_quadol'],candidate='quality_window',own_method_ablation='state_window',
 compensation='Same retained partial-product rows and balanced sum asR17; choose integerC nearestS/4 within[S-B,B]. Known optimization, not novelty. Independent uniform operand bits implyE[omittedPP]=S/4;addend cancels exactly.',
 seed_status='Starting representation shared by every method, not an additional baseline; all exact mathematicalreferences unchanged.',
 method='UnchangedR19/R20 proposal and state_window search. One additional pass through its accepted windows, sameorder, samehalf-table supports and physicalselector. Full-domain SSE for everyforcedpair choice; forbiddenWCE choices have penalty larger than any feasible total. Aggregate binaryenergy; consistent polarity flips permit known exactmincut. Nonorientablecases keepincumbent. No newwindows/topologies/masks/restarts.',
 acceptance='Must satisfy unchanged WCE, strictlyreduce whole-domainSSE, and not increase structuralproxy tuple. Independentlyrecheck finalcircuit WCE/SSE after eachacceptedchange. Physicalgain remains empirical, notguaranteed bysupport.',
 correctness='All2^24inputtuples percase. SSE accumulatedin128bitintegers. Independent scalarforcedroot spotchecks; vendorHDL for all12endpoints. ExactSAE/SSE integers for analysis, no roundedMAE dominance.',
 physical='All3cases x4methods=12 logical endpoints synthesized and routed onArtix7 DSP0 at10/12.5/15ns. Canonicalduplicates reused onlywithsamecase/clock. Preserve failedtiming.',
 stop='Completeall3cases/all12endpoints beforecomparison andscore. Ifqualitycompletion givesnoextraquality/PPAadvantage, close thiscandidate withoutaddingfallbackmechanisms. Then choose highest-value system/scale evidence from fullresults.',
 scope='No claim that mincut, compensation, squared-error objectives or pairwiseenergies are new. Candidatecontribution is hardware-constrained numerical functioncompletion and demonstratedincrement. No change toR20/historicalresults.',
 score_rubric=dict(quality_advantage=30,physical_advantage=25,causal_fairness=25,correctness=20),
 no=['schedules','delegation','manuscript','otherprojects','intermediateoutcomeselection'])
dump(Q/'configs/plan.json',plan);dump(Q/'serial/configs/plan.json',plan);dump(Q/'inputs/starting_source_provenance.json',provenance)
for name in ['proposal','configure','state','oracle','quadol','direct']:
 text=(R/f'round20/tools/{name}20.py').read_text()
 for mod in ['common','proposal','configure','state','oracle','quadol','direct']:text=text.replace(mod+'20',mod+'21')
 (Q/f'tools/{name}21.py').write_text(text)
common=(R/'round19/tools/common19.py').read_text();(Q/'tools/common21.py').write_text(common)
common_serial=common.replace('R=Q.parent','R=Q.parents[1]');(Q/'serial/tools/common_serial.py').write_text(common_serial)
for name in ['serial_support.py','quadol_serial.py','oracle_serial.py','direct_serial.py']:shutil.copy2(R/'round20/serial/tools'/name,Q/'serial/tools'/name)
for sub in ['input/quadol_source','serial/input/quadol_source']:shutil.copytree(R/'round19/input/quadol_source',Q/sub,dirs_exist_ok=True)
for name in ['map','worker']:
 text=(R/f'round20/tools/{name}20.py').read_text()
 for mod in ['common','proposal','configure','state','oracle','quadol','direct']:text=text.replace(mod+'20',mod+'21')
 if name=='worker':text=text.replace("assert rec['WCE']==0,rec","assert rec['WCE']==c['seed_budget'],rec")
 (Q/f'tools/{name}21.py').write_text(text)
# Restore main metric precision prospectively; oldround outputs remain immutable.
p=Q/'tools/oracle21.py';text=p.read_text().replace("s.append(core.emit_ops(ops,co,'candidate'))","s.append('#include <iomanip>');s.append(core.emit_ops(ops,co,'candidate'))").replace('std::cout<<"inputs,WCE','std::cout<<std::setprecision(17)<<"inputs,WCE');p.write_text(text)
dump(Q/'state/input_hashes.json',{p.relative_to(Q).as_posix():hashlib.sha256(p.read_bytes()).hexdigest()for p in(Q/'rtl').glob('*')})
dump(Q/'state/round_status.json',dict(status='PREPARING_IMPLEMENTATION',round=21,planned_cases=3,planned_endpoints=12,plan_sha256=hashlib.sha256((Q/'configs/plan.json').read_bytes()).hexdigest()))
(Q/'AGENTS.md').write_text('Project3 R21. Complete configs/plan.json unchanged before analysis. At mosttwo baselines. All methods share analyticallycompensated seeds. PreserveR1-R20. No schedules/delegation/manuscript.\n')
campaign=load(R/'state/campaign.json');campaign.update(active_round=21,status='ROUND21_PREPARING',root=str(Q),latest_progress=str(Q/'state/round_status.json'));dump(R/'state/campaign.json',campaign)
instruction='LATEST ROUND21 (2026-10-15): R20 complete and analyzed, score84, reportround20/reports/ROUND20_ANALYSIS_ZH.md. Current authorizedworkround21/configs/plan.json: commonanalyticalMSEcompensation andfixedsupportqualitycompletion, all3cases/all12endpoints beforeanalysis. PreserveR1-R20. No schedules/delegation/manuscript/otherprojects.\n\n'
for p in [R/'AGENTS.md',R.parent/'AGENTS.md']:p.write_text(instruction+p.read_text(encoding='utf-8'),encoding='utf-8')
print(Q)
