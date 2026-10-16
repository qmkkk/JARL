"""Read-only retrieval of public primary-source RTL; never build or execute it."""
from pathlib import Path
import requests,json,hashlib
R=Path(__file__).resolve().parents[1];O=R/'literature_sources_20261015/signed_multiplier_author';assert not O.exists();O.mkdir(parents=True)
root='https://api.github.com/repos/YnuGuoLab/FPGA_Signed_Approx_Mul'
def get(url):
 r=requests.get(url,timeout=30);r.raise_for_status();return r
commit=get(root+'/commits/main').json()['sha'];tree=get(root+'/git/trees/'+commit+'?recursive=1').json()
(O/'tree.json').write_text(json.dumps(tree,indent=2));rows=[]
for f in tree['tree']:
 p=f['path']
 if f['type']!='blob' or not(p=='README.md' or ('16' in p and '32'not in p and '/sources/'in p and p.endswith('.v'))):continue
 blob=get('https://raw.githubusercontent.com/YnuGuoLab/FPGA_Signed_Approx_Mul/'+commit+'/'+p).content
 target=O/p;target.parent.mkdir(parents=True,exist_ok=True);target.write_bytes(blob);rows.append(dict(path=p,bytes=len(blob),sha256=hashlib.sha256(blob).hexdigest()))
(O/'receipt.json').write_text(json.dumps(dict(status='READ_ONLY_NOT_EXECUTED',commit=commit,repository='https://github.com/YnuGuoLab/FPGA_Signed_Approx_Mul',files=rows),indent=2))
print(json.dumps(dict(commit=commit,files=rows),indent=2))
