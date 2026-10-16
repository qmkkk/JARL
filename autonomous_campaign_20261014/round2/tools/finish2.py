from core2 import Q,R,load,dump
import datetime,hashlib
a=load(Q/'state/analysis.json');a.update(status='COMPLETE_SCORED',score=82,score_components=dict(innovation=18,physical_gain=22,problem_coverage=15,correctness=18,cost=9),function_difference=load(Q/'state/function_difference.json'),decision='CONTINUE_ROUND3_EXACT_VS_BUDGET_RELATION_AND_STRICT_PAIR_POOL');dump(Q/'state/analysis.json',a)
record=dict(round=2,status='COMPLETE',score=82,report=str(Q/'reports/ROUND2_REPORT_ZH.md'),report_sha256=hashlib.sha256((Q/'reports/ROUND2_REPORT_ZH.md').read_bytes()).hexdigest(),finished=datetime.datetime.now().astimezone().isoformat());dump(Q/'state/round_status.json',record)
c=load(R/'state/campaign.json');c['rounds'].append(record);c['status']='ROUND2_COMPLETE_PREPARING_ROUND3';dump(R/'state/campaign.json',c);print(record)
