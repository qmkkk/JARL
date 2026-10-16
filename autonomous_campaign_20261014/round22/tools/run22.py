from common22 import Q,R,load,dump,build,COMMON
import core,sys,subprocess,time,hashlib,copy,csv,random,re,struct,collections
sys.path.insert(0,str(R/'input/legacy_code'))
from edif_graph import read_edif
from formal22 import bool_rtl,proof,combin_primitives
import proposal22 as proposal
from configure22 import configure
from quadol22 import enumerate_candidates,changed_graph
from direct22 import quadol_rtl
import networkx as nx
V='E:/AMDDesignTools/2026.1/Vivado/bin/vivado.bat';plan=load(Q/'configs/plan.json')
def phase(s,**kw):dump(Q/'state/progress.json',dict(phase=s,**kw))
def map_case(c):
 n=c['name'];fp=Q/f'graphs/{n}_seed.json'
 if fp.exists():return load(fp)
 d=Q/'build'/('source_'+n);d.mkdir();src=Q/f'rtl/{n}_source.v';tcl=d/'map.tcl'
 tcl.write_text(f'set_param general.maxThreads 4\ncreate_project -in_memory -part xc7a100tcsg324-1\nread_verilog -sv {src.as_posix()}\nsynth_design -mode out_of_context -top {n}_source -part xc7a100tcsg324-1 -max_dsp 0\nwrite_edif -force {(d/"source.edf").as_posix()}\nreport_utilization -file {(d/"util.rpt").as_posix()}\nclose_project\n')
 phase('SOURCE_SYNTH',case=n)
 with(d/'map.log').open('w')as out:p=subprocess.run([V,'-mode','batch','-nojournal','-nolog','-source',str(tcl)],cwd=d,stdout=out,stderr=subprocess.STDOUT,creationflags=subprocess.CREATE_NO_WINDOW)
 p.check_returncode();g=read_edif(d/'source.edf');cells=[];cnt=0
 for x in g['cells']:
  if x['type']!='LUT6_2':cells.append(x);continue
  cnt+=1;tt=int(x['props']['INIT'].split("'h")[1],16)
  for k,out,init in [(5,'O5',tt&0xffffffff),(6,'O6',tt)]:
   if out not in x['pins']:continue
   pins={f'I{i}':x['pins'][f'I{i}']for i in range(k)};pins['O']=x['pins'][out]
   cells.append(dict(name=x['name']+'/'+out,type=f'LUT{k}',pins=pins,props=dict(x['props'],INIT=f"{1<<k}'h{init:x}",HLUTNM=f'original_dual_{cnt}')))
 g['cells']=cells;g['normalized_dual_primitives']=cnt;build(g);dump(fp,g);dump(Q/f'graphs/{n}.json',g);return g
def sample_context(c,g,ops,co,ins,nn,p,pi):
 n=c['name'];path=Q/f'results/{n}_pair{pi}.csv'
 if path.exists():return path
 s=[COMMON,f'constexpr int NN={nn},N={plan["sample_count"]};',core.force_eval(ops,co),'static uint32_t samples[N];','static void inputs(U*v,int base){']
 for net,name in ins.items():
  b=int(name[2:-1])+(0 if name[0]=='A' else 16);s.append(f'v[{net}]=0;for(int j=0;j<64;j++)v[{net}]|=U((samples[base+j]>>{b})&1)<<j;')
 s.append('}\nstatic uint32_t value(U*v,int j){uint32_t y=0;')
 for i in range(32):s.append(f'y|=uint32_t((v[{g["ports"][f"Y[{i}]"]}]>>j)&1)<<{i};')
 s.append('return y;}\nstatic int supp[]={'+','.join(map(str,p['support']))+'};')
 s.append(f'constexpr int S=1<<{len(p["support"])},K={len(p["support"])};')
 s.append(r'''int main(int argc,char**argv){std::ifstream f(argv[1],std::ios::binary);f.read((char*)samples,sizeof(samples));if(!f)return 3;U v[NN],o[NN];U cnt[256]={};bool bad[4][256]={};
for(int base=0;base<N;base+=64){inputs(o,base);original(o);int rows[64]={};uint32_t ref[64];for(int j=0;j<64;j++){ref[j]=value(o,j);for(int k=0;k<K;k++)rows[j]|=((o[supp[k]]>>j)&1)<<k;cnt[rows[j]]++;}
for(int q=0;q<4;q++){inputs(v,base);original(v,AOUT,BOUT,q);for(int j=0;j<64;j++)bad[q][rows[j]]|=(value(v,j)!=ref[j]);}}
std::cout<<"row,count,q,error_lo,error_hi,seed_error_lo,seed_error_hi,current_error_lo,current_error_hi\n";
for(int r=0;r<S;r++)if(cnt[r])for(int q=0;q<4;q++)std::cout<<r<<","<<cnt[r]<<","<<q<<",0,"<<bad[q][r]<<",0,"<<bad[q][r]<<",0,"<<bad[q][r]<<"\n";}
'''.replace('AOUT',str(p['a_out'])).replace('BOUT',str(p['b_out'])))
 src=Q/f'src/{n}_pair{pi}.cpp';src.write_text('\n'.join(s));core.native(src,[core.linux(Q/'inputs/samples.bin')],path);return path
