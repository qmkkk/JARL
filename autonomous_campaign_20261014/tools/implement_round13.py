from pathlib import Path
import ast
R=Path(__file__).resolve().parents[1];Q=R/'round13';old=R/'round12/tools'
def save(name,s):
 p=Q/'tools'/name;assert not p.exists(),p;ast.parse(s);p.write_text(s,encoding='utf-8')
save('common13.py',(old/'common12.py').read_text())
s=(old/'model12.py').read_text().replace('common12','common13').replace("METHODS=['seed','numeric_window']","METHODS=['seed','numeric_window','packing_window']").replace("top=f'r12_","top=f'r13_").replace('R12_PASS','R13_PASS')
save('model13.py',s)
save('hardware13.py',(old/'hardware12.py').read_text().replace('model12','model13').replace('R12_PASS','R13_PASS'))
s=(old/'core12.py').read_text();start=s.index('def independent_candidates');end=s.index('native_original=basis.native');s=s[:start]+s[end:]
s=s.replace("METHODS=['numeric_window'];basis.METHODS=METHODS","METHODS=['numeric_window','packing_window'];basis.METHODS=METHODS\nGENERATED=['packing_window']\nfrom packing13 import rank as packing_rank, complete as physical_complete, select as packing_select")
s=s.replace('common12','common13').replace("'eval0(v,mask);')","'if(method==0)eval0(v,mask);else eval1(v,mask);')")
s=s.replace('pools={m:[]for m in METHODS}','pools={m:[]for m in GENERATED}').replace("[('numeric_window',cc,budget)]","[('packing_window',cc,budget)]")
s=s.replace('retained_before_completion={m:len(pools[m])for m in METHODS}', 'retained_before_completion={m:len(pools[m])for m in GENERATED}')
s=s.replace('def structural_rank(cf):return(structural_score(ops,g,pair,cf)', 'def structural_rank(cf):return(packing_rank(ops,g,pair,cf)')
s=s.replace("best['proxy']=list(structural_score(ops,g,pair,best));", "best['proxy']=list(structural_score(ops,g,pair,best));best['packing_proxy']=list(packing_rank(ops,g,pair,best));")
s=s.replace("records=[];st=time.perf_counter()", "records=[];st=time.perf_counter();old=load(Q/f'inputs/{n}_original_methods.json')")
s=s.replace("records.append(dict(pair=i,methods=methods", "assert old[i]['pair']==i;methods['numeric_window']=old[i]['methods']['numeric_window'];records.append(dict(pair=i,methods=methods")
s=s.replace("if __name__=='__main__':", "matched_original=basis.matched\ndef matched(c,ops,co,ins,pairs,records,method):\n if method=='packing_window':return packing_select(c,ops,co,ins,pairs,records,method,load(Q/f'graphs/{c[\"name\"]}.json'))\n return matched_original(c,ops,co,ins,pairs,records,method)\nbasis.matched=matched\n\nif __name__=='__main__':")
s=s.replace("{'context':basis.context,'optimize':optimize,'replay':basis.replay}","{'optimize':optimize,'replay':basis.replay}")
save('core13.py',s)
s=(old/'run12.py').read_text().replace("('abc12.py',),('core12.py','context'),","('packing13.py',),").replace('12.py','13.py');save('run13.py',s)
for p in(Q/'tools').glob('*.py'):ast.parse(p.read_text())
print('Round13 drivers parsed')
