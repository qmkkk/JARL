from pathlib import Path
import json,hashlib,shutil,datetime,ast
R=Path(__file__).resolve().parents[1];Q=R/'round18';B=Q/'repairs/startup_gsr_attempt1';assert not B.exists();B.mkdir(parents=True)
load=lambda p:json.loads(p.read_text());dump=lambda p,x:p.write_text(json.dumps(x,indent=2,ensure_ascii=False),encoding='utf-8');h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
paths=[Q/'tools/integration18.py',*list((Q/'rtl/integration').glob('tb_*.sv'))];changes=[]
hardware_hashes={str(p):h(p)for p in(Q/'rtl/integration').glob('r18_dot16_*.v')}
for p in paths:
 old=p.read_text();assert old.count('initial begin repeat(4)')==1;shutil.copy2(p,B/p.name);sha=h(p);new=old.replace('initial begin repeat(4)','initial begin #200;repeat(4)')
 if p.suffix=='.py':
  old_q="n=g['case'];q=OUT/f'simulation_{n}';assert not q.exists();q.mkdir();"
  new_q="n=g['case'];q=OUT/f'simulation_{n}';q=q if not q.exists()else OUT/f'simulation_{n}_resume1';assert not q.exists();q.mkdir();"
  assert old_q in new;new=new.replace(old_q,new_q);ast.parse(new)
 p.write_text(new,encoding='utf-8');changes.append(dict(path=str(p),old_sha256=sha,new_sha256=h(p),preserved=str(B/p.name)))
for n,sha in hardware_hashes.items():assert h(Path(n))==sha
rec=dict(id='startup_gsr_attempt1',kind='TESTBENCH_STARTUP_NOT_MODEL',date=datetime.datetime.now().astimezone().isoformat(),reason='AMD glbl.v has ROC_WIDTH100000ps=100ns; custom dot testbench started after4clocks at40ns while primitives held GSR. Original operator tests alreadywait200ns. Addsame200nsstartup beforelocalresetsequence.',primary_reference='E:/AMDDesignTools/2026.1/Vivado/data/verilog/src/glbl.v lines8,61-65',failed_log=str(Q/'results/integration/simulation_mac8_add8_b256_column/simulate.log'),changes=changes,hardware_rtl_unchanged=hardware_hashes,scope='No scientificmodel,budget,candidate,clock,hardwarecontrolorinputvectors changed. Oldattempt retained; rerun in freshsimulationdir.')
rep=load(Q/'state/engineering_repairs.json');rep.append(rec);dump(Q/'state/engineering_repairs.json',rep);print('Testbench GSR startup repaired;9hardwareRTL hashesunchanged')
