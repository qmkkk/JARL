from pathlib import Path
import json,shutil,hashlib,datetime,ast
R=Path(__file__).resolve().parents[1];Q=R/'round16';old=R/'round15'
load=lambda p:json.loads(p.read_text());dump=lambda p,x:p.write_text(json.dumps(x,indent=2,ensure_ascii=False),encoding='utf-8');h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
assert load(old/'state/round_status.json')['status']=='COMPLETE';assert not Q.exists()
for d in ['tools','configs','input','graphs','rtl','src','build','results/hardware','state','logs','reports']:(Q/d).mkdir(parents=True,exist_ok=True)
cases=load(old/'configs/plan.json')['cases'];origins=[];catalog=[]
def copy(p,d):
 d.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(p,d);origins.append(dict(source=str(p),target=str(d),sha256=h(p)))
for c in cases:
 n=c['name']
 for suf in ['','_seed','_pairs']:copy(old/f'graphs/{n}{suf}.json',Q/f'graphs/{n}{suf}.json')
 for suf in ['_methods.json','_replay.csv']:copy(old/f'results/{n}{suf}',Q/f'input/{n}{suf}')
 copy(old/f'state/{n}_replay_manifest.json',Q/f'input/{n}_replay_manifest.json')
 copy(old/f'rtl/{n}.xdc',Q/f'rtl/{n}.xdc')
 copy(old/f'results/{n}_methods.json',Q/f'results/{n}_methods.json')
 for e in load(old/'rtl/design_manifest.json'):
  if e['case']!=n or e['method']!='numeric_window':continue
  p=old/f'rtl/{e["top"]}.v';pp=next(x for x in load(old/'results/hardware/ppa.json')if x['top']==e['top'])
  catalog.append(dict(case=n,source_round=15,canonical_sha256=e['canonical_sha256'],rtl=str(p),rtl_file_sha256=h(p),physical_result=pp))
