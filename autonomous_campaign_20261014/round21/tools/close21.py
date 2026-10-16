from common21 import Q,R,load,dump
import hashlib,datetime
a=load(Q/'state/analysis.json');assert a['endpoints']==12 and a['timing_pass']==12
details=[]
for c in load(Q/'configs/plan.json')['cases']:
 n=c['name'];s=load(Q/f'state/{n}_quality_window_state.json');records=load(Q/f'results/{n}_methods.json')
 for h in s['history']:
  if h['status']!='ACCEPTED_QUALITY':continue
  old=h['old_configuration'];new=records[h['pair']]['methods']['quality_window'];solved=h['solver']
  details.append(dict(case=n,pair=h['pair'],variables=solved['variables'],mask_a=solved['mask_a'],mask_b=solved['mask_b'],changed_A_rows=(int(old['initA'],16)^int(new['initA'],16)).bit_count(),changed_B_rows=(int(old['initB'],16)^int(new['initB'],16)).bit_count(),SSE_before=solved['incumbent_cost'],SSE_after=solved['cost'],old_configuration=old,new_configuration=new))
dump(Q/'results/quality_change_details.json',details)
report=Q/'reports/ROUND21_ANALYSIS_ZH.md'
text='''# Project3 共同解析补偿起点上的质量优化结果

本轮完成三个24位输入域的MAC算例、两个基线、旧主方法及质量优化候选，共12个端点。全部完成独立RTL校验与布局布线。质量候选在三个算例上都改善了旧主方法的资源精度前沿：LUT、FF、CARRY4和布线时序裕量不变，RMSE分别降低15.42%、5.14%、1.11%。

| 算例 | 最佳资源基线LUT | 旧主方法与质量候选LUT | LUT减少 | 旧主方法RMSE | 质量候选RMSE | 最佳资源基线RMSE |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| 8位乘法与8位加数 | 51 | 49 | 3.92% | 136.133 | 115.136 | 104.452 |
| 9位乘法与6位加数 | 69 | 66 | 4.35% | 402.761 | 382.053 | 379.205 |
| 10位乘法与4位加数 | 63 | 62 | 1.59% | 1958.587 | 1936.785 | 1805.947 |

三个案例的新方法均在资源与MSE平面上不受本轮两个基线支配，但仍有资源与精度交换。8位和10位的基线精度更好；9位质量候选MAE为318.5578，与串行基线318.5729接近，但RMSE仍比串行基线高约0.75%。不能将相对旧主方法的改善改写成对所有基线的全面精度胜出。

## 排除简单补偿解释

所有方法从相同的、经过解析补偿的映射图开始。保留原部分积列截断与平衡加法结构，只将常数从160／896／2048调整为80／769／1024。设被删除部分积和为R，最大值为S，独立均匀操作数下E[R]=S/4；在误差约束C属于[S-B,B]内选取最接近S/4的整数C，可最小化该类常数补偿的均方误差。它属于已知算术优化，不是新贡献。

新方法的额外收益发生在上述共同起点及旧主方法搜索完成之后。因此不能只用起点去偏差解释本轮质量增量。另一方面，解析优化起点不保证贪心综合后的最终前沿优于所有历史起点；R19结果仍保留，不能被本轮新起点覆盖。

## 质量优化做了什么

候选只访问旧主方法已经接受的窗口，保持同一顺序、共享输入、选择器和半表支持。对每种根输出组合，累加最终算术输出的全域平方误差，并以原WCE上限作为硬约束。可一致变换为次模二元能量的子问题使用标准最小割求解。

23个窗口中，20个在固定支持的该能量问题下已经最优，3个得到严格改善，每个位宽各1个。改变发生在双半表函数内，没有增加输出补偿加法器。三个改善窗口分别有64、48、17个布尔变量：8位实例没有跨半表行的支持耦合，另外两个实例存在支持识别带来的变量共享。不能把所有实例都描述为复杂耦合求解，也不把最小割算法作为新发明。

已知图割理论给出的最优性只适用于固定拓扑、支持和可转化的能量问题；全流程仍需构造全域数值上下文，尚未解决大输入域的指数成本。[原始图割论文](https://www.cs.cornell.edu/~rdz/Papers/KZ-PAMI04.pdf)

## 完整性与边界

每个算例覆盖2^24个输入。强制输出上下文采用128位整数累加SSE；每次接受的质量变化，都经独立全域回放确认预测SSE与实际SSE一致。最终平均指标由整数总和计算。Vivado完成51760次独立输出比较，12个独立网表全部完成综合及布线，分别满足10／12.5／15ns登记时钟。

新候选保持登记的WCE预算，未保证每个实例的实际WCE不增加：8位从241变为245，仍低于256；9位和10位均保持原实际最大误差1024、4096。三个案例的LUT与时序裕量和旧主方法相同，10位主方法及质量候选都比两个基线少1个FF。这里得到的是实际实现上的资源精度改进，不是已测功耗或最大频率收益。

## 阶段决定

本轮评分88／100：质量优势25／30，物理优势20／25，因果公平性23／25，正确性20／20。质量优化候选保留；不再对这三个小算例追加掩码、重启或参数搜索。

下一项最有判断价值的工作是直接进入已有专门优化的16位有符号设计，检验方法是否能摆脱全域枚举并提供额外物理收益。作者发布的近期TVLSI乘法器RTL已固定版本86d94d1286286d2ab7be2dc78910b02ec00feaeb，尚未执行。后续必须先固定完整矩阵，使用有明确时间预算的符号校验，并区分证明通过、反例和超时。[作者工件](https://github.com/YnuGuoLab/FPGA_Signed_Approx_Mul)

真实FIR、第二器件及功耗实验仍是系统证据工作；应基于通过验证的核心完成，避免把小核简单拼接或增加清单数量当作方法可扩展性的证明。当前尚未到达可声明的研究上限，R20跨算子收益和R21无额外资源的质量改善提供了继续推进的明确依据。

原始入口：results/comparison.json、results/route_endpoints.csv、results/quality_change_details.json、inputs/quality_solver_contract.json，以及每个算例的quality_window_state.json。
'''
assert not report.exists();report.write_text(text,encoding='utf-8')
decision=dict(round=21,status='COMPLETE_ANALYZED',score=88,score_components=dict(quality_advantage=25,physical_advantage=20,causal_fairness=23,correctness=20),decision='KEEP_QUALITY_CANDIDATE_AND_TEST_DIRECT_SIGNED16_SCALABILITY',next_round_authorized=True,successful_project_archive=False,report=str(report),report_sha256=hashlib.sha256(report.read_bytes()).hexdigest(),summary=a,completed=datetime.datetime.now().astimezone().isoformat())
dump(Q/'state/final_decision.json',decision);dump(Q/'state/round_status.json',decision)
campaign=load(R/'state/campaign.json');campaign.update(status='ROUND21_COMPLETE_PREPARING_SIGNED16',active_round=21,last_score=88,latest_report=str(report));dump(R/'state/campaign.json',campaign);print('ROUND21_COMPLETE_SCORE88')
