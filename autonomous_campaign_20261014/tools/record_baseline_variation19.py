"""Preserve a failed over-strict identity check without changing frozen methods."""
from pathlib import Path
import json,hashlib,datetime,shutil
R=Path(__file__).resolve().parents[1];Q=R/'round19'
load=lambda p:json.loads(p.read_text(encoding='utf-8'))
h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
dump=lambda p,x:p.write_text(json.dumps(x,indent=2,ensure_ascii=False),encoding='utf-8')
for p,sha in load(Q/'state/freeze_manifest.json')['files'].items():assert h(Path(p))==sha,p
assert not (Q/'results/hardware/ppa.json').exists()
old={(e['case'],e['method']):e for e in load(Q/'input/expected_round18.json')['core']}
new=load(Q/'rtl/design_manifest.json');differences=[]
for e in new:
 if e['canonical_sha256']!=old[e['case'],e['method']]['canonical_sha256']:
  assert e['method']=='quadol_wce';differences.append(dict(case=e['case'],old=old[e['case'],e['method']]['canonical_sha256'],new=e['canonical_sha256'],WCE=e['WCE']))
assert len(differences)==2
folder=Q/'repairs/baseline_order_identity';folder.mkdir()
for p in [Q/'state/pipeline.json',Q/'logs/resume2_09_identity19.py.log',Q/'tools/identity19.py']:
 shutil.copy2(p,folder/p.name)
files={str(p):h(p)for p in (Q/'rtl').glob('*.v')}
for c in load(Q/'configs/plan.json')['cases']:
 for p in [Q/f'graphs/{c["name"]}_quadol_wce.json',Q/f'state/{c["name"]}_search.json',Q/f'results/{c["name"]}_verify.csv']:
  files[str(p)]=h(p)
for n in ['identity19_overlay.py','resume_round19_after_baseline_identity.py']:files[str(R/'tools'/n)]=h(R/'tools'/n)
rec=dict(status='LOCKED_BEFORE_ANY_R19_PHYSICAL_RESULTS',time=datetime.datetime.now().astimezone().isoformat(),differences=differences,files=files,
 explanation='Pinned author util.reorder uses iteration over string sets; the previously stabilized LUT object hash does not stabilize pin sets. R19 regenerated baseline can differ from R18. All fifteen seed/proposed/ablation models and the third QUADOL baseline remain byte-identical after top-name normalization. Preserve new baseline, independently verify its full 24-bit mathematical domain, freeze its concrete graph and RTL, and freshly implement it. No source/model/config in the original freeze changes. No selection by measured PPA.',
 identity_policy='Exact R18 identity remains mandatory for seed and all proposed variants, application outputs, and all integration wrappers. QUADOL uses its locked R19 artifact, exhaustive WCE and independent HDL/application checks; never claim exact rerun equality for these two baseline graphs.',
 reproducibility_limit='Replay physical and mathematical evidence from included fixed baseline graphs/RTL. Fresh author search without fixed string-hash environment is not promised bit-identical; both historical and fresh results are retained.')
dump(Q/'state/baseline_identity_amendment.json',rec)
rep=load(Q/'state/engineering_repairs.json');rep.append(dict(kind='formal_baseline_order_variation',record=str(Q/'state/baseline_identity_amendment.json'),frozen_source_changes=False,model_changes=False,original_failed_check_preserved=True));dump(Q/'state/engineering_repairs.json',rep)
print(json.dumps(differences))
