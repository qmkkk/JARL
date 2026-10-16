from pathlib import Path
import json,shutil,hashlib,datetime,ast
R=Path(__file__).resolve().parents[1];Q=R/'round17'
load=lambda p:json.loads(p.read_text());dump=lambda p,x:p.write_text(json.dumps(x,indent=2,ensure_ascii=False),encoding='utf-8');h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
assert load(R/'round16/state/round_status.json')['status']=='COMPLETE';assert not Q.exists()
for d in ['tools','configs','input','inputs','graphs','rtl','src','build','results/hardware','state','logs','reports']:(Q/d).mkdir(parents=True,exist_ok=True)
cases=[];origins=[];catalog=[]
for w,aw,B,clk in [(8,8,256,10.0),(9,6,1024,12.5),(10,4,4096,15.0)]:
 source=f'mac{w}_add{aw}_b{B}';options=[]
 for cut in range(2*w+1):
  removed=sum(1<<(i+j)for i in range(w)for j in range(w)if i+j<cut)
  if(removed+1)//2<=B:options.append((cut,removed))
 cut,total=max(options);comp=total//2
 for flow in ['native','column']:
  n=source+'_'+flow;c=dict(name=n,source_case=source,kind='mac',width=w,add_width=aw,domain_bits=2*w+aw,budget=B,clock_ns=clk,flow=flow,cut=cut,removed_max=total,compensation=comp);assert c['domain_bits']==24;cases.append(c)
  top=n+'_source';lines=[f'module {top}(input wire clk,input wire[15:0] A,B,output reg[31:0] Y);',f'reg[{w-1}:0]a_q;reg[{w+aw-1}:0]b_q;']
  if flow=='native':lines += [f'wire[{2*w-1}:0]p=a_q*b_q[{w-1}:0];',f'wire[{2*w-1}:0]q=(p+b_q[{w+aw-1}:{w}])|1;']
  else:
   row_names=[]
   for j in range(w):
    bits=[f'(a_q[{i}] & b_q[{j}])'if cut<=i+j<2*w else "1'b0"for i in range(w)]
    lines.append(f'wire[{2*w-1}:0]row{j} = '+"{"+f"{w}'b0,"+','.join(reversed(bits))+f'}} << {j};');row_names.append('row'+str(j))
   # Fixed balanced reduction tree; no placement- or result-guided architecture search.
   level=0
   while len(row_names)>1:
    nxt=[]
    for i in range(0,len(row_names),2):
     if i+1==len(row_names):nxt.append(row_names[i]);continue
     nm=f'sum{level}_{i//2}';lines.append(f'wire[{2*w-1}:0]{nm}={row_names[i]}+{row_names[i+1]};');nxt.append(nm)
    row_names=nxt;level+=1
   lines.append(f'wire[{2*w-1}:0]q={row_names[0]}+{2*w}\'d{comp}+b_q[{w+aw-1}:{w}];')
  lines += [f'always @(posedge clk) begin a_q<=A[{w-1}:0];b_q<=B[{w+aw-1}:0];Y<=q;end','endmodule']
  (Q/f'rtl/{top}.v').write_text('\n'.join(lines)+'\n')
  (Q/f'rtl/{n}.xdc').write_text(f'create_clock -period {clk} -name clk [get_ports clk]\nset_input_delay 2.0 -clock clk [get_ports {{A* B*}}]\nset_output_delay 2.0 -clock clk [get_ports Y*]\nset_property HD.CLK_SRC BUFGCTRL_X0Y0 [get_ports clk]\n')
  if w==9 and flow=='native':
   p=R/'round16/graphs/mac9_add6_b1024_seed.json';d=Q/f'graphs/{n}_inherited.json';shutil.copy2(p,d);origins.append(dict(source=str(p),target=str(d),sha256=h(p),reason='Exact same native9x9+6 OR1 graph'))
   for rn,method in [(13,'seed'),(16,'state_window')]:
    oq=R/f'round{rn}';on='mac9_add6_odd'if rn==13 else'mac9_add6_b1024';e=next(e for e in load(oq/'rtl/design_manifest.json')if e['case']==on and e['method']==method)
    pp=e['inherited_record']['physical_result']if e['inherited_physical']else next(p for p in load(oq/'results/hardware/ppa.json')if p['top']==e['top']);rtl=oq/f'rtl/{e["top"]}.v'
    catalog.append(dict(case=n,source_round=rn,canonical_sha256=e['canonical_sha256'],rtl=str(rtl),rtl_file_sha256=h(rtl),physical_result=pp,case_alias_reason='Same full-width9x9+6 mathematical function, same source graph, B1024,12.5ns; reuse only if canonicalRTLidentical'))
