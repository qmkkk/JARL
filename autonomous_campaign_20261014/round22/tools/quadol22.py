"""Pinned public QUADOL candidate/search code with an exhaustive WCE adapter.
Source modules remain byte-identical. All polarity/mux implementation cells survive.
"""
from pathlib import Path
import sys,os,json,hashlib,copy,itertools,random,threading,subprocess,time,csv
sys.dont_write_bytecode=True
Q=Path(__file__).resolve().parents[1];R=Q.parent
sys.path.insert(0,str(R/'tools'));import core
core.Q=Q
from core import load,dump,build,linux,run
from common22 import base_code,reference
sys.path.insert(0,str(Q/'input/quadol_source'))
import definition,util,writer,distanceCal,binarySearch,simulation

# Stable hashes affect tie ordering only; original object identity equality remains.
definition.LUT.__hash__=lambda self:int.from_bytes(hashlib.sha256(self.name.encode()).digest()[:8],'little')

def enumerate_candidates(g):
 ops,co,ins,nn,anc=build(g);luts=[];orig={}
 for op in ops:
  if op['typ']!='lut':continue
  # Hand-instantiated author primitives can repeat an input pin. The author
  # candidate API assumes distinct named inputs; quotient the truth table by
  # identical nets without changing the mapped source or its function.
  unique=list(dict.fromkeys(op['ins']))
  tt=[(op['init']>>sum(((r>>unique.index(net))&1)<<j for j,net in enumerate(op['ins'])))&1 for r in range(1<<len(unique))]
  l=definition.LUT('n'+str(op['out']),['n'+str(v)for v in reversed(unique)]);l.tt=tt;luts.append(l);orig[l.name]=op['name']
 pairs=[]
 for a,b in itertools.combinations(luts,2):
  k=len(set(a.port_list)&set(b.port_list))
  if not((a.size==6 and b.size==6 and k in [5,6])or(sorted([a.size,b.size])==[5,6]and k==5)):continue
  p=distanceCal.SimilarPair(a,b).MinHD
  assert p.HD!=float('inf') and p.implement
  pairs.append(p)
 d=definition.BLIF_design(g['top'],list(ins),[],luts);d.updateLUT62(pairs)
 return d,orig

def changed_graph(g,d,orig,selected,impl):
 h=copy.deepcopy(g);remove={orig[l.name] for i in selected for l in[d.lut62[i].lut1,d.lut62[i].lut2]};h['cells']=[c for c in h['cells']if c['name']not in remove]
 nets={'n'+str(i):i for i in range(g['n_nets'])}
 for pi,im in zip(selected,impl):
  for l in d.lut62[pi].implement[im]:
   for x in [l.name]+l.port_list:
    if x not in nets:nets[x]=h['n_nets'];h['n_nets']+=1
  for j,l in enumerate(d.lut62[pi].implement[im]):
   assert 1<=l.size<=6
   init=sum(int(b)<<i for i,b in enumerate(l.tt));pins={f'I{i}':nets[x]for i,x in enumerate(reversed(l.port_list))};pins['O']=nets[l.name]
   h['cells'].append(dict(name=f'quadol_{pi}_{j}',type=f'LUT{l.size}',pins=pins,props=dict(INIT=f"{1<<l.size}'h{init:x}")))
 return h

