from pathlib import Path
import ast
R=Path(__file__).resolve().parents[1];Q=R/'round8'
def once(s,a,b):
 assert s.count(a)==1,(a,s.count(a));return s.replace(a,b)
s=(R/'round7/tools/common7.py').read_text();(Q/'tools/common8.py').write_text(s)
s=(R/'round6/tools/core6.py').read_text().replace('common6 import','common8 import').replace("METHODS=['exact_joint']","METHODS=['local_exact','relation']")
s=once(s,"  s=replace_once(s,f'if(check(0,proposed,\"admission\",j)<={b})',f'if(check(0,proposed,\"admission\",j)<={b}&&last_change==0)')\n  s=replace_once(s,f'if(check(0,mask,\"final\",-1)>{b})',f'if(check(0,mask,\"final\",-1)>{b}||last_change!=0)')", "  for mi in range(2):\n   s=replace_once(s,f'if(check({mi},proposed,\"admission\",j)<={b})',f'if(check({mi},proposed,\"admission\",j)<={b}&&last_change==0)')\n   s=replace_once(s,f'if(check({mi},mask,\"final\",-1)>{b})',f'if(check({mi},mask,\"final\",-1)>{b}||last_change!=0)')")
s=once(s,"','eval0(v,mask);')","','if(method==0)eval0(v,mask);else eval1(v,mask);')")
s=once(s,"exact=cost.copy()","exact=cost.copy();local=np.ones_like(cost);local[rr,f+2*h]=0")
s=once(s,"ee=cc.copy();hh=cc.copy()","ee=cc.copy();ll=cc.copy();hh=cc.copy()")
s=once(s,"ee[:,ab]=exact[rr,q][grp].max(axis=1);","ee[:,ab]=exact[rr,q][grp].max(axis=1);ll[:,ab]=local[rr,q][grp].max(axis=1);")
s=once(s,"[('exact_joint',ee,0)]","[('local_exact',ll,0),('relation',ee,0)]")
s=once(s,"0 if method=='exact_joint'else budget","0")
s=once(s,"'change_from_seed'if method=='exact_joint'else 'numeric_WCE'","'change_from_seed'if method=='relation'else 'local_truth_change'")
s=once(s,"basis.base_code=base_code","basis.base_code=base_code;core.Q=Q;basis.Q=Q")
(Q/'tools/core8.py').write_text(s)
s=(R/'round7/tools/model7.py').read_text().replace('common7 import','common8 import').replace("METHODS=['abc_global']","METHODS=['seed','local_exact','relation']").replace('r7_','r8_').replace('R7_PASS','R8_PASS')
start=s.index('def blif(');end=s.index('def verify():')
s=s[:start]+'''def choices(n,method):
 mi=['local_exact','relation'].index(method);manifest=load(Q/f'state/{n}_replay_manifest.json')[mi];f=next(r for r in csv.DictReader((Q/f'results/{n}_replay.csv').open())if r['stage']=='final'and int(r['method'])==mi);mask=int(f['mask']);return[x for i,x in enumerate(manifest['choices'])if mask>>i&1]

def models(c):
 n=c['name'];g=load(Q/f'graphs/{n}_seed.json');ops,co,ins,nn,_=build(g);out={'seed':(g,ops,co,ins,nn)};pairs=load(Q/f'graphs/{n}_pairs.json');data=load(Q/f'results/{n}_methods.json')
 for m in METHODS[1:]:
  new=ops
  for pi,k in choices(n,m):new=replace_ops(new,pairs[pi],data[pi]['methods'][k])
  new=reorder(new,set(co)|set(ins));assert new is not None;out[m]=(g,new,co,ins,nn)
 return out

'''+s[end:]
s=once(s,'   text=export_rtl(g,[],[],{},top)', '''   pairs=load(Q/f'graphs/{n}_pairs.json');data={r['pair']:r for r in load(Q/f'results/{n}_methods.json')};selected=[]if m=='seed'else choices(n,m)
   text=export_rtl(g,selected,pairs,data,top)''')
s=once(s,"choices=[]);entries.append(entry)","choices=selected);entries.append(entry)")
s=once(s,"   if not dup:local.append(entry)",'''   if m=='seed':
    inh=next(x for x in load(Q/'state/inherited_results.json')if x['case']==n);oldpath=Path(inh['rtl']);assert hashlib.sha256(oldpath.read_bytes()).hexdigest()==inh['rtl_file_sha256'];oldtop=inh['physical_result']['top'];old=oldpath.read_text().replace(f'module {oldtop}(', 'module canonical(');assert old==canonical,('seed RTL mismatch',n);entry['inherited_physical']=True
   else:entry['inherited_physical']=False
   if not dup:local.append(entry)''')
s=once(s,'dict(resynth=resynth,verify=verify,export=export)','dict(verify=verify,export=export)')
(Q/'tools/model8.py').write_text(s)
s=(R/'round7/tools/hardware7.py').read_text().replace('model7 import','model8 import').replace('R7_PASS','R8_PASS')
needle=" entries=[e for e in load(S/'design_manifest.json')if not e['duplicate_of']];rows=[]"
s=once(s,needle," entries=[e for e in load(S/'design_manifest.json')if not e['duplicate_of']and not e['inherited_physical']];rows=[]")
(Q/'tools/hardware8.py').write_text(s)
for p in(Q/'tools').glob('*.py'):ast.parse(p.read_text());print(p.name,'syntax PASS')
