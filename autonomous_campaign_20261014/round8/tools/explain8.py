"""Analyze all recorded candidate contexts only after the fixed round ends."""
from model8 import Q,load,dump,choices
import csv,collections
def bit(init,inputs,support,row):
 return(init>>sum(((row>>support.index(n))&1)<<j for j,n in enumerate(inputs)))&1
def main():
 assert load(Q/'state/analysis.json')['status']in ['COMPLETE_AWAIT_SCORE','COMPLETE_SCORED'];out=[]
 for c in load(Q/'configs/plan.json')['cases']:
  n=c['name'];ps=load(Q/f'graphs/{n}_pairs.json');mm=load(Q/f'results/{n}_methods.json');accepted={i for i,m in choices(n,'relation')};details=[]
  for pi,p in enumerate(ps):
   allowed=collections.defaultdict(set);counts={};support=p['support'];cf=mm[pi]['methods']['relation'];stats=collections.Counter();examples=[]
   for r in csv.DictReader((Q/f'results/{n}_pair{pi}.csv').open()):
    row=int(r['row']);counts[row]=int(r['count'])
    if int(r['seed_error_lo'])==0 and int(r['seed_error_hi'])==0:allowed[row].add(int(r['q']))
   for row,vv in allowed.items():
    f=bit(p['a_init'],p['a_ins'],support,row);g=bit(p['b_init'],p['b_ins'],support,row);old=f+2*g;assert old in vv;nonrect=len(vv)!=len({q&1 for q in vv})*len({q>>1 for q in vv});stats['nonrectangular_rows']+=nonrect;stats['reachable_rows']+=1;stats['contexts']+=counts[row]
    if cf:
     aa=bit(int(cf['initA'],16),cf['shared'],support,row);bb=bit(int(cf['initB'],16),cf['shared'],support,row);sel=1 if cf['select']is None else(row>>support.index(cf['select']))&1;six=aa if sel else bb;new=six+2*bb if cf['mode']=='f6'else bb+2*six;assert new in vv;essential=(new^old)==3 and (new&1)+2*g not in vv and f+2*(new>>1)not in vv;stats['changed_rows']+=new!=old;stats['essential_joint_rows']+=essential
     if(new!=old or nonrect)and len(examples)<3:examples.append(dict(row=row,old=old,new=new,allowed=sorted(vv),contexts=counts[row],essential_joint=essential))
   details.append(dict(pair=pi,accepted=pi in accepted,candidate_class=p['candidate_class'],union=p['union'],local_eligible=mm[pi]['methods']['local_exact']is not None,relation_eligible=cf is not None,unobserved_rows=(1<<len(support))-len(counts),statistics=dict(stats),examples=examples))
  total=lambda key:sum(x['statistics'].get(key,0)for x in details)
  out.append(dict(case=n,exhaustive_context=c['domain_bits']<=16,pairs=details,nonrectangular_rows_all_candidates=total('nonrectangular_rows'),essential_joint_rows_all_eligible=total('essential_joint_rows'),new_feasible_pairs=sum(x['relation_eligible']and not x['local_eligible']for x in details),new_feasible_accepted_pairs=sum(x['accepted']and not x['local_eligible']for x in details)))
 dump(Q/'state/relation_attribution.json',dict(scope='Recorded seed-context attribution; sampled MAC unseen rows are not proved unreachable. Final combined designs were separately checked exhaustively.',cases=out));print([{k:v for k,v in x.items()if k!='pairs'}for x in out])
if __name__=='__main__':main()
