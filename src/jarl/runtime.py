"""Execution adapter for an explicitly selected scratch workspace."""
from pathlib import Path
import json, os, subprocess
Q = Path(os.environ.get('JARL_WORKDIR', 'work')).resolve()

def load(path):
    return json.loads(Path(path).read_text(encoding='utf-8-sig'))

def dump(path, value):
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, indent=2), encoding='utf-8')

def native(src, args, out):
    src, out = Path(src), Path(out)
    binary = src.with_suffix('.exe' if os.name == 'nt' else '')
    compiler = os.environ.get('CXX', 'g++')
    with src.with_suffix('.compile.log').open('w') as log:
        subprocess.run([compiler, '-O2', '-std=c++17', str(src), '-o', str(binary)],
                       stdout=log, stderr=subprocess.STDOUT, check=True)
    with out.open('w') as log, Path(str(out)+'.stderr').open('w') as err:
        subprocess.run([str(binary), *map(str,args)], stdout=log, stderr=err, check=True)
