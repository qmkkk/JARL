from pathlib import Path
import json,shutil,hashlib,datetime,ast
R=Path(__file__).resolve().parents[1];Q=R/'round18';P=R/'round17'
load=lambda p:json.loads(p.read_text());dump=lambda p,x:p.write_text(json.dumps(x,indent=2,ensure_ascii=False),encoding='utf-8');h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
assert load(P/'state/round_status.json')['status']=='COMPLETE';assert not Q.exists()
for d in ['tools','configs','input/quadol_source','input/images','graphs','rtl','src','build','results/hardware','state','logs','reports']:(Q/d).mkdir(parents=True,exist_ok=True)
cases=[dict(c,seed_budget=(c['removed_max']+1)//2)for c in load(P/'configs/plan.json')['cases']if c['flow']=='column'];origins=[];catalog=[]
def cp(p,d):
 d.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(p,d);origins.append(dict(source=str(p),target=str(d),sha256=h(p)))
for c in cases:
 n=c['name']
 for suf in ['_seed','_pairs']:cp(P/f'graphs/{n}{suf}.json',Q/f'graphs/{n}{suf}.json')
 cp(P/f'results/{n}_methods.json',Q/f'results/{n}_methods.json');cp(P/f'state/{n}_replay_manifest.json',Q/f'state/{n}_replay_manifest.json');cp(P/f'state/{n}_state.json',Q/f'state/{n}_state_window_state.json');cp(P/f'rtl/{n}.xdc',Q/f'rtl/{n}.xdc')
 for e in load(P/'rtl/design_manifest.json'):
  if e['case']!=n:continue
  pp=next(p for p in load(P/'results/hardware/ppa.json')if p['top']==e['top']);rtl=P/f'rtl/{e["top"]}.v';catalog.append(dict(case=n,source_round=17,canonical_sha256=e['canonical_sha256'],rtl=str(rtl),rtl_file_sha256=h(rtl),physical_result=pp))
for p in(R/'round15/input/quadol_source').rglob('*'):
 if p.is_file():cp(p,Q/'input/quadol_source'/p.relative_to(R/'round15/input/quadol_source'))
# Bundled public sample data only: do not download or select based on outcomes.
import skimage.data,numpy as np
images=[]
for name in ['camera','coins','moon']:
 image=getattr(skimage.data,name)();assert image.ndim==2 and image.dtype==np.uint8
 p=Q/f'input/images/{name}.npy';np.save(p,image);images.append(dict(name=name,path=str(p),shape=list(image.shape),sha256=h(p),source='Installed scikit-image public bundled sample; no outcome-based image selection'))
plan=dict(round=18,registered=datetime.datetime.now().astimezone().isoformat(),cases=cases,methods=['seed','quadol_wce','static_full','state_const5','state_exact','state_window'],baselines=['compensated column arithmetic seed','pinned author QUADOL-WCE adapter on same seed'],ablation_status='static_full,state_const5,state_exact are controlled removals of proposed mechanism, not claimed new methods or extra published baselines.',questions=['Increment over closest actual authorcode after strong arithmetic optimization','State refresh vs full-domain context separated','Physical sixth-input dependence vs constantI5','Global numerical freedom vs exact current-output preservation','Quality tradeoffs on fixed real-image inputs','Controller-inclusive equal-work streaming computation'],core_scope='3columninputs x6models; identical fixedR17 candidate order and solvercaps; no rematching,tuning,newmodules. MainR17identical may inherit physical until frozenR19.',ablation={'static_full':'Relations from initial seed for every candidate; independent cumulative WCE admission may reject stale functions.','state_const5':'Current fullcontext, selectorI5fixed1; remaining candidate/solverbudget unchanged.','state_exact':'Current fullcontext but require forced output equals current whole-circuit value at every input; retain physical solver andcandidate order.'},quadol='Unchanged pinnedR11source MinHD/binarySearch, GRAPH_NUM16 and16endpoint protections,512querycap, fullmathWCE adapter; directprimitive lowering and independentalltable verification.',images=images,application=dict(workloads=['spatial alpha blend camera/each resized image','16tap4x4binomial grayscale filter with coefficients4*outer([1,3,3,1],[1,3,3,1])'],methods='all6; 3widths; all3images; fixed outputs; reportPSNR,SSIM,MAE,maxerror,bias and aggregate; noqualitythreshold tuning',implementation='Evaluate optimized MAC at addend0, exact wide summation and fixed rounding/clipping; independent scalar spotchecks; noapplication acceleration claim from software simulation.'),integration=dict(widths=[8,9,10],methods=['seed','quadol_wce','state_window'],block_length=16,accumulator_width=32,clock_ns=15,interface='valid/start/last framed 16product block; feed2cycle MAC with addend0, pipeline control alongside, exact32bitaccumulator; sameinputsequence,latency andII for all',checks='Independent sum of verified operator outputs, fullRTL simulation including bubbles and back-to-back blocks, PPAincludescontroller andaccumulator.',scope='Composition handles larger input vectors, not scalable synthesis for arbitrarily many interacting inputs; noindustrial-scale synthesisclaim.'),cost='Reuse generation cost of unchanged main only as historical; measure newablations andauthorbaseline separately; report exponentialdomainbound explicitly.',stop='Complete18coremodels,9integratedmodels andallfixedapplicationdata before comparativeanalysis andR19decision; no newrounds beyondR19.',score=dict(innovation=25,physical_gain=25,coverage=20,correctness=20,cost=10))
dump(Q/'configs/plan.json',plan);dump(Q/'state/origins.json',origins);dump(Q/'state/physical_reuse_catalog.json',catalog);dump(Q/'state/engineering_repairs.json',[])
def save(n,s):ast.parse(s);(Q/'tools'/n).write_text(s,encoding='utf-8')
for n in ['common','oracle','hardware']:
 s=(P/f'tools/{n}17.py').read_text().replace('common17','common18').replace('model17','model18').replace('R17_PASS','R18_PASS');save(n+'18.py',s)
s=(P/'tools/configure17.py').read_text().replace('common17','common18').replace('def configure(pair,path,ops,g,budget):','def configure(pair,path,ops,g,budget,policy="state_window"):\n if policy=="state_exact":budget=0')
s=s.replace("cost[row,q]=max(abs(int(r['error_lo'])),abs(int(r['error_hi'])))","cost[row,q]=max(abs(int(r['current_error_lo'if policy=='state_exact'else'error_lo'])),abs(int(r['current_error_hi'if policy=='state_exact'else'error_hi'])))")
s=s.replace('for selector in [None]+sorted(set(sup)-set(sh)):','for selector in ([None]if policy=="state_const5"else[None]+sorted(set(sup)-set(sh))):');save('configure18.py',s)
s=(P/'tools/state17.py').read_text().replace('common17','common18').replace('configure17','configure18').replace('oracle17','oracle18')
s=s.replace('uint32_t out[64],seed[64];','uint32_t out[64],seed[64],cur[64];').replace('dl[4][256],dh[4][256];','dl[4][256],dh[4][256],cl[4][256],ch[4][256];').replace('lo[q][r]=dl[q][r]=INT64_MAX;hi[q][r]=dh[q][r]=INT64_MIN;','lo[q][r]=dl[q][r]=cl[q][r]=INT64_MAX;hi[q][r]=dh[q][r]=ch[q][r]=INT64_MIN;').replace('original(orig);unpack(orig,out);int rows','original(orig);unpack(orig,out);unpack(orig,cur);int rows').replace('dh[q][r]=std::max(dh[q][r],d);','dh[q][r]=std::max(dh[q][r],d);I cd=I(out[j])-I(cur[j]);cl[q][r]=std::min(cl[q][r],cd);ch[q][r]=std::max(ch[q][r],cd);').replace('seed_error_hi\\n','seed_error_hi,current_error_lo,current_error_hi\\n').replace('<<dh[q][r]<<"\\n"','<<dh[q][r]<<","<<cl[q][r]<<","<<ch[q][r]<<"\\n"')
s=s.replace('def run_case(c):','def run_case(c,method):').replace("n=c['name'];st=time.perf_counter();g=", "n=c['name'];c=dict(c,name=n+'_'+method);st=time.perf_counter();g=")
s=s.replace('context(c,g,seedops,current,co,ins,nn,p,pi)','context(c,g,seedops,seedops if method=="static_full"else current,co,ins,nn,p,pi)').replace("configure(p,path,current,g,c['budget'])","configure(p,path,current,g,c['budget'],policy=method)")
s=s.replace("assert rec['WCE']<=c['budget'],('FULL_CONTEXT_CONTRACT_FAILURE',n,pi,rec)\n     current=changed;accepted.append([pi,'state_window']);records[pi]['methods']['state_window']=copy.deepcopy(cf);ev['status']='ACCEPTED'", "if rec['WCE']>c['budget']:\n      assert method=='static_full',('FULL_CONTEXT_CONTRACT_FAILURE',n,method,pi,rec)\n      ev['status']='CUMULATIVE_WCE_REJECTED'\n     else:\n      current=changed;accepted.append([pi,method]);records[pi]['methods'][method]=copy.deepcopy(cf);ev['status']='ACCEPTED'")
s=s.replace("{n}_state_partial.json","{n}_{method}_state_partial.json").replace("{n}_state.json","{n}_{method}_state.json")
s=s.replace("for c in load(Q/'configs/plan.json')['cases']:run_case(c)","for c in load(Q/'configs/plan.json')['cases']:\n  for method in ['static_full','state_const5','state_exact']:run_case(c,method)");save('state18.py',s)
for n in ['quadol','direct','validate_adapter']:
 s=(R/f'round15/tools/{n}15.py').read_text().replace('common15','common18').replace('quadol15','quadol18').replace('seed_expected(l)','seed_expected(a,b,l)');save(n+'18.py',s)
s=(R/'round15/tools/model15.py').read_text().replace('common15','common18').replace('direct15','direct18').replace('r15_','r18_').replace('R15_PASS','R18_PASS').replace('seed_expected(l)','seed_expected(a,b,l)')
s=s.replace("METHODS=['quantized','quadol_wce','numeric_window']","METHODS=['seed','quadol_wce','static_full','state_const5','state_exact','state_window']")
a=s.index('def choices');b=s.index('def unpack_method')
s=s[:a]+'''def choices(n,method):
 return load(Q/f'state/{n}_{method}_state.json')['accepted']

def models(c):
 n=c['name'];g=load(Q/f'graphs/{n}_seed.json');ops,co,ins,nn,_=build(g);out={'seed':(g,ops,co,ins,nn)}
 gm=load(Q/f'graphs/{n}_quadol_wce.json');op,k,i,sz,_=build(gm);out['quadol_wce']=(gm,op,k,i,sz)
 pairs=load(Q/f'graphs/{n}_pairs.json');data=load(Q/f'results/{n}_methods.json')
 for method in METHODS[2:]:
  new=ops
  for pi,k in choices(n,method):new=replace_ops(new,pairs[pi],data[pi]['methods'][k])
  new=reorder(new,set(co)|set(ins));assert new is not None;out[method]=(g,new,co,ins,nn)
 return out

'''+s[b:]
s=s.replace("selected=choices(n,m)if m=='numeric_window'else[]","selected=[]if m in ['seed','quadol_wce']else choices(n,m)");save('model18.py',s)
s=(P/'tools/run17.py').read_text();a=s.index('steps=');b=s.index('\nrows=',a);s=s[:a]+"steps=[('validate_adapter18.py',),('quadol18.py',),('state18.py',),('model18.py','verify'),('model18.py','export'),('hardware18.py','simulation'),('hardware18.py','route'),('application18.py',),('integration18.py','prepare'),('integration18.py','simulation'),('integration18.py','route'),('analyze18.py',)]"+s[b:];save('run18.py',s)
dump(Q/'state/progress.json',dict(phase='REGISTERED_IMPLEMENTING_FULL_EVIDENCE_MATRIX'));dump(Q/'state/input_hashes.json',{p.relative_to(Q).as_posix():h(p)for sub in ['configs','input','graphs','rtl']for p in(Q/sub).rglob('*')if p.is_file()})
c=load(R/'state/campaign.json');c.update(status='ROUND18_REGISTERED_FULL_EVIDENCE_MATRIX',active_round=18,root=str(Q),latest_progress='round18/state/progress.json');dump(R/'state/campaign.json',c)
print('R18 registered18coremodels,9integratedmodels,3images,2workloads; no newmethodmodules')
