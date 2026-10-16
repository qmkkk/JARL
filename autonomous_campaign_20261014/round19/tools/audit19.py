"""Finite audit limited to the final numerical mapping and streaming-core claims."""
from pathlib import Path
import sys,json,hashlib,itertools,random,csv,datetime,subprocess,importlib.metadata
Q=Path(__file__).resolve().parents[1];R=Q.parent;P=R/'round18';sys.dont_write_bytecode=True;sys.path.insert(0,str(R/'tools'));import core
load=lambda p:json.loads(p.read_text(encoding='utf-8'));dump=lambda p,x:p.write_text(json.dumps(x,indent=2,ensure_ascii=False),encoding='utf-8')
assert load(P/'state/round_status.json')['status']=='COMPLETE'
checks=[];rng=random.Random(20261019)
for trial in range(128):
 ma=rng.randrange(4);mb=rng.randrange(4);ga=sorted({r&ma for r in range(32)});gb=sorted({r&mb for r in range(32)});va={k:rng.randrange(2)for k in ga};vb={k:rng.randrange(2)for k in gb};allowed=core.np.array([[rng.random()<.45 for q in range(4)]for r in range(32)],dtype=bool)
 for r in range(32):allowed[r,va[r&ma]+2*vb[r&mb]]=True
 if trial%3==0:allowed[rng.randrange(32),:]=False
 found=False
 for bits in itertools.product([0,1],repeat=len(ga)+len(gb)):
  av=dict(zip(ga,bits));bv=dict(zip(gb,bits[len(ga):]))
  if all(allowed[r,av[r&ma]+2*bv[r&mb]]for r in range(32)):found=True;break
 for reverse in [False,True]:
  ans=core.sat_assignment(allowed,ma,mb,reverse);assert (ans is not None)==found,(trial,ma,mb)
checks.append(dict(check='2SAT_feasibility_independent_bruteforce',cases=128,traversals=256,status='PASS',scope='Reduced support masks, satisfiable andunsatisfiable relations; mathematical proof covers general fixedmasks.'))
count=0
for c in load(Q/'configs/plan.json')['cases']:
 n=c['name'];w=c['width'];assert 2*w+c['add_width']==c['domain_bits']==24
 removed=sum(1<<(i+j)for i in range(w)for j in range(w)if i+j<c['cut']);assert removed==c['removed_max']and c['compensation']==removed//2 and (removed+1)//2<=c['budget']
 assert 16*((2**w-1)**2+c['budget'])<2**32
 pairs=load(P/f'graphs/{n}_pairs.json')
 verify=list(csv.DictReader((P/f'results/{n}_verify.csv').open()));exact=next(r for r in verify if r['method']=='state_exact');assert int(exact['seed_max_delta'])==0,('EXACT_ABLATION_CHANGED_OUTPUT',n)
 for method in ['static_full','state_const5','state_exact','state_window']:
  history=load(P/f'state/{n}_{method}_state.json')['history']
  for ev in history:
   if ev['status']!='ACCEPTED':continue
   pair=pairs[ev['pair']];cf=ev['configuration'];sup=pair['support'];bound=0 if method=='state_exact'else c['budget'];lo='current_error_lo'if method=='state_exact'else'error_lo';hi='current_error_hi'if method=='state_exact'else'error_hi'
   assert len(cf['shared'])==5 and len(set(cf['shared']))==5 and set(cf['shared'])<=set(sup)
   if method=='state_const5':assert cf['select']is None
   table={(int(z['row']),int(z['q'])):z for z in csv.DictReader(Path(ev['context']['path']).open())}
   for row in {r for r,q in table}:
    idx=sum(((row>>sup.index(net))&1)<<i for i,net in enumerate(cf['shared']));aa=(int(cf['initA'],16)>>idx)&1;bb=(int(cf['initB'],16)>>idx)&1;sel=1 if cf['select']is None else(row>>sup.index(cf['select']))&1;six=aa if sel else bb;qq=six+2*bb if cf['mode']=='f6'else bb+2*six;z=table[row,qq];assert max(abs(int(z[lo])),abs(int(z[hi])))<=bound;(count:=count+1)
   assert ev['full_check']['WCE']<=c['budget']
