from model10 import Q,R,load,dump
import datetime,hashlib
a=load(Q/'state/analysis.json');assert a['status']=='COMPLETE_AWAIT_SCORE'
assert len(a['rows'])==20 and all(x['pass_registered_clock'] for x in a['rows'])
a.update(status='COMPLETE_SCORED',score=87,score_components=dict(innovation=19,physical_gain=22,problem_coverage=19,correctness=19,cost=8),decision='CONTINUE_ROUND11_NEAREST_WORK_FLOW_COMPARISON');dump(Q/'state/analysis.json',a)
record=dict(round=10,status='COMPLETE',score=87,report=str(Q/'reports/ROUND10_REPORT_ZH.md'),report_sha256=hashlib.sha256((Q/'reports/ROUND10_REPORT_ZH.md').read_bytes()).hexdigest(),finished=datetime.datetime.now().astimezone().isoformat());dump(Q/'state/round_status.json',record)
c=load(R/'state/campaign.json');assert all(x['round']!=10 for x in c['rounds']);c['rounds'].append(record);c['status']='ROUND10_COMPLETE_PREPARING_ROUND11';dump(R/'state/campaign.json',c);print(record)
