from pathlib import Path
R=Path(__file__).resolve().parents[1];Q=R/'round7'
common='''from pathlib import Path
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
'''
(Q/'tools/common7.py').write_text(common)
s=(R/'round6/tools/model6.py').read_text().replace("METHODS=['seed','abc_exact','relation']","METHODS=['abc_global']").replace('from common6 import base_code,reference','from common7 import base_code,reference\ncore.Q=Q')
blif='''def blif(g):
 ops,co,ins,nn,_=build(g);regs={c['name']for c in g['cells']if c['type'].startswith('FD')};logic=[o for o in ops if o['name']not in regs];drivers={o['out']for o in logic};boundary_inputs=sorted({n for o in logic for n in o['ins']}-drivers-set(co));sinks={n for c in g['cells']if c['name']in regs for pin,n in c['pins'].items()if pin in ['D','CE','R','S']}|{n for k,n in g['ports'].items()if k.startswith('Y[')};outputs=sorted(drivers&sinks)
 allowed_inputs=set(ins)|{c['pins']['Q']for c in g['cells']if c['name']in regs};assert set(boundary_inputs)<=allowed_inputs
 lines=['.model whole_comb','.inputs '+' '.join(f'n{n}'for n in boundary_inputs),'.outputs '+' '.join(f'n{n}'for n in outputs)]
 for n,b in co.items():lines += [f'.names n{n}']+(['1']if b else[])
 for o in logic:
  k=len(o['ins'])
  if o['typ']=='lut':init=o['init']
  else:
   def val(r):
    b=[(r>>i)&1 for i in range(k)]
    return {'or':lambda:b[0]|b[1],'andnot':lambda:b[0]&(1-b[1]),'xor':lambda:b[0]^b[1],'not':lambda:1-b[0],'mux':lambda:b[2]if b[0]else b[1]}[o['typ']]()
   init=sum(val(r)<<r for r in range(1<<k))
  if init in [0,(1<<(1<<k))-1]:lines += [f'.names n{o["out"]}']+(['1']if init else[]);continue
  lines.append('.names '+' '.join(f'n{n}'for n in o['ins']+[o['out']]))
  for r in range(1<<k):
   if init>>r&1:lines.append(''.join(str((r>>i)&1)for i in range(k))+' 1')
 lines.append('.end');return '\\n'.join(lines)+'\\n',dict(logic_nodes=len(logic),inputs=len(boundary_inputs),outputs=len(outputs),expanded_CARRY4=sum(c['type']=='CARRY4'for c in g['cells']))

'''
s=s[:s.index('def blif(g):')]+blif+s[s.index('def parse(g,path):'):]
s=s.replace("names={};nextnet=g['n_nets'];defs=[];i=0","names={};original_limit=build(g)[3];nextnet=original_limit;defs=[];i=0").replace("int(s[1:])<g['n_nets']","int(s[1:])<original_limit")
s=s.replace("cells=[c for c in g['cells']if not re.fullmatch('LUT[1-6]',c['type'])]","cells=[c for c in g['cells']if c['type'].startswith('FD')or c['type']in ['GND','VCC']]")
s=s.replace("origin='R4 carry-preserving ABC exact LUT-region resynthesis'","origin='R7 ABC whole combinational resynthesis, registers preserved, CARRY4 expanded'")
s=s.replace('abc_exact','abc_global').replace("f'build/abc_{n}_constant_fix'","f'build/abc_{n}_retry'")
start=s.index('def models(c):');end=s.index('def verify():')
s=s[:start]+'''def models(c):
 n=c['name'];g=load(Q/f'graphs/{n}_seed.json');ops,co,ins,nn,_=build(g);out={'seed':(g,ops,co,ins,nn)};ga=load(Q/f'graphs/{n}_abc_global.json');oa,ca,ia,na,_=build(ga);out['abc_global']=(ga,oa,ca,ia,na);return out

'''+s[end:]
# No relation re-optimization or new inherited design exports.
start=s.index("   if m=='relation':");end=s.index("   canonical=text.replace",start)
s=s[:start]+"   text=export_rtl(g,[],[],{},top)\n"+s[end:]
s=s.replace("top=f'r6_{n}_{m}'","top=f'r7_{n}_{m}'").replace('R6_PASS','R7_PASS')
s=s.replace("if c['kind']=='sqrt_exact':vectors={(a,0)for a in range(65536)}","if c['kind']in ['sqrt','sqrt_exact']:vectors={(a,0)for a in range(1<<c['domain_bits'])}")
s=s.replace("sha256=hashlib.sha256(text.encode()).hexdigest(),canonical_sha256=digest","sha256=hashlib.sha256((S/f'{top}.v').read_bytes()).hexdigest(),normalized_text_sha256=hashlib.sha256(text.encode()).hexdigest(),canonical_sha256=digest")
(Q/'tools/model7.py').write_text(s)
s=(R/'round6/tools/hardware6.py').read_text().replace('from model6 import','from model7 import').replace('R6_PASS','R7_PASS');(Q/'tools/hardware7.py').write_text(s)
import ast
for p in (Q/'tools').glob('*.py'):ast.parse(p.read_text());print(p.name,'syntax PASS')
