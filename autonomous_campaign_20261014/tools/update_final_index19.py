from pathlib import Path
import json,hashlib,collections
R=Path(__file__).resolve().parents[1];load=lambda p:json.loads(p.read_text(encoding='utf-8'));h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();c=load(R/'state/campaign.json');assert c['status']=='FINAL_EVIDENCE_COMPLETE_STOP'
lines=['# Project3 最终研究证据入口','','R17—R19三轮收拢已经完成；主模型冻结，实验停止，不自动开启R20。最终贡献与边界以R19全表为准。旧轮报告原样保留，下面的SHA已全部核对。','','[最终综合报告](../round19/reports/FINAL_THREE_ROUND_REPORT_ZH.md) · [逐项科学判断](../round19/state/final_evidence_assessment.json) · [全部正式数据](../round19/state/final_tables.json)','','|轮次|评分|报告|','|---|---:|---|']
for rec in c['rounds']:
 p=Path(rec['report']);assert h(p)==rec['report_sha256'];lines.append(f"|{rec['round']}|{rec['score']}/100|[报告]({p.as_posix()})|")
lines+=['','R19主批次18核心+9集成与串联对照3核心+3集成全部完成。原始失败尝试、作者代码重生成差异和负结果均保留。作者搜索的字符串集合顺序并非完整确定，冻结电路和RTL可供确定地重放本次证据。','', '本交付没有论文正文、自动实验、定时任务、代理或后继项目。未来是否另行开展研究由新的人类指令决定。实验完成不等于保证期刊接收。']
(R/'reports/EXPERIMENT_INDEX_ZH.md').write_text('\n'.join(lines)+'\n',encoding='utf-8')
groups=collections.defaultdict(list)
for rec in c['rounds']:
 rn=rec['round']
 if rn<10:continue
 q=R/f'round{rn}';cs={x['name']:x for x in load(q/'configs/plan.json')['cases']};source=q/('state/final_tables.json'if rn==19 else'state/analysis.json');raw=load(source);rows=raw['core']if rn==19 else raw['rows']
 for r in rows:
  if not r['pass_registered_clock']:continue
  cfg=cs[r['case']];key=(cfg['kind'],cfg['width'],cfg.get('add_width',0),cfg['budget'],cfg['clock_ns']);groups[key].append(dict(round=rn,case=r['case'],method=r['method'],LUT=r['LUT'],FF=r['FF'],CARRY4=r['CARRY4'],DSP=r['DSP'],WNS_ns=r['WNS_ns'],source=str(source),source_sha256=h(source)))
data=[]
for k,rs in groups.items():data.append(dict(kind=k[0],width=k[1],add_width=k[2],math_WCE_budget=k[3],clock_ns=k[4],best_LUT_observation=min(rs,key=lambda r:(r['LUT'],r['CARRY4'],r['FF'],r['round'])),observed_records=len(rs),scope='Minimum of listed completed records including final serial control; not global optimality, equal actual error, universal superiority or silicon area.'))
(R/'state/current_core_frontier.json').write_text(json.dumps(data,indent=2),encoding='utf-8')
out=['# 已完成记录中的核心资源参照','','包含R10—R19已完成记录以及R19最终串联对照；按数学功能、位宽、误差上限、时钟分组。历史继承只计记录，不计新实验。最小LUT不代表同等实际精度或全局最优。完整的最终基线比较见round19/reports/FINAL_GAINS.csv。','','|功能|位宽/加数|误差上限|时钟ns|最小LUT|FF|CARRY4|记录|','|---|---|---:|---:|---:|---:|---:|---|']
for z in data:
 b=z['best_LUT_observation'];out.append(f"|{z['kind']}|{z['width']}/{z['add_width']}|{z['math_WCE_budget']}|{z['clock_ns']}|{b['LUT']}|{b['FF']}|{b['CARRY4']}|R{b['round']} {b['case']} {b['method']}|")
(R/'reports/CURRENT_CORE_FRONTIER_ZH.md').write_text('\n'.join(out)+'\n',encoding='utf-8');print('Final index verified',len(c['rounds']),'reports;',len(data),'groups including serial control')
