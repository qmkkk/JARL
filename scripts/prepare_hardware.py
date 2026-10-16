"""Prepare isolated Vivado jobs for the supplied programmable FIR designs."""
from pathlib import Path
import argparse, hashlib, json, os, shutil
ROOT = Path(__file__).resolve().parents[1]

def main():
    ap=argparse.ArgumentParser()
    ap.add_argument('--out',required=True)
    ap.add_argument('--vivado-bin',required=True)
    a=ap.parse_args(); out=Path(a.out).resolve(); v=Path(a.vivado_bin).resolve()
    if out.exists(): raise SystemExit('Choose a fresh output directory.')
    if out.is_relative_to(ROOT): raise SystemExit('Choose a directory outside the repository.')
    entries=json.loads((ROOT/'rtl/fir/design_manifest.json').read_text())
    cfg=json.loads((ROOT/'benchmarks/fir/config.json').read_text())
    ext='.bat' if os.name=='nt' else ''
    commands=[]; out.mkdir(parents=True)
    for e in entries:
        d=out/e['top'];d.mkdir()
        for field in ['rtl','tb']:
            source=ROOT/e[field]
            assert hashlib.sha256(source.read_bytes()).hexdigest()==e[field+'_sha256']
            shutil.copy2(source,d/source.name)
        shutil.copy2(ROOT/'rtl/fir/system.xdc',d/'system.xdc')
        for p in (ROOT/'benchmarks/fir').glob('*.hex'):shutil.copy2(p,d/p.name)
        (d/'run.tcl').write_text('run all\nquit\n')
        rtl=d/Path(e['rtl']).name;tb=d/Path(e['tb']).name
        specs=[['xvlog','--sv',str(rtl),str(tb),str(v.parent/'data/verilog/src/glbl.v')],
               ['xelab','--debug','typical','-L','unisims_ver','-L','unimacro_ver','tb','glbl','-s','fir_sim'],
               ['xsim','fir_sim','-tclbatch',str(d/'run.tcl')]]
        for argv in specs:
            argv[0]=str(v/(argv[0]+ext));commands.append(dict(kind='RTL',cwd=str(d),argv=argv))
        for part in cfg['devices']:
            rd=d/part;rd.mkdir();shutil.copy2(ROOT/'scripts/vivado/implement.tcl',rd/'implement.tcl')
            argv=[str(v/('vivado'+ext)),'-mode','batch','-nojournal','-nolog','-source',str(rd/'implement.tcl'),
                  '-tclargs',rd.as_posix(),rtl.as_posix(),e['top'],part,(d/'system.xdc').as_posix()]
            commands.append(dict(kind='PHYSICAL',cwd=str(rd),argv=argv))
    (out/'commands.json').write_text(json.dumps(commands,indent=2))
    print(json.dumps(dict(status='PREPARED',designs=len(entries),commands=len(commands),out=str(out))))

if __name__=='__main__':main()
