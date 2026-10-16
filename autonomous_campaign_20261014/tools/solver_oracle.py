"""Small independent brute-force oracle for the new 2-SAT feasibility primitive."""
import itertools,random,json
from core import np,sat_assignment,Q,dump
rng=random.Random(20261014);checks=0;feasible=0
for ma,mb in itertools.product([0,1,2,3],repeat=2):
 ga=sorted(set(r&ma for r in range(32)));gb=sorted(set(r&mb for r in range(32)))
 for case in range(32):
  # Repeated higher rows do not all have to agree: that tests support removal.
  allowed=np.array([[rng.random()<.8 for _ in range(4)]for r in range(32)])
  if case%2==0:
   a={r:rng.randrange(2)for r in ga};b={r:rng.randrange(2)for r in gb}
   for r in range(32):allowed[r,a[r&ma]+2*b[r&mb]]=True
  witness=None
  for v in itertools.product([0,1],repeat=len(ga)+len(gb)):
   a=dict(zip(ga,v));b=dict(zip(gb,v[len(ga):]));q=[a[r&ma]+2*b[r&mb]for r in range(32)]
   if all(allowed[r,q[r]]for r in range(32)):witness=q;break
  got=sat_assignment(allowed,ma,mb)
  assert (got is None)==(witness is None),(ma,mb,case)
  if got is not None:assert all(allowed[r,got[r]]for r in range(32));feasible+=1
  checks+=1
dump(Q/'state/solver_oracle.json',dict(status='PASS',instances=checks,feasible=feasible,oracle='enumerate all assignments up to eight independent Boolean variables; compare SAT/UNSAT and verify returned witness',scope='independent oracle for small support masks, not exhaustive validation of all 64-variable cases'))
print('solver oracle PASS',checks,feasible)