def values(g,ops,co,ins,nn,a,b,forced=None):
 v=[0]*nn;v[:]=v
 for n,z in co.items():v[n]=z
 for n,k in ins.items():v[n]=((a if k[0]=='A'else b)>>int(k[2:-1]))&1
 for o in ops:
  x=[v[n]for n in o['ins']];t=o['typ']
  z=((o['init']>>sum(q<<i for i,q in enumerate(x)))&1)if t=='lut'else {'or':lambda:x[0]|x[1],'andnot':lambda:x[0]&(1-x[1]),'xor':lambda:x[0]^x[1],'not':lambda:1-x[0],'mux':lambda:x[2]if x[0]else x[1]}[t]()
  v[o['out']]=(forced or{}).get(o['out'],z)
 return v,sum(v[g['ports'][f'Y[{i}]']]<<i for i in range(32))
def refine(path,g,current,co,ins,nn,p,w):
 v,ref=values(g,current,co,ins,nn,w['A'],w['B']);row=sum(v[n]<<i for i,n in enumerate(p['support']));rows=list(csv.DictReader(path.open()));field=list(rows[0]);index={(int(r['row']),int(r['q'])):r for r in rows}
 for q in range(4):
  _,y=values(g,current,co,ins,nn,w['A'],w['B'],{p['a_out']:q&1,p['b_out']:q>>1});bad=int(y!=ref);r=index.setdefault((row,q),dict(row=row,count=0,q=q,error_lo=0,error_hi=0,seed_error_lo=0,seed_error_hi=0,current_error_lo=0,current_error_hi=0))
  for k in ['error_hi','seed_error_hi','current_error_hi']:r[k]=max(int(r[k]),bad)
 with path.open('w',newline='')as f:wr=csv.DictWriter(f,fieldnames=field);wr.writeheader();wr.writerows(index[k]for k in sorted(index))
def quadol(c,g):
 n=c['name'];d,orig=enumerate_candidates(g);G=nx.Graph()
 for i,p in enumerate(d.lut62):
  if p.HD==0:G.add_edge(p.lut1,p.lut2,tag=i,weight=1<<(len(d.lut62)-i))
 mat=nx.max_weight_matching(G,maxcardinality=True);ids=sorted(G[a][b]['tag']for a,b in mat);impl=[0]*len(ids);h=changed_graph(g,d,orig,ids,impl);build(h)
 dump(Q/f'state/{n}_search.json',dict(selected=ids,implementation=impl,candidate_pairs=len(d.lut62),exact_candidate_pairs=G.number_of_edges(),scope='Pinned author MinHD=0 generator + deterministic maximum-cardinality matching; exact-only endpoint.'))
 dump(Q/f'graphs/{n}_quadol_wce.json',h);return h
