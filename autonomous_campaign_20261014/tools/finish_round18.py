from pathlib import Path
import json,hashlib,datetime,numpy as np
R=Path(__file__).resolve().parents[1];Q=R/'round18';load=lambda p:json.loads(p.read_text());dump=lambda p,x:p.write_text(json.dumps(x,indent=2,ensure_ascii=False),encoding='utf-8');h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
a=load(Q/'state/analysis.json');assert a['status']=='COMPLETE_AWAIT_SCORE';pipe=load(Q/'state/pipeline.json');effective={tuple(x['step']):x for x in pipe};assert len(effective)==12 and all(x['returncode']==0 for x in effective.values())
rep=load(Q/'state/engineering_repairs.json');assert len(rep)==1;allowed={z['path']:z['new_sha256']for r in rep for z in r['changes']}
for n,sha in load(Q/'state/execution_source_hashes.json').items():assert h(Path(n))==allowed.get(n,sha),n
for n,sha in load(Q/'state/input_hashes.json').items():assert h(Q/n)==sha,n
assert all(r['WCE']<=r['budget']and r['pass_registered_clock']for r in a['rows']);assert all(r['pass_registered_clock']for r in a['integration'])
rows=a['rows'];names=[c['name']for c in load(Q/'configs/plan.json')['cases']];core=[];integ=[]
for n in names:
 rr={r['method']:r for r in rows if r['case']==n};ii={r['method']:r for r in a['integration']if r['case']==n};core.append((n,{m:r['LUT']for m,r in rr.items()}));integ.append(dict(case=n,baseline=min(ii[m]['LUT']for m in ['seed','quadol_wce']),proposed=ii['state_window']['LUT'],gain_pct=100*(1-ii['state_window']['LUT']/min(ii[m]['LUT']for m in ['seed','quadol_wce']))))
