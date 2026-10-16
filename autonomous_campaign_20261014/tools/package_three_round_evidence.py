from pathlib import Path
import json,hashlib,zipfile,datetime
R=Path(__file__).resolve().parents[1];Q=R/'round19';load=lambda p:json.loads(p.read_text(encoding='utf-8'));h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
assert load(Q/'state/round_status.json')['status']=='COMPLETE';assert load(Q/'state/final_evidence_assessment.json')['execution_status']=='COMPLETE'
out=R.parent/'Project3_R19_Paper_Evidence_20261015.zip';assert not out.exists();selected=set()
def add(p):
 if p.is_file():selected.add(p)
for name in ['AGENTS.md','state/campaign.json','configs/three_round_completion_20261015.json']:add(R/name)
for d in ['tools','input/legacy_code','round2/tools']:
 for p in(R/d).rglob('*'):
  if p.is_file()and p.suffix in ['.py','.tcl']:add(p)
for p in(R/'reports').glob('*'):
 if p.suffix in ['.md','.json','.csv']:add(p)
for name in ['THREE_ROUND_CONTRIBUTION_AND_EVIDENCE_ZH.md','FINAL_METHOD_CONTRACT_AND_COMPOSITION_ZH.md','LITERATURE_COMPETITIVENESS_UPDATE_20261015.md']:add(R/'research_review'/name)
for rn in range(1,17):
 for name in [f'reports/ROUND{rn}_REPORT_ZH.md','state/analysis.json','state/round_status.json','state/completion_verification.json']:add(R/f'round{rn}'/name)
for rn in [17,18,19]:
 q=R/f'round{rn}'
 for sub in ['tools','configs','input','inputs','graphs','rtl','state','reports','src','results','logs','repairs']:
  if not(q/sub).exists():continue
  for p in(q/sub).rglob('*'):
   if not p.is_file():continue
   parts=p.relative_to(q).parts
   if any(x in ['xsim.dir','.Xil','__pycache__']for x in parts):continue
   if p.suffix.lower()in ['.py','.tcl','.json','.md','.csv','.v','.sv','.xdc','.hex','.txt','.cpp','.rpt','.log','.stderr','.svg','.npy']or(rn==19 and p.suffix.lower()in ['.bin','.png']):add(p)
rows=[dict(path=p.relative_to(R).as_posix(),bytes=p.stat().st_size,sha256=h(p))for p in sorted(selected)];readme='''# Project3 R17—R19 evidence handoff

Read round19/reports/FINAL_THREE_ROUND_REPORT_ZH.md and round19/state/final_evidence_assessment.json first. Experiment completion and publication readiness are separate fields. This package does not guarantee TVLSI acceptance.

R17: strong arithmetic starting points. R18: actual author-code baseline, controlled ablations, public-image quality and controller-inclusive streaming cores. R19: finite core-claim audit, byte freeze, regenerated functions and fresh formal math/HDL/PPA/application reruns. Historical positive and adverse records are preserved.

The MANIFEST.json file records SHA256 and size for every included source/evidence file. The adjacent verification.json is produced by reopening the archive and checking every member's bytes. Checkpoints, compiler executables and simulator binaries are omitted; generated RTL, constraints, commands, logs, metrics, full-domain source/results and operator tables are included.

Original workspace: D:/paper_project_5/project_3/autonomous_campaign_20261014. Scripts derive their active directory from __file__, but historical evidence and command records preserve original absolute paths. These are provenance records; restore the original layout for direct execution, or explicitly record a path mapping when relocating. Do not silently rewrite the frozen original. Windows Python D:/anaconda/python.exe, Vivado E:/AMDDesignTools/2026.1/Vivado/bin; WSL Ubuntu user k, g++. Exact versions are in round19/state/tool_versions.json. No new framework installation is needed in the original environment.

Never rerun a pipeline inside a completed evidence directory: its no-overwrite guards are intentional. Reproduction must use a fresh copy/work directory with paths explicitly mapped and old hashes retained. Keep the input ZIP/hash verification receipt as the immutable delivered evidence snapshot.
'''
manifest=dict(created=datetime.datetime.now().astimezone().isoformat(),original_root=str(R),files=rows,excluded='Large checkpoints, build binaries, simulation caches; no raw result deletion in workspace.',status=load(Q/'state/final_evidence_assessment.json'))
with zipfile.ZipFile(out,'w',compression=zipfile.ZIP_DEFLATED,compresslevel=7)as z:
 for p in sorted(selected):z.write(p,p.relative_to(R).as_posix())
 z.writestr('README_FIRST.md',readme);z.writestr('MANIFEST.json',json.dumps(manifest,indent=2,ensure_ascii=False))
with zipfile.ZipFile(out)as z:
 assert z.testzip()is None
 for rec in rows:
  data=z.read(rec['path']);assert len(data)==rec['bytes']and hashlib.sha256(data).hexdigest()==rec['sha256'],rec['path']
verification=dict(status='PASS',zip=str(out),zip_sha256=h(out),zip_bytes=out.stat().st_size,source_files=len(rows),all_member_hashes_verified=True,created=datetime.datetime.now().astimezone().isoformat(),evidence_assessment=load(Q/'state/final_evidence_assessment.json'))
v=out.with_suffix('.verification.json');v.write_text(json.dumps(verification,indent=2,ensure_ascii=False),encoding='utf-8');print(json.dumps({k:v for k,v in verification.items()if k!='evidence_assessment'},ensure_ascii=False))
