from pathlib import Path
import json, hashlib
from datetime import datetime

Q=Path(__file__).resolve().parents[1]
R=Q.parent
def load(p): return json.loads(p.read_text(encoding='utf-8-sig'))
def sha(p): return hashlib.sha256(p.read_bytes()).hexdigest()
def dump(p,x): p.write_text(json.dumps(x,ensure_ascii=False,indent=2),encoding='utf-8')
c=load(R/'state/campaign.json')
for n in (20,21,22):
    s=load(R/f'round{n}/state/round_status.json')
    p=Path(s['report'])
    rec=dict(round=n,status='COMPLETE_ANALYZED',score=s['score'],report=str(p),report_sha256=sha(p))
    if 'completed' in s: rec['finished']=s['completed']
    c['rounds']=[x for x in c['rounds'] if x['round']!=n]+[rec]
c.update(status='ROUND23_EXECUTING_FIXED_FINAL_MATRIX',authorization='Finite R23 execution, analysis and binary TVLSI submission-competitiveness verdict; then stop.',active_round=23,final_round=23,remaining_rounds=[23],next_round_authorized=False,latest_report=str(R/'round22/reports/ROUND22_ANALYSIS_ZH.md'),last_score=86,updated=datetime.now().astimezone().isoformat(),literature_comparison=str(Q/'reports/CONTEMPORARY_COMPARISON_ZH.md'))
dump(R/'state/campaign.json',c)
print('Campaign synchronized through R22; R23 remains running; no R24 authorization.')
