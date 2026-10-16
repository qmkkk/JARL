from common22 import Q,R,load,dump
import core,subprocess,time,hashlib
from formal22 import Y
def partition_proof(a,b,name):
 d=Q/'formal'/name;d.mkdir(exist_ok=True);src=d/'partition.v';content=a+'\n'+b
 if src.exists():assert src.read_text()==content
 else:src.write_text(content)
 if(d/'receipt.json').exists():return load(d/'receipt.json')
 script=d/'prove.ys';script.write_text(f'read_verilog {Y}/share/yosys/xilinx/cells_sim.v\nread_verilog -sv {core.linux(src)}\nhierarchy -check\nproc\nflatten gold trial\nopt\nsplitnets gold trial\nequiv_make gold trial equiv\nhierarchy -top equiv\nequiv_simple -short -nogroup\nequiv_status -assert\n')
 st=time.perf_counter();log=d/'prove.log'
 with log.open('w')as out:p=subprocess.run(['wsl','-d','Ubuntu','-u','k','--','env',f'LD_LIBRARY_PATH={Y}/lib/x86_64-linux-gnu',f'{Y}/bin/yosys','-s',core.linux(script)],stdout=out,stderr=subprocess.STDOUT,creationflags=subprocess.CREATE_NO_WINDOW)
 raw=log.read_text(errors='replace');rec=dict(status='PROVED'if p.returncode==0 and 'Equivalence successfully proven!'in raw else'UNPROVEN',returncode=p.returncode,seconds=time.perf_counter()-st,source_sha256=hashlib.sha256(src.read_bytes()).hexdigest(),log=str(log),proof='One pass equiv_simple -short -nogroup; all equivalence obligations must discharge, no unmatched assumptions accepted.')
 dump(d/'receipt.json',rec);return rec
if __name__=='__main__':
 p=Q/'formal/fabm16_f12_author_actual_primitives/miter.v';s=p.read_text();gold,trial=s.split('\nmodule trial(',1);trial='module trial('+trial.split('\nmodule miter(',1)[0];print(partition_proof(gold,trial,'fabm16_f12_author_partition_v2'))
