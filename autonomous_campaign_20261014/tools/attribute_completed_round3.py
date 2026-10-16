"""Read-only reanalysis of completed R3, stored in campaign state, not in R3."""
from pathlib import Path
import sys,json,csv,contextlib,io
sys.dont_write_bytecode=True
R=Path(__file__).resolve().parents[1];Q=R/'round3'
sys.path.insert(0,str(R/'round6/tools'))
import explain6 as e
e.Q=Q
def load(p):
 x=json.loads(p.read_text())
 if p==Q/'configs/plan.json':
  for c in x['cases']:c['domain_bits']=c['bits']*(2 if c['kind']=='mul'else 1)
 return x
def choices(n):
 mm=load(Q/f'state/{n}_replay_manifest.json')[0];row=next(r for r in csv.DictReader((Q/f'results/{n}_replay.csv').open())if r['stage']=='final'and r['method']=='0');mask=int(row['mask']);return [x for i,x in enumerate(mm['choices'])if mask>>i&1]
def save(p,x):
 assert p==Q/'state/relation_attribution.json'
 x['origin']='Reanalysis of complete Round3; no new experiments or changes to historical evidence'
 (R/'state/round3_relation_attribution_20261014.json').write_text(json.dumps(x,indent=2))
e.load=load;e.dump=save;e.relation_choices=choices
with contextlib.redirect_stdout(io.StringIO()):e.main()
x=json.loads((R/'state/round3_relation_attribution_20261014.json').read_text())
for c in x['cases']:
 print(c['case'],len(c['accepted_pairs']),{k:sum(p['statistics'].get(k,0)for p in c['accepted_pairs'])for k in ['reachable_rows_with_internal_change','nonrectangular_relation_rows','essential_joint_change_rows']})
