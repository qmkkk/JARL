"""Index completed rounds without changing historical data or running experiments."""
from pathlib import Path
import json,hashlib
R=Path(__file__).resolve().parents[1];c=json.loads((R/'state/campaign.json').read_text());rows=[]
for x in c['rounds']:
 p=Path(x['report']);assert hashlib.sha256(p.read_bytes()).hexdigest()==x['report_sha256'];q=R/f'round{x["round"]}'
 rows.append(f"|{x['round']}|{x['score']}/100|[报告]({p.as_posix()})|[分析]({(q/'state/analysis.json').as_posix()})|")
text='''# Project3 自主研究证据入口

此目录是持续研究项目，尚未冻结为正式论文实验版本。历史原始结果只读保留，各新轮次使用独立目录。下列报告哈希已在生成索引时核对。

|完成轮次|阶段评分|结论报告|机器可读分析|
|---|---:|---|---|
'''+ '\n'.join(rows)+f'''

当前状态：`{c['status']}`，活动轮次 `{c['active_round']}`。进行中的单项数据不等于全轮结论。

- [主张台账]({(R/'reports/CLAIM_LEDGER_ZH.md').as_posix()})：已有支持、反证与尚待验证的主张。
- [活动轮计划]({(Path(c['root'])/'configs/plan.json').as_posix()})：固定假设、输入、方法、界限与停止规则。
- [活动轮进度]({(Path(c['root'])/'state/progress.json').as_posix()})：真实执行阶段。
- [待选机制推导]({(R/'research_review/PENDING_MECHANISM_IDEAS_20261015.md').as_posix()})：尚未进入新实验的想法。

每轮 `graphs/` 保存电路及候选，`src/` 保存实际生成并编译的整数检查程序，`rtl/` 保存可实现 RTL 和测试平台，`results/hardware/` 保存独立实现目录、原始工具日志与报告，`tools/` 保存该轮驱动，`state/` 保存输入/证据哈希、来源映射和执行记录。继承结果始终标记来源轮次，不计为本轮新运行。

执行环境为 Windows Python、WSL 原生 C++ 和本机 Vivado。PyCharm 可直接打开这些源文件；本记录不声称操作过 PyCharm GUI。历史脚本可能要求全新输出目录，不能为复现而覆盖旧结果。新正式实验需要先确认贡献、完成有限核心审查，再冻结工具、配置和输入到独立版本。
'''
(R/'reports/EXPERIMENT_INDEX_ZH.md').write_text(text,encoding='utf-8');print('Indexed',len(rows),'completed rounds; report hashes verified')
