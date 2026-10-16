# 最终评价的证据阅读顺序

本聊天仅负责Project3。R23是用户要求的最终二选一判断轮，不能自动启动R24。根目录Project10记录不改变本聊天范围。

1. `configs/plan.json`：固定三位宽、四方法、两器件、六工作负载，以及本轮停止条件。
2. `reports/CONTEMPORARY_COMPARISON_ZH.md`：2025—2026同期TVLSI真实论文及真正最近邻。明确区分读到全文、摘要、作者代码和正式元数据的范围。
3. `../round19/reports/FINAL_THREE_ROUND_REPORT_ZH.md`：冻结主方法、强串联对照、机制消融、完整控制/累加器成本。其当时的投稿判断是历史判断，后续证据不得倒写进去。
4. `../round20/reports/ROUND20_ANALYSIS_ZH.md`：六类算子、五预算，固定物理子集，乘法资源/误差同时改善；完整保留平局与负例。最终精度应读其`results/precision_reconciliation/exact_metrics.json`。
5. `../round21/reports/ROUND21_ANALYSIS_ZH.md`：相同解析补偿后的四方法比较，固定支持质量改进，包含两个真正存在跨行耦合的实例。2-SAT和图割属于已有求解工具，不是本项目发明。
6. `../round22/reports/ROUND22_ANALYSIS_ZH.md`：同期FABM作者16位原电路的精确函数迁移；三个配置均省LUT，15个最终证明与37,953次RTL比较。setup与完整I/O hold结论分开记录。
7. 本轮`results/system_quality.json`与`inputs/*gold.hex`：每个固定信号和滤波器的完整数值结果；不是挑选的最佳应用。全部矩阵完成后生成CSV、图和`results/analysis_summary.json`。
8. 本轮`results/hardware/<part>__<top>/`：每个物理端点的原始综合/布线、功能回放、SAIF、功耗及注释覆盖。各端点独立构建，无共享Vivado工程。
9. 本轮`state/execution_complete.json`：仅在12个RTL设计与24个物理活动端点全部成功执行后生成。执行结束与TVLSI评价是两个不同字段；正负结果都可完成执行。

资源与误差指标相互配对，不能把A方法的资源和B方法的精度拼成不存在的优胜点。相同WCE预算不等于相同MAE/SNR，但同预算的资源改善也不能仅因为平均误差不处处最小而抹去。最终评估同时解释可实现新配置、同预算资源、真实应用精度以及已记录的适用条件。
