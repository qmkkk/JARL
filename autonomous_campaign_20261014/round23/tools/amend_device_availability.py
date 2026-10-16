from pathlib import Path
import json,hashlib
from datetime import datetime
Q=Path(__file__).resolve().parents[1]
def dump(p,x):p.write_text(json.dumps(x,ensure_ascii=False,indent=2),encoding='utf-8')
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
original=Q/'configs/plan.json'; backup=Q/'inputs/plan_before_device_availability_amendment.json'
assert not backup.exists()
backup.write_bytes(original.read_bytes())
p=json.loads(original.read_text(encoding='utf-8'))
assert p['devices']==['xc7a100tcsg324-1','xc7k160tfbg676-1']
failed=Q/'results/hardware/xc7k160tfbg676-1__r23_fir8_quadol_wce/physical_1.log'
assert 'Specified part could not be found' in failed.read_text()
p['devices'][1]='xc7a200tfbg676-1'
reason='Registered Kintex7 part unavailable locally; get_parts xc7k* returns empty. Before any second-device outcome, replace all 12 second-device endpoints by installed Artix7 200T, speed -1, 676-pin package. No architecture-generalization claim. No RTL/input/budget/clock/method changes. Prior endpoints retained, not rerun.'
p['execution_amendment']=dict(recorded=datetime.now().astimezone().isoformat(),reason=reason,original_plan_sha256=sha(backup),original_second_device='xc7k160tfbg676-1',replacement_second_device=p['devices'][1],selection_basis='Available larger 7-series die with same -1 speed grade and 676-pin package, selected before performance/quality outcomes. All installed Kintex7 parts absent.')
dump(original,p)
receipt=dict(**p['execution_amendment'],revised_plan_sha256=sha(original),original_error_log=str(failed),original_error_log_sha256=sha(failed),original_kintex_endpoints_unavailable=12,revised_physical_endpoints=24)
dump(Q/'state/device_availability_amendment.json',receipt)
err=Q/'state/execution_error.json'
(Q/'state/execution_error_missing_kintex.json').write_bytes(err.read_bytes())
s=json.loads((Q/'state/round_status.json').read_text(encoding='utf-8-sig'))
s.update(status='EXECUTING_FIXED_MATRIX_WITH_DOCUMENTED_DEVICE_AVAILABILITY_AMENDMENT',original_plan_sha256=sha(backup),plan_sha256=sha(original),amendment=str(Q/'state/device_availability_amendment.json'))
dump(Q/'state/round_status.json',s)
with (Q/'reports/EXECUTION_NOTES.md').open('a',encoding='utf-8')as f:
 f.write('\n\n## Second-device availability amendment\n'+reason+'\nOriginal and revised plan hashes are in state/device_availability_amendment.json. This is an execution-availability repair, not a performance-driven selection. Original Kintex12 unavailable; replacement Artix200T12 remains mandatory.\n')
print(json.dumps(receipt,indent=2))
