from core import R,Q,load,dump
import datetime,hashlib,shutil
p=Q/'state/analysis.json';a=load(p);a.update(status='COMPLETE_SCORED',score=80,score_components=dict(innovation=17,physical_gain=21,problem_coverage=15,correctness=18,cost=9),score_interpretation='subjective evidence/progress assessment, not publication odds or manuscript completeness',quantizer_equivalence=load(Q/'state/quantizer_equivalence.json'),decision='CONTINUE_ROUND2_JOINT_RELATION_VS_SERIAL_AFTER_STRONG_SEEDS');dump(p,a)
snap=Q/'src/executed_driver_snapshot';snap.mkdir(exist_ok=True)
for f in(R/'tools').iterdir():
 if f.suffix in['.py','.tcl']:shutil.copy2(f,snap/f.name)
record=dict(round=1,status='COMPLETE',score=80,report=str(Q/'reports/ROUND1_REPORT_ZH.md'),report_sha256=hashlib.sha256((Q/'reports/ROUND1_REPORT_ZH.md').read_bytes()).hexdigest(),finished=datetime.datetime.now().astimezone().isoformat())
dump(Q/'state/round_status.json',record);campaign=load(R/'state/campaign.json');campaign['rounds']=[record];campaign['status']='ROUND1_COMPLETE_PREPARING_ROUND2';dump(R/'state/campaign.json',campaign);print(record)
