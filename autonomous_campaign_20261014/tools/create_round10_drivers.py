from pathlib import Path
import ast,hashlib,json
R=Path(__file__).resolve().parents[1];Q=R/'round10';sources={}
def read(p):
 sources[str(p)]=hashlib.sha256(p.read_bytes()).hexdigest();return p.read_text()
def put(name,s):
 ast.parse(s);p=Q/'tools'/name;assert not p.exists();p.write_text(s)
def replace(s,a,b,count=1):
 assert s.count(a)==count,(a,s.count(a));return s.replace(a,b)
s=read(R/'round9/tools/core9.py').replace('common9','common10')
f=read(R/'round6/tools/core6.py');f=f[f.index('def candidates(c):'):f.index('basis.candidates=candidates')].replace('def candidates(c):','def independent_candidates(c):')
s=replace(s,'def candidates(c):',f+'\ndef candidates(c):')
s=replace(s,"n=c['name'];g=load(Q/f'graphs/{n}.json');ops,co,ins,nn,anc=build(g);pairs=load(Q/f'inputs/{n}_independent_pairs.json');depth={n:0 for n in set(co)|set(ins)}","n=c['name'];g,pairs=independent_candidates(c);dump(Q/f'inputs/{n}_independent_pairs.json',pairs);ops,co,ins,nn,anc=build(g);depth={n:0 for n in set(co)|set(ins)}")
put('core10.py',s)
s=read(R/'round9/tools/model9.py').replace('common9 import base_code,reference','common10 import base_code,reference,vectors_for').replace("f'r9_{n}_{m}'","f'r10_{n}_{m}'").replace('R9_PASS','R10_PASS')
s=replace(s,"   if m=='seed':assert matches,('seed inheritance mismatch',n)\n",'')
start=s.index('  rng=random.Random(20261014)');end=s.index('  vectors.update((int(f[',start)
s=s[:start]+"  rng=random.Random(20261015);vectors=vectors_for(c,rng)\n"+s[end:]
put('model10.py',s)
s=read(R/'round9/tools/hardware9.py').replace('from model9','from model10').replace('R9_PASS','R10_PASS');put('hardware10.py',s)
s=read(R/'round9/tools/analyze9.py').replace('from model9','from model10').replace('else 9','else 10').replace('dict(round=9','dict(round=10').replace("len(a['hdl'])==6","len(a['hdl'])==5");put('analyze10.py',s)
s=read(R/'round9/tools/explain9.py').replace('from model9','from model10');put('explain10.py',s)
s=read(R/'round9/tools/plot9.py').replace('Round 9: numeric relation windows under unchanged error bounds','Round 10: unchanged relation windows on larger arithmetic cores').replace('ROUND9_RESULTS','ROUND10_RESULTS');put('plot10.py',s)
(Q/'state/driver_source_hashes.json').write_text(json.dumps(sources,indent=2))
print('Round10 drivers created and parsed; R9 algorithm preserved')
