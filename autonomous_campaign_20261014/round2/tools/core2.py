from pathlib import Path
import sys,json,csv,itertools,collections,time,hashlib
sys.dont_write_bytecode=True
Q=Path(__file__).resolve().parents[1];R=Q.parent
sys.path.insert(0,str(R/'tools'))
import core
core.Q=Q
from core import load,dump,linux,native,build,base_code,force_eval,truth,replace_ops,reorder,emit_ops,structural_score,physical_complete,np,nx,export_rtl,scalar
METHODS=['seed','serial','joint']
def candidates(c):
 g=load(Q/f'graphs/{c["name"]}.json');ops,co,ins,nn,anc=build(g);lut=[o for o in ops if o['typ']=='lut'and 4<=o['k']<=6];depth={n:0 for n in set(co)|set(ins)}
 for o in ops:depth[o['out']]=1+max(depth[x]for x in o['ins'])
 pool=[]
 for a,b in itertools.combinations(lut,2):
  aa,bb=set(a['ins']),set(b['ins']);u=aa|bb;sh=aa&bb
  if not(5<=len(u)<=8 and len(sh)<=4):continue
  if a['out']in anc[b['out']]or b['out']in anc[a['out']]:continue
  ha=a.get('props',{}).get('HLUTNM');hb=b.get('props',{}).get('HLUTNM')
  if ha and ha==hb and a['name'].rsplit('/',1)[0]==b['name'].rsplit('/',1)[0]:continue
  pool.append(dict(a=a['name'],b=b['name'],a_out=a['out'],b_out=b['out'],a_ins=a['ins'],b_ins=b['ins'],a_init=a['init'],b_init=b['init'],support=sorted(u),shared=len(sh),union=len(u),depth=max(depth[a['out']],depth[b['out']])))
 pool.sort(key=lambda p:(-p['shared'],p['union'],p['depth'],p['a'],p['b']));degrees=collections.Counter();chosen=[]
 for p in pool:
  if degrees[p['a']]>=4 or degrees[p['b']]>=4:continue
  chosen.append(p);degrees.update([p['a'],p['b']])
  if len(chosen)==24:break
 dump(Q/f'graphs/{c["name"]}_pairs.json',chosen);dump(Q/f'state/{c["name"]}_pool.json',dict(structural_candidates=len(pool),registered_candidates=len(chosen)));return g,chosen
def context(c):
 n=c['name'];g,pairs=candidates(c);s,ops,co,ins,nn,anc=base_code(c,g);s.append(force_eval(ops,co));s.append('struct Pair{int a,b,k;int inputs[8];};\nstatic const Pair pairs[]={'+','.join('{%d,%d,%d,{%s}}'%(p['a_out'],p['b_out'],len(p['support']),','.join(map(str,p['support'])))for p in pairs)+'};');s.append(f'constexpr int NP={len(pairs)};constexpr I BUDGET={c["budget"]};')
 s.append(r'''
int main(int argc,char**argv){std::string prefix=argv[1];U v[NN],orig[NN];uint32_t out[64];U blocks=MUL?std::min(N/64,U(1024)):N/64;
for(int pi=0;pi<NP;pi++){auto&p=pairs[pi];int S=1<<p.k;I lo[4][256],hi[4][256];U counts[256]={};for(int q=0;q<4;q++)for(int r=0;r<S;r++){lo[q][r]=INT64_MAX;hi[q][r]=INT64_MIN;}
for(U bi=0;bi<blocks;bi++){U base=MUL?((bi*U(104729))%(N/64))*64:bi*64;inputs(orig,base);original(orig);unpack(orig,out);int rows[64]={};
for(int j=0;j<64;j++){U a,b,l,h;reference(base+j,a,b,l,h);if(std::max(std::abs(I(out[j])-I(l)),std::abs(I(out[j])-I(h)))>BUDGET){std::cerr<<"SEED_BUDGET_FAILURE "<<base+j;return 3;}}
for(int k=0;k<p.k;k++){U v=orig[p.inputs[k]];while(v){int j=__builtin_ctzll(v);rows[j]|=1<<k;v&=v-1;}}for(int j=0;j<64;j++)counts[rows[j]]++;
for(int q=0;q<4;q++){inputs(v,base);original(v,p.a,p.b,q);unpack(v,out);for(int j=0;j<64;j++){U a,b,l,h;reference(base+j,a,b,l,h);int r=rows[j];lo[q][r]=std::min(lo[q][r],I(out[j])-I(h));hi[q][r]=std::max(hi[q][r],I(out[j])-I(l));}}}
std::ofstream f(prefix+"_pair"+std::to_string(pi)+".csv");f<<"row,count,q,error_lo,error_hi\n";for(int r=0;r<S;r++)if(counts[r])for(int q=0;q<4;q++)f<<r<<","<<counts[r]<<","<<q<<","<<lo[q][r]<<","<<hi[q][r]<<"\n";
std::cout<<"context_pair="<<pi<<" inputs="<<blocks*64<<std::endl;}}
''')
 src=Q/f'src/{n}_contexts.cpp';src.write_text('\n'.join(s));native(src,[linux(Q/f'results/{n}')],Q/f'logs/{n}_contexts.log');print(n,'context',len(pairs),flush=True)
