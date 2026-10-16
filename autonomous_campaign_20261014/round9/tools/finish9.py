from model9 import Q,R,load,dump
import datetime,hashlib
a=load(Q/'state/analysis.json');assert a['status']=='COMPLETE_AWAIT_SCORE'
a.update(status='COMPLETE_SCORED',score=84,score_components=dict(innovation=19,physical_gain=19,problem_coverage=18,correctness=19,cost=9),decision='CONTINUE_ROUND10_FIXED_SCALE_VALIDATION');dump(Q/'state/analysis.json',a)
record=dict(round=9,status='COMPLETE',score=84,report=str(Q/'reports/ROUND9_REPORT_ZH.md'),report_sha256=hashlib.sha256((Q/'reports/ROUND9_REPORT_ZH.md').read_bytes()).hexdigest(),finished=datetime.datetime.now().astimezone().isoformat());dump(Q/'state/round_status.json',record)
c=load(R/'state/campaign.json');assert all(x['round']!=9 for x in c['rounds']);c['rounds'].append(record);c['status']='ROUND9_COMPLETE_PREPARING_ROUND10';dump(R/'state/campaign.json',c);print(record)
