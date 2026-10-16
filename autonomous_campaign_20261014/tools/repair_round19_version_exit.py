from pathlib import Path
import json,hashlib,shutil,ast,datetime
R=Path(__file__).resolve().parents[1];Q=R/'round19';load=lambda p:json.loads(p.read_text(encoding='utf-8'));dump=lambda p,x:p.write_text(json.dumps(x,indent=2,ensure_ascii=False),encoding='utf-8');h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();f=load(Q/'state/freeze_manifest.json');assert f['status']=='PREPARED_PENDING_CORE_AUDIT'
B=Q/'repairs/version_exit_attempt2';B.mkdir(parents=True,exist_ok=False);shutil.copy2(Q/'state/freeze_manifest.json',B/'prepared_manifest_before.json');changes=[]
for sub in ['state','logs']:
 for p in(Q/sub).glob('version_*'):shutil.copy2(p,B/p.name)
for p in [Q/'tools/audit19.py',R/'tools/final_audit_template.py']:
 old=p.read_text(encoding='utf-8');sha=h(p);shutil.copy2(p,B/p.name);assert old.count('assert p.returncode==0,receipt')==1
 new=old.replace("assert p.returncode==0,receipt", "assert p.returncode==0 or(key=='vivado'and p.returncode==1 and not p.stderr and receipt['stdout'].startswith('vivado v2026.1 (64-bit)')and 'SW Build 6511674'in receipt['stdout']),receipt")
 ast.parse(new);p.write_text(new,encoding='utf-8');changes.append(dict(path=str(p),old_sha256=sha,new_sha256=h(p),preserved=str(B/p.name)));f['files'][str(p)]=h(p)
old=(R/'tools/resume_round19.py').read_text(encoding='utf-8');new=old.replace("assert len(rows)==1 and rows[0]['returncode']==1","assert len(rows)==2 and all(x['step']==['audit19.py']and x['returncode']==1 for x in rows)").replace('resume1_','resume2_').replace('capture_resume1','capture_resume2');p=R/'tools/resume_round19_attempt2.py';p.write_text(new,encoding='utf-8');ast.parse(new);f['files'][str(p)]=h(p)
rr=load(Q/'state/engineering_repairs.json');rr.append(dict(id='version_exit_attempt2',stage='PRE_FREEZE_METADATA_ONLY',time=datetime.datetime.now().astimezone().isoformat(),reason='Vivado2026.1 -version returns1 with complete versionbanner andempty stderr. Accept only this exact recorded banner/build for metadata, preservingrc1; all experimental commands stillrequire0. Matches successfulR18tool logs.',changes=changes,failed_log=str(Q/'logs/resume1_00_audit19.py.log')));dump(Q/'state/engineering_repairs.json',rr);dump(Q/'state/freeze_manifest.json',f);print('Version-onlyexit handling fixed; scientificexecutionreturnchecksunchanged')
