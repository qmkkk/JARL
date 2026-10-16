from common12 import Q,R,load,dump
import sys,hashlib
sys.path.insert(0,str(R/'round7/tools'))
import model7
sys.path.insert(0,str(R/'round6/tools'))
import model6
import core
core.Q=Q
from core import linux,run,build
records=[]
for c in load(Q/'configs/plan.json')['cases']:
 n=c['name'];g=load(Q/f'graphs/{n}_raw.json')
 if c['flow']=='native':
  build(g);dump(Q/f'graphs/{n}.json',g);dump(Q/f'graphs/{n}_seed.json',g);print('NATIVE_INPUT_READY',n,flush=True);continue
 d=Q/f'build/abc_{n}';assert not d.exists();d.mkdir();helper=model7 if c['starting_method']=='abc_global'else model6;text,stats=helper.blif(g);src=d/'source.blif';dst=d/'mapped.blif';src.write_text(text);exe=linux(Q/'inputs/abc_executable');dump(Q/'state/progress.json',dict(phase='ABC_MAP_CEC',case=n))
 run(['wsl','-d','Ubuntu','-u','k','--',exe,'-c',f'read_blif {linux(src)}; strash; dc2; dch; if -a -K 6; mfs2; print_stats; write_blif {linux(dst)}'],d/'map.log');assert dst.exists()
 run(['wsl','-d','Ubuntu','-u','k','--',exe,'-c',f'cec {linux(src)} {linux(dst)}'],d/'cec.log');assert 'Networks are equivalent'in(d/'cec.log').read_text()
 mapped=helper.parse(g,dst);build(mapped);dump(Q/f'graphs/{n}.json',mapped);dump(Q/f'graphs/{n}_seed.json',mapped);records.append(dict(case=n,starting_method=c['starting_method'],source=stats,cec='PASS',source_sha256=hashlib.sha256(src.read_bytes()).hexdigest(),mapped_sha256=hashlib.sha256(dst.read_bytes()).hexdigest()));dump(Q/'state/abc_validation.json',records);print('ABC_CEC_PASS',n,flush=True)
