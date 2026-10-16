"""Post-round attribution from recorded contexts; no new optimization or experiment."""
from model6 import Q,load,dump,relation_choices
import csv,collections

def bit(init,inputs,support,row):
 i=sum(((row>>support.index(n))&1)<<j for j,n in enumerate(inputs))
 return (init>>i)&1

def main():
 assert load(Q/'state/progress.json')['phase']=='ALL_CORE_EXPERIMENTS_COMPLETE'
 out=[]
 for c in load(Q/'configs/plan.json')['cases']:
  n=c['name'];pairs=load(Q/f'graphs/{n}_pairs.json');methods=load(Q/f'results/{n}_methods.json');details=[]
  for pi,m in relation_choices(n):
   p=pairs[pi];cf=methods[pi]['methods'][m];support=p['support'];allowed=collections.defaultdict(set);counts={}
   for r in csv.DictReader((Q/f'results/{n}_pair{pi}.csv').open()):
    row=int(r['row']);counts[row]=int(r['count'])
    if int(r['seed_error_lo'])==0 and int(r['seed_error_hi'])==0:allowed[row].add(int(r['q']))
   stats=collections.Counter();examples=[]
   for row in counts:
    f=bit(p['a_init'],p['a_ins'],support,row);g=bit(p['b_init'],p['b_ins'],support,row);old=f+2*g
    aa=bit(int(cf['initA'],16),cf['shared'],support,row);bb=bit(int(cf['initB'],16),cf['shared'],support,row);sel=1 if cf['select']is None else(row>>support.index(cf['select']))&1;six=aa if sel else bb
    new=six+2*bb if cf['mode']=='f6'else bb+2*six
    assert old in allowed[row] and new in allowed[row]
    vv=allowed[row];nonrect=len(vv)!=len({q&1 for q in vv})*len({q>>1 for q in vv});stats['reachable_rows']+=1;stats['nonrectangular_relation_rows']+=nonrect
    changed=new!=old;stats['reachable_rows_with_internal_change']+=changed;stats['contexts_with_internal_change']+=counts[row]*changed
    essential=(new^old)==3 and (new&1)+2*g not in vv and f+2*(new>>1)not in vv
    stats['essential_joint_change_rows']+=essential
    if changed and len(examples)<3:examples.append(dict(row=row,old_q=old,new_q=new,allowed_q=sorted(vv),essential_joint=essential,observed_contexts=counts[row]))
   details.append(dict(pair=pi,candidate_class=p['candidate_class'],fanin=[len(p['a_ins']),len(p['b_ins'])],union=p['union'],reachable_support_rows=len(counts),total_support_rows=1<<len(support),unobserved_support_rows=(1<<len(support))-len(counts),statistics=dict(stats),examples=examples))
  out.append(dict(case=n,context_is_exhaustive=c['domain_bits']<=16,accepted_pairs=details))
 dump(Q/'state/relation_attribution.json',dict(scope='Seed contexts used for candidate generation; joint final network separately checked over its entire effective input domain. MAC contexts sampled. Nonrectangular relations do not alone establish contribution novelty.',cases=out))
 print(out)
if __name__=='__main__':main()
