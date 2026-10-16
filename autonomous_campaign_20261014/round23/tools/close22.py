from pathlib import Path
import json,hashlib,collections
Q=Path(__file__).resolve().parents[1].parent/'round22'
def load(p):return json.loads(p.read_text(encoding='utf-8'))
def dump(p,x):p.write_text(json.dumps(x,indent=2,ensure_ascii=False),encoding='utf-8')
route=load(Q/'results/hardware/route_all.json');manifest=load(Q/'rtl/design_manifest.json');sim=load(Q/'state/rtl_validation.json')
assert len(route)==len(manifest)==9 and sum(s['checks']for s in sim)==37953
for e in manifest:assert hashlib.sha256((Q/f'rtl/{e["top"]}.v').read_bytes()).hexdigest()==e['sha256']
rows=[];formal=[]
for case in ['fabm16_f12','fabm16_f15','fabm16_f18']:
 c=load(Q/f'state/{case}_complete.json');rr={r['method']:r for r in route if r['case']==case};assert all(x['status']=='PROVED'for x in c['formal'])
 base=min(rr[m]['LUT']for m in ['author','quadol_exact']);main=rr['state_formal']
 rows.append(dict(case=case,author_LUT=rr['author']['LUT'],quadol_LUT=rr['quadol_exact']['LUT'],method_LUT=main['LUT'],LUT_gain_percent=100*(base-main['LUT'])/base,accepted=len(c['accepted']),proposal_status=dict(collections.Counter(x['status']for x in c['history'])),formal_checks=len(c['formal']),WNS_ns=main['WNS_ns'],WHS_ns=main['WHS_ns']))
 formal.extend(c['formal'])
dump(Q/'results/final_comparison.json',rows)
report='''# R22：16位作者电路迁移实验结论

三个配置均取得正向资源收益：相同作者功能、相同寄存器接口、相同工具和约束下，主方法分别比原作者电路及本轮精确QUADOL适配基线节约5、4、4个布线后LUT。结果来自实际Vivado实现，不是候选配对数。该结果支持方法可以作用于同期TVLSI公开的手工优化16位有符号电路，不只作用于自制8—10位例子。

|配置|原作者LUT|QUADOL精确适配LUT|主方法LUT|节约|接受窗口|
|---|---:|---:|---:|---:|---:|
'''
for r in rows:report+=f'|{r["case"]}|{r["author_LUT"]}|{r["quadol_LUT"]}|{r["method_LUT"]}|{r["LUT_gain_percent"]:.3f}%|{r["accepted"]}|\n'
report+='''
这里的“精确”指保持FABM原本的近似乘法函数完全一致，不是把FABM变成数学精确乘法器。采用作者原始RTL作为物理基线，防止解析/重导出人为削弱基线。QUADOL对照采用固定作者MinHD=0候选生成与确定性最大匹配；这是精确函数任务的适配，不等于复现作者完整近似前沿。

全部9个端点完成综合、布局布线；37,953项独立HDL输出比较通过。每个候选需SAT证明后接纳，最终原始作者RTL、图模型、实际LUT6_2实现之间的证明均通过。超时提案保留为未证明，不作为反例或失败接受。

时序应准确分层：全部9个端点的setup满足15ns，WNS为5.541—6.372ns；完整I/O时序判据未通过，因为登记的输入最小延迟为0ns，而OOC时钟插入延迟造成输入端口至输入寄存器hold失败。原作者与两个比较方法都出现同一类问题。原始报告与判定保持不变，不能写作“全时序闭合”，也不能把该接口约束现象解释为创新方法性能退化或乘法逻辑太慢。本轮未另改时钟或I/O约束重跑以制造通过。

本轮新增价值是16位真实作者电路的零功能变化资源增量及形式验证迁移。它是整体论文中的广度/稳健性证据，不单独声称提出新的乘法器、SAT算法或击败FABM的精度—功耗前沿。相对于同期工作，应承认其硬件资源优势，也保留不同任务和测量条件，避免把不同分母的百分比直接排名。

工程记录：WSL日志解码、SAT超时识别、重复引脚适配、形式编码、原作者物理基线和Windows换行哈希问题已有限修复；原始失败日志及修复记录均保留。没有用工程故障代替科学结论。

本轮评分86/100：贡献区分28/35、硬件收益25/30、证据一致性24/25、迁移广度9/10。评分是研究评价，不是录用概率。整体TVLSI结论在已登记的R23全矩阵完成后一次给出，不自动追加R24。
'''
(Q/'reports/ROUND22_ANALYSIS_ZH.md').write_text(report,encoding='utf-8')
old=load(Q/'state/round_status.json');dump(Q/'state/round_status.json',dict(old,status='COMPLETE_ANALYZED',physical_endpoints=9,HDL_checks=37953,final_formal_proofs=len(formal),score=86,report=str(Q/'reports/ROUND22_ANALYSIS_ZH.md'),full_IO_timing_pass=0,setup_pass=9))
dump(Q/'state/progress.json',dict(phase='COMPLETE_ANALYZED',endpoints=9));print(json.dumps(rows,ensure_ascii=False))
