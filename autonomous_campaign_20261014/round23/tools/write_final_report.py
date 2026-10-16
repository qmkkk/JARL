from pathlib import Path
import json
Q=Path(__file__).resolve().parents[1]
def load(p):return json.loads(p.read_text(encoding='utf-8'))
s=load(Q/'results/analysis_summary.json');phys=load(Q/'results/physical_results_annotated.json');qual=s['quality_aggregate'];raw=load(Q/'results/system_quality.json')
assert s['physical_endpoints']==24 and s['timing_pass']==24
def qr(w,m):return next(r for r in qual if(r['width'],r['method'])==(w,m))
def mdtable(headers,rows):return '\n'.join(['| '+' | '.join(headers)+' |','| '+' | '.join(['---']*len(headers))+' |',*['| '+' | '.join(map(str,row))+' |'for row in rows]])
resources=[]
for part in load(Q/'configs/plan.json')['devices']:
 for w in (8,9,10):
  rr=[r for r in phys if(r['part'],r['width'])==(part,w)];m=next(r for r in rr if r['method']=='quality_window');b=min((r for r in rr if r['method']in('quadol_wce','serial_then_quadol')),key=lambda r:r['route_LUT'])
  resources.append([part,w,b['route_LUT'],m['route_LUT'],f"{100*(b['route_LUT']-m['route_LUT'])/b['route_LUT']:.3f}%",f"{b['route_FF']}→{m['route_FF']}",'通过'])
quality=[]
for w in (8,9,10):
 rr=[qr(w,m)for m in('quadol_wce','serial_then_quadol','state_window','quality_window')]
 quality.append([w,*[f"{r['RMSE']:.3f}"for r in rr],f"{100*(rr[2]['RMSE']-rr[3]['RMSE'])/rr[2]['RMSE']:.3f}%"])
