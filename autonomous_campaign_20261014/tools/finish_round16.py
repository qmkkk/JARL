from pathlib import Path
import json,hashlib,datetime
R=Path(__file__).resolve().parents[1];Q=R/'round16'
load=lambda p:json.loads(p.read_text());dump=lambda p,x:p.write_text(json.dumps(x,indent=2,ensure_ascii=False),encoding='utf-8');h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
a=load(Q/'state/analysis.json');assert a['status']=='COMPLETE_AWAIT_SCORE'
pipe=load(Q/'state/pipeline.json');assert len(pipe)==7 and all(x['returncode']==0 for x in pipe)
for name,sha in load(Q/'state/input_hashes.json').items():assert h(Q/name)==sha,name
for name,sha in load(Q/'state/execution_source_hashes.json').items():assert h(Path(name))==sha,name
assert sum(x['checks']for x in a['hdl'])==39171 and a['independent_scalar_probes']==1216
assert a['new_physical_jobs']==6 and a['inherited_physical_models']==3
a.update(status='COMPLETE_SCORED',score=84,score_components=dict(innovation=18,physical_gain=20,problem_coverage=18,correctness=20,cost=8),decision='ADOPT_STATE_WINDOW_FOR_MAC_CANDIDATE; STRUCTURED_ARITHMETIC_TRANSFER_NEXT')
dump(Q/'state/analysis.json',a);p=Q/'reports/ROUND16_REPORT_ZH.md';rec=dict(round=16,status='COMPLETE',score=84,report=str(p),report_sha256=h(p),finished=datetime.datetime.now().astimezone().isoformat());dump(Q/'state/round_status.json',rec)
c=load(R/'state/campaign.json');assert c['active_round']==16 and not any(x['round']==16 for x in c['rounds']);c['rounds'].append(rec);c['status']='ROUND16_COMPLETE_NEXT_ROUND17_SELECTED';dump(R/'state/campaign.json',c)
dump(Q/'state/completion_verification.json',dict(status='PASS',input_hashes='UNCHANGED',execution_source_hashes='UNCHANGED',pipeline_stages=7,report_sha256=h(p)));print(json.dumps(rec))
