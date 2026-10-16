"""Reproduced formal models must equal the selected R18 frozen functions."""
from pathlib import Path
import sys,json,hashlib
Q=Path(__file__).resolve().parents[1];load=lambda p:json.loads(p.read_text(encoding='utf-8'));dump=lambda p,x:p.write_text(json.dumps(x,indent=2,ensure_ascii=False),encoding='utf-8')
assert load(Q/'state/freeze_manifest.json')['status']=='FROZEN_AUDIT_PASSED';phase=sys.argv[1];expected=load(Q/'input/expected_round18.json');f=Q/'state/formal_identity_checks.json';records=load(f)if f.exists()else[]
if phase=='core':
 old={(e['case'],e['method']):e for e in expected['core']};new=load(Q/'rtl/design_manifest.json');assert len(new)==18
 for e in new:assert e['canonical_sha256']==old[e['case'],e['method']]['canonical_sha256'],('MODEL_CHANGED',e['case'],e['method']);assert not e['inherited_physical']and e['duplicate_of']is None
 rec=dict(phase=phase,status='PASS',canonical_models=18,all_new_physical=True)
elif phase=='application_and_integration':
 old={(e['case'],e['method']):e for e in expected['tables']};new=load(Q/'state/product_tables.json')
 for e in new:assert e['sha256']==old[e['case'],e['method']]['sha256']
 old={(e['case'],e['image'],e['task'],e['method']):e for e in expected['application']['rows']};new=load(Q/'state/application_results.json')['rows']
 for e in new:assert e['sha256']==old[e['case'],e['image'],e['task'],e['method']]['sha256']
 old={(e['case'],e['method']):e for e in expected['integration']};new=load(Q/'rtl/integration/manifest.json')
 for e in new:assert Path(e['rtl']).read_text().replace('r19_','r18_')==Path(old[e['case'],e['method']]['rtl']).read_text()
 rec=dict(phase=phase,status='PASS',product_tables=18,application_outputs=108,integration_rtl=9)
else:
 a=load(Q/'state/analysis.json');assert len(a['rows'])==18 and len(a['integration'])==9
 for n,sha in load(Q/'state/freeze_manifest.json')['files'].items():assert hashlib.sha256(Path(n).read_bytes()).hexdigest()==sha,n
 rec=dict(phase=phase,status='PASS',all_frozen_files_unchanged=True,formal_core_models=18,formal_integrated_models=9)
records.append(rec);dump(f,records);print('FORMAL_IDENTITY',rec,flush=True)
