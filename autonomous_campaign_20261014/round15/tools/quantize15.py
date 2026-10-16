from common15 import Q,load,dump,build
import copy
for c in load(Q/'configs/plan.json')['cases']:
 n=c['name'];g=load(Q/f'graphs/{n}_seed.json');q=copy.deepcopy(g);zeros=[x['pins']['G']for x in q['cells']if x['type']=='GND'];assert zeros
 for i in range(c['quant_bits']):q['ports'][f'Y[{i}]']=zeros[0]
 build(q);dump(Q/f'graphs/{n}_quantized.json',q)
print('QUANTIZATION_GRAPHS_READY')
