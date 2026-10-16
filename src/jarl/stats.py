import csv
from .common import Q, load, dump, build, base_code
from . import core


def stats(c,g,ops,label):
 src=Q/f'src/{c["name"]}_{label}_integer.cpp';out=Q/f'results/{c["name"]}_{label}_integer.csv'
 assert not src.exists() and not out.exists()
 s,_,co,_,_,_=base_code(c,g);s.append(core.emit_ops(ops,co,'candidate'))
 s.append('''int main(){U v[NN],sae=0,sse=0,wce=0,minimum=UINT64_MAX,maximum=0,wa=0,wb=0,wy=0;I signed_sum=0;uint32_t yy[64];
for(U base=0;base<N;base+=64){inputs(v,base);candidate(v);unpack(v,yy);for(int j=0;j<64;j++){U a,b,l,h;reference(base+j,a,b,l,h);I e=I(yy[j])-I(l);U ae=std::abs(e);if(ae>BUDGET)return 7;if(ae>wce){wce=ae;wa=a;wb=b;wy=yy[j];}sae+=ae;sse+=ae*ae;signed_sum+=e;minimum=std::min(minimum,U(yy[j]));maximum=std::max(maximum,U(yy[j]));}}
std::cout<<"inputs,WCE,SAE,SSE,signed_sum,minimum_output,maximum_output,witness_A,witness_B,witness_Y\\n"<<N<<","<<wce<<","<<sae<<","<<sse<<","<<signed_sum<<","<<minimum<<","<<maximum<<","<<wa<<","<<wb<<","<<wy<<std::endl;return 0;}
'''.replace('BUDGET',str(c['budget'])))
 src.write_text('\n'.join(s));core.native(src,[],out);row={k:int(v)for k,v in next(csv.DictReader(out.open())).items()};row.update(MAE=row['SAE']/row['inputs'],MSE=row['SSE']/row['inputs'],bias=row['signed_sum']/row['inputs'],source=str(src),result=str(out));return row
