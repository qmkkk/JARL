from core import Q,load,dump,native,linux
import csv,json
rows=[]
for name in ['sqrt12','sqrt16']:
 s=(Q/f'src/{name}_replay.cpp').read_text().replace('int main(){','int historical_main(){')
 final={int(r['method']):int(r['mask'])for r in csv.DictReader((Q/f'results/{name}_replay.csv').open())if r['stage']=='final'}
 s+='\nint main(){U v[NN];uint32_t out[64];'
 for m in [2,3]:
  s+=f'{{U mismatches=0;for(U base=0;base<N;base+=64){{inputs(v,base);eval{m}(v,{final[m]}ULL);unpack(v,out);for(int j=0;j<64;j++)mismatches+=(out[j]!=(root(base+j)|1));}}std::cout<<"{m},"<<N<<","<<mismatches<<std::endl;}}'
 s+='return 0;}';src=Q/f'src/{name}_quantizer_diagnostic.cpp';src.write_text(s);out=Q/f'results/{name}_quantizer_diagnostic.csv';native(src,[],out)
 rows.extend(dict(case=name,method=['hd','minimax','support','physical'][int(r[0])],inputs=int(r[1]),mismatches_to_isqrt_or_one=int(r[2]))for r in csv.reader(out.open()))
dump(Q/'state/quantizer_equivalence.json',rows);print(json.dumps(rows,indent=2))
