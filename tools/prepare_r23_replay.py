"""Prepare an isolated replay of frozen R23 RTL. Never launches tools or edits evidence."""
from pathlib import Path
import argparse,json,hashlib,shutil
ROOT=Path(__file__).resolve().parents[1];Q=ROOT/'autonomous_campaign_20261014/round23'
def main():
    ap=argparse.ArgumentParser();ap.add_argument('--out',required=True);ap.add_argument('--vivado-bin',required=True);a=ap.parse_args()
    out=Path(a.out).resolve();v=Path(a.vivado_bin).resolve()
    assert not out.exists(),'Choose a fresh work directory'
    assert not out.is_relative_to(ROOT/'autonomous_campaign_20261014'),'Do not write to frozen evidence'
    entries=json.loads((Q/'rtl/design_manifest.json').read_text(encoding='utf-8'));plan=json.loads((Q/'configs/plan.json').read_text(encoding='utf-8'))
    out.mkdir(parents=True);commands=[];mapped=[]
    for e in entries:
        d=out/e['top'];d.mkdir()
        # Path names in Windows manifests also need to work on Linux/macOS.
        rtl=Q/'rtl'/e['rtl'].replace('\\','/').split('/')[-1]
        tb=Q/'rtl'/e['tb'].replace('\\','/').split('/')[-1]
        assert hashlib.sha256(rtl.read_bytes()).hexdigest()==e['rtl_sha256']
        assert hashlib.sha256(tb.read_bytes()).hexdigest()==e['tb_sha256']
        shutil.copy2(rtl,d/rtl.name);shutil.copy2(Q/'rtl/system.xdc',d/'system.xdc')
        for p in Q.glob('inputs/*.hex'):shutil.copy2(p,d/p.name)
        text=tb.read_text(encoding='utf-8')
        for key in [e['gold'],str(Q/f'inputs/w{e["width"]}_coeff.hex'),str(Q/f'inputs/w{e["width"]}_samples.hex')]:
            # Frozen TB paths use slash spelling, independent of host OS.
            name=key.replace('\\','/').split('/')[-1]
            import re
            text=re.sub(r'\$readmemh\("[^"\n]*/'+re.escape(name)+r'"',lambda m:'$readmemh("'+(d/name).as_posix()+'"',text)
        (d/tb.name).write_text(text,encoding='utf-8');(d/'run.tcl').write_text('run all\nquit\n')
        cmds=[['xvlog.bat','--sv',str(d/rtl.name),str(d/tb.name),str(v.parent/'data/verilog/src/glbl.v')],['xelab.bat','--debug','typical','-L','unisims_ver','-L','unimacro_ver','tb','glbl','-s','fir_sim'],['xsim.bat','fir_sim','-tclbatch',str(d/'run.tcl')]]
        for cmd in cmds:cmd[0]=str(v/cmd[0]);commands.append(dict(cwd=str(d),argv=cmd,kind='RTL'))
        for part in plan['devices']:
            rd=d/part;rd.mkdir();shutil.copy2(Q/'tools/physical23.tcl',rd/'physical23.tcl')
            commands.append(dict(cwd=str(rd),kind='PHYSICAL',argv=[str(v/'vivado.bat'),'-mode','batch','-nojournal','-nolog','-source',str(rd/'physical23.tcl'),'-tclargs',rd.as_posix(),(d/rtl.name).as_posix(),e['top'],part,(d/'system.xdc').as_posix()]))
        mapped.append(dict(top=e['top'],original_tb_sha256=e['tb_sha256'],mapped_tb_sha256=hashlib.sha256((d/tb.name).read_bytes()).hexdigest(),rtl_sha256=e['rtl_sha256']))
    (out/'commands.json').write_text(json.dumps(commands,indent=2),encoding='utf-8');(out/'path_only_changes.json').write_text(json.dumps(mapped,indent=2),encoding='utf-8')
    (out/'README.txt').write_text('Prepared only; no experiments executed. Commands are argv arrays with explicit cwd. Run in order using subprocess.run(argv,cwd=cwd,check=True). Physical commands require licensed Vivado and both installed Artix parts. R23_ROUTE_COMPLETE and R23_FIR_PASS markers are expected. This entry prepares RTL verification and route; full routed-SAIF power replay remains in frozen tools/run23.py with path mapping. Never replace archived results with replay outputs.\n',encoding='utf-8')
    print(json.dumps(dict(status='PREPARED_NOT_EXECUTED',designs=len(mapped),rtl_commands=36,physical_commands=24,root=str(out))))
if __name__=='__main__':main()