report='''# 第18轮：锁定贡献，完成因果、作者代码与集成证据

固定18个核心模型、9个带控制的点积核和108项图像质量记录全部完成，未在途中换输入、误差界或模型。**相对实际作者QUADOL-WCE，核心LUT减少7.14%、5.71%、11.43%；加上控制和32位累加器后，相对两基线中较小者仍减少4.63%、2.48%、6.11%。** 全部登记时钟通过。评分85/100；分数不替代下面的贡献判定。

## 完整核心矩阵

|模型|8×8+8，B256|9×9+6，B1024|10×10+4，B4096|
|---|---:|---:|---:|
|补偿截断种子|56|70|71|
|作者QUADOL-WCE|56|70|70|
|初始静态全域关系|53|66|66|
|当前关系、固定I5=1|53|69|62|
|当前关系、保持整网输出|52|67|70|
|完整主方法|52|66|62|

表为实际布线LUT。每列所有方法的FF/CARRY4分别保持40/8、40/8、39/11，DSP0。误差、平均误差、WNS/WHS全部保存在RESULTS.csv，不能把LUT减少扩写为所有指标同时改善。

作者代码来自此前固定提交，实际枚举三例27/10/16个符合作者条件的配对，完成56/41/58次完整域查询，无无效图。使用数学WCE适配、固定16匹配及端点检查，保留直接LUT6_2导出中的必要反相逻辑。它是作者流程在共同WCE指标下的对照，不是原论文MRED/nMSE表格复现，也不是对所有其他近似乘法器的领先声明。

## 消融明确了贡献来源

三个实验只移除主方法的一个因素，并保持相同候选顺序和求解上限。

1. **当前关系刷新：** 10位从静态66到62 LUT；8位53到52；9位面积同为66，但WCE从1024降至968、MAE从389.500降至383.180。因此刷新并非每例都省面积，其作用已有独立证据，不再与完整域/采样差异混在一起。
2. **真实第六输入：** 9位从固定I5的69降至66，8位53到52；10位同为62。第六输入在部分结构上有价值，但不是全部增量的共同来源。
3. **额外数值自由度：** 10位保持输出时70，允许数值余量后62；9位67到66。8位两者同为52，且保持输出版本WCE161、MAE84.6685优于完整主方法的225、119.330。8位的额外近似并不值得用于追求更小LUT，正式表将保留这个更好的精度选项，不能宣称完整模式处处最优。

最终候选贡献明确为：**在已有误差受限的算术网表上，根据当前全局数值许可关系联合生成符合实际LUT6_2共用半表和共享输入约束的函数，从而获得已有固定函数配置流程未取得的资源节省。** 状态更新、2-SAT、Boolean relation和双输出原语本身均已有文献；本项目的贡献要由这一具体生成能力及上述对照支持。方法固定，不新增模块。精确输出保持是已登记的同方法约束模式，不把按结果选择模式包装为新的选择算法。

## 包含控制与累加的计算核

|16项点积，15ns|种子 LUT|QUADOL LUT|主方法 LUT|相对较强基线|FF/CARRY4（三方法相同）|
|---|---:|---:|---:|---:|---:|
|8位|108|110|103|4.63%|88/22|
|9位|121|121|118|2.48%|85/20|
|10位|132|131|123|6.11%|84/23|

所有方法完成相同16次乘法和精确32位累加，接口、有效输入速率、控制、寄存边界和15ns时钟相同。含空拍与背靠背块的RTL检查均通过。三例128块×三方法，独立总和比较1152项，done周期检查19629项。固定时钟下每16个连续有效输入得到一个块结果；没有板级I/O、功耗或端到端应用加速主张。

## 实际图像数据的质量与边界

固定camera、coins、moon三幅公开样例，经固定256×256预处理，全部六方法、三位宽、两任务共108项记录。

|任务/位宽|种子 PSNR|QUADOL PSNR|主方法 PSNR|主方法最大像素误差|
|---|---:|---:|---:|---:|
|图像混合8位|49.92|49.92|48.05|2|
|图像混合9位|46.66|46.66|47.89|2|
|图像混合10位|48.98|49.04|47.44|2|
|16项滤波8位|30.96|30.96|27.15|14|
|16项滤波9位|27.15|27.15|29.00|14|
|16项滤波10位|31.45|31.41|28.00|16|

PSNR以三图合并MSE计算，不是所有单图的最低值。9位主方法在两种应用中同时降低资源和实际误差；8/10位有质量代价。图像混合的绝对误差很小，而低系数、多项累加的滤波暴露明显正偏差。全量程WCE约束不能自动保证低幅值或累积应用的高精度；不删除滤波负例，不调整预算补救本轮数字。独立算子真值表、输出图像及PSNR/SSIM/MAE/偏差均保存。

## 验证与工程记录

18模型最终数学检查302,?个输入，精确数量以state/analysis.json为准。核心HDL共68993项比较；集成核独立校验见上。核心10项新物理实现，其余按登记同RTL复用或同轮去重；集成9项全部新实现。

一次工程修复：自定义集成测试平台在厂商glbl的100ns全局复位结束前送入首块数据。将测试激励延后200ns后，三例全部通过。九个集成硬件RTL的哈希不变，模型、预算、时钟、控制和输入块不变。原失败目录、原测试平台、原工具脚本、修复SHA与复跑日志均保留。这是仿真启动问题，不是科学反例。

完整域构造的指数成本仍在；组合成16项点积只证明模块级可组合性，不证明工业大网表综合可扩展。研究贡献限定为已验证的小位宽误差受限算术单元的物理重综合。

## 冻结决策

已有可信的核心资源收益、两个机制的独立消融、数学正确性及包含控制的正结果，允许进入用户指定的有限核心审查。R19将从种子重新生成候选、作者基线和四种关系模式，核对最终函数与本轮完全一致，冻结后重新执行18核心+9集成物理实现以及全部应用评价。没有新的模型模块或R20。

评分：创新19/25、物理收益21/25、覆盖18/20、正确性20/20、成本7/10，总计85。尚未把正式证据完成或TVLSI竞争力写成已成立；R19统一完成验收与投稿证据评估。
'''
report=report.replace('302,?个输入',f'{a["effective_final_inputs"]:,}个输入');assert sum(r['checks']for r in a['hdl'])==68993
p=Q/'reports/ROUND18_REPORT_ZH.md';p.write_text(report,encoding='utf-8')
a.update(status='COMPLETE_SCORED',score=85,score_components=dict(innovation=19,physical_gain=21,problem_coverage=18,correctness=20,cost=7),decision='MAIN_CONTRIBUTION_LOCKED; CORE_AUDIT_FREEZE_AND_FULL_FORMAL_R19',integrated_gain_summary=integ);dump(Q/'state/analysis.json',a)
rec=dict(round=18,status='COMPLETE',score=85,report=str(p),report_sha256=h(p),finished=datetime.datetime.now().astimezone().isoformat());dump(Q/'state/round_status.json',rec)
dump(Q/'state/completion_verification.json',dict(status='PASS',effective_stages=12,pipeline_records=len(pipe),preserved_failed_attempts=sum(x['returncode']!=0 for x in pipe),input_hashes='UNCHANGED',execution_source_changes='Only documented testbenchstartup/resume change with oldbytes preserved',core_models=18,integration_models=9,application_records=108,report_sha256=h(p)))
c=load(R/'state/campaign.json');assert c['active_round']==18 and not any(x['round']==18 for x in c['rounds']);c['rounds'].append(rec);c.update(status='ROUND18_COMPLETE_PROCEED_FINAL_R19',remaining_rounds=[19]);dump(R/'state/campaign.json',c);print(json.dumps(rec,ensure_ascii=False))
