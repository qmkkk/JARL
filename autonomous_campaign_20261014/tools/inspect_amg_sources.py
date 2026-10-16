"""Fetch only provenance and source inventory; no external code execution."""
from pathlib import Path
import urllib.request,json,hashlib,datetime
R=Path(__file__).resolve().parents[1];D=R/'research_review/literature_sources_20261015/amg_inventory';D.mkdir(exist_ok=True)
def get(url):
 req=urllib.request.Request(url,headers={'User-Agent':'Project3-literature-review','Accept':'application/vnd.github+json'})
 with urllib.request.urlopen(req,timeout=30)as r:return r.read()
assert not(D/'receipt.json').exists()
c=json.loads(get('https://api.github.com/repos/phyzhenli/AMG/commits/master'));sha=c['sha'];tree=get('https://api.github.com/repos/phyzhenli/AMG/git/trees/'+sha+'?recursive=1');(D/'tree.json').write_bytes(tree);readme=get(f'https://raw.githubusercontent.com/phyzhenli/AMG/{sha}/README.md');(D/'README.md').write_bytes(readme)
files=[x for x in json.loads(tree)['tree']if x['type']=='blob'];selected=[{k:x[k]for k in ['path','sha','size']if k in x}for x in files if x['path'].startswith('multipliers/unsigned_8x8')and(x['path'].endswith(('.csv','.json','.md','.txt'))or'/ours/'in x['path'])]
(D/'candidate_inventory.json').write_text(json.dumps(selected,indent=2));rec=dict(commit=sha,url='https://github.com/phyzhenli/AMG',retrieved=datetime.datetime.now().astimezone().isoformat(),files={p.name:hashlib.sha256(p.read_bytes()).hexdigest()for p in D.iterdir()if p.is_file()},scope='Read-only source inventory; no BO dependencies installed, no generator or multipliers executed');(D/'receipt.json').write_text(json.dumps(rec,indent=2));print(json.dumps(dict(commit=sha,total_files=len(files),selected_inventory=len(selected),selected_paths=[x['path']for x in selected[:15]]),indent=2))
