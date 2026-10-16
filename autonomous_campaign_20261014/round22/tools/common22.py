from pathlib import Path
import sys
sys.dont_write_bytecode=True
Q=Path(__file__).resolve().parents[1];R=Q.parent
sys.path.insert(0,str(R/'tools'))
import core
core.Q=Q
from core import load,dump,build,COMMON
def base_code(*args):raise RuntimeError('Use sampled_context22, not exhaustive common code')
def reference(*args):raise RuntimeError('Reference is pinned author circuit, not multiplication')
