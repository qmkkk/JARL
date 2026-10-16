"""Read completed rounds only; summarize comparable declared core settings.
No new experiments or overall-silicon-area claims.
"""
from pathlib import Path
import json,hashlib,collections
R=Path(__file__).resolve().parents[1]
load=lambda p:json.loads(p.read_text());groups=collections.defaultdict(list)
completed=[x['round']for x in load(R/'state/campaign.json')['rounds']if x['round']>=10 and x['status']=='COMPLETE']
for rn in completed:
 q=R/f'round{rn}';assert load(q/'state/round_status.json')['status']=='COMPLETE';cs={c['name']:c for c in load(q/'configs/plan.json')['cases']}
 for row in load(q/'state/analysis.json')['rows']:
  c=cs[row['case']]
  if not row['pass_registered_clock']:continue
  key=(c['kind'],c['width'],c.get('add_width',0),c['budget'],c['clock_ns'])
  groups[key].append(dict(round=rn,case=c['name'],method=row['method'],LUT=row['LUT'],FF=row['FF'],CARRY4=row['CARRY4'],DSP=row['DSP'],WNS_ns=row['WNS_ns'],source=str(q/'state/analysis.json'),source_sha256=hashlib.sha256((q/'state/analysis.json').read_bytes()).hexdigest()))
data=[]
for key,rr in groups.items():
 best=min(rr,key=lambda r:(r['LUT'],r['CARRY4'],r['FF'],r['round']));data.append(dict(kind=key[0],width=key[1],add_width=key[2],math_WCE_budget=key[3],clock_ns=key[4],best_LUT_observation=best,observed_records=len(rr),scope='Minimum routed LUT among completed listed records at this mathematical bound and clock; not global optimum, application speedup, or a total silicon-area ranking. Duplicate historical inheritance is counted as a record, not a new experiment.'))
(R/'state/current_core_frontier.json').write_text(json.dumps(data,indent=2))
lines=['# 已完成轮次中的当前核心资源参照','', f'只汇总R10—R{max(completed)}的已完成记录，按功能、位宽、数学误差上限、时钟分组。WNS必须合格。最少LUT是观测结果，不是全局最优证明；同时列出FF和CARRY4，不换算成总芯片面积。继承记录不是新增实验。相同允许误差不代表实际误差和平均误差相同。','', '|功能|位宽/加数位宽|WCE上限|时钟ns|最少LUT|FF|CARRY4|本表记录来源|','|---|---|---:|---:|---:|---:|---:|---|']
for d in data:
 b=d['best_LUT_observation'];lines.append(f"|{d['kind']}|{d['width']}/{d['add_width']}|{d['math_WCE_budget']}|{d['clock_ns']}|{b['LUT']}|{b['FF']}|{b['CARRY4']}|R{b['round']} {b['case']} / {b['method']}|")
lines+=['','本表不使用未完成轮次的数据。不能在一行里混用不同误差预算或把旧起点改善比例当作相对当前最强流程的优势。']
(R/'reports/CURRENT_CORE_FRONTIER_ZH.md').write_text('\n'.join(lines)+'\n',encoding='utf-8')
print('Comparable completed core groups:',len(data))
