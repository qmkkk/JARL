from pathlib import Path
import json,hashlib,shutil,ast,datetime
R=Path(__file__).resolve().parents[1];Q=R/'round19';load=lambda p:json.loads(p.read_text(encoding='utf-8'));dump=lambda p,x:p.write_text(json.dumps(x,indent=2,ensure_ascii=False),encoding='utf-8');h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();f=load(Q/'state/freeze_manifest.json');assert f['status']=='PREPARED_PENDING_CORE_AUDIT'
B=Q/'repairs/version_capture_attempt1';B.mkdir(parents=True,exist_ok=False);shutil.copy2(Q/'state/freeze_manifest.json',B/'prepared_manifest_before.json');paths=[Q/'tools/audit19.py',R/'tools/final_audit_template.py'];changes=[]
helper='''def version_command(key,cmd):
 p=subprocess.run(cmd,capture_output=True,creationflags=subprocess.CREATE_NO_WINDOW)
 (Q/f'logs/version_{key}.stdout.bin').write_bytes(p.stdout);(Q/f'logs/version_{key}.stderr.bin').write_bytes(p.stderr)
 def decode(b):return b.decode('utf-16-le',errors='replace')if b'\\x00'in b else b.decode('utf-8',errors='replace')
 receipt=dict(argv=cmd,returncode=p.returncode,stdout=decode(p.stdout),stderr=decode(p.stderr));dump(Q/f'state/version_{key}_receipt.json',receipt)
 assert p.returncode==0,receipt
 return receipt['stdout'].strip()
'''
for p in paths:
 old=p.read_text(encoding='utf-8');sha=h(p);shutil.copy2(p,B/p.name);new=old.replace('versions=dict(python=',helper+'\nversions=dict(python=')
 a="p=subprocess.run(cmd,capture_output=True,text=True,creationflags=subprocess.CREATE_NO_WINDOW);assert p.returncode==0;versions[key]=p.stdout.strip()";assert a in new;new=new.replace(a,"versions[key]=version_command(key,cmd)")
 a="p=subprocess.run(['wsl','-d','Ubuntu','-u','k','--','sha256sum','/usr/bin/g++'],capture_output=True,text=True,creationflags=subprocess.CREATE_NO_WINDOW);assert p.returncode==0;versions['g++_binary_sha256']=p.stdout.strip()";assert a in new;new=new.replace(a,"versions['g++_binary_sha256']=version_command('g++_hash',['wsl','-d','Ubuntu','-u','k','--','sha256sum','/usr/bin/g++'])")
 ast.parse(new);p.write_text(new,encoding='utf-8');changes.append(dict(path=str(p),old_sha256=sha,new_sha256=h(p),preserved=str(B/p.name)));f['files'][str(p)]=h(p)
rec=dict(id='version_capture_attempt1',stage='PRE_FREEZE_AUDIT_ONLY',time=datetime.datetime.now().astimezone().isoformat(),reason='WSL may write UTF16 startup diagnostics alongside UTF8 toolstdout; Windows default GBK textcapture raised decoder error. Capture raw bytes and keep per-command receipts; decode diagnostic streams explicitly. No experimental computation or model changed.',changes=changes,failed_log=str(Q/'logs/pipeline_00_audit19.py.log'));rr=load(Q/'state/engineering_repairs.json');rr.append(rec);dump(Q/'state/engineering_repairs.json',rr);dump(Q/'state/freeze_manifest.json',f);print('Version capture repaired beforefreeze; oldsource andmanifestpreserved')
