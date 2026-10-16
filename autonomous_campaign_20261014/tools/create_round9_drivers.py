from pathlib import Path
import ast
R=Path(__file__).resolve().parents[1];Q=R/'round9'
def once(s,a,b):
 assert s.count(a)==1,(a,s.count(a));return s.replace(a,b)
(Q/'tools/common9.py').write_text((R/'round8/tools/common8.py').read_text())
s=(R/'round8/tools/core8.py').read_text().replace('common8 import','common9 import').replace("METHODS=['local_exact','relation']","METHODS=['local_window','numeric_pair','numeric_window']")
start=s.index('def candidates(c):');end=s.index('basis.candidates=candidates')
s=s[:start]+'''def candidates(c):
 n=c['name'];g=load(Q/f'graphs/{n}.json');ops,co,ins,nn,anc=build(g);pairs=load(Q/f'inputs/{n}_independent_pairs.json');depth={n:0 for n in set(co)|set(ins)}
 for o in ops:depth[o['out']]=1+max(depth[x]for x in o['ins'])
 luts=[o for o in ops if o['typ']=='lut'and 2<=o['k']<=6];pool=[]
 for a,b in itertools.permutations(luts,2):
  if a['out']not in b['ins']:continue
  u=(set(a['ins'])|set(b['ins']))-{a['out'],b['out']}
  if not 5<=len(u)<=8:continue
  if any(a['out']in anc.get(x,set())or b['out']in anc.get(x,set())for x in u):continue
  if a.get('props',{}).get('HLUTNM')and a.get('props',{}).get('HLUTNM')==b.get('props',{}).get('HLUTNM')and a['name'].rsplit('/',1)[0]==b['name'].rsplit('/',1)[0]:continue
  support=sorted(u);fa=[];fb=[]
  for r in range(1<<len(support)):
   vals={x:(r>>i)&1 for i,x in enumerate(support)};aa=(a['init']>>sum(vals[x]<<j for j,x in enumerate(a['ins'])))&1;vals[a['out']]=aa;bb=(b['init']>>sum(vals[x]<<j for j,x in enumerate(b['ins'])))&1;fa.append(aa);fb.append(bb)
  pool.append(dict(a=a['name'],b=b['name'],a_out=a['out'],b_out=b['out'],a_ins=a['ins'],b_ins=b['ins'],a_init=a['init'],b_init=b['init'],support=support,shared=len(set(a['ins'])&set(b['ins'])),union=len(u),depth=depth[b['out']],candidate_class='dependent_window',window_a_truth=fa,window_b_truth=fb))
 pool.sort(key=lambda p:(p['union'],-len(p['a_ins'])-len(p['b_ins']),-p['depth'],p['a'],p['b']));degree=collections.Counter();added=0
 for p in pool:
  if degree[p['a']]>=4 or degree[p['b']]>=4:continue
  pairs.append(p);degree.update([p['a'],p['b']]);added+=1
  if added==16:break
 dump(Q/f'graphs/{n}_pairs.json',pairs);dump(Q/f'state/{n}_pool.json',dict(independent_registered=len(pairs)-added,dependent_available=len(pool),dependent_registered=added,total=len(pairs)));return g,pairs
'''+s[end:]
s=once(s,'  for mi in range(2):','  for mi in [0]:')
line=" if src.name.endswith('_replay.cpp'):s=s.replace('if(method==0)eval0(v,mask);else if(method==1)eval1(v,mask);else eval2(v,mask);','if(method==0)eval0(v,mask);else eval1(v,mask);')\n"
s=once(s,line,'')
s=once(s,"f=truth(pair['a_init'],pair['a_ins'],sup,rr);h=truth(pair['b_init'],pair['b_ins'],sup,rr)","f=np.array(pair['window_a_truth'])if 'window_a_truth'in pair else truth(pair['a_init'],pair['a_ins'],sup,rr);h=np.array(pair['window_b_truth'])if 'window_b_truth'in pair else truth(pair['b_init'],pair['b_ins'],sup,rr)")
s=once(s,"[('local_exact',ll,0),('relation',ee,0)]:","[('local_window',ll,0),('numeric_pair',cc,budget),('numeric_window',cc,budget)]:\n     if method=='numeric_pair'and pair['candidate_class']=='dependent_window':continue")
s=once(s,'physical_complete(cf,cc,hh,0,ops,g,pair)','physical_complete(cf,cc,hh,0 if method==\'local_window\'else budget,ops,g,pair)')
s=once(s,"'change_from_seed'if method=='relation'else 'local_truth_change'","'local_truth_change'if method=='local_window'else 'numeric_WCE'")
(Q/'tools/core9.py').write_text(s)
s=(R/'round8/tools/model8.py').read_text().replace('common8 import','common9 import').replace("METHODS=['seed','local_exact','relation']","METHODS=['seed','local_window','numeric_pair','numeric_window']").replace("mi=['local_exact','relation'].index(method)","mi=METHODS[1:].index(method)").replace('r8_','r9_').replace('R8_PASS','R9_PASS')
s=once(s,'if(delta!=0||wce>BUDGET)return 6;','if((EXACT&&delta!=0)||wce>BUDGET)return 6;')
s=once(s,".replace('BUDGET',str(c['budget'])))",".replace('BUDGET',str(c['budget'])).replace('EXACT','true'if m in ['seed','local_window']else 'false'))")
start=s.index("   if m=='seed':\n    inh=");end=s.index('   if not dup:local.append(entry)',start)
s=s[:start]+'''   catalog=load(Q/'state/physical_reuse_catalog.json');matches=[x for x in catalog if x['case']==n and x['canonical_sha256']==digest and x['physical_result']['clock_ns']==c['clock_ns']];entry['inherited_physical']=bool(matches)
   if matches:
    old=matches[0];assert hashlib.sha256(Path(old['rtl']).read_bytes()).hexdigest()==old['rtl_file_sha256'];entry['inherited_record']=old
   if m=='seed':assert matches,('seed inheritance mismatch',n)
'''+s[end:]
s=once(s,"ys=[scalar(*mm[e['method']],a,b)for e in local];assert len(set(ys))==1;ref=reference(c,a,b);assert abs(ys[0]-ref)<=c['budget'];lines.append", "ys=[scalar(*mm[e['method']],a,b)for e in local];ref=reference(c,a,b);assert all(abs(y-ref)<=c['budget']for y in ys);lines.append")
(Q/'tools/model9.py').write_text(s)
s=(R/'round8/tools/hardware8.py').read_text().replace('model8 import','model9 import').replace('R8_PASS','R9_PASS');s=once(s," dump(Q/'state/progress.json',dict(phase='ALL_CORE_EXPERIMENTS_COMPLETE'"," dump(OUT/'ppa.json',rows)\n dump(Q/'state/progress.json',dict(phase='ALL_CORE_EXPERIMENTS_COMPLETE'")
(Q/'tools/hardware9.py').write_text(s)
for p in(Q/'tools').glob('*.py'):ast.parse(p.read_text());print(p.name,'syntax PASS')
