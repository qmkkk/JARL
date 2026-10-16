from common20 import Q,R,load,dump
import hashlib,datetime
a=load(Q/'state/analysis.json');assert a['cells']==30 and a['routed_registered']==18
report=Q/'reports/ROUND20_ANALYSIS_ZH.md'
decision=dict(status='COMPLETE_ANALYZED',round=20,score=84,
 score_components=dict(cross_structure_evidence=27,fairness_and_correctness=24,resource_accuracy_advantage=19,mechanistic_explanation=14),
 decision='CONTINUE_QUALITY_FRONTIER_ON_COMMON_ANALYTICALLY_COMPENSATED_SEEDS',
 report=str(report),report_sha256=hashlib.sha256(report.read_bytes()).hexdigest(),
 strongest_new_result='umul8 B16 routed67->64 LUT and MAE6.25->2.46875, all15ns pass',
 next_round_authorized=True,successful_project_archive=False,
 completed=datetime.datetime.now().astimezone().isoformat(),summary=a)
dump(Q/'state/final_decision.json',decision);dump(Q/'state/round_status.json',decision)
campaign=load(R/'state/campaign.json');campaign.update(active_round=20,status='ROUND20_COMPLETE_PREPARING_ROUND21',latest_report=str(report),last_score=84,next_round_authorized=True);dump(R/'state/campaign.json',campaign)
print('ROUND20_COMPLETE_SCORE84')
