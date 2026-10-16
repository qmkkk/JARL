from pathlib import Path
import json,hashlib,datetime
R=Path(__file__).resolve().parents[1];Q=R/'round15'
load=lambda p:json.loads(p.read_text());dump=lambda p,x:p.write_text(json.dumps(x,indent=2,ensure_ascii=False),encoding='utf-8');h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
a=load(Q/'state/analysis.json');assert a['status']=='COMPLETE_AWAIT_SCORE'
pipe=load(Q/'state/pipeline.json');assert len(pipe)==10 and all(x['returncode']==0 for x in pipe)
for name,sha in load(Q/'state/input_hashes.json').items():assert h(Q/name)==sha,name
for name,sha in load(Q/'state/execution_source_hashes.json').items():assert h(Path(name))==sha,name
assert sum(x['checks']for x in a['hdl'])==39177
assert sum(c['queries']for c in a['quadol_search'].values())==233
assert sum(c['full_inputs']for c in a['quadol_search'].values())==3059744768
a.update(status='COMPLETE_SCORED',score=80,score_components=dict(innovation=17,physical_gain=16,problem_coverage=18,correctness=20,cost=9),decision='STATE_CONDITIONED_RELATION_REGENERATION_NEXT; RETAIN_STATIC_MAC_POSITIVE')
dump(Q/'state/analysis.json',a);p=Q/'reports/ROUND15_REPORT_ZH.md';rec=dict(round=15,status='COMPLETE',score=80,report=str(p),report_sha256=h(p),finished=datetime.datetime.now().astimezone().isoformat());dump(Q/'state/round_status.json',rec)
c=load(R/'state/campaign.json');assert c['active_round']==15 and not any(x['round']==15 for x in c['rounds']);c['rounds'].append(rec);c['status']='ROUND15_COMPLETE_NEXT_ROUND16_SELECTED';dump(R/'state/campaign.json',c)
dump(Q/'state/completion_verification.json',dict(status='PASS',input_hashes='UNCHANGED',execution_source_hashes='UNCHANGED',pipeline_stages=10,report_sha256=h(p)));print(json.dumps(rec))
