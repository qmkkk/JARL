from pathlib import Path
import csv,json,datetime,hashlib
Q=Path(__file__).resolve().parents[1];R=Q.parent
def load(p):return json.loads(p.read_text())
def dump(p,x):p.write_text(json.dumps(x,indent=2,ensure_ascii=False),encoding='utf-8')
def main():
 ppa=load(Q/'results/hardware/ppa.json');entries=load(Q/'rtl/design_manifest.json');assert len(ppa)==len(entries)==12;assert len({x['job']for x in ppa})==12;rows=[]
 for r in ppa:
  rows.append({k:r[k]for k in ['case','base_case','method','job','clock_ns','LUT','FF','CARRY4','DSP','WCE','WNS_ns','WHS_ns','FF_period_ns','pass_registered_clock','wall_s']})
 groups=[]
 for n in ['sqrt12','sqrt16']:
  best={};points={}
  for m in ['abc_exact','relation']:
   allrows=[r for r in rows if r['base_case']==n and r['method']==m];passing=[r for r in allrows if r['pass_registered_clock']];b=min(passing,key=lambda r:r['clock_ns'])if passing else None;points[m]=[dict(clock_ns=r['clock_ns'],LUT=r['LUT'],pass_timing=r['pass_registered_clock'],WNS_ns=r['WNS_ns'])for r in allrows]
   best[m]=dict(clock_ns=b['clock_ns'],MHz=1000/b['clock_ns'],LUT=b['LUT'],LUT_ns=b['LUT']*b['clock_ns'],job=b['job'])if b else None
  groups.append(dict(case=n,points=points,best_tested_passing=best,frequency_gain_pct=100*(best['relation']['MHz']/best['abc_exact']['MHz']-1)if all(best.values())else None,resource_change_pct=100*(best['relation']['LUT']/best['abc_exact']['LUT']-1)if all(best.values())else None,note='Clock-grid observation only; no exact Fmax or board/application speed claim. Resource comparison uses each method best tested passing point.'))
 a=dict(round=5,status='COMPLETE_AWAIT_SCORE',completed=datetime.datetime.now().astimezone().isoformat(),cases=groups,rows=rows,physical_jobs=12,timing_pass=sum(r['pass_registered_clock']for r in rows),functional_validation='Inherited from R4 through byte identity, not rerun or counted anew',limits=load(Q/'configs/plan.json')['limits']);dump(Q/'state/analysis.json',a)
 with(Q/'reports/RESULTS.csv').open('w',newline='')as f:w=csv.DictWriter(f,fieldnames=list(rows[0]));w.writeheader();w.writerows(rows)
 hashes={p.relative_to(Q).as_posix():hashlib.sha256(p.read_bytes()).hexdigest()for sub in ['tools','configs','rtl','results']for p in(Q/sub).rglob('*')if p.is_file()and p.suffix in['.py','.tcl','.json','.v','.xdc','.csv','.log','.rpt']};dump(Q/'state/evidence_hashes.json',hashes);print(json.dumps(groups,indent=2))
if __name__=='__main__':main()
