"""Finite evidence check after the complete R23 matrix, without rerunning experiments."""
from pathlib import Path
from datetime import datetime
import json,hashlib

Q=Path(__file__).resolve().parents[1]
def load(p):return json.loads(p.read_text(encoding='utf-8-sig'))
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def main():
 done=load(Q/'state/execution_complete.json');summary=load(Q/'results/analysis_summary.json')
 assert done['physical_endpoints']==24 and summary['physical_endpoints']==24
 manifest=load(Q/'rtl/design_manifest.json');plan=load(Q/'configs/plan.json');revision=load(Q/'state/device_availability_amendment.json')
 assert sha(Q/'inputs/plan_before_device_availability_amendment.json')==revision['original_plan_sha256']
 assert sha(Q/'configs/plan.json')==revision['revised_plan_sha256']
 files=set();checks=[]
 for row in load(Q/'inputs/stimulus_manifest.json'):
  p=Path(row['path']);assert sha(p)==row['sha256'];files.add(p)
 for e in manifest:
  for k in ('rtl','tb','gold','source'):
   p=Path(e[k]);assert sha(p)==e[k+'_sha256'];files.add(p)
  d=Q/'results/hardware'/('rtl_'+e['top']);r=load(d/'PASS.json');assert r['status']=='PASS' and r['checks']==6144
  assert 'R23_FIR_PASS checks=6144 latency=19 II=20' in Path(r['log']).read_text()
  files.update((d/'PASS.json',Path(r['log'])))
  for part in plan['devices']:
   d=Q/'results/hardware'/(part+'__'+e['top']);assert (d/'route.complete').read_text()==e['rtl_sha256']
   assert (d/'power.complete').read_text()=='complete'
   r=load(d/'sim/PASS.json');assert r['status']=='PASS' and r['checks']==6144 and r['routed']
   assert sha(d/'sim/activity.saif')==r['saif_sha256']
   assert 'R23_FIR_PASS checks=6144 latency=19 II=20' in Path(r['log']).read_text()
   checks.append(dict(top=e['top'],part=part,status='EVIDENCE_CONSISTENT'))
   files.update(d.glob('*.rpt'));files.update(d.glob('*.log'));files.update((d/'routed.v',d/'route.dcp',d/'route.complete',d/'power.complete',d/'sim/PASS.json',d/'sim/activity.saif',Path(r['log'])))
 for row in load(Q/'state/table_verification.json'):
  p=Q/f'results/{row["top"]}_unsigned.u32';assert sha(p)==row['sha256'];files.add(p)
 for folder in ('configs','tools','src','reports','inputs'):
  files.update(p for p in (Q/folder).rglob('*')if p.is_file())
 files.update(p for p in (Q/'results').glob('*')if p.is_file())
 files.update(p for p in (Q/'state').glob('*.json')if p.name not in ('final_evidence_verification.json','round_status.json'))
 files.add(Q/'state/installed_parts.log')
 rows=[dict(path=str(p),bytes=p.stat().st_size,sha256=sha(p))for p in sorted(files)]
 out=dict(status='PASS',verified_at=datetime.now().astimezone().isoformat(),revised_matrix='Artix100T and Artix200T; original Kintex unavailable retained separately',physical_receipts=len(checks),rtl_output_comparisons=done['rtl_checks'],routed_output_comparisons=done['routed_checks'],plan_sha256=sha(Q/'configs/plan.json'),files=rows,endpoints=checks,note='Evidence integrity only; journal verdict is an independent research judgment. Core is OOC, power is functional-SAIF estimate.')
 (Q/'state/final_evidence_verification.json').write_text(json.dumps(out,ensure_ascii=False,indent=2),encoding='utf-8')
 print(json.dumps({k:v for k,v in out.items()if k not in ('files','endpoints')},ensure_ascii=False,indent=2));print('FILES_HASHED',len(rows))
if __name__=='__main__':main()
