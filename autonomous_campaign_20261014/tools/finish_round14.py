from pathlib import Path
import json,hashlib,datetime
R=Path(__file__).resolve().parents[1];Q=R/'round14'
load=lambda p:json.loads(p.read_text());dump=lambda p,x:p.write_text(json.dumps(x,indent=2,ensure_ascii=False),encoding='utf-8');h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
a=load(Q/'state/analysis.json');assert a['status']=='COMPLETE_AWAIT_SCORE'
pipe=load(Q/'state/pipeline.json');assert len(pipe)==6 and all(x['returncode']==0 for x in pipe)
for name,sha in load(Q/'state/input_hashes.json').items():assert h(Q/name)==sha,name
for name,sha in load(Q/'state/execution_source_hashes.json').items():assert h(Path(name))==sha,name
assert sum(x['checks']for x in a['hdl'])==52744;assert sum(c['full_queries']for c in a['cases'])==60
a.update(status='COMPLETE_SCORED',score=75,score_components=dict(innovation=18,physical_gain=10,problem_coverage=18,correctness=20,cost=9),decision='KEEP_ORIGINAL_MAIN; FINITE_TOLERANCE_VALUE_COMPARISON_NEXT')
dump(Q/'state/analysis.json',a);p=Q/'reports/ROUND14_REPORT_ZH.md';rec=dict(round=14,status='COMPLETE',score=75,report=str(p),report_sha256=h(p),finished=datetime.datetime.now().astimezone().isoformat());dump(Q/'state/round_status.json',rec)
c=load(R/'state/campaign.json');assert c['active_round']==14 and not any(x['round']==14 for x in c['rounds']);c['rounds'].append(rec);c['status']='ROUND14_COMPLETE_NEXT_ROUND15_SELECTED';dump(R/'state/campaign.json',c)
dump(Q/'state/completion_verification.json',dict(status='PASS',input_hashes='UNCHANGED',execution_source_hashes='UNCHANGED',pipeline_stages=6,report_sha256=h(p)));print(json.dumps(rec))
