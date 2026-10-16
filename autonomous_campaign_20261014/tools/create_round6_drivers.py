from pathlib import Path
R=Path(__file__).resolve().parents[1];Q=R/'round6'
s=(R/'round3/tools/core3.py').read_text();s=s.replace("METHODS=['exact_joint','serial','budget_joint'];basis.METHODS=METHODS","METHODS=['exact_joint'];basis.METHODS=METHODS\nfrom common6 import base_code\nbasis.base_code=base_code")
start=s.index('def candidates(c):');end=s.index('basis.candidates=candidates')
candidate='''def candidates(c):
 n=c['name'];g=load(Q/f'graphs/{n}.json');ops,co,ins,nn,anc=build(g);depth={n:0 for n in set(co)|set(ins)}
 for o in ops:depth[o['out']]=1+max(depth[x]for x in o['ins'])
 lut=[o for o in ops if o['typ']=='lut'and 4<=o['k']<=6];pools={'control':[],'strict_new':[]}
 for a,b in itertools.combinations(lut,2):
  aa,bb=set(a['ins']),set(b['ins']);u=aa|bb;common=aa&bb
  if a['out']in anc[b['out']]or b['out']in anc[a['out']]:continue
  if a.get('props',{}).get('HLUTNM')and a.get('props',{}).get('HLUTNM')==b.get('props',{}).get('HLUTNM')and a['name'].rsplit('/',1)[0]==b['name'].rsplit('/',1)[0]:continue
  cls='control'if len(u)==5 else('strict_new'if min(a['k'],b['k'])>=5 and 6<=len(u)<=8 and len(common)<=4 else None)
  if cls is None:continue
  pools[cls].append(dict(a=a['name'],b=b['name'],a_out=a['out'],b_out=b['out'],a_ins=a['ins'],b_ins=b['ins'],a_init=a['init'],b_init=b['init'],support=sorted(u),shared=len(common),union=len(u),depth=max(depth[a['out']],depth[b['out']]),candidate_class=cls))
 pools['control'].sort(key=lambda p:(-p['shared'],p['depth'],p['a'],p['b']));pools['strict_new'].sort(key=lambda p:(-(len(p['a_ins'])+len(p['b_ins'])),-p['shared'],p['union'],p['depth'],p['a'],p['b']));pairs=[];degree=collections.Counter();counts={}
 for cls,cap in [('control',8),('strict_new',16)]:
  used=0
  for p in pools[cls]:
   if degree[p['a']]>=4 or degree[p['b']]>=4:continue
   pairs.append(p);degree.update([p['a'],p['b']]);used+=1
   if used==cap:break
  counts[cls]=dict(available=len(pools[cls]),registered=used)
 dump(Q/f'graphs/{n}_pairs.json',pairs);dump(Q/f'state/{n}_pool.json',counts);return g,pairs
'''
s=s[:start]+candidate+s[end:];s=s.replace("[('exact_joint',ee,0),('budget_joint',cc,budget)]","[('exact_joint',ee,0)]");start=s.index('    # Serial reference');end=s.index(' def structural_rank',start);s=s[:start]+s[end:]
s=s.replace(" src.write_text(s);return native_original(src,args,out)"," if src.name.endswith('_replay.cpp'):s=s.replace('if(method==0)eval0(v,mask);else if(method==1)eval1(v,mask);else eval2(v,mask);','eval0(v,mask);')\n src.write_text(s);return native_original(src,args,out)")
(Q/'tools/core6.py').write_text(s)

s=(R/'round4/tools/model4.py').read_text();s=s.replace("METHODS=['seed','abc_exact','relation']","METHODS=['seed','abc_exact','relation']\nfrom common6 import base_code,reference")
start=s.index(' old=R/');end=s.index('\ndef verify()',start)
s=s[:start]+''' pairs=load(Q/f'graphs/{n}_pairs.json');data=load(Q/f'results/{n}_methods.json');choices=relation_choices(n);new=ops
 for pi,m in choices:new=replace_ops(new,pairs[pi],data[pi]['methods'][m])
 new=reorder(new,set(co)|set(ins));assert new is not None;out['relation']=(g,new,co,ins,nn);return out

def relation_choices(n):
 manifest=load(Q/f'state/{n}_replay_manifest.json')[0];f=next(r for r in csv.DictReader((Q/f'results/{n}_replay.csv').open())if r['stage']=='final');mask=int(f['mask']);return[x for i,x in enumerate(manifest['choices'])if mask>>i&1]
''' + s[end:]
s=s.replace('reference(base+j,a,b,l,h);delta=', 'reference(base+j,a,b,l,h);if(seed[j]!=seed_expected(l))return 7;delta=')
start=s.index("   if m=='relation':text=");end=s.index('   canonical=',start)
s=s[:start]+'''   if m=='relation':
    pairs=load(Q/f'graphs/{n}_pairs.json');data={r['pair']:r for r in load(Q/f'results/{n}_methods.json')};text=export_rtl(g,relation_choices(n),pairs,data,top)
   else:text=export_rtl(g,[],[],{},top)
''' + s[end:]
s=s.replace("top=f'r4_{n}_{m}'","top=f'r6_{n}_{m}'").replace('R4_PASS','R6_PASS')
start=s.index("  rng=random.Random(20261014)");end=s.index('  vectors.update',start)
# Replace the complete old family-specific vector setup, including nested update statements.
end=s.index("  vectors.update((int(f['witness_A'])",start)
s=s[:start]+'''  rng=random.Random(20261014)
  if c['kind']=='sqrt_exact':vectors={(a,0)for a in range(65536)}
  else:
   vals=[0,1,2,3,7,15,16,31,32,63,64,127,128,254,255];vectors=set(itertools.product(vals,vals));vectors.update((rng.randrange(256),rng.randrange(65536 if c['kind']=='mac'else 256))for _ in range(4096))
   if c['kind']=='mac':vectors.update((a,b|(z<<8))for a,b,z in itertools.product(vals,[0,1,127,255],[0,1,127,255]))
''' + s[end:]
s=s.replace("ref=a*b if c['kind']=='mul'else math.isqrt(a)","ref=reference(c,a,b)")
s=s.replace("records=load(Q/'state/abc_validation.json')if(Q/'state/abc_validation.json').exists()else[]","records=load(Q/'state/abc_validation.json')if(Q/'state/abc_validation.json').exists()else[]")
(Q/'tools/model6.py').write_text(s)
s=(R/'round4/tools/hardware4.py').read_text().replace('from model4 import','from model6 import').replace('R4_PASS','R6_PASS');(Q/'tools/hardware6.py').write_text(s)
print('Round6 drivers created')
