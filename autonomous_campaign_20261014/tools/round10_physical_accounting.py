"""Read completed R10 routed reports; no resynthesis or experimental changes."""
from pathlib import Path
import json,re,hashlib
R=Path(__file__).resolve().parents[1];Q=R/'round10';rows=[]
assert json.loads((Q/'state/analysis.json').read_text())['status']=='COMPLETE_SCORED'
for method in ['seed','local_window','numeric_pair','numeric_window']:
 p=Q/f'results/hardware/r10_sqrt24_exact_{method}/util_route.rpt';s=p.read_text()
 def count(pattern):return int(re.search(r'\|\s*'+pattern+r'\s*\|\s*(\d+)',s)[1])
 lut=count('LUT as Logic');memory=count('LUT as Memory');o5=count('using O5 output only');o6=count('using O6 output only');dual=count('using O5 and O6')
 primitives={k:int(v)for k,v in re.findall(r'\|\s*(LUT[1-6])\s*\|\s*(\d+)\s*\|\s*LUT\s*\|',s)}
 assert memory==0 and lut==o5+o6+dual
 assert sum(primitives.values())==o5+o6+2*dual
 rows.append(dict(method=method,physical_logic_LUTs=lut,single_output_sites=o5+o6,dual_output_sites=dual,used_logic_outputs=o5+o6+2*dual,primitive_counts=primitives,source=str(p),source_sha256=hashlib.sha256(p.read_bytes()).hexdigest()))
p=R/'state/round10_posthoc_physical_accounting.json';assert not p.exists()
p.write_text(json.dumps(dict(scope='Accounting of four completed routed netlists, not a new experiment or a unique causal attribution.',case='sqrt24_exact',rows=rows),indent=2))
print(rows)
