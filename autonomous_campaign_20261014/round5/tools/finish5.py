from analyze5 import Q,R,load,dump
import datetime,hashlib
a=load(Q/'state/analysis.json');assert a['status']=='COMPLETE_AWAIT_SCORE';a.update(status='COMPLETE_SCORED',score=83,score_components=dict(innovation=17,physical_gain=23,problem_coverage=15,correctness=19,cost=9),decision='CONTINUE_ROUND6_FIXED_METHOD_GENERALIZATION');dump(Q/'state/analysis.json',a)
record=dict(round=5,status='COMPLETE',score=83,report=str(Q/'reports/ROUND5_REPORT_ZH.md'),report_sha256=hashlib.sha256((Q/'reports/ROUND5_REPORT_ZH.md').read_bytes()).hexdigest(),finished=datetime.datetime.now().astimezone().isoformat());dump(Q/'state/round_status.json',record)
c=load(R/'state/campaign.json');assert all(x['round']!=5 for x in c['rounds']);c['rounds'].append(record);c['status']='ROUND5_COMPLETE_PREPARING_ROUND6';dump(R/'state/campaign.json',c);print(record)
