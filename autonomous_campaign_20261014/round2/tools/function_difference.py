from core2 import Q,load,dump,native
import csv,json
allrows=[]
for c in load(Q/'configs/plan.json')['cases']:
 n=c['name'];src=Q/f'src/{n}_replay.cpp';s=src.read_text().replace('int main(){','int historical_main(){');final={int(r['method']):int(r['mask'])for r in csv.DictReader((Q/f'results/{n}_replay.csv').open())if r['stage']=='final'}
 s+='\nint main(){U v[NN];uint32_t baseout[64],out[64];U count[2]={},maxdiff[2]={};for(U base=0;base<N;base+=64){inputs(v,base);eval0(v,0);unpack(v,baseout);'
 for mi in [1,2]:s+=f'inputs(v,base);eval{mi}(v,{final[mi]}ULL);unpack(v,out);for(int j=0;j<64;j++){{U d=std::abs(I(out[j])-I(baseout[j]));count[{mi-1}]+=(d!=0);maxdiff[{mi-1}]=std::max(maxdiff[{mi-1}],d);}}'
 s+='}for(int i=0;i<2;i++)std::cout<<i+1<<","<<N<<","<<count[i]<<","<<maxdiff[i]<<std::endl;return 0;}'
 cpp=Q/f'src/{n}_function_difference.cpp';cpp.write_text(s);out=Q/f'results/{n}_function_difference.csv';native(cpp,[],out)
 allrows.extend(dict(case=n,method=['seed','serial','joint'][int(r[0])],effective_inputs=int(r[1]),changed_outputs_vs_seed=int(r[2]),max_absolute_change_vs_seed=int(r[3]))for r in csv.reader(out.open()))
dump(Q/'state/function_difference.json',allrows);print(json.dumps(allrows,indent=2))
