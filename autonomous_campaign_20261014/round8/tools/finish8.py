from model8 import Q,R,load,dump
import datetime,hashlib
a=load(Q/'state/analysis.json');assert a['status']=='COMPLETE_AWAIT_SCORE'
a.update(status='COMPLETE_SCORED',score=78,score_components=dict(innovation=17,physical_gain=15,problem_coverage=18,correctness=19,cost=9),decision='CONTINUE_ROUND9_NUMERIC_RELATION_WINDOWS');dump(Q/'state/analysis.json',a)
record=dict(round=8,status='COMPLETE',score=78,report=str(Q/'reports/ROUND8_REPORT_ZH.md'),report_sha256=hashlib.sha256((Q/'reports/ROUND8_REPORT_ZH.md').read_bytes()).hexdigest(),finished=datetime.datetime.now().astimezone().isoformat());dump(Q/'state/round_status.json',record)
c=load(R/'state/campaign.json');assert all(x['round']!=8 for x in c['rounds']);c['rounds'].append(record);c['status']='ROUND8_COMPLETE_PREPARING_ROUND9';dump(R/'state/campaign.json',c);print(record)
