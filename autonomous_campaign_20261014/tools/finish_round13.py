from pathlib import Path
import json,hashlib,datetime
R=Path(__file__).resolve().parents[1];Q=R/'round13'
load=lambda p:json.loads(p.read_text());dump=lambda p,x:p.write_text(json.dumps(x,indent=2,ensure_ascii=False),encoding='utf-8');h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
a=load(Q/'state/analysis.json');assert a['status']=='COMPLETE_AWAIT_SCORE'
assert len(load(Q/'state/pipeline.json'))==8 and all(x['returncode']==0 for x in load(Q/'state/pipeline.json'))
for name,sha in load(Q/'state/input_hashes.json').items():assert h(Q/name)==sha,name
for name,sha in load(Q/'state/execution_source_hashes.json').items():assert h(Path(name))==sha,name
assert sum(x['checks']for x in a['hdl'])==57445
a.update(status='COMPLETE_SCORED',score=76,score_components=dict(innovation=17,physical_gain=12,problem_coverage=18,correctness=20,cost=9),decision='KEEP_ORIGINAL_MAIN_MODEL; NEXT_ROUND_COUNTEREXAMPLE_RELATION_REGENERATION')
dump(Q/'state/analysis.json',a)
p=Q/'reports/ROUND13_REPORT_ZH.md';rec=dict(round=13,status='COMPLETE',score=76,report=str(p),report_sha256=h(p),finished=datetime.datetime.now().astimezone().isoformat());dump(Q/'state/round_status.json',rec)
c=load(R/'state/campaign.json');assert c['active_round']==13 and not any(x['round']==13 for x in c['rounds']);c['rounds'].append(rec);c['status']='ROUND13_COMPLETE_NEXT_ROUND14_SELECTED';dump(R/'state/campaign.json',c)
dump(Q/'state/completion_verification.json',dict(status='PASS',input_hashes='UNCHANGED',execution_source_hashes='UNCHANGED',pipeline_stages=8,report_sha256=h(p)))
print(json.dumps(rec))