def configure(pair,path,ops,g,budget):
 sup=pair['support'];rr=np.arange(1<<len(sup));f=truth(pair['a_init'],pair['a_ins'],sup,rr);h=truth(pair['b_init'],pair['b_ins'],sup,rr);cost=np.zeros((len(rr),4),dtype=np.int64)
 for row in csv.DictReader(path.open()):cost[int(row['row']),int(row['q'])]=max(abs(int(row['error_lo'])),abs(int(row['error_hi'])))
 hd=np.stack([((q&1)!=f).astype(int)+((q>>1)!=h).astype(int)for q in range(4)],axis=1);joint_pool=[];serial_pool=[];checked=0
 def cf_from(q,sh):return dict(shared=list(sh),select=None,mode='f6',initA=f'{sum(int(v&1)<<r for r,v in enumerate(q)):08x}',initB=f'{sum(int(v>>1)<<r for r,v in enumerate(q)):08x}')
 def rank(x):return(structural_score(ops,g,pair,x),x['wce'],x['local_hd'],x['initA'],x['initB'])
 for sh in itertools.combinations(sup,5):
  idx=sum(((rr>>sup.index(n))&1)<<i for i,n in enumerate(sh));order=np.argsort(idx,kind='stable');grp=order.reshape(32,-1);cc=cost[grp].max(axis=1);hh=hd[grp].sum(axis=1);q=np.array([min(range(4),key=lambda a:(cc[r,a],hh[r,a],a))for r in range(32)]);w=int(cc[np.arange(32),q].max());checked+=1
  if w<=budget:
   cf=dict(cf_from(q,sh),wce=w,local_hd=int(hh[np.arange(32),q].sum()));joint_pool.append((rank(cf),cf,cc,hh))
  for first in [0,1]:
   vals=[];first_w=0
   for rows in grp:
    oldother=h[rows]if first==0 else f[rows]
    def first_key(bit):
     qs=bit+2*oldother if first==0 else oldother+2*bit
     return(int(cost[rows,qs].max()),int(hd[rows,qs].sum()),bit)
    v=min([0,1],key=first_key);first_w=max(first_w,first_key(v)[0]);vals.append(v)
   if first_w>budget:continue
   qq=[]
   for row,v in enumerate(vals):
    options=[v+2*b for b in [0,1]]if first==0 else[a+2*v for a in [0,1]]
    qq.append(min(options,key=lambda a:(cc[row,a],hh[row,a],a)))
   qq=np.array(qq);w=int(cc[np.arange(32),qq].max())
   if w<=budget:serial_pool.append(dict(cf_from(qq,sh),wce=w,local_hd=int(hh[np.arange(32),qq].sum()),first_output=first,first_intermediate_WCE=first_w))
 serial=min(serial_pool,key=rank)if serial_pool else None
 # Cost ranking happens before completion; only the fixed top two are completed.
 joint_pool.sort(key=lambda x:x[0]);joint_final=[x[1]for x in joint_pool]
 for _,cf,cc,hh in joint_pool[:2]:joint_final.append(physical_complete(cf,cc,hh,budget,ops,g,pair))
 joint=min(joint_final,key=rank)if joint_final else None
 for cf in [serial,joint]:
  if cf:cf['proxy']=list(structural_score(ops,g,pair,cf))
 return dict(serial=serial,joint=joint),dict(topologies=checked,serial_legal_completions=len(serial_pool),joint_legal_topologies=len(joint_pool))
def optimize(c):
 n=c['name'];g=load(Q/f'graphs/{n}.json');ops,*_=build(g);pairs=load(Q/f'graphs/{n}_pairs.json');records=[];st=time.perf_counter()
 for i,p in enumerate(pairs):
  t=time.perf_counter();methods,diag=configure(p,Q/f'results/{n}_pair{i}.csv',ops,g,c['budget']);records.append(dict(pair=i,methods=methods,diagnostic=diag,seconds=time.perf_counter()-t));print(n,'pair',i,'serial',methods['serial']is not None,'joint',methods['joint']is not None,flush=True)
 dump(Q/f'results/{n}_methods.json',records);dump(Q/f'state/{n}_optimize.json',dict(seconds=time.perf_counter()-st,pairs=len(pairs),serial=sum(r['methods']['serial']is not None for r in records),joint=sum(r['methods']['joint']is not None for r in records)))
