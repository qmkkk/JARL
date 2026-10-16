"""Record the completed, human-scoped final round after analysis and verification."""
from pathlib import Path
from datetime import datetime
import json,hashlib
Q=Path(__file__).resolve().parents[1];R=Q.parent;P=R.parent
def load(p):return json.loads(p.read_text(encoding='utf-8-sig'))
def dump(p,x):p.write_text(json.dumps(x,ensure_ascii=False,indent=2),encoding='utf-8')
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def main():
 a=load(Q/'state/final_assessment.json');v=load(Q/'state/final_evidence_verification.json');s=load(Q/'results/analysis_summary.json')
 assert a['verdict'] in ('有 TVLSI 投稿竞争力','没有 TVLSI 投稿竞争力')
 assert v['status']=='PASS' and len(v['endpoints'])==24 and s['physical_endpoints']==24
 report=Q/'reports/FINAL_R23_TVLSI_VERDICT_ZH.md';assert report.exists() and a['verdict'] in report.read_text(encoding='utf-8')
 now=datetime.now().astimezone().isoformat()
 status=dict(status='COMPLETE_ANALYZED_FINAL_VERDICT_STOPPED',round=23,completed=now,verdict=a['verdict'],score=a['score'],score_components=a['score_components'],report=str(report),report_sha256=sha(report),assessment=str(Q/'state/final_assessment.json'),assessment_sha256=sha(Q/'state/final_assessment.json'),verification=str(Q/'state/final_evidence_verification.json'),verification_sha256=sha(Q/'state/final_evidence_verification.json'),physical_endpoints=24,timing_pass=s['timing_pass'],rtl_output_comparisons=s['rtl_checks'],routed_output_comparisons=s['routed_checks'],plan_sha256=sha(Q/'configs/plan.json'),execution_amendment=str(Q/'state/device_availability_amendment.json'),next_round_authorized=False,experiments_stopped=True,manuscript_written=False,successful_project_archive=False,acceptance_guaranteed=False)
 dump(Q/'state/round_status.json',status)
 errors=[str(p)for p in(Q/'state').glob('execution_error*.json')]
 dump(Q/'state/execution_resolution.json',dict(status='EXECUTION_COMPLETED',historical_error_receipts=errors,interpretation='Preserved historical execution failures; none is the active terminal round status. The fixed revised matrix has completed; see round_status.json.',details=str(Q/'reports/EXECUTION_NOTES.md')))
 c=load(R/'state/campaign.json')
 c['rounds']=[x for x in c['rounds']if x['round']!=23]+[dict(round=23,status='COMPLETE_ANALYZED',score=a['score'],report=str(report),report_sha256=sha(report),finished=now,verdict=a['verdict'])]
 c.update(status='ROUND23_COMPLETE_FINAL_VERDICT_STOPPED',active_round=None,final_round=23,remaining_rounds=[],next_round_authorized=False,latest_report=str(report),last_score=a['score'],scientific_assessment=str(Q/'state/final_assessment.json'),publication_competitiveness_verdict=a['verdict'],experiments_stopped=True,updated=now)
 dump(R/'state/campaign.json',c)
 record=f'LATEST ROUND23 COMPLETION (2026-10-15): Fixed final round completed and analyzed; verdict: {a["verdict"]}. Read {report.as_posix()} and {(Q/"state/round_status.json").as_posix()}. All24 amended physical endpoints completed; documented unavailable Kintex replacement by Artix200T. This is a submission-competitiveness judgment, not acceptance or an archive action. STOP: no automatic R24, further experiments, manuscript, schedules, delegation, other projects or succession without new human scope. Preserve all historical positive/negative results.\n\n'
 for p in (P/'AGENTS.md',R/'AGENTS.md'):
  text=p.read_text(encoding='utf-8-sig')
  if not text.startswith('LATEST ROUND23 COMPLETION'):p.write_text(record+text,encoding='utf-8')
 dump(P/'state/current_campaign.json',dict(status=status['status'],root=str(Q),campaign_state=str(R/'state/campaign.json'),round_state=str(Q/'state/round_status.json'),report=str(report),verdict=a['verdict'],updated=now,note='Older research_state.json belongs to the retained 2026-10-13 translation branch; do not reinterpret its historical records as the latest campaign status.'))
 print(json.dumps(status,ensure_ascii=False,indent=2))
if __name__=='__main__':main()