def case(c):
 n=c['name'];done=Q/f'state/{n}_complete.json'
 if done.exists():return
 g=map_case(c);ops,co,ins,nn,anc=build(g);gold=bool_rtl(g,ops,co,ins,nn,'gold');proposal.candidates(c);pairs=load(Q/f'graphs/{n}_pairs.json');current=ops;accepted=[];data={};history=[];used=set();start=time.perf_counter()
 for pi,p in enumerate(pairs):
  if used&{p['a'],p['b']}:history.append(dict(pair=pi,status='OVERLAP_SKIPPED'));continue
  # Candidate supports must precede both roots in the current graph.
  ancestor={x:set()for x in set(co)|set(ins)}
  for o in current:ancestor[o['out']]=set(o['ins'])|set().union(*(ancestor[x]for x in o['ins']))
  if any({p['a_out'],p['b_out']}&({x}|ancestor[x])for x in p['support']):history.append(dict(pair=pi,status='DEPENDENT_SUPPORT_REJECTED'));continue
  phase('SAMPLED_RELATION_AND_SAT',case=n,pair=pi,total=len(pairs));path=sample_context(c,g,current,co,ins,nn,p,pi);ev=dict(pair=pi,attempts=[])
  for attempt in range(3):
   mm,diag=configure(p,path,current,g,0,policy='state_exact');cf=mm['numeric_window']
   if cf is None:ev['status']='NO_COMPLETION';break
   new=core.reorder(core.replace_ops(current,p,cf),set(co)|set(ins))
   if new is None:ev['status']='CYCLIC';break
   rec=proof(gold,bool_rtl(g,new,co,ins,nn,'trial'),f'{n}_p{pi}_a{attempt}');ev['attempts'].append(dict(configuration=cf,proof=rec))
   if rec['status']=='PROVED':
    current=new;accepted.append([pi,'state_formal']);used|={p['a'],p['b']};data[pi]=dict(methods=dict(state_formal=cf));ev['status']='ACCEPTED';break
   if rec['status']=='TIMEOUT':ev['status']='UNPROVEN_TIMEOUT';break
   assert rec['status']=='COUNTEREXAMPLE';refine(path,g,current,co,ins,nn,p,rec['witness']);ev['status']='REFINEMENT_LIMIT'
  history.append(ev);dump(Q/f'state/{n}_partial.json',dict(accepted=accepted,history=history));print(n,pi,ev['status'],flush=True)
 h=quadol(c,g);hop,hco,hin,hnn,_=build(h)
 models={'author':(g,ops,co,ins,nn),'quadol_exact':(h,hop,hco,hin,hnn),'state_formal':(g,current,co,ins,nn)};entries=[];formal=[]
 for method,model in models.items():
  top=f'r22_{n}_{method}'
  text=quadol_rtl(c,h,top)if method=='quadol_exact'else core.export_rtl(g,accepted if method=='state_formal'else[],pairs,data,top)
  (Q/f'rtl/{top}.v').write_text(text)
  # Compare actual LUT6_2/primitive implementation to graph reference independently.
  comb=combin_primitives(text,h if method=='quadol_exact'else g,'trial')
  mg,mo,mc,mi,mn=model
  rec=proof(bool_rtl(mg,mo,mc,mi,mn,'gold',True),comb,f'{n}_{method}_primitive_canonical',libs=True,seconds=10);assert rec['status']=='PROVED',rec;formal.append(dict(method=method,**rec))
  if method=='quadol_exact':
   rec=proof(gold,bool_rtl(h,hop,hco,hin,hnn,'trial'),f'{n}_quadol_to_reference');assert rec['status']=='PROVED',rec;formal.append(dict(method='quadol_to_reference',**rec))
  canonical=text.replace(top,'canonical');digest=hashlib.sha256(canonical.encode()).hexdigest()
  entries.append(dict(case=n,family=n,method=method,top=top,clock_ns=15,route_registered=True,duplicate_of=None,canonical_sha256=digest,sha256=hashlib.sha256(text.encode()).hexdigest(),budget=0,budget_scope='exact delta to FABM',WCE=0))
 # Independently check source author RTL, not only parser-generated baseline.
 source='\n'.join(p.read_text()for p in sorted((Q/'inputs/author').glob('*.v'))if p.name!='top.v')
 source+=f'\nmodule trial(input[15:0] A,B,output[31:0]Y);Approxi_Multi #(.approximate_bit({c["approximate_bit"]})) u(A,B,Y);endmodule\n'
 rec=proof(bool_rtl(g,ops,co,ins,nn,'gold',True),source,f'{n}_author_source_equivalence',libs=True,seconds=10);assert rec['status']=='PROVED',rec;formal.append(dict(method='source_vs_graph',**rec))
 rng=random.Random(20261015);edge=[0,1,2,127,128,255,256,32767,32768,65534,65535];vv={(a,b)for a in edge for b in edge};vv.update((rng.randrange(65536),rng.randrange(65536))for _ in range(4096));lines=[]
 for a,b in sorted(vv):
  yy=[core.scalar(*models[e['method']],a,b)for e in entries];assert len(set(yy))==1;lines.append(' '.join(f'{x:08x}'for x in [a,b]+yy))
 (Q/f'rtl/{n}_golden.hex').write_text('\n'.join(lines)+'\n');tb=f'tb_r22_{n}';code=['`timescale 1ns/1ps',f'module {tb};reg clk=0;always #5 clk=~clk;reg[15:0]A=0,B=0;wire[31:0]Y[0:2];reg[31:0]e[0:2];reg[31:0]aa,bb;integer fd,rc,k,cnt=0;']
 for i,e in enumerate(entries):code.append(f'{e["top"]}u{i}(clk,A,B,Y[{i}]);'.replace(f'{e["top"]}u',f'{e["top"]} u'))
 code += [f'initial begin #200;fd=$fopen("{n}_golden.hex","r");if(fd==0)$fatal;while(!$feof(fd))begin rc=$fscanf(fd,"%h %h %h %h %h\\n",aa,bb,e[0],e[1],e[2]);if(rc==5)begin @(negedge clk);A=aa;B=bb;repeat(2)@(posedge clk);#1;for(k=0;k<3;k=k+1)if(Y[k]!==e[k])$fatal(1,"mismatch %d %d",cnt,k);cnt=cnt+1;end end $display("R22_PASS family={n} vectors=%0d designs=3",cnt);$finish;end endmodule']
 (Q/f'rtl/{tb}.sv').write_text('\n'.join(code));dump(done,dict(case=n,accepted=accepted,history=history,formal=formal,entries=entries,golden=dict(family=n,tb=tb,vectors=len(vv),designs=3,checks=3*len(vv)),seconds=time.perf_counter()-start));print('CASE_COMPLETE',n,flush=True)
