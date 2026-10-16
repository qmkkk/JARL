# 与2025—2026已发表论文的横向比较

用户要求：最终判断必须以同期真实论文为参照，公平呈现本项目的优势、贡献与边界，不能只列自身缺陷。本文在R23固定矩阵运行期间整理文献；最终科学判定待全矩阵完成后填入最终报告。不据中途结果改模型、输入、基线或门槛。

比较遵循同一原则：评价论文实际解决的具体问题及对应证据，不要求所有论文同时具备通用算法、多个芯片家族、板测和流片。已知算法的有用新问题建模/硬件构造可以构成研究贡献；不能仅因使用2-SAT、图割或SAT等已有工具而否定创新。另一方面，已完成多少轮不构成贡献证据。

## 同期期刊参照

|论文与正式发表信息|具体贡献及已核实证据|与Project3比较的意义|
|---|---|---|
|Guo等，FPGA-Based Low-Power Signed Approximate Multipliers for Diverse Error-Resilient Applications，TVLSI 34(3):1029–1042，2026，DOI 10.1109/TVLSI.2026.3654164|FPGA定制混合基数部分积生成及累加，提供16/32位开源RTL；摘要报告最佳16位配置相对精确乘法器PDP减少38.31%、LUT减少35.66%，并有JPEG/FIR应用。|它是专用运算器设计，我们是可施加于既有电路的重综合方法。R22直接在其作者RTL上保持函数、再节约1.92%—2.24%LUT，是更强起点上的增量；不能把此增量与35.66%的精确起点降幅直接比较，也不声称替代其全部算法或应用前沿。|
|Bao等，FANE: FPGA-Based FP8 Approximate Neural Network Engine，TVLSI 34(6):2015–2019，2026，DOI 10.1109/TVLSI.2026.3677683|五页brief，将线性加法近似乘法构造成MAC、卷积及MVM，并集成LLM。大学存档摘要报告61.5% TOPS/W提升。作者仓库提供软硬件模型，说明功耗来自PDM2025.2，并区分论文版本与后续修正。|它强调运算器到应用的硬件价值，适用于评价我们的系统证据；不能把FP8算术直接当作整数WCE综合算法基线。其公开功耗也为工具估计，因此不能仅因我们没有板测就机械否决投稿竞争力。其仓库有版本修正，故也不能假设“发表即无工程边界”；这些记录不等于认定论文无效。|
|Awais等，Design Space Exploration for Approximate Circuits via Checkpointing and DNN-Based Estimators，TVLSI 33(9):2395–2405，2025，DOI 10.1109/TVLSI.2025.3559377|DeepApprox以静态/动态检查点把ML误差估计与模拟校正结合，比较模拟MCTS和仅ML两类流程；摘要称在更低运行成本下保持相近面积/功耗效果。|它说明方法类论文可以贡献搜索可靠性与效率，不必每例面积都胜过所有方法。我们的贡献应围绕真实LUT6_2数值关系与可实现函数构造，而不是把全域验证本身写成首创。当前只核到论文摘要及正式记录，不编造其具体基准数量、加速倍数或全文未见的限制。|
|Shi等，Hybrid Approximate Multipliers With Merits Balance for Digital Processing and Neural Networks，TVLSI 33(10):2795–2805，2025，DOI 10.1109/TVLSI.2025.3587279|对数表示与分段线性拟合结合，在幂二斜率约束下平衡误差；摘要报告45nm库相对精确乘法器超过55%功耗、23%延迟和43%面积降低，并评价数字处理与神经网络。|它有明确的误差—硬件协同构造，是贡献组织参照。45nm ASIC和FPGA LUT不可混排；相对精确设计的大幅收益也不应成为本项目相对强近似基线增量的统一数值门槛。我们没有复现其全部对比，不能声称胜过HAM。|

主要来源（均为论文自身内容、作者工件或作者学校记录；摘要与全文阅读范围明确分开）：

