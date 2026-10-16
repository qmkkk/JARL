from pathlib import Path
import ast,hashlib,json
R=Path(__file__).resolve().parents[1];Q=R/'round12';old=R/'round10/tools'
def save(name,s):
 ast.parse(s);p=Q/'tools'/name;assert not p.exists();p.write_text(s)
def replace(s,a,b):assert s.count(a)==1,(a,s.count(a));return s.replace(a,b)
save('common12.py',(old/'common10.py').read_text())
s=(old/'core10.py').read_text().replace('from common10','from common12')
s=replace(s,"METHODS=['local_window','numeric_pair','numeric_window']","METHODS=['numeric_window']")
s=replace(s,"[('local_window',ll,0),('numeric_pair',cc,budget),('numeric_window',cc,budget)]","[('numeric_window',cc,budget)]")
s=replace(s,"for mi in [0]:","for mi in []:")
s=replace(s,'src.write_text(s);return native_original(src,args,out)',"if src.name.endswith('_replay.cpp'):s=replace_once(s,'if(method==0)eval0(v,mask);else if(method==1)eval1(v,mask);else eval2(v,mask);','eval0(v,mask);')\n src.write_text(s);return native_original(src,args,out)")
save('core12.py',s)
s=(old/'model10.py').read_text().replace('from common10','from common12').replace('r10_','r12_').replace('R10_PASS','R12_PASS');s=replace(s,"METHODS=['seed','local_window','numeric_pair','numeric_window']","METHODS=['seed','numeric_window']")
save('model12.py',s)
save('hardware12.py',(old/'hardware10.py').read_text().replace('from model10','from model12').replace('R10_PASS','R12_PASS'))
s=(old/'abc10.py').read_text().replace('from common10','from common12').replace('strash; dc2; if -K 6; mfs2','strash; dc2; dch; if -a -K 6; mfs2')
s=replace(s,"n=c['name'];g=load(Q/f'graphs/{n}_raw.json');d=Q/f'build/abc_{n}';", "n=c['name'];g=load(Q/f'graphs/{n}_raw.json')\n if c['flow']=='native':\n  build(g);dump(Q/f'graphs/{n}.json',g);dump(Q/f'graphs/{n}_seed.json',g);print('NATIVE_INPUT_READY',n,flush=True);continue\n d=Q/f'build/abc_{n}';")
save('abc12.py',s)
s=(old/'run10.py').read_text().replace('core10.py','core12.py').replace('model10.py','model12.py').replace('hardware10.py','hardware12.py').replace('analyze10.py','analyze12.py').replace('explain10.py','explain12.py').replace('plot10.py','plot12.py')
# Add input mapping as a first stage, and use dedicated final analysis/plot later.
s=s.replace("steps=[", "steps=[('abc12.py',),",1)
# Exact driver syntax varies; remove inference-only diagnostic scripts from execution.
s=s.replace(",('explain12.py',)","").replace(",('plot12.py',)","")
save('run12.py',s)
(Q/'state/imported_driver_hashes.json').write_text(json.dumps({str(p):hashlib.sha256(p.read_bytes()).hexdigest()for p in old.glob('*.py')},indent=2));print('Round12drivers ready')
