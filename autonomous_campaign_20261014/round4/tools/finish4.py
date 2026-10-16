from model4 import Q,R,load,dump
import datetime,hashlib
a=load(Q/'state/analysis.json');assert a['status']=='COMPLETE_AWAIT_SCORE';a.update(status='COMPLETE_SCORED',score=82,score_components=dict(innovation=17,physical_gain=22,problem_coverage=15,correctness=19,cost=9),decision='CONTINUE_ROUND5_COMMON_TIGHT_CLOCK_VALIDATION');dump(Q/'state/analysis.json',a)
record=dict(round=4,status='COMPLETE',score=82,report=str(Q/'reports/ROUND4_REPORT_ZH.md'),report_sha256=hashlib.sha256((Q/'reports/ROUND4_REPORT_ZH.md').read_bytes()).hexdigest(),finished=datetime.datetime.now().astimezone().isoformat());dump(Q/'state/round_status.json',record)
c=load(R/'state/campaign.json');assert all(x['round']!=4 for x in c['rounds']);c['rounds'].append(record);c['status']='ROUND4_COMPLETE_PREPARING_ROUND5';dump(R/'state/campaign.json',c);print(record)
