import time, csv
from .common import Q, load, dump, build, base_code, reference
from . import core


def values(g,ops,co,ins,nn,a,b,forced=None):
 v=[0]*nn;forced=forced or {}
 for n,val in co.items():v[n]=val
 for n,name in ins.items():v[n]=((a if name[0]=='A'else b)>>int(name[2:-1]))&1
 for op in ops:
  x=[v[n]for n in op['ins']];t=op['typ']
  if t=='lut':z=(op['init']>>sum(q<<j for j,q in enumerate(x)))&1
  elif t=='or':z=x[0]|x[1]
  elif t=='andnot':z=x[0]&(1-x[1])
  elif t=='xor':z=x[0]^x[1]
  elif t=='not':z=1-x[0]
  elif t=='mux':z=x[2]if x[0]else x[1]
  else:raise ValueError(t)
  v[op['out']]=forced.get(op['out'],z)
 return v,sum(v[g['ports'][f'Y[{i}]']]<<i for i in range(32))

def query(c,g,ops,index):
 n=c['name'];src=Q/f'src/{n}_q{index:03d}.cpp';out=Q/f'results/{n}_q{index:03d}.csv';assert not src.exists()and not out.exists()
 s,_,co,ins,nn,_=base_code(c,g);s.append(core.emit_ops(ops,co,'candidate'))
 s.append(r'''
int main(){U v[NN],wa=0,wb=0,wy=0;uint32_t out[64];I wce=-1;long double sae=0;
for(U base=0;base<N;base+=64){inputs(v,base);candidate(v);unpack(v,out);
for(int j=0;j<64;j++){U a,b,l,h;reference(base+j,a,b,l,h);I e=std::max(std::abs(I(out[j])-I(l)),std::abs(I(out[j])-I(h)));sae+=std::abs(I(out[j])-I(l));if(e>wce){wce=e;wa=a;wb=b;wy=out[j];}}}
std::cout<<"inputs,WCE,witness_A,witness_B,witness_Y,MAE\n"<<N<<","<<wce<<","<<wa<<","<<wb<<","<<wy<<","<<double(sae/N)<<std::endl;return 0;}
''')
 src.write_text('\n'.join(s));st=time.perf_counter();core.native(src,[],out);v=next(csv.DictReader(out.open()));rec={k:float(x)if k=='MAE'else int(x)for k,x in v.items()};rec.update(query=index,wall_with_compile_s=time.perf_counter()-st,source=str(src),result=str(out));return rec
