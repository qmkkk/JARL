from pathlib import Path
import urllib.request,json,hashlib,concurrent.futures
R=Path(__file__).resolve().parents[1]
q=R/'research_review/literature_sources_20261015/abcpercy_merge'
rec=json.loads((q/'receipt.json').read_text()); sha=rec['commit']
tree=json.loads((q/'tree.json').read_text())['tree']
root=q/'selected_source_more';root.mkdir(exist_ok=True)
paths=[r['path']for r in tree if r['type']=='blob' and r['path'].startswith('zinterface/abcorig/src/map/if/') and r['path'].endswith(('.c','.h'))]
paths+=['zinterface/cnf_gen.cpp','zinterface/cnf_gen.h']
def get(rel):
 p=root/rel;p.parent.mkdir(parents=True,exist_ok=True)
 url=f'https://raw.githubusercontent.com/{rec["repository"]}/{sha}/{rel}'
 if p.exists():data=p.read_bytes()
 else:
  data=urllib.request.urlopen(urllib.request.Request(url,headers={'User-Agent':'Project3-literature-review'}),timeout=30).read();p.write_bytes(data)
 return dict(path=rel,url=url,bytes=len(data),sha256=hashlib.sha256(data).hexdigest())
with concurrent.futures.ThreadPoolExecutor(max_workers=4) as pool:rows=list(pool.map(get,paths))
(root/'receipt.json').write_text(json.dumps(rows,indent=2))
print('Read',len(rows),'pinned source files; no build or execution')