checks.append(dict(check='actual_accepted_functions_against_full_relation',reachable_rows=count,status='PASS'))
checks.append(dict(check='input_domains_column_reference_32bit_composition_overflow',cases=3,status='PASS'))
import numpy as np
composition=[]
for c in load(Q/'configs/plan.json')['cases']:
 n=c['name'];w=c['width'];blocks=load(P/f'rtl/integration/{n}_input_blocks.json')
 for method in ['seed','quadol_wce','state_window']:
  table=np.fromfile(P/f'results/product_tables/{n}_{method}.bin',dtype='<u4').reshape(1<<w,1<<w);errors=[sum(int(table[b,a])-a*b for a,b in block)for block in blocks];assert max(map(abs,errors))<=16*c['budget'];composition.append(dict(case=n,method=method,blocks=len(blocks),observed_max_error=max(map(abs,errors)),proved_bound=16*c['budget']))
checks.append(dict(check='independent_composition_math_on_all_HDL_blocks',status='PASS',rows=composition))
expected=load(Q/'input/expected_round18.json');assert len(expected['core'])==18 and len(expected['integration'])==9 and len(expected['application']['rows'])==108
def version_command(key,cmd):
 p=subprocess.run(cmd,capture_output=True,creationflags=subprocess.CREATE_NO_WINDOW)
 (Q/f'logs/version_{key}.stdout.bin').write_bytes(p.stdout);(Q/f'logs/version_{key}.stderr.bin').write_bytes(p.stderr)
 def decode(b):return b.decode('utf-16-le',errors='replace')if b'\x00'in b else b.decode('utf-8',errors='replace')
 receipt=dict(argv=cmd,returncode=p.returncode,stdout=decode(p.stdout),stderr=decode(p.stderr));dump(Q/f'state/version_{key}_receipt.json',receipt)
 assert p.returncode==0 or(key=='vivado'and p.returncode==1 and not p.stderr and receipt['stdout'].startswith('vivado v2026.1 (64-bit)')and 'SW Build 6511674'in receipt['stdout']),receipt
 return receipt['stdout'].strip()

versions=dict(python=sys.version,packages={n:importlib.metadata.version(n)for n in ['numpy','networkx','scikit-image','pillow']})
for key,cmd in [('g++',['wsl','-d','Ubuntu','-u','k','--','g++','--version']),('vivado',['E:/AMDDesignTools/2026.1/Vivado/bin/vivado.bat','-version'])]:
 versions[key]=version_command(key,cmd)
vexe=Path('E:/AMDDesignTools/2026.1/Vivado/bin/unwrapped/win64.o/vivado.exe');versions['vivado_binary_sha256']=hashlib.sha256(vexe.read_bytes()).hexdigest();versions['python_binary_sha256']=hashlib.sha256(Path(sys.executable).read_bytes()).hexdigest()
versions['g++_binary_sha256']=version_command('g++_hash',['wsl','-d','Ubuntu','-u','k','--','sha256sum','/usr/bin/g++'])
dump(Q/'state/tool_versions.json',versions)
dump(Q/'state/core_claim_audit.json',dict(status='PASS',completed=datetime.datetime.now().astimezone().isoformat(),checks=checks,repairs=[],scope='No general bughunt. Domain, analyticreference, actualcofactoradmissibility,2SATsoundness,wideaccumulator overflow andsourceprovenance. Sequential latency andfullmath/HDL rechecked by formalrun.'))
f=load(Q/'state/freeze_manifest.json');assert f['status']=='PREPARED_PENDING_CORE_AUDIT'
for p in [vexe,Path(sys.executable),Q/'state/tool_versions.json',Q/'state/core_claim_audit.json']:f['files'][str(p)]=hashlib.sha256(p.read_bytes()).hexdigest()
f.update(status='FROZEN_AUDIT_PASSED',audit_sha256=hashlib.sha256((Q/'state/core_claim_audit.json').read_bytes()).hexdigest(),frozen=datetime.datetime.now().astimezone().isoformat());dump(Q/'state/freeze_manifest.json',f);print('CORE_CLAIM_AUDIT_PASS_AND_FROZEN',count,flush=True)
