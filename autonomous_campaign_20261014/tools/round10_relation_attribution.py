"""Post-hoc descriptive analysis only; no model change or new experiments."""
from pathlib import Path
import json,hashlib
R=Path(__file__).resolve().parents[1];p=R/'round10/state/window_attribution.json';data=json.loads(p.read_text());out=[]
for c in data['cases']:
 rr=c['accepted']['numeric_window'];out.append(dict(case=c['case'],accepted=len(rr),changed_observed_rows=sum(x['statistics'].get('root_values_changed_rows',0)for x in rr),windows_changing_observed_rows=sum(x['statistics'].get('root_values_changed_rows',0)>0 for x in rr),nonrectangular_rows_present=sum(x['statistics'].get('nonrectangular_numeric_rows',0)for x in rr),unseen_row_count_per_window=[dict(pair=x['pair'],observed=x['statistics']['observed_support_rows'],total=1<<x['union'])for x in rr]))
q=R/'state/round10_posthoc_relation_summary.json';assert not q.exists();q.write_text(json.dumps(dict(source_sha256=hashlib.sha256(p.read_bytes()).hexdigest(),scope='Proposal-context descriptors; sampled context is not exhaustive relation proof. No unique physical causal attribution.',cases=out),indent=2));print([{x['case']:{k:x[k]for k in['accepted','changed_observed_rows','windows_changing_observed_rows','nonrectangular_rows_present']}}for x in out])
