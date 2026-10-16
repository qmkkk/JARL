# 最终贡献与最近邻的边界

本文件只澄清已有工作与本次固定实验的对应关系，不开启新方向或追加实验。最终数值结论由完整矩阵结束后的 FINAL_THREE_ROUND_REPORT_ZH.md 决定。

|已有工作|必须承认的已有能力|本次实际检验的区别|
|---|---|---|
|[Miao 等，ICCAD 2013](https://slam.ece.utexas.edu/pubs/iccad13.ALS.pdf)|误差幅度约束与 Boolean relation 最小化之间的联系已有系统表述|不能把“用数值许可关系表示近似自由度”当成首创；本次针对真实 LUT6_2 半表、共享输入和支持的联合生成|
|[多级近似综合，ICCAD 2014](https://users.ece.utexas.edu/~gerstl/publications/iccad14.MALS.pdf)|多级近似综合已有研究|当前电路更新和全局误差验收不能单独构成创新声明|
|[Wu 等，ASP-DAC 2017](https://gc.sjtu.edu.cn/~wkqian/papers/Wu_Shen_Jia_Qian_Approximate_Logic_Synthesis_for_FPGA_by_Wire_Removal_and_Local_Function_Change.pdf)|利用 LUT 灵活性同时移除局部输入并改变函数，并通过 ILP 选择变换|本次串联对照采用透明的单根最小支持算法加实际 QUADOL，不是该论文完整 ILP 流程复现；不能写成击败该论文|
|[QUADOL](https://arxiv.org/html/2411.18330v1)|局部函数相似性、双输出原语配置与全局质量控制|本次实际执行固定作者代码，并适配共同数学 WCE；比较固定函数配置与联合函数生成，而不是宣称首先使用双输出 LUT|
|[eSLIM，SAT 2024](https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.SAT.2024.23)|多输出 Boolean relation 和局部 SAT 重综合已有方法|本次只证明固定物理支持问题的生成与可行性，不声称首次多输出关系重综合，也不继承其可扩展性结论|
|[SimALS-MaxError](https://arxiv.org/html/2505.16769v2)|最大误差限制下的近似替换与验收已有方法|本次关注数值关系与双输出物理共用半表约束的联合求解；验收或状态更新本身不是贡献|
|[AMG](https://arxiv.org/html/2310.15495v4)|面向 FPGA 的近似乘法器生成已有工作|当前列截断种子是透明实现，不是 AMG 复现；未执行 AMG 时不能宣称对全部近似乘法器达到最好结果|

ASP-DAC 论文年份以[官方会议程序](https://www.aspdac.com/aspdac2017/archive/program/program.html)为准；搜索引擎的近期抓取日期不是发表日期。本轮直接打开其 PDF 一度超时，随后检索到作者域上的摘要与方法说明；没有将检索摘要当成完整实现说明。

具体创新候选是：在已有误差受限算术网表上，对当前全局数值许可关系求解满足真实 LUT6_2 共用半表、共享输入及支持约束的两根函数，随后用独立整网检查验收。固定支持可行性可归约为 2-CNF，但支持搜索、候选池和物理代价排序均有固定上限，因此不声称整网面积全局最优。

串联对照能回答一个重要、但范围明确的问题：在相同候选根及单遍约束下，先分别缩减支持再执行作者配置流程，是否已经足以取得本方法的物理收益。它不能排除所有可能的单根迭代、所有支持排序或更强全局选择算法。最终结论必须区分“在已执行的对照上成立”和“普遍不可由串联方法达到”。