plan=dict(round=17,registered=datetime.datetime.now().astimezone().isoformat(),question='Does state-conditioned numerical LUT6_2 synthesis transfer across MAC widths and improve a dedicated bounded-error arithmetic starting point?',cases=cases,methods_per_flow=['seed','state_window'],baselines=['Native Vivado MAC OR1 at mathWCE1','Compensated lower partial-product column truncation with exact addend'],innovations=['Unchanged R16 state-conditioned relation synthesis on native starting circuit','The same proposed model on the structured truncated starting circuit'],method_status='Two applications of one proposed model, not new algorithms; column truncation and constant compensation are known arithmetic techniques, not claimed as innovation.',source_policy='8x8+8,9x9+6,10x10+4; all24effective input bits. Native9graph inherited unchanged; remaining5graphs freshly synthesize fixedRTL. No ABC recipe scan.',arithmetic_baseline='Choose largest cut k analytically with ceil(Sk/2)<=B, Sk=sum(2^(i+j),i+j<k); hardwire C=floor(Sk/2), exact addend, balanced sum of retained partial-product rows. Error=C-omittedPP in[-ceil(Sk/2),floor(Sk/2)]. Same2cycle interface. This is our transparent canonical implementation, not a claimed full AMG or TCAD-paper reproduction.',algorithm='Unchanged8control+16strict independent+16dependent candidate pool, degree4,65536proposal inputs,8pinsets,8retained,top2support completions,1024support masks,two2SATorders. Fixed matching/order selected from initial proposals, then R16full current-context regeneration and independent admission,one pass. No R13 proxy/R14loop, no budget/clock tuning.',correctness='Seed graph independently matches nativeOR1 or explicit retainedpartialproduct+compensation formula over all2^24inputs. Final mathematicalWCE, whole-domain current contexts and admissions, scalar probes, vendor HDL. Different seed errors are not silently treated as exact.',physical='12models:3functions x2startingflows x(seed,proposed). SameArtix7 DSP0 and registered10/12.5/15ns. Canonical same-case same-clock identical models may inherit. LUT/FF/CARRY4 all reported; no total-area inference from LUTalone.',scope='Strong arithmetic start and transfer evidence for the current proposed model; neither application-quality validation nor a formal frozen paper. Preserve all adverse cases; do not infer universal superiority.',stop='Complete all6flow inputs and12models before comparisons/score/next decision. No added cases/iterations/order changes during round.',score=dict(innovation=25,physical_gain=25,problem_coverage=20,correctness=20,cost=10))
dump(Q/'configs/plan.json',plan);dump(Q/'state/origins.json',origins);dump(Q/'state/physical_reuse_catalog.json',catalog);dump(Q/'state/engineering_repairs.json',[]);dump(Q/'state/progress.json',dict(phase='REGISTERED_IMPLEMENTING'))
dump(Q/'state/input_hashes.json',{p.relative_to(Q).as_posix():h(p)for sub in ['configs','graphs','rtl','input']for p in(Q/sub).rglob('*')if p.is_file()})
def save(n,s):ast.parse(s);(Q/'tools'/n).write_text(s,encoding='utf-8')
s=(R/'round16/tools/common16.py').read_text();old="s.append('static U seed_expected(U x){return '+('x'if c['seed_budget']==0 else'(x|1)')+';}');return s,ops,co,ins,nn,anc";new="""terms=[f'(((a>>{i})&1)*((b>>{j})&1)<<{i+j})'for i in range(w)for j in range(w)if i+j>=c['cut']]
 expected='(x|1)'if c['flow']=='native'else'('+'+'.join(terms)+f'+{c["compensation"]}+(b>>{w}))'
 s.append('static U seed_expected(U a,U b,U x){return '+expected+';}');return s,ops,co,ins,nn,anc""";assert old in s;s=s.replace(old,new);save('common17.py',s)
save('configure17.py',(R/'round16/tools/configure16.py').read_text().replace('common16','common17'))
save('oracle17.py',(R/'round16/tools/oracle16.py').read_text().replace('common16','common17'))
s=(R/'round12/tools/core12.py').read_text().replace('common12','common17');save('proposal17.py',s)
s=(R/'round16/tools/state16.py').read_text().replace('common16','common17').replace('configure16','configure17').replace('oracle16','oracle17').replace("Q/f'input/{n}_replay_manifest.json'","Q/f'state/{n}_replay_manifest.json'").replace('seed_expected(l)','seed_expected(a,b,l)');s=s.replace("assert len(selected)=={'sqrt24_b16':10,'div10_b4':5,'mac9_add6_b1024':23}[n]","assert len(selected)<=40");save('state17.py',s)
s=(R/'round12/tools/model12.py').read_text().replace('common12','common17').replace('numeric_window','state_window').replace('r12_','r17_').replace('R12_PASS','R17_PASS').replace('seed_expected(l)','seed_expected(a,b,l)');a=s.index('def choices');b=s.index('def models');s=s[:a]+"def choices(n,method):\n assert method=='state_window';return load(Q/f'state/{n}_state.json')['accepted']\n\n"+s[b:];save('model17.py',s)
save('hardware17.py',(R/'round16/tools/hardware16.py').read_text().replace('model16','model17').replace('R16_PASS','R17_PASS'))
s=(R/'round16/tools/run16.py').read_text();a=s.index('steps=');b=s.index('\nrows=',a);s=s[:a]+"steps=[('map17.py',),('proposal17.py','context'),('proposal17.py','optimize'),('select17.py',),('state17.py',),('model17.py','verify'),('model17.py','export'),('hardware17.py','simulation'),('hardware17.py','route'),('analyze17.py',)]"+s[b:];save('run17.py',s)
c=load(R/'state/campaign.json');c.update(status='ROUND17_REGISTERED',active_round=17,root=str(Q),latest_progress='round17/state/progress.json');dump(R/'state/campaign.json',c)
(Q/'reports/REGISTERED_SCOPE_ZH.md').write_text('R17固定三个MAC、两个起点、各自种子与同一R16方法，共12模型。列截断与补偿是已知技术，解析选择截断深度且不扫参数。两个提出方法实例是同一算法的起点迁移，不虚称两个新算法。全部完成后比较；固定原生9位历史图按哈希复用。',encoding='utf-8')
print('R17 registered12models; analytical cuts',[(c['width'],c['cut'],c['removed_max'],c['compensation'])for c in cases if c['flow']=='column'])
