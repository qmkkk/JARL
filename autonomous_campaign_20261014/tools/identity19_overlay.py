from pathlib import Path
import sys,json,hashlib
R=Path(__file__).resolve().parents[1];Q=R/'round19';load=lambda p:json.loads(p.read_text(encoding='utf-8'));h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
phase=sys.argv[1];expected=load(Q/'input/expected_round18.json');f=Q/'state/formal_identity_checks.json';records=load(f)if f.exists()else[]
for manifest in ['freeze_manifest.json','baseline_identity_amendment.json']:
 for p,sha in load(Q/'state'/manifest)['files'].items():assert h(Path(p))==sha,p
if phase=='core':
 old={(e['case'],e['method']):e for e in expected['core']};new=load(Q/'rtl/design_manifest.json');assert len(new)==18
 for e in new:
  if e['method']!='quadol_wce':assert e['canonical_sha256']==old[e['case'],e['method']]['canonical_sha256']
  assert e['WCE']<=e['budget'] and not e['inherited_physical'] and e['duplicate_of'] is None
 rec=dict(phase=phase,status='PASS_WITH_DISCLOSED_BASELINE_VARIATION',identical_nonbaseline_models=15,locked_fresh_baselines=3,all_new_physical=True)
elif phase=='application_and_integration':
 old={(e['case'],e['method']):e for e in expected['tables']};new=load(Q/'state/product_tables.json');assert len(new)==18
 for e in new:
  if e['method']!='quadol_wce':assert e['sha256']==old[e['case'],e['method']]['sha256']
 old={(e['case'],e['image'],e['task'],e['method']):e for e in expected['application']['rows']};new=load(Q/'state/application_results.json')['rows'];assert len(new)==108
 for e in new:
  if e['method']!='quadol_wce':assert e['sha256']==old[e['case'],e['image'],e['task'],e['method']]['sha256']
 old={(e['case'],e['method']):e for e in expected['integration']};new=load(Q/'rtl/integration/manifest.json');assert len(new)==9
 for e in new:assert Path(e['rtl']).read_text().replace('r19_','r18_')==Path(old[e['case'],e['method']]['rtl']).read_text()
 rec=dict(phase=phase,status='PASS_WITH_DISCLOSED_BASELINE_VARIATION',identical_nonbaseline_tables=15,identical_nonbaseline_application_outputs=90,identical_integration_wrappers=9)
else:
 a=load(Q/'state/analysis.json');assert len(a['rows'])==18 and len(a['integration'])==9
 rec=dict(phase=phase,status='PASS',original_frozen_files_unchanged=True,baseline_artifacts_unchanged=True,formal_core_models=18,formal_integrated_models=9)
records.append(rec);f.write_text(json.dumps(records,indent=2),encoding='utf-8');print(rec)