gain10=100*(qr(10,'serial_then_quadol')['RMSE']-qr(10,'quality_window')['RMSE'])/qr(10,'serial_then_quadol')['RMSE']
gain9=100*(qr(9,'quadol_wce')['RMSE']-qr(9,'quality_window')['RMSE'])/qr(9,'quadol_wce')['RMSE']
oldwins=sum(next(x['SSE']for x in raw if(x['width'],x['method'],x['block'])==(r['width'],'state_window',r['block']))>r['SSE']for r in raw if r['method']=='quality_window')
report=f'''# Project3 R23最终评估：有TVLSI投稿竞争力

**结论：有 TVLSI 投稿竞争力。** 我的判断是，Project3已经可以按一篇围绕“状态相关数值关系驱动的FPGA双输出LUT重综合”的方法论文收拢。依据是可明确区分的构造方法、强起点上的实测增量、质量优化的独立作用，以及算子、作者电路和完整FIR三个层次的证据。这个判断针对现有明确限定的研究主线，建议结束本轮实验并组织投稿材料；不再用下一轮推迟结论。本次不撰写论文、不自动启动R24。

这不是由实验轮数、一个固定提升百分比或一张完整性清单推导出的结论，也不等于录用承诺。同期论文的实际贡献和证据强度是校准依据；不能要求本项目同时具备所有已发表工作的全部优点。

## 1. 最有分量的正向证据

- **跨结构的同时改善。** R20的固定8位乘法物理点，相对最低资源基线，LUT从67减到64（4.48%），MAE从6.25降到2.46875（60.50%），三种方法均通过15ns时钟。六类算子、五预算的全部90个逻辑端点和预定物理子集均已保留，不只汇报该正点。
- **质量完成有独立作用。** R21从所有方法共享的解析补偿起点出发，在既有支持和拓扑上选择双半表函数，三种位宽的核心RMSE降低15.42%、5.14%、1.11%，LUT、FF、CARRY及该轮布线时序不变。这里的质量优化不是新增补偿加法器，也不是将解析补偿重新命名为创新。
- **可叠加到近期作者优化电路。** R22在TVLSI2026 FABM公开的三个16位有符号配置上，保持原近似函数完全一致，将布线后LUT从223/208/190降到218/204/186，即1.92%—2.24%。候选经符号证明准入，最终15项证明和37,953项HDL比较通过。该轮全部setup通过，但原登记OOC输入接口存在hold失败，所以这些结果用于等价资源迁移证据，不声称其完整I/O时序闭合。
- **完整系统中资源优势仍然存在。** 本轮计入可编程系数、历史样本存储、符号处理、控制和40位累加器后，六个位宽/器件配置仍全部比登记的最低LUT基线更省资源。10位FIR汇总RMSE还比串行强基线低{gain10:.3f}%；9位相对QUADOL-WCE同时减少LUT并降低汇总RMSE {gain9:.3f}%。

这些结果合在一起，已经超过“单个小例子省一个LUT”的证据形态。适合承担论文主线的是受数值约束的构造方法和可重复的资源—质量改进，应用实验说明其后果。

## 2. 这一轮实际完成了什么

三位宽（8/9/10）、两项基线（QUADOL-WCE与独立支持缩减后接QUADOL）、旧主方法消融和质量完成主方法，共12种RTL；在Artix-7 100T和200T上完成24个独立物理端点。所有方法使用同一可编程16抽头FIR、15ns时钟、20周期启动间隔和19周期输出延迟，即66.667MHz下3.333Msample/s、285ns延迟。

所有24个端点通过本轮核级OOC时序及约束检查。73,728次RTL输出比较和147,456次布线后功能网表输出比较通过，共221,184次；比较同时要求输出值、有效信号和登记周期吻合。输入与原R21源RTL的哈希检查通过。完整乘法切片表覆盖5,505,024个方法—输入组合，另有3,124个独立标量点检查；FIR使用独立精确整数卷积作为精度参考，并验证16B组合误差上界及40位不溢出。

原计划的Kintex-7型号在本机未安装。确认所有Kintex-7器件均不可用后，在第二器件任何结果出现之前，将全部12个第二器件端点统一换成已安装的Artix-7 200T，保留原计划、失败日志和修订哈希。模型、输入、预算、时钟和方法未改变。因此最终证据是**同系列两个器件**，不声称跨FPGA架构。修订记录见state/device_availability_amendment.json。

## 3. 资源结果与精度配对

以下最低资源基线在每个位宽和器件内取本轮两个基线的最小布线后LUT；它不自动等于最优精度基线。

{mdtable(['器件','位宽','最低基线LUT','主方法LUT','LUT减少','FF基线→主方法','15ns时序'],resources)}

CARRY资源在各位宽的方法间一致；10位主方法额外少1个FF。主方法相对QUADOL-WCE的LUT减少范围为0.87%—3.60%，相对两项基线中最省LUT者为0.47%—2.09%。所有方法完成同样数量的滤波输出，吞吐和延迟相同，因此这里的收益是等吞吐的资源效率。

每个位宽的完整6个固定工作负载包括低通/带通滤波器与多音、扫频、带阶跃和脉冲的种子噪声信号。它们是标准构造的DSP测试信号，不是现场采集数据。下面按全部6,144个样本汇总SSE后计算RMSE，不对dB直接取算术平均，也不按输赢重加权。

{mdtable(['位宽','QUADOL RMSE','串行基线RMSE','旧方法RMSE','主方法RMSE','相对旧方法RMSE降低'],quality)}

具体解释：

- 8位主方法比两个基线都省LUT，但汇总精度更低；这里明确是资源与精度交换。
- 9位主方法在汇总资源/RMSE上优于QUADOL-WCE；串行基线的汇总RMSE仍更低。两个低通工作负载上主方法精度也超过串行基线，其余点全部保留。
- 10位主方法相对串行强基线同时少1个LUT、少1个FF并降低汇总RMSE {gain10:.3f}%；QUADOL-WCE使用更多LUT但精度明显更高。不能把主方法写成全面精度领先。
- 质量完成相对旧方法的三个汇总RMSE均下降，{oldwins}/18个独立“位宽×工作负载”精度改善；另4个有小幅回退。R21均匀输入域上的质量改善，并不自动等于所有FIR输入分布上的改善。

两个器件上36个主方法“位宽×器件×工作负载”资源/SSE点均不被本轮两个基线支配。这一统计来自更低LUT与精度的成对比较，**不等于36次全面胜出**，也不是已对所有外部方法证明全局帕累托前沿。

零操作数分量分析解释了部分应用误差：冻结近似核在零输入上可能仍有偏移，FIR中的零系数、零样本和初始历史会触发它。8位低通有2个量化为零的系数；其他配置即使系数非零，仍会遇到零样本或初始化。该分量已从原输入/表格计算并保存在results/zero_operand_error_component.csv，分量SSE因交叉项不能直接相加为总误差。本轮没有加入零检测、改系数或调预算来追逐结果。

## 4. 功耗与时序结论

24个端点均用相同固定工作负载的布线后功能回放产生SAIF，再注入布线检查点计算功耗。设计网匹配率89.56%—91.24%，未匹配网由工具传播估计。动态功耗报告为3—4mW，报告分辨率1mW；主方法与最低LUT基线在六个配置中报告值相同。因此本轮**没有证明相对强基线的能耗优势**，不能将单个相对QUADOL的1mW显示差异包装成稳健25%节能。

固定时钟、相同II和输出延迟已验证，未执行Fmax扫描，未做板测或含毛刺的时序活动功耗仿真。上述边界使能效或峰值加速不能成为本论文核心claim；它们不抹去有物理实现支撑的资源/精度贡献。

## 5. 与同期真实论文横向判断

|同期论文|已核实的贡献和证据|对Project3的公平判断|
|---|---|---|
|FABM，TVLSI34(3):1029–1042，2026|FPGA友好的混合基数近似部分积与累加；最佳16位配置相对精确乘法器LUT减少35.66%，并评价JPEG/FIR|它的专用算术优化幅度更大；我们的构造更偏通用重综合，且已直接在其优化RTL上获得额外约2%的等价面积收益。不同起点的百分比不能混排。|
|DeepApprox，TVLSI33(9):2395–2405，2025|把DNN误差估计与检查点模拟纠偏结合，改善近似综合搜索的成本与可靠性|它是有效方法组合形成独立贡献的同期例子。我们也应按具体问题建模、机制作用和相对强基线的结果评价，而非仅因用了已有2-SAT/图割就否定创新。|
|FANE，TVLSI34(6):2015–2019，2026|从FP8近似乘法到MAC、卷积/MVM与LLM，摘要报告更高TOPS/W；作者工件说明采用工具功耗估计|它的应用和能效收益更突出。Project3的竞争点在数值约束重综合与资源质量设计空间；无需假装已有同等能效成果，也无需因缺少板测被机械否决。|
|HAM，TVLSI33(10):2795–2805，2025|以对数及分段线性算术构造硬件/误差平衡，评价45nm实现与数字处理/神经网络应用|它提供另一类具体硬件构造加应用证据的参照。其ASIC面积/功耗与本项目FPGA LUT不进行直接数值排名。|

原始来源：[FABM论文摘要](https://www.researchgate.net/publication/400046953_FPGA-Based_Low-Power_Signed_Approximate_Multipliers_for_Diverse_Error-Resilient_Applications)、[FABM作者工件](https://github.com/YnuGuoLab/FPGA_Signed_Approx_Mul)、[DeepApprox正式记录](https://ris.uni-paderborn.de/record/62020)、[DeepApprox摘要](https://www.researchgate.net/publication/391415557_Design_Space_Exploration_for_Approximate_Circuits_via_Checkpointing_and_DNN-Based_Estimators)、[FANE大学摘要](https://researchportal.vub.be/en/publications/fane-fpga-based-fp8-approximate-neural-network-engine/)、[FANE作者工件](https://github.com/hanbao04/FANE-FPGA-based-FP8-Approximate-Neural-Network-Engine)、[HAM论文摘要](https://www.researchgate.net/publication/393895932_Hybrid_Approximate_Multipliers_With_Merits_Balance_for_Digital_Processing_and_Neural_Networks)。四篇TVLSI论文已核对正式发表信息、可得摘要和作者工件；未取得全文的项目不声称已逐表复核。详细阅读边界及DOI见CONTEMPORARY_COMPARISON_ZH.md。

真正的方法最近邻仍是QUADOL、SPFD、ResubALS、SimALS-MaxError和eSLIM。QUADOL已考虑真实双输出LUT的输入、函数和选择器，因此本项目不能以“首次双LUT联合”或“首次考虑I5”作为新颖性。区别在于从当前全电路的数值许可关系直接生成可实现的共享半表及支持，并在固定支持上进行输出误差代价选择。R19反事实消融、R20联合合法性见证和R21质量消融分别支撑这些分量。

SPFD全文相对其强映射基线报告2.7%几何平均面积和3.6%深度改善。这说明几个百分点的强起点增量可以有研究价值；不是说本项目达到2%就自动合格。SPFD的大型基准覆盖和扩展性更强，我们的数值预算构造、实际原语和应用物理验证是不同优势。我们没有完整复现其作者流程，不声称全面胜过SPFD。[QUADOL全文](https://arxiv.org/html/2411.18330v1)、[SPFD全文](https://changmg.github.io/papers/Costamagna_Meng_De-Micheli_SPFD-Based-Resynthesis-for-Dual-Output-LUT-Networks.pdf)

## 6. 最终贡献范围、评分与停止决定

建议固定的核心贡献是：**在给定数值误差预算下，以当前电路的双根许可关系联合构造符合真实LUT6_2共享半表约束的实现，并在固定支持上优化输出误差，从而在已测试强基线之外形成有物理验证的资源—质量改进；零额外误差特例可继续优化近期作者设计。**

一般关系综合、2-SAT、图割和SAT验证均有先行研究，不包装为新发明。近似数值搜索仍主要采用小输入域全枚举，R22仅证明精确函数迁移可采用符号准入；不声称通用大规模数值综合已经解决。R20有物理资源回退与平方根时序负例，R19和本轮也有应用精度回退，它们全部进入证据，不改变上述正向贡献的存在。

本轮评分**86/100**：贡献区分30/35，系统优势24/30，证据可信度24/25，泛化8/10。扣分反映系统增量幅度、应用分布敏感性、功耗报告精度与同系列器件覆盖；分数是按本轮预登记维度作出的研究评价，不是录用概率，也不与不同评分规则的历史轮数机械比较。

**最终判断保持明确：有 TVLSI 投稿竞争力。** 现有证据足以支持按这条收敛贡献组织一篇认真投稿的论文。我不再把每个应用都最优、跨所有FPGA家族或板测当作本项目必须追加的门槛，也不把同领域不同论文最强结果拼成一个无人满足的标准。

本轮实验阶段结束。停止自主实验和方向迭代，不追加R24；所有原始正负结果、执行故障、输入哈希、修订和工具配置原位保留。本判断不是宣称找到数学全局上限，也不是自动成功归档或论文已写完。

## 数据入口

- 本轮完整数值结果：results/system_quality.csv、quality_aggregate.csv、workload_quality_comparison.csv。
- 物理与活动结果：results/physical_results.csv、baseline_comparison.csv；每个硬件子目录含原始Vivado报告、仿真和SAIF。
- 图：reports/fir_resources.png、reports/fir_quality.png。
- 有限证据一致性核验：state/final_evidence_verification.json；最终状态：state/round_status.json。
- 历史主证据：round19—round22各自reports与results；不回写其当时结论。
- 工程处理详情：reports/EXECUTION_NOTES.md；未安装器件替换及检查点恢复均有原始日志，不计为方法失败或新科研成果。
'''
(Q/'reports/FINAL_R23_TVLSI_VERDICT_ZH.md').write_text(report,encoding='utf-8')
assessment=dict(verdict='有 TVLSI 投稿竞争力',verdict_kind='Evidence-based submission-competitiveness judgment against 2025-2026 publications, not acceptance guarantee',score=86,score_components=dict(independent_contribution=30,system_advantage=24,evidence_integrity=24,generalization=8),claim='State-conditioned numeric relations drive physically realizable dual-output LUT support/function completion, with fixed-support quality optimization and verified resource-quality gains beyond the registered baselines.',positive_anchors=['R20 umul8: routed67->64LUT and MAE6.25->2.46875','R21: core RMSE decreases15.42/5.14/1.11% at unchanged physical resources','R22: three author signed16 designs preserve function with1.92-2.24% fewer routedLUTs','R23: six width/device systems all lowerLUT than lowestLUT registeredbaseline, with10bit pooledRMSE improvement and9bit jointgain vsQUADOL'],r23_RMSE_gain10_vs_serial_percent=gain10,r23_RMSE_gain9_vs_quadol_percent=gain9,r23_quality_completion_workload_wins=oldwins,r23_workloads=18,not_claimed=['Universal superiority','Energy or Fmax gain','Board-level measurement','Cross-architecture FPGA validation','General scalable numeric search on32inputbits','Mathematical global optimum','Acceptance guaranteed'],decision='STOP_AFTER_FINAL_VERDICT_NO_AUTOMATIC_R24',next_round_authorized=False,manuscript_authorized=False,schedules=False,delegation=False)
(Q/'state/final_assessment.json').write_text(json.dumps(assessment,ensure_ascii=False,indent=2),encoding='utf-8')
print(json.dumps(assessment,ensure_ascii=False,indent=2))
