from pathlib import Path
import sys,math
sys.dont_write_bytecode=True
Q=Path(__file__).resolve().parents[1];R=Q.parent
sys.path.insert(0,str(R/'round6/tools'))
import common6
import core
core.Q=Q
def base_code(c,g):
 if c['kind']=='sqrt':
  v=core.base_code(c,g);v[0].append('static U seed_expected(U x){return x|1;}');return v
 return common6.base_code(c,g)
def reference(c,a,b):
 return math.isqrt(a) if c['kind']=='sqrt' else common6.reference(c,a,b)
