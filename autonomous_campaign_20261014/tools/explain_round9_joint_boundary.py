from pathlib import Path
import sys,csv,json,hashlib
sys.dont_write_bytecode=True
R=Path(__file__).resolve().parents[1];sys.path.insert(0,str(R/'round9/tools'))
from model9 import Q,load,choices
def bit(init,inputs,support,row):return(init>>sum(((row>>support.index(n))&1)<<j for j,n in enumerate(inputs)))&1
records=[];sources={}
for c in load(Q/'configs/plan.json')['cases']:
 n=c['name'];pairs=load(Q/f'graphs/{n}_pairs.json');data=load(Q/f'results/{n}_methods.json');accepted=choices(n,'numeric_window')
 for order,(pi,method)in enumerate(accepted):
  p=pairs[pi];cf=data[pi]['methods'][method];sup=p['support'];allowed={};path=Q/f'results/{n}_pair{pi}.csv';sources[str(path)]=hashlib.sha256(path.read_bytes()).hexdigest()
  for r in csv.DictReader(path.open()):
   row=int(r['row']);allowed.setdefault(row,set())
   if max(abs(int(r['error_lo'])),abs(int(r['error_hi'])))<=c['budget']:allowed[row].add(int(r['q']))
  witnesses=[]
  for row,vv in allowed.items():
   f=p['window_a_truth'][row]if'window_a_truth'in p else bit(p['a_init'],p['a_ins'],sup,row);h=p['window_b_truth'][row]if'window_b_truth'in p else bit(p['b_init'],p['b_ins'],sup,row);old=f+2*h
   aa=bit(int(cf['initA'],16),cf['shared'],sup,row);bb=bit(int(cf['initB'],16),cf['shared'],sup,row);sel=1 if cf['select']is None else(row>>sup.index(cf['select']))&1;six=aa if sel else bb;new=six+2*bb if cf['mode']=='f6'else bb+2*six
   q_a=(new&1)+2*h;q_b=f+2*(new>>1)
   if new!=old and new in vv and q_a not in vv and q_b not in vv:witnesses.append(dict(row=row,old=old,new=new,A_only=q_a,B_only=q_b,allowed=sorted(vv)))
  records.append(dict(case=n,pair=pi,kind=p['candidate_class'],accepted_order=order,seed_context_full_domain=c['domain_bits']<=16,essential_joint_boundary_rows=len(witnesses),examples=witnesses[:4],interpretation='Literal individual-LUT counterfactual for independent roots; dependent-window rows describe two boundary functions, not a naturally recomputed single-LUT edit.'))
result=dict(analysis_only=True,round=9,source='Completed R9 stored contexts/configurations; no new simulation, no R10 outcome use.',records=records,source_hashes=sources)
(R/'state/round9_posthoc_joint_boundary.json').write_text(json.dumps(result,indent=2));print(json.dumps([r for r in records if r['essential_joint_boundary_rows']],indent=2))
