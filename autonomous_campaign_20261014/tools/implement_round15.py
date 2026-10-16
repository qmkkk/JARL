from pathlib import Path
import ast
R=Path(__file__).resolve().parents[1];Q=R/'round15'
s=(R/'round13/tools/model13.py').read_text().replace('common13','common15').replace("METHODS=['seed','numeric_window','packing_window']","METHODS=['quantized','quadol_wce','numeric_window']\nfrom direct15 import quadol_rtl").replace('r13_','r15_').replace('R13_PASS','R15_PASS')
a=s.index('def choices');b=s.index('def verify')
s=s[:a]+'''def choices(n,method):
 assert method=='numeric_window'
 manifest=load(Q/f'state/{n}_replay_manifest.json')[0];f=next(r for r in csv.DictReader((Q/f'results/{n}_replay.csv').open())if r['stage']=='final'and int(r['method'])==0);mask=int(f['mask']);return[x for i,x in enumerate(manifest['choices'])if mask>>i&1]

def models(c):
 n=c['name'];g=load(Q/f'graphs/{n}_seed.json');ops,co,ins,nn,_=build(g);out={'seed':(g,ops,co,ins,nn)}
 for m in ['quantized','quadol_wce']:
  gm=load(Q/f'graphs/{n}_{m}.json');op,k,i,sz,_=build(gm);out[m]=(gm,op,k,i,sz)
 pairs=load(Q/f'graphs/{n}_pairs.json');data=load(Q/f'results/{n}_methods.json');new=ops
 for pi,m in choices(n,'numeric_window'):new=replace_ops(new,pairs[pi],data[pi]['methods'][m])
 new=reorder(new,set(co)|set(ins));assert new is not None;out['numeric_window']=(g,new,co,ins,nn);return out

def unpack_method(g,m):
 s=[f'static void unpack_{m}(const U*v,uint32_t*out){{std::fill(out,out+64,0);']
 for i in range(32):s.append(f'{{U b=v[{g["ports"][f"Y[{i}]"]}];while(b){{int j=__builtin_ctzll(b);out[j]|=uint32_t(1)<<{i};b&=b-1;}}}}')
 return '\\n'.join(s+['}'])

'''+s[b:]
s=s.replace("s.append(emit_ops(op,co,'eval_'+m))","s.append(emit_ops(op,co,'eval_'+m));s.append(unpack_method(gm,m))")
s=s.replace('EVAL(v);unpack(v,out);','EVAL(v);unpack_LABEL(v,out);')
s=s.replace("selected=[]if m=='seed'else choices(n,m)","selected=choices(n,m)if m=='numeric_window'else[]")
s=s.replace('text=export_rtl(g,selected,pairs,data,top)','text=quadol_rtl(c,g,top)if m==\'quadol_wce\'else export_rtl(g,selected,pairs,data,top)')
ast.parse(s);p=Q/'tools/model15.py';assert not p.exists();p.write_text(s,encoding='utf-8')
for p in(Q/'tools').glob('*.py'):ast.parse(p.read_text())
print('Round15 model and drivers parsed')
