"""Read-only public-source snapshot; no build, execution, installation or experiment."""
from pathlib import Path
import urllib.request,json,hashlib,datetime
R=Path(__file__).resolve().parents[1];q=R/'research_review/literature_sources_20261015';q.mkdir(exist_ok=True)
def get(url):
 req=urllib.request.Request(url,headers={'User-Agent':'Project3-literature-review'});return urllib.request.urlopen(req,timeout=30).read()
repo='Sheng1994/abcpercy_merge';head=json.loads(get('https://api.github.com/repos/'+repo+'/commits/master'));sha=head['sha'];d=q/'abcpercy_merge';d.mkdir(exist_ok=True)
files={}
for target,url in [('commit.json','https://api.github.com/repos/'+repo+'/commits/'+sha),('README.md','https://raw.githubusercontent.com/'+repo+'/'+sha+'/README.md'),('tree.json','https://api.github.com/repos/'+repo+'/git/trees/'+sha+'?recursive=1')]:
 p=d/target;assert not p.exists();data=get(url);p.write_bytes(data);files[target]=dict(url=url,sha256=hashlib.sha256(data).hexdigest())
(d/'receipt.json').write_text(json.dumps(dict(repository=repo,commit=sha,retrieved=datetime.datetime.now().astimezone().isoformat(),files=files,execution='NOT_BUILT_NOT_RUN'),indent=2))
tree=json.loads((d/'tree.json').read_text());paths=[t['path']for t in tree.get('tree',[])if any(x in t['path'].lower()for x in ['duallut','ifdual','mapper','readme','ifmerge'])];print(json.dumps(dict(commit=sha,tree_truncated=tree.get('truncated'),selected_paths=paths[:45]),indent=2))
