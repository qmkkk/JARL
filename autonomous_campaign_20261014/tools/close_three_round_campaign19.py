from pathlib import Path
import json,hashlib,datetime
R=Path(__file__).resolve().parents[1];Q=R/'round19';load=lambda p:json.loads(p.read_text(encoding='utf-8'));dump=lambda p,x:p.write_text(json.dumps(x,indent=2,ensure_ascii=False),encoding='utf-8');h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
d=load(Q/'state/final_tables.json');assessment=load(Q/'state/final_evidence_assessment.json')
assert d['status']=='COMPLETE_COLLECTED' and assessment['execution_status']=='COMPLETE'
p=Q/'reports/FINAL_THREE_ROUND_REPORT_ZH.md';assert p.exists() and p.stat().st_size>5000
for root,name in [(Q,'freeze_manifest.json'),(Q,'baseline_identity_amendment.json'),(Q/'results/serial_claim_check','freeze_manifest.json'),(Q/'results/serial_claim_check','generated_artifact_freeze.json')]:
 for f,sha in load(root/'state'/name)['files'].items():assert h(Path(f))==sha,f
rec=dict(round=19,status='COMPLETE',score=assessment['score'],report=str(p),report_sha256=h(p),finished=datetime.datetime.now().astimezone().isoformat())
dump(Q/'state/round_status.json',rec)
a=load(Q/'state/analysis.json');a.update(status='COMPLETE_SCORED',score=assessment['score'],score_components=assessment['score_components'],decision=assessment['decision'],final_tables='state/final_tables.json',serial_control_completed=True);dump(Q/'state/analysis.json',a)
dump(Q/'state/completion_verification.json',dict(status='PASS',pipelines=d['pipelines'],counts=d['counts'],original_frozen_files_unchanged=True,formal_baseline_variation_disclosed=True,all_registered_clocks_pass=True,report_sha256=h(p),serial_control='COMPLETE',historical_reports_unchanged=True))
supp=load(Q/'state/final_manifest_supplement.json');supp.update(status='COMPLETE',finished=rec['finished']);dump(Q/'state/final_manifest_supplement.json',supp)
c=load(R/'state/campaign.json');assert c['active_round']==19 and not any(x['round']==19 for x in c['rounds']);c['rounds'].append(rec);c.update(status='FINAL_EVIDENCE_COMPLETE_STOP',remaining_rounds=[],final_round=19,latest_progress='round19/state/round_status.json',scientific_assessment='round19/state/final_evidence_assessment.json',next_round_authorized=False);dump(R/'state/campaign.json',c)
nav='''# 当前最终交付

用户指定的三轮收拢 R17、R18、R19 已执行完成，停止实验，不开启 R20。主模型冻结，全部结果与旧轮原始记录保留。执行完成与科学贡献判定分别见下。

- 完整结论：../round19/reports/FINAL_THREE_ROUND_REPORT_ZH.md
- 科学判定：../round19/state/final_evidence_assessment.json
- 最终全表：../round19/state/final_tables.json
- 核心、集成、质量、相对最强基线数据：../round19/reports/FINAL_CORE.csv、FINAL_INTEGRATED.csv、FINAL_QUALITY.csv、FINAL_GAINS.csv
- 原始冻结清单：../round19/state/freeze_manifest.json
- 原作者基线两例重生成差异：../round19/state/baseline_identity_amendment.json
- 最终串联因果对照：../round19/results/serial_claim_check

没有新方向、模型优化、自动接续、定时任务、论文正文或投稿。该停止不自动表示期刊接收或整项目成功归档。
'''
(R/'reports/MAIN_MODEL_CURRENT_ZH.md').write_text(nav,encoding='utf-8')
(R/'reports/CLAIM_LEDGER_ZH.md').write_text('# 最终 claim 状态\n\n以 round19/reports/FINAL_THREE_ROUND_REPORT_ZH.md 的逐项判定为准。三轮证据完整交付；保留不支持的宽泛主张和所有负例。\n\n'+json.dumps(assessment['claim_decisions'],indent=2,ensure_ascii=False)+'\n',encoding='utf-8')
agents=R/'AGENTS.md';agents.write_text('LATEST THREE-ROUND WORK RECORD (2026-10-15): R17/R18/R19 completed, including the final serial causal control. Read round19/state/final_evidence_assessment.json and round19/reports/FINAL_THREE_ROUND_REPORT_ZH.md. Preserve all evidence and frozen sources. STOP: no R20, new experiments, new direction, manuscript, schedules, agents or project succession without explicit new human scope. Scientific readiness is recorded separately from execution completion.\n\n'+agents.read_text(encoding='utf-8'),encoding='utf-8')
outer=R.parent/'AGENTS.md';outer.write_text('LATEST THREE-ROUND WORK RECORD (2026-10-15): User-scoped R17/R18/R19 completion finished in autonomous_campaign_20261014. Read its round19/state/final_evidence_assessment.json and round19/reports/FINAL_THREE_ROUND_REPORT_ZH.md. Experiment execution and scientific readiness are separate. Preserve historical and formal evidence. STOP: no autonomous R20, further experiments, new direction, manuscript, schedules, agents or succession without new explicit human scope.\n\n'+outer.read_text(encoding='utf-8'),encoding='utf-8')
print(json.dumps(rec,ensure_ascii=False))
