"""Reconcile metric formatting with exact integer totals; no model changes."""
from common20 import Q,R,load,dump,build,base_code
import core,csv,hashlib,shutil
out=Q/'results/precision_reconciliation';out.mkdir(exist_ok=True)
manifest=load(Q/'rtl/design_manifest.json');plan=load(Q/'configs/plan.json');allrows=[]
for f in plan['families']:
 family=f['family'];entries=[e for e in manifest if e['family']==family and not e['duplicate_of']]
 models=[]
 for e in entries:
  n=e['case'];c=next(c for c in plan['cases']if c['name']==n)
  if e['method']=='state_window':
   g=load(Q/f'graphs/{n}_seed.json');ops,co,ins,nn,_=build(g);pairs=load(Q/f'graphs/{n}_pairs.json');records=load(Q/f'results/{n}_methods.json')
   for pi,m in load(Q/f'state/{n}_state_window_state.json')['accepted']:ops=core.replace_ops(ops,pairs[pi],records[pi]['methods'][m])
   ops=core.reorder(ops,set(co)|set(ins));assert ops is not None
  else:
   root=Q/'serial'if e['method']=='serial_then_quadol'else Q
   g=load(root/f'graphs/{n}_quadol_wce.json');ops,co,ins,nn,_=build(g)
  models.append((e,c,g,ops,co,nn))
 c=models[0][1];g=models[0][2];s,*_=base_code(c,g);oldnn=build(g)[3];newnn=max(m[-1]for m in models)
 s=[x.replace(f'constexpr int NN={oldnn},',f'constexpr int NN={newnn},')for x in s]
 for i,(_,_,gm,ops,co,_)in enumerate(models):
  assert gm['ports']==g['ports']
  s.append(core.emit_ops(ops,co,f'eval{i}'))
 s.append('int main(){std::cout<<"top,inputs,WCE,SAE,SSE\\n";')
 for i,(e,c,*_)in enumerate(models):
  s.append('''{U v[NN],sae=0,sse=0,wce=0;uint32_t yy[64];
for(U base=0;base<N;base+=64){inputs(v,base);EVAL(v);unpack(v,yy);for(int j=0;j<64;j++){U a,b,l,h;reference(base+j,a,b,l,h);U error=std::abs(I(yy[j])-I(l));if(error>BUDGET)return 7;wce=std::max(wce,error);sae+=error;sse+=error*error;}}
std::cout<<"TOP,"<<N<<","<<wce<<","<<sae<<","<<sse<<std::endl;}
'''.replace('EVAL',f'eval{i}').replace('BUDGET',str(c['budget'])).replace('TOP',e['top']))
 s.append('return 0;}');src=out/f'{family}.cpp';csvpath=out/f'{family}.csv'
 if not csvpath.exists():
  assert not src.exists();src.write_text('\n'.join(s));core.native(src,[],csvpath)
 allrows.extend(list(csv.DictReader(csvpath.open())))
 index={r['top']:r for r in allrows}
 print('INTEGER_METRIC_PASS',family,flush=True)
rows=[]
for e in manifest:
 raw=index[e['duplicate_of']or e['top']];r={k:int(v)for k,v in raw.items()if k!='top'}
 assert r['WCE']==e['WCE']
 rows.append(dict(top=e['top'],physical_source=e['duplicate_of']or e['top'],**r,MAE=r['SAE']/r['inputs'],MSE=r['SSE']/r['inputs'],original_MAE=e['MAE']))
dump(out/'exact_metrics.json',rows)
dump(out/'receipt.json',dict(status='PASS',unique_rechecked=len(allrows),endpoints=len(rows),reason='Original main C++ stream used6significant digits versus baseline12; exact integer SAE/SSE resolves false near-equality Pareto classifications.',sources_changed=False,raw_results_overwritten=False))
