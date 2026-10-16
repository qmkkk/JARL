from model9 import Q,load,dump,choices,METHODS
import csv,collections
def bit(init,inputs,support,row):return(init>>sum(((row>>support.index(n))&1)<<j for j,n in enumerate(inputs)))&1
def main():
 assert load(Q/'state/analysis.json')['status']in ['COMPLETE_AWAIT_SCORE','COMPLETE_SCORED'];cases=[]
 for c in load(Q/'configs/plan.json')['cases']:
  n=c['name'];pairs=load(Q/f'graphs/{n}_pairs.json');records=load(Q/f'results/{n}_methods.json');by_method={}
  for m in METHODS[1:]:
   out=[]
   for pi,k in choices(n,m):
    p=pairs[pi];cf=records[pi]['methods'][m];sup=p['support'];allowed=collections.defaultdict(set);counts={};stats=collections.Counter();examples=[]
    for r in csv.DictReader((Q/f'results/{n}_pair{pi}.csv').open()):
     row=int(r['row']);counts[row]=int(r['count'])
     if max(abs(int(r['error_lo'])),abs(int(r['error_hi'])))<=c['budget']:allowed[row].add(int(r['q']))
    for row,vv in allowed.items():
     f=p['window_a_truth'][row]if 'window_a_truth'in p else bit(p['a_init'],p['a_ins'],sup,row);h=p['window_b_truth'][row]if 'window_b_truth'in p else bit(p['b_init'],p['b_ins'],sup,row);old=f+2*h;aa=bit(int(cf['initA'],16),cf['shared'],sup,row);bb=bit(int(cf['initB'],16),cf['shared'],sup,row);sel=1 if cf['select']is None else(row>>sup.index(cf['select']))&1;six=aa if sel else bb;new=six+2*bb if cf['mode']=='f6'else bb+2*six;assert old in vv and new in vv
     stats['observed_support_rows']+=1;stats['root_values_changed_rows']+=old!=new;stats['nonrectangular_numeric_rows']+=len(vv)!=len({q&1 for q in vv})*len({q>>1 for q in vv})
     if old!=new and len(examples)<3:examples.append(dict(row=row,old=old,new=new,numeric_allowed=sorted(vv),observed_contexts=counts[row]))
    out.append(dict(pair=pi,kind=p['candidate_class'],union=p['union'],original_fanins=[len(p['a_ins']),len(p['b_ins'])],exact_window_eligible=records[pi]['methods']['local_window']is not None,statistics=dict(stats),examples=examples))
   by_method[m]=out
  cases.append(dict(case=n,proposal_context_is_exhaustive=c['domain_bits']<=16,accepted=by_method))
 dump(Q/'state/window_attribution.json',dict(scope='Candidate seed contexts; not a literal single-LUT counterfactual for dependent windows. Final full-network arithmetic verification is separate.',cases=cases));print([{c['case']:{m:dict(accepted=len(v),dependent=sum(x['kind']=='dependent_window'for x in v),not_locally_exact=sum(not x['exact_window_eligible']for x in v))for m,v in c['accepted'].items()}}for c in cases])
if __name__=='__main__':main()
