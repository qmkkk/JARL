from pathlib import Path
import json,hashlib,re,sys,csv
sys.dont_write_bytecode=True
R=Path(__file__).resolve().parents[1];Q=R/'round13'
load=lambda p:json.loads(p.read_text())
a=load(Q/'state/analysis.json');assert len(a['rows'])==15
records=[]
for r in a['rows']:
 p=Path(r['physical_directory'])/'util_route.rpt';txt=p.read_text();dual=int(re.search(r'\|\s*using O5 and O6\s*\|\s*(\d+)',txt)[1]);records.append(dict(case=r['case'],method=r['method'],LUT_sites=r['LUT'],dual_output_sites=dual,logical_LUT_outputs=r['LUT']+dual,physical_report=str(p),sha256=hashlib.sha256(p.read_bytes()).hexdigest()))
(Q/'state/posthoc_physical_accounting.json').write_text(json.dumps(records,indent=2))
print(json.dumps(records,indent=2))