if __name__=='__main__':
 for c in plan['cases']:case(c)
 rows=[load(Q/f'state/{c["name"]}_complete.json')for c in plan['cases']];entries=sum([r['entries']for r in rows],[]);seen={}
 # The author baseline must retain the original hand-instantiated LUT6_2 cells.
 # A parsed export is functionally equal but is not the strongest faithful
 # physical author implementation. No physical job has run before this gate.
 corrections=[]
 for e in entries:
  if e['method']!='author':continue
  path=Q/f'rtl/{e["top"]}.v';saved=Q/f'rtl/{e["top"]}_parsed_export.v'
  if not saved.exists():saved.write_bytes(path.read_bytes())
  text=(Q/f'rtl/{e["case"]}_source.v').read_text().replace(e['case']+'_source',e['top']);path.write_text(text)
  corrections.append(dict(top=e['top'],parsed_export_sha256=e['sha256'],physical_source='Original author modules and identical two-register wrapper; no flattened reconstruction.'))
  e['sha256']=hashlib.sha256(text.encode()).hexdigest();e['canonical_sha256']=hashlib.sha256(text.replace(e['top'],'canonical').encode()).hexdigest();e['author_original_rtl']=True
 dump(Q/'state/author_physical_endpoint_correction.json',corrections)
 for e in entries:
  key=(e['case'],e['canonical_sha256']);e['duplicate_of']=seen.get(key);seen.setdefault(key,e['top'])
 dump(Q/'rtl/design_manifest.json',entries);dump(Q/'state/golden.json',[r['golden']for r in rows]);phase('HARDWARE');subprocess.run([sys.executable,'-X','utf8','-B',str(Q/'tools/hardware22.py')],check=True)
 dump(Q/'state/round_status.json',dict(status='COMPLETE_AWAIT_ANALYSIS',endpoints=len(entries)));print('ROUND22_COMPLETE',flush=True)
