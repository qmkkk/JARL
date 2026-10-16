from common22 import Q,R,load,dump,build
import core,subprocess,time,re,hashlib
Y='/mnt/d/paper_project_REMV_Ax/tools/cache/deps/yosysroot/usr'
def bool_rtl(g,ops,co,ins,nn,top,mux_encoding=False):
 s=[f'module {top}(input[15:0] A,B,output[31:0] Y);wire[{nn-1}:0]v;']
 for n,b in co.items():s.append(f"assign v[{n}]=1'b{b};")
 for n,k in ins.items():s.append(f'assign v[{n}]={k};')
 for o in ops:
  xs=[f'v[{n}]'for n in o['ins']];t=o['typ']
  if t=='lut':
   if mux_encoding:
    prev=f"{1<<o['k']}'h{o['init']:x}"
    for bit in reversed(range(o['k'])):
     size=1<<bit;wire=f't{o["out"]}_{bit}'
     if bit==o['k']-1:
      mask=(1<<size)-1;hi=f"{size}'h{(o['init']>>size)&mask:x}";lo=f"{size}'h{o['init']&mask:x}"
     else:hi=f'{prev}[{2*size-1}:{size}]';lo=f'{prev}[{size-1}:0]'
     s.append(f'wire[{size-1}:0]{wire}={xs[bit]}?{hi}:{lo};');prev=wire
    rhs=prev
   else:rhs=f"({1<<o['k']}'h{o['init']:x} >> "+'{'+','.join(reversed(xs))+'}) & 1\'b1'
  else:rhs={'or':lambda:f'({xs[0]}|{xs[1]})','andnot':lambda:f'({xs[0]}&~{xs[1]})','xor':lambda:f'({xs[0]}^{xs[1]})','not':lambda:f'~{xs[0]}','mux':lambda:f'({xs[0]}?{xs[2]}:{xs[1]})'}[t]()
  s.append(f'assign v[{o["out"]}]={rhs};')
 for i in range(32):s.append(f'assign Y[{i}]=v[{g["ports"][f"Y[{i}]"]}];')
 return '\n'.join(s+['endmodule'])
def proof(a,b,name,libs=False,seconds=10):
 d=Q/'formal'/name;d.mkdir(exist_ok=True);src=d/'miter.v';content=a+'\n'+b+'\nmodule miter(input[15:0] A,B,output good);wire[31:0]a,b;gold x(A,B,a);trial y(A,B,b);assign good=(a==b);endmodule\n'
 if src.exists():assert src.read_text()==content,('RESUME_SOURCE_MISMATCH',name)
 else:src.write_text(content)
 if(d/'receipt.json').exists():
  previous=load(d/'receipt.json')
  if previous['status']!='ENGINEERING_ERROR':return previous
  old=d/'receipt_before_parser_repair.json'
  if not old.exists():dump(old,previous)
 script=d/'prove.ys';script.write_text((f'read_verilog {Y}/share/yosys/xilinx/cells_sim.v\n'if libs else'')+f'read_verilog -sv {core.linux(src)}\nprep -top miter -flatten\nopt\n'+('techmap\nopt\n'if libs else'')+f'sat -prove good 1 -show A -show B -set-def-inputs -timeout {seconds} -dump_json {core.linux(d/"witness.json")}\n')
 st=time.perf_counter();log=d/'prove.log'
 recovered=log.exists()
 if not recovered:
  with log.open('w')as out:p=subprocess.run(['wsl','-d','Ubuntu','-u','k','--','env',f'LD_LIBRARY_PATH={Y}/lib/x86_64-linux-gnu',f'{Y}/bin/yosys','-s',core.linux(script)],stdout=out,stderr=subprocess.STDOUT,creationflags=subprocess.CREATE_NO_WINDOW)
 raw=log.read_text(errors='replace');status='PROVED'if 'SAT proof finished - no model found: SUCCESS!'in raw else('COUNTEREXAMPLE'if 'SAT proof finished - model found: FAIL!'in raw else('TIMEOUT'if 'Interrupted SAT solver: TIMEOUT!'in raw or 'Reached timeout' in raw else'ENGINEERING_ERROR'))
 rec=dict(status=status,returncode=None if recovered else p.returncode,seconds=None if recovered else time.perf_counter()-st,recovered_completed_log=recovered,log=str(log),source_sha256=hashlib.sha256(src.read_bytes()).hexdigest())
 if status=='COUNTEREXAMPLE':
  vals={k:int(v)for k,v in re.findall(r'\\([AB])\s+(\d+)\s+[0-9a-f]+\s+[01]+',raw)};assert set(vals)=={'A','B'},raw[-4000:];rec['witness']=vals
 dump(d/'receipt.json',rec)
 if status=='ENGINEERING_ERROR':raise RuntimeError(rec)
 return rec
def combin_primitives(text,g,top):
 # Only the same input/output boundary registers may be removed for this proof.
 _,co,ins,_,_=build(g);outs={v for k,v in g['ports'].items()if k.startswith('Y[')};count=0
 for c in g['cells']:
  if not c['type'].startswith('FD'):continue
  p=c['pins'];assert c['type']=='FDRE'and co.get(p['CE'])==1 and co.get(p['R'])==0
  assert p['D']in ins or p['Q']in outs,('NON_BOUNDARY_REGISTER',c['name'])
 def sub(m):
  nonlocal count
  z=m.group();pins=dict(re.findall(r'\.(\w+)\((v\[\d+\])\)',z));assert set(['Q','D','CE','R'])<=set(pins);count+=1
  return f'assign {pins["Q"]}={pins["D"]};'
 text=re.sub(r'FDRE\s+.*?;',sub,text)
 assert count==sum(c['type']=='FDRE'for c in g['cells'])
 text=re.sub(r'module \w+\(input wire clk,input wire \[15:0\] A,B,output wire \[31:0\] Y\);',f'module {top}(input wire [15:0] A,B,output wire [31:0] Y);wire clk=0;',text)
 assert f'module {top}('in text
 return text
