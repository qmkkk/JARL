from pathlib import Path
Q=Path(__file__).resolve().parents[1];R=Q.parent
s=(R/'tools/physical.py').read_text()
s=s.replace('from core import R,Q,load,dump,build,replace_ops,reorder,export_rtl,scalar','from core2 import R,Q,load,dump,build,replace_ops,reorder,export_rtl,scalar,METHODS')
s=s.replace("['hd','minimax','support','physical']","METHODS").replace("f'r1_{name}_{m}'","f'r2_{name}_{m}'").replace('R1_PASS','R2_PASS')
s=s.replace("q=OUT/f'simulation_{name}_v2'","q=OUT/f'simulation_{name}'")
s=s.replace("(S/'ooc_clocked.xdc').as_posix()","(S/f'{entry[\"case\"]}.xdc').as_posix()")
s=s.replace("row['FF_period_ns']=10-float(row['ff_slack_ns'])","row['clock_ns']=next(c['clock_ns']for c in load(Q/'configs/plan.json')['cases']if c['name']==entry['case']);row['FF_period_ns']=row['clock_ns']-float(row['ff_slack_ns'])")
s=s.replace("row['pass_internal_100MHz']","row['pass_registered_clock']")
s=s.replace("y=scalar(*models[e['top']],a,b);assert", "y=scalar(*models[e['top']],a,b);assert")
(Q/'tools/hardware2.py').write_text(s)
print('hardware2 prepared')