class Oracle:
 def __init__(self,c,g,d,orig):
  self.c,self.g,self.d,self.orig=c,g,d,orig;self.n=c['name'];self.lock=threading.Lock();self.cache={};self.records=[];self.tests=[];self.next_id=0
  self.q=Q/'build'/self.n
  if self.q.exists():self.q=Q/'build'/(self.n+'_attempt1')
  self.q.mkdir();self.max_nets=g['n_nets']+8*len(d.lut62)+4096
  ops,co,ins,nn,_=build(g);lutset={(o['init'],o['k'])for o in ops if o['typ']=='lut'}
  for p in d.lut62:
   for impl in p.implement:
    for l in impl:lutset.add((sum(int(b)<<i for i,b in enumerate(l.tt)),l.size))
  self.luts=sorted(lutset);self.ids={x:i for i,x in enumerate(self.luts)}
  s=base_code(c,g)[0];s=[x.replace(f'constexpr int NN={nn},',f'constexpr int NN={self.max_nets},')for x in s]
  s.append('#include <string>\n#include <iomanip>')
  for i,(tt,k)in enumerate(self.luts):s.append(f'static U f{i}(const U*x){{return lut<0x{tt:x}ULL,{k}>(x);}}')
  s.append('using FN=U(*)(const U*);FN fns[]={'+','.join('f'+str(i)for i in range(len(self.luts)))+'};')
  s.append(r'''
struct Op {int type,out,fn,k;int ins[6];};
int main(){std::string path;std::cout<<std::setprecision(12);
while(std::getline(std::cin,path)){if(!path.empty()&&path.back()=='\r')path.pop_back();if(path=="QUIT")break;std::ifstream f(path);int no,nc,nnet,seed;f>>no>>nc>>nnet>>seed;if(!f||nnet>NN)return 8;
std::vector<Op>ops(no);std::vector<std::pair<int,int>>co(nc);for(auto&c:co)f>>c.first>>c.second;for(auto&o:ops){f>>o.type>>o.out>>o.fn>>o.k;for(int i=0;i<o.k;i++)f>>o.ins[i];}if(!f)return 9;
auto start=std::chrono::steady_clock::now();U v[NN],wa=0,wb=0,wy=0;uint32_t out[64];I wce=0;long double sae=0;
for(U base=0;base<N;base+=64){inputs(v,base);for(auto&c:co)v[c.first]=c.second?FULL:0;
for(auto&o:ops){U x[6];for(int i=0;i<o.k;i++)x[i]=v[o.ins[i]];U z=0;switch(o.type){case 0:z=fns[o.fn](x);break;case 1:z=x[0]|x[1];break;case 2:z=x[0]&~x[1];break;case 3:z=x[0]^x[1];break;case 4:z=~x[0];break;case 5:z=(x[0]&x[2])|(~x[0]&x[1]);break;default:return 10;}v[o.out]=z;}
unpack(v,out);for(int j=0;j<64;j++){U a,b,l,h;reference(base+j,a,b,l,h);if(seed&&out[j]!=seed_expected(a,b,l))return 11;I e=std::max(std::abs(I(out[j])-I(l)),std::abs(I(out[j])-I(h)));sae+=std::abs(I(out[j])-I(l));if(e>wce){wce=e;wa=a;wb=b;wy=out[j];}}}
std::cout<<wce<<" "<<N<<" "<<wa<<" "<<wb<<" "<<wy<<" "<<std::chrono::duration<double>(std::chrono::steady_clock::now()-start).count()<<" "<<double(sae/N)<<std::endl;
}}
''')
  src=self.q/'oracle.cpp';src.write_text('\n'.join(s));binary=src.with_suffix('');run(['wsl','-d','Ubuntu','-u','k','--','g++','-O2','-std=c++17',linux(src),'-o',linux(binary)],self.q/'compile.log')
  self.err=(self.q/'oracle.stderr').open('w');self.p=subprocess.Popen(['wsl','-d','Ubuntu','-u','k','--',linux(binary)],stdin=subprocess.PIPE,stdout=subprocess.PIPE,stderr=self.err,text=True,bufsize=1,creationflags=subprocess.CREATE_NO_WINDOW)
 def evaluate(self,selected,impl):
  key=tuple(zip(selected,impl))
  if key in self.cache:return self.cache[key]
  if len(self.cache)>=512:raise RuntimeError('BLOCKED_COST_512_QUERY_LIMIT')
  qid=self.next_id;self.next_id+=1;h=changed_graph(self.g,self.d,self.orig,selected,impl)
  try:ops,co,ins,nn,_=build(h)
  except AssertionError as e:
   rec=dict(query=qid,selected=list(selected),impl=list(impl),status='INVALID_GRAPH',reason=str(e)[:1000],WCE=None);self.records.append(rec);self.cache[key]=rec;dump(self.q/'queries.json',self.records);return rec
  path=self.q/f'query_{qid:04d}.txt';code=[f'{len(ops)} {len(co)} {nn} {int(not selected)}']+[f'{n} {b}'for n,b in co.items()]
  types=['lut','or','andnot','xor','not','mux']
  for o in ops:code.append(' '.join(map(str,[types.index(o['typ']),o['out'],self.ids[(o['init'],o['k'])]if o['typ']=='lut'else 0,len(o['ins']),*o['ins']])))
  path.write_text('\n'.join(code)+'\n');self.p.stdin.write(linux(path)+'\n');self.p.stdin.flush();line=self.p.stdout.readline();assert line,('ORACLE_EXIT',self.p.poll(),self.n)
  v=line.split();assert len(v)==7,line
  rec=dict(query=qid,selected=list(selected),impl=list(impl),status='FULL_DOMAIN',WCE=int(v[0]),inputs=int(v[1]),witness_A=int(v[2]),witness_B=int(v[3]),witness_Y=int(v[4]),wall_s=float(v[5]),MAE=float(v[6]),graph_sha256=hashlib.sha256(json.dumps(h,sort_keys=True).encode()).hexdigest())
  self.cache[key]=rec;self.records.append(rec);dump(self.q/'queries.json',self.records)
  dump(Q/'state/progress.json',dict(phase='QUADOL_FULL_DOMAIN_SEARCH',case=self.n,queries=len(self.records),candidate_pairs=len(self.d.lut62)))
  return rec
 def accuracy(self,design,config,ID):
  with self.lock:
   ids=[i for i,x in enumerate(config)if x];best=None
   for impl in definition.approx_config(design,config).implement_idx:
    r=self.evaluate(ids,impl);err=r['WCE']if r['WCE']is not None else float('inf')
    if best is None or err<best[0]:best=(err,list(impl),r)
   self.tests.append(dict(config=list(config),ID=ID,error=best[0],impl=best[1],query=best[2]['query']));return config,best[0],ID,best[1]
 def close(self):
  self.p.stdin.write('QUIT\n');self.p.stdin.flush();self.p.stdin.close();assert self.p.wait()==0;self.err.close()

