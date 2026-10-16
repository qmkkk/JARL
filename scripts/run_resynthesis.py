"""Run a selected numerical-relation experiment in a fresh work directory."""
from pathlib import Path
import argparse, json, os, shutil, sys
ROOT=Path(__file__).resolve().parents[1]

def main():
    ap=argparse.ArgumentParser()
    ap.add_argument('--suite',choices=['relation','quality'],default='quality')
    ap.add_argument('--case',required=True)
    ap.add_argument('--out',required=True)
    ap.add_argument('--cxx',default='g++')
    a=ap.parse_args();out=Path(a.out).resolve()
    if out.exists() or out.is_relative_to(ROOT):raise SystemExit('Choose a fresh directory outside the repository.')
    cases=json.loads((ROOT/f'benchmarks/{a.suite}/cases.json').read_text())
    case=next((c for c in cases if c['name']==a.case),None)
    if case is None:raise SystemExit('Unknown case; see benchmarks/<suite>/cases.json.')
    for sub in ['graphs','state','results','src','configs']:(out/sub).mkdir(parents=True)
    for p in (ROOT/f'benchmarks/{a.suite}/graphs').glob(a.case+'*.json'):shutil.copy2(p,out/'graphs'/p.name)
    for p in (ROOT/f'benchmarks/{a.suite}/configurations').glob(a.case+'*_replay_manifest.json'):shutil.copy2(p,out/'state'/p.name)
    shutil.copy2(ROOT/f'results/{a.suite}/{a.case}_methods.json',out/f'results/{a.case}_methods.json')
    os.environ['JARL_WORKDIR']=str(out);os.environ['CXX']=a.cxx
    sys.path.insert(0,str(ROOT/'src'))
    from jarl.stateful import run_case
    run_case(case,'state_window')
    if a.suite=='quality':
        from jarl.quality import run_case as complete_quality
        complete_quality(case)

if __name__=='__main__':main()
