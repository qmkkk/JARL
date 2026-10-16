from common_serial import Q,R,load,dump,build,base_code
from oracle_serial import query
import core,csv,time,copy,hashlib
def context(c,g,root,index):
 s,ops,co,ins,nn,_=base_code(c,g);s.append(core.force_eval(ops,co));pins=root['ins'];k=len(pins);s.append('static const int pins[]={'+','.join(map(str,pins))+'};');s.append(f'constexpr int K={k},S=1<<K,ROOT={root["out"]};constexpr I BUDGET={c["budget"]};')
 s.append(r'''
int main(){U v[NN],orig[NN],count[64]={};uint32_t out[64];I lo[2][64],hi[2][64];for(int q=0;q<2;q++)for(int r=0;r<S;r++){lo[q][r]=INT64_MAX;hi[q][r]=INT64_MIN;}
for(U base=0;base<N;base+=64){inputs(orig,base);original(orig);unpack(orig,out);int rows[64]={};
for(int j=0;j<64;j++){U a,b,l,h;reference(base+j,a,b,l,h);if(std::abs(I(out[j])-I(l))>BUDGET)return 3;}
for(int b=0;b<K;b++){U z=orig[pins[b]];while(z){int j=__builtin_ctzll(z);rows[j]|=1<<b;z&=z-1;}}for(int j=0;j<64;j++)count[rows[j]]++;
for(int q=0;q<2;q++){inputs(v,base);original(v,ROOT,-1,q);unpack(v,out);for(int j=0;j<64;j++){U a,b,l,h;reference(base+j,a,b,l,h);int r=rows[j];I e=I(out[j])-I(l);lo[q][r]=std::min(lo[q][r],e);hi[q][r]=std::max(hi[q][r],e);}}}
std::cout<<"row,count,q,error_lo,error_hi\n";for(int r=0;r<S;r++)if(count[r])for(int q=0;q<2;q++)std::cout<<r<<","<<count[r]<<","<<q<<","<<lo[q][r]<<","<<hi[q][r]<<"\n";return 0;}
''');src=Q/f'src/{c["name"]}_single{index}.cpp';out=Q/f'results/{c["name"]}_single{index}.csv';assert not src.exists();src.write_text('\n'.join(s));core.native(src,[],out);tab={(int(r['row']),int(r['q'])):r for r in csv.DictReader(out.open())};return tab,out
def run_case(c):
 n=c['name'];start=time.perf_counter();g=load(Q/f'graphs/{n}_original.json');pairs=load(Q/f'graphs/{n}_pairs.json');ch=load(Q/f'state/{n}_replay_manifest.json')[0]['choices'];roots=list(dict.fromkeys(pairs[pi][k]for pi,m in ch for k in ['a','b']));history=[];queries=[]
 for index,name in enumerate(roots):
  ops,co,ins,nn,_=build(g);root=next(o for o in ops if o['name']==name);assert root['typ']=='lut'and 1<=root['k']<=6;dump(Q/'state/progress.json',dict(phase='SINGLE_OUTPUT_SUPPORT_REDUCTION',case=n,root=index,planned=len(roots)));tab,path=context(c,g,root,index);k=root['k'];cost=[[max(abs(int(tab[r,q]['error_lo'])),abs(int(tab[r,q]['error_hi'])))if(r,q)in tab else 0 for q in range(2)]for r in range(1<<k)];options=[]
  for mask in range(1<<k):
   bits=[b for b in range(k)if mask>>b&1];groups={r:[]for r in range(1<<len(bits))}
   for r in range(1<<k):groups[sum(((r>>b)&1)<<i for i,b in enumerate(bits))].append(r)
   tt=0;wc=0;hd=0;valid=True
   for row,rs in groups.items():
    allowed=[q for q in range(2)if max(cost[r][q]for r in rs)<=c['budget']]
    if not allowed:valid=False;break
    q=min(allowed,key=lambda q:(max(cost[r][q]for r in rs),sum(((root['init']>>r)&1)!=q for r in rs),q));tt|=q<<row;wc=max(wc,max(cost[r][q]for r in rs));hd+=sum(((root['init']>>r)&1)!=q for r in rs)
   if valid:options.append(((len(bits),wc,hd,mask,tt),bits,tt))
  assert options;rank,bits,tt=min(options);hh=copy.deepcopy(g);cell=next(x for x in hh['cells']if x['name']==name);selected=[root['ins'][b]for b in bits]
  if not selected:selected=[root['ins'][0]];tt=3 if tt else 0
  cell['type']='LUT'+str(len(selected));cell['pins']={**{f'I{i}':v for i,v in enumerate(selected)},'O':root['out']};cell['props']=dict(cell.get('props',{}),INIT=f"{1<<len(selected)}'h{tt:x}");newops,*_=build(hh);rec=query(c,hh,newops,index);assert rec['WCE']<=c['budget'];queries.append(rec);g=hh;history.append(dict(root=name,old_support=root['k'],new_support=len(bits),rank=list(rank),table=str(path),check=rec));print(n,index,'support',root['k'],'to',len(bits),flush=True)
 ops,*_=build(g);final=query(c,g,ops,len(roots));dump(Q/f'graphs/{n}_seed.json',g);dump(Q/f'state/{n}_serial.json',dict(case=n,status='COMPLETE',roots=len(roots),history=history,checks=queries,final=final,seconds=time.perf_counter()-start));print('SERIAL_SUPPORT_COMPLETE',n,flush=True)
if __name__=='__main__':
 for c in load(Q/'configs/plan.json')['cases']:run_case(c)