plan=dict(round=16,registered=datetime.datetime.now().astimezone().isoformat(),question='Can state-conditioned numerical relations overcome the noncomposability of static seed-generated dual-output functions?',cases=cases,methods=['midpoint','numeric_window','state_window'],baselines=['Analytical bucket midpoint: 2B*floor(seed/(2B))+B; same strong source, no added arithmetic because output bits map to constants','Unchanged R15 static numerical-window model, same source, fixed budget, candidate matching and order; physical results inherited only on canonical identity'],innovation='Regenerate the joint feasible-output relation on the currently accepted network using complete-domain four-root-output evaluation; then synthesize a legal LUT6_2 support/function under that relation. Finite one-pass with unchanged candidate list and order.',novelty_boundary='Approximate care sets, dynamic resubstitution, Boolean relations, and counterexample-guided synthesis already exist. This round tests the specific incremental effect of state-conditioned numerical relations coupled to actual LUT6_2 cofactor/support synthesis. No priority or journal-readiness claim.',hypothesis='R15 static proposals are individually feasible in the original source but many fail after earlier edits consume or reshape signed numerical slack. Current-network relation generation may permit different joint functions that compose while retaining physical savings.',limits=dict(candidate_order='Exact R15 selected list and order: sqrt10,div5,MAC23',passes=1,context_domain='All effective inputs, all4forced root outputs',pinsets=8,retained=8,support_completions=2,support_masks=1024,two_sat_orders=2,admission='One independent full-domain check per generated configuration; no repair loop'),correctness='Recompute reachable support rows on current unforced network. Check support contains no current-root descendants. Recompute forced current network for all4root outputs. Global WCE from mathematical reference, not additive error bound. Full-domain final, independent scalar context probes, vendor HDL.',physical='Same Artix7, DSP0,2cycle interface, fixed clocks. Whole LUT/FF/CARRY numbers. Inherit only byte-canonical same-case same-clock RTL; OOC core, no board or application claim.',stop='Complete all3cases and all3methods before comparison/score/next selection; no mid-round new candidates, order changes, caps, budgets or correction adders.',score=dict(innovation=25,physical_gain=25,problem_coverage=20,correctness=20,cost=10))
dump(Q/'configs/plan.json',plan);dump(Q/'state/origins.json',origins);dump(Q/'state/physical_reuse_catalog.json',catalog);dump(Q/'state/engineering_repairs.json',[]);dump(Q/'state/progress.json',dict(phase='REGISTERED_IMPLEMENTING'))
dump(Q/'state/input_hashes.json',{p.relative_to(Q).as_posix():h(p)for sub in ['configs','graphs','input']for p in(Q/sub).rglob('*')if p.is_file()})
def save(n,s):ast.parse(s);(Q/'tools'/n).write_text(s,encoding='utf-8')
save('common16.py',(old/'tools/common15.py').read_text())
s=(old/'tools/core15.py').read_text();a=s.index('def configure');b=s.index('def optimize');header=s[:s.index('native_original=')];save('configure16.py',header.replace('common15','common16')+s[a:b])
s=(R/'round14/tools/repair14.py').read_text();s=s[s.index('def values'):s.index('def signature')];save('oracle16.py',"import time,csv\nfrom common16 import Q,R,load,dump,build,base_code,reference\nimport core\n"+s)
save('hardware16.py',(old/'tools/hardware15.py').read_text().replace('model15','model16').replace('R15_PASS','R16_PASS'))
s=(old/'tools/run15.py').read_text();a=s.index('steps=');b=s.index('\nrows=',a);s=s[:a]+"steps=[('midpoint16.py',),('state16.py',),('model16.py','verify'),('model16.py','export'),('hardware16.py','simulation'),('hardware16.py','route'),('analyze16.py',)]"+s[b:];save('run16.py',s)
s=(old/'tools/model15.py').read_text().replace('common15','common16').replace("METHODS=['quantized','quadol_wce','numeric_window']\nfrom direct15 import quadol_rtl","METHODS=['midpoint','numeric_window','state_window']").replace('r15_','r16_').replace('R15_PASS','R16_PASS')
a=s.index('def choices');b=s.index('def unpack_method');s=s[:a]+'''def choices(n,method):
 if method=='state_window':return load(Q/f'state/{n}_state.json')['accepted']
 assert method=='numeric_window'
 manifest=load(Q/f'input/{n}_replay_manifest.json')[0];f=next(r for r in csv.DictReader((Q/f'input/{n}_replay.csv').open())if r['stage']=='final'and int(r['method'])==0);mask=int(f['mask']);return[x for i,x in enumerate(manifest['choices'])if mask>>i&1]

def models(c):
 n=c['name'];g=load(Q/f'graphs/{n}_seed.json');ops,co,ins,nn,_=build(g);out={'seed':(g,ops,co,ins,nn)}
 gm=load(Q/f'graphs/{n}_midpoint.json');op,k,i,sz,_=build(gm);out['midpoint']=(gm,op,k,i,sz)
 pairs=load(Q/f'graphs/{n}_pairs.json');data=load(Q/f'results/{n}_methods.json')
 for m in METHODS[1:]:
  new=ops
  for pi,method in choices(n,m):new=replace_ops(new,pairs[pi],data[pi]['methods'][method])
  new=reorder(new,set(co)|set(ins));assert new is not None;out[m]=(g,new,co,ins,nn)
 return out

'''+s[b:]
s=s.replace("selected=choices(n,m)if m=='numeric_window'else[]","selected=[]if m=='midpoint'else choices(n,m)").replace("text=quadol_rtl(c,g,top)if m=='quadol_wce'else export_rtl(g,selected,pairs,data,top)","text=export_rtl(g,selected,pairs,data,top)");save('model16.py',s)
c=load(R/'state/campaign.json');c.update(status='ROUND16_REGISTERED',active_round=16,root=str(Q),latest_progress='round16/state/progress.json');dump(R/'state/campaign.json',c)
(Q/'reports/REGISTERED_SCOPE_ZH.md').write_text('第16轮固定R15三个算子和全部候选顺序。两个对照为解析中点量化与R15静态数值窗口。提出的方法在每次已接受改动后，对下一候选重建当前电路完整域数值许可关系并重新求解LUT6_2函数。仅一遍，不追加候选或修复循环。九项全部完成再分析。',encoding='utf-8')
print('R16 registered: fixed 3 cases x 3 methods,2 baselines')
