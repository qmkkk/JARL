from pathlib import Path
import urllib.request,json,hashlib
R=Path(__file__).resolve().parents[1];q=R/'research_review/literature_sources_20261015/abcpercy_merge';rec=json.loads((q/'receipt.json').read_text());sha=rec['commit'];root=q/'selected_source';root.mkdir(exist_ok=True);rows=[]
for rel in ['zinterface/abcorig/src/map/if/ifCore.c','zinterface/abcorig/src/map/if/ifMap.c','zinterface/abcorig/src/map/if/if.h','zinterface/abcorig/src/base/abci/abcIf.c']:
 url='https://raw.githubusercontent.com/'+rec['repository']+'/'+sha+'/'+rel;p=root/Path(rel).name;assert not p.exists();data=urllib.request.urlopen(urllib.request.Request(url,headers={'User-Agent':'Project3-literature-review'}),timeout=30).read();p.write_bytes(data);rows.append(dict(path=rel,url=url,sha256=hashlib.sha256(data).hexdigest()))
(root/'receipt.json').write_text(json.dumps(rows,indent=2));print('Read4sourcefiles; no build or execution')