- FABM [作者工件](https://github.com/YnuGuoLab/FPGA_Signed_Approx_Mul)、[论文摘要](https://www.researchgate.net/publication/400046953_FPGA-Based_Low-Power_Signed_Approximate_Multipliers_for_Diverse_Error-Resilient_Applications)。本项目已固定作者代码并执行R22；论文全文未取得，不声称逐表复核。
- FANE [大学正式记录及摘要](https://researchportal.vub.be/en/publications/fane-fpga-based-fp8-approximate-neural-network-engine/)、[作者代码与功耗说明](https://github.com/hanbao04/FANE-FPGA-based-FP8-Approximate-Neural-Network-Engine)。论文全文未取得；61.5%是作者报告，不是本地复现实测。
- DeepApprox [大学正式卷期记录](https://ris.uni-paderborn.de/record/62020)、[论文摘要](https://www.researchgate.net/publication/391415557_Design_Space_Exploration_for_Approximate_Circuits_via_Checkpointing_and_DNN-Based_Estimators)。大学记录明确未上传全文。
- HAM [论文摘要与DOI](https://www.researchgate.net/publication/393895932_Hybrid_Approximate_Multipliers_With_Merits_Balance_for_Digital_Processing_and_Neural_Networks)。Crossref出版社登记元数据保存在本轮inputs；没有以第三方付费代购页面作为技术依据。

## 更直接的方法最近邻

同期TVLSI工作用于校准论文定位；具体新颖性仍需面对真正的算法最近邻，不能只挑不同问题的期刊论文作陪衬。

|方法|已有能力|本项目可区分的具体内容及证据边界|
|---|---|---|
|QUADOL，DATE2026|配置局部双输出函数/输入并通过图匹配与误差控制选择合并。|我们在当前整网数值许可关系内联合生成函数及支持，并约束真实O5/O6共用余因子；作者代码适配基线和更强串行控制已经执行。不是泛泛的“双LUT联合”。|
|SPFD-Based Resynthesis for Dual-Output LUT Networks，VLSI-SoC2026|映射后双输出重综合、合并和扩展重代换；全文报告抽象面积/深度改进。|其精确依赖构造是紧邻。本项目数值预算许可及实际原语实现是具体差异；物理和系统实验是我们的证据优势，但不同指标不能直接百分比排名。尚未执行作者完整流程，不宣称全面胜过它。|
|SimALS-MaxError，TCAD2026|模拟引导及SAT约束最大误差综合。|因此“用SAT保证WCE”不独立新颖；R22的SAT用作可迁移验证，主要创新仍在候选构造。|
|ResubALS，TCAD2025；eSLIM，SAT2024|近似care及组合误差控制；通用多输出布尔关系综合。|关系、重代换和多输出不是我们的首创。面向共享半表的数值许可、支持完成与质量选择的结合，需由反事实消融及实测增量承担。|

来源：[QUADOL作者论文](https://arxiv.org/html/2411.18330v1)、[正式发表记录](https://research.tue.nl/en/publications/quadol-a-quality-driven-approximate-logic-synthesis-method-levera/)、[SPFD全文](https://changmg.github.io/papers/Costamagna_Meng_De-Micheli_SPFD-Based-Resynthesis-for-Dual-Output-LUT-Networks.pdf)、[SimALS-MaxError全文](https://si2.epfl.ch/demichel/publications/archive/2026/approx.pdf)、[ResubALS全文](https://si2.epfl.ch/demichel/publications/archive/2025/resub.pdf)、[eSLIM全文](https://drops.dagstuhl.de/storage/00lipics/lipics-vol305-sat2024/LIPIcs.SAT.2024.23/LIPIcs.SAT.2024.23.pdf)。

## 对本轮最终判断的约束

积极证据须完整计入：R20乘法同时减少LUT和MAE；R21在不增加实现资源的情况下改进质量；R22在真实16位作者电路上保持功能继续减少资源；R19已有相同有效工作下的控制/累加器成本；R23将进一步给出真实可编程FIR及两个7系列器件的结果。

适用边界也采用对等标准：两种7系列型号不是跨LUT架构泛化；R22输入hold问题不能冒充算法负例；功耗估计不是实测，但工具估计本身并不自动否决论文。质量或资源回退不能删除，不过也不要求在每一电路、每一应用、每一指标上都胜出。

最终只回答这条已收敛、限定清楚的贡献是否值得按TVLSI水平投稿。判断依据是独立方法价值、强基线下的可信增量、实际应用中的资源质量取舍和证据可信度，不是任意实验数量或固定改善百分比。全部矩阵结束后给出“有”或“没有”，不再以等待下一轮回避。