def run_case(c):
 n=c['name'];out=Q/f'state/{n}_search.json';assert not out.exists();g=load(Q/f'graphs/{n}_seed.json');d,orig=enumerate_candidates(g);d.e_th=c['budget'];d.e_mode='full_mathematical_WCE'
 dump(Q/f'graphs/{n}_quadol_candidates.json',[dict(id=i,a=p.lut1.name,b=p.lut2.name,HD=p.HD,mux_type=p.mux_type.value,mux_inverse=p.mux_inv,invert_A=p.O1_inv,invert_B=p.O2_inv,implementations=len(p.implement))for i,p in enumerate(d.lut62)])
 oracle=Oracle(c,g,d,orig);seed=oracle.evaluate([],[]);assert seed['WCE']==c['seed_budget'];random.seed(20261015)
 simulation.accuracy_sim=oracle.accuracy;chosen=[]
 def synth(design,config):chosen.append(list(config));return design.size-sum(config)
 simulation.synthesis=synth
 if len(d.lut62):author_result=binarySearch.binary_search(d)
 else:chosen=[[False]*len(d.lut62)];author_result=(seed['WCE'],d.size)
 original_selection=chosen[-1]
 # Pre-registered endpoint protection: examine full-prefix author-style matchings.
 import networkx as nx
 G=nx.Graph()
 for i,p in enumerate(d.lut62):G.add_edge(p.lut1,p.lut2,tag=i)
 edge=None;seen=set()
 for iteration in range(16):
  H=G.copy()
  if edge is not None:H.remove_edge(*edge)
  matching=nx.max_weight_matching(H,maxcardinality=True)
  if not matching:break
  ordered=sorted(matching,key=lambda ab:tuple(sorted(x.name for x in ab)));edge=random.choice(ordered);ids=tuple(sorted(G[a][b]['tag']for a,b in matching))
  if ids in seen:continue
  seen.add(ids);oracle.accuracy(d,[i in ids for i in range(len(d.lut62))],10000+iteration)
 feasible=[r for r in oracle.records if r['status']=='FULL_DOMAIN'and r['WCE']<=c['budget']]
 best=min(feasible,key=lambda r:(-len(r['selected']),r['WCE'],r['selected'],r['impl']));h=changed_graph(g,d,orig,best['selected'],best['impl']);dump(Q/f'graphs/{n}_quadol_wce.json',h)
 record=dict(case=n,status='COMPLETE',candidate_pairs=len(d.lut62),author_error=author_result[0],author_abstract_cost=author_result[1],author_selection=[i for i,x in enumerate(original_selection)if x],selected=best['selected'],implementation=best['impl'],selected_query=best,endpoint_protection_changed_selection=[i for i,x in enumerate(original_selection)if x]!=best['selected'],queries=len(oracle.records),full_inputs=sum(r.get('inputs',0)for r in oracle.records),full_eval_wall_s=sum(r.get('wall_s',0)for r in oracle.records),invalid_graphs=sum(r['status']=='INVALID_GRAPH'for r in oracle.records))
 dump(out,record);dump(self_path:=oracle.q/'search_tests.json',oracle.tests);oracle.close();print('QUADOL_CASE_COMPLETE',n,'queries',len(oracle.records),flush=True)

if __name__=='__main__':
 for c in load(Q/'configs/plan.json')['cases']:
  if not(Q/f'state/{c["name"]}_search.json').exists():run_case(c)
 dump(Q/'state/progress.json',dict(phase='ALL_THREE_SEARCHES_COMPLETE'))
