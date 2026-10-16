from model11 import Q,R,load,dump
import hashlib,datetime
a=load(Q/'state/analysis.json');assert a['status']=='COMPLETE_AWAIT_SCORE';assert len(a['rows'])==18 and all(r['pass_registered_clock']for r in a['rows'])
inp=load(Q/'state/input_hashes.json');assert all(hashlib.sha256((Q/k).read_bytes()).hexdigest()==v for k,v in inp.items())
repairs=load(Q/'state/engineering_repairs.json');repairs[-1]['status']='DIRECT_HDL_AND_PHYSICAL_PASSED';dump(Q/'state/engineering_repairs.json',repairs)
a.update(status='COMPLETE_SCORED',engineering_repairs=repairs,score=88,score_components=dict(innovation=20,physical_gain=22,problem_coverage=18,correctness=20,cost=8),decision='CONTINUE_ROUND12_MAPPING_START_ROBUSTNESS');dump(Q/'state/analysis.json',a)
record=dict(round=11,status='COMPLETE',score=88,report=str(Q/'reports/ROUND11_REPORT_ZH.md'),report_sha256=hashlib.sha256((Q/'reports/ROUND11_REPORT_ZH.md').read_bytes()).hexdigest(),finished=datetime.datetime.now().astimezone().isoformat());dump(Q/'state/round_status.json',record)
c=load(R/'state/campaign.json');assert all(x['round']!=11 for x in c['rounds']);c['rounds'].append(record);c['status']='ROUND11_COMPLETE_PREPARING_ROUND12';dump(R/'state/campaign.json',c);print(record)