def matched(c,ops,co,ins,pairs,records,method):
 if method=='seed':return [],[]
 G=nx.Graph();base_sites=sum(o['typ']=='lut'and o['k']>=2 for o in ops)
 for r in records:
  cf=r['methods'][method]
  if cf is None:continue
  pi=r['pair'];p=pairs[pi];gain=max(0,base_sites-cf['proxy'][0]);G.add_edge(p['a'],p['b'],pair=pi,weight=(1000+100*gain)*10000+(len(pairs)-pi))
 matching=nx.max_weight_matching(G,maxcardinality=False);ids=sorted((G.edges[a,b]['pair']for a,b in matching),key=lambda pi:(records[pi]['methods'][method]['proxy'],pi));chosen=[];new=ops;by={o['name']:o for o in ops};rejected=[]
 for pi in ids:
  candidate=replace_ops(new,pairs[pi],records[pi]['methods'][method]);union=[dict(o,ins=sorted(set(o['ins'])|set(by[o['name']]['ins'])))for o in candidate]
  if reorder(union,set(co)|set(ins))is None:rejected.append(pi);continue
  new=candidate;chosen.append((pi,method))
 return chosen,rejected
def replay(c):
 n=c['name'];g=load(Q/f'graphs/{n}.json');pairs=load(Q/f'graphs/{n}_pairs.json');records=load(Q/f'results/{n}_methods.json');s,ops,co,ins,nn,_=base_code(c,g);s.append('#include <iomanip>');s.append(emit_ops(ops,co,'original'));by={o['name']:o for o in ops};manifest=[]
 for mi,m in enumerate(METHODS):
  chosen,rejected=matched(c,ops,co,ins,pairs,records,m);new=ops
  for pi,_ in chosen:new=replace_ops(new,pairs[pi],records[pi]['methods'][m])
  newby={o['name']:o for o in new};union=[dict(o,ins=sorted(set(o['ins'])|set(by[o['name']]['ins'])))for o in new];ordered=reorder(union,set(co)|set(ins));assert ordered is not None;new=[newby[o['name']]for o in ordered];index={pairs[pi][key]:j for j,(pi,_)in enumerate(chosen)for key in ['a','b']};s.append(f'static void eval{mi}(U*v,U mask){{')
  for k,b in co.items():s.append(f'v[{k}]={"FULL"if b else"0"};')
  for op in new:
   code=''.join(emit_ops([op],{},'x').splitlines()[1:-1])
   if op['name']in index:code=f'if(mask&(U(1)<<{index[op["name"]]})){{'+code+'}else{'+''.join(emit_ops([by[op['name']]],{},'x').splitlines()[1:-1])+'}'
   s.append(code)
  s.append('}');manifest.append(dict(method=m,choices=chosen,cycle_rejected_pairs=rejected))
 s.append('''
static I check(int method,U mask,const char*stage,int step){U v[NN];uint32_t out[64];I wce=-1,lo=INT64_MAX,hi=INT64_MIN;U wa=0,wb=0,wy=0,errors=0;long double sae=0;
for(U base=0;base<N;base+=64){inputs(v,base);if(method==0)eval0(v,mask);else if(method==1)eval1(v,mask);else eval2(v,mask);unpack(v,out);for(int j=0;j<64;j++){U a,b,l,h;reference(base+j,a,b,l,h);I el=I(out[j])-I(h),eh=I(out[j])-I(l);lo=std::min(lo,el);hi=std::max(hi,eh);if(std::abs(el)>wce){wce=std::abs(el);wa=a+((U(1)<<T)-1);wb=b+((U(1)<<T)-1);wy=out[j];}if(std::abs(eh)>wce){wce=std::abs(eh);wa=a;wb=b;wy=out[j];}errors+=(out[j]!=l);sae+=std::abs(eh);}}
std::cout<<method<<","<<stage<<","<<step<<","<<mask<<","<<N<<","<<wce<<","<<lo<<","<<hi<<","<<wa<<","<<wb<<","<<wy<<","<<errors<<","<<std::setprecision(17)<<double(sae/N)<<std::endl;return wce;}
int main(){std::cout<<"method,stage,step,mask,inputs,WCE,error_lo,error_hi,witness_A,witness_B,witness_Y,error_count_at_lowbits_zero,MAE_at_lowbits_zero\\n";
''')
 for mi,d in enumerate(manifest):
  s.append(f'{{U mask=0;for(int j=0;j<{len(d["choices"])};j++){{U proposed=mask|(U(1)<<j);if(check({mi},proposed,"admission",j)<={c["budget"]})mask=proposed;}}if(check({mi},mask,"final",-1)>{c["budget"]})return 6;}}')
 s.append('return 0;}');src=Q/f'src/{n}_replay.cpp';src.write_text('\n'.join(s));dump(Q/f'state/{n}_replay_manifest.json',manifest);native(src,[],Q/f'results/{n}_replay.csv');print(n,'full-domain replay complete',flush=True)
if __name__=='__main__':
 phase=sys.argv[1]
 for c in load(Q/'configs/plan.json')['cases']:
  dump(Q/'state/progress.json',dict(phase=phase,case=c['name']));dict(context=context,optimize=optimize,replay=replay)[phase](c)
