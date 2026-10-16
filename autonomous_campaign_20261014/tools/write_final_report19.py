from pathlib import Path
import json,datetime
R=Path(__file__).resolve().parents[1];Q=R/'round19';load=lambda p:json.loads(p.read_text(encoding='utf-8'));dump=lambda p,x:p.write_text(json.dumps(x,indent=2,ensure_ascii=False),encoding='utf-8')
d=load(Q/'state/final_tables.json');assert d['status']=='COMPLETE_COLLECTED'
names=[r['case']for r in d['gains']];labels={'seed':'补偿列截断种子','quadol_wce':'作者 QUADOL-WCE','serial_then_quadol':'单根支持缩减后 QUADOL','static_full':'初始静态全域关系','state_const5':'当前关系、固定 I5','state_exact':'当前关系、保持整网输出','state_window':'完整联合生成主方法'}
def table(header,rows):return '\n'.join(['|'+'|'.join(header)+'|','|'+'|'.join(['---']*len(header))+'|']+['|'+'|'.join(map(str,r))+'|'for r in rows])
def core(n,m):return next(r for r in d['core']if r['case']==n and r['method']==m)
def integ(n,m):return next(r for r in d['integration']if r['case']==n and r['method']==m)
mt=['seed','quadol_wce','serial_then_quadol','static_full','state_const5','state_exact','state_window']
core_table=table(['模型','8×8+8','9×9+6','10×10+4'],[[labels[m]]+[core(n,m)['LUT']for n in names]for m in mt])
int_table=table(['位宽','种子 LUT','QUADOL LUT','串联 LUT','主方法 LUT','相对最小基线'],[[g['width']]+[integ(g['case'],m)['LUT']for m in ['seed','quadol_wce','serial_then_quadol','state_window']]+[f"{g['integration_gain_pct']:.2f}%"]for g in d['gains']])
err_table=table(['位宽','方法','WCE / 上限','全域 MAE','WNS ns'],[[g['width'],labels[m],f"{core(g['case'],m)['WCE']} / {g['budget']}",f"{core(g['case'],m)['MAE']:.3f}",f"{core(g['case'],m)['WNS_ns']:.3f}"]for g in d['gains']for m in ['seed','quadol_wce','serial_then_quadol','state_window']])
quality=[]
for task in ['alpha_blend','binomial16']:
 for g in d['gains']:
  qr={r['method']:r for r in d['quality']if r['case']==g['case']and r['task']==task}
  quality.append(['混合'if task=='alpha_blend'else'16项滤波',g['width']]+[f"{qr[m]['pooled_PSNR_dB']:.3f}"for m in ['seed','quadol_wce','serial_then_quadol','state_window']]+[qr['state_window']['max_error']])
app_table=table(['任务','位宽','种子 PSNR','QUADOL PSNR','串联 PSNR','主方法 PSNR','主方法最大像素误差'],quality)
cost_table=table(['位宽','主方法生成秒数','接受窗口数','串联单根阶段秒数'],[[g['width'],f"{next(x['wall_s']for x in d['costs']if x['case']==g['case']and x['method']=='state_window'):.2f}",next(x['accepted']for x in d['costs']if x['case']==g['case']and x['method']=='state_window'),f"{next(x['wall_s']for x in d['costs']if x['case']==g['case']and x['method']=='serial_support_stage'):.2f}"]for g in d['gains']])
assessment=dict(execution_status='COMPLETE',created=datetime.datetime.now().astimezone().isoformat(),decision='STOP_EXPERIMENTS_SCOPED_PAPER_EVIDENCE_READY_TVLSI_NOT_ESTABLISHED',score=84,score_components=dict(innovation=20,physical_gain=19,planned_evidence_coverage=18,correctness=20,cost=7),
 paper_evidence='Complete for the explicitly narrowed small-width LUT-only arithmetic resynthesis claim and fixed declared matrix; adequate to organize a scoped research manuscript, not universal superiority or a guarantee of publication.',
 tvlsi_readiness='NOT_ESTABLISHED: three related MAC configurations, one FPGA family and one error budget per width; final strong-control gains are modest and application quality is not uniformly superior. No assertion that evidence completion alone meets a venue threshold.',
 successful_project_archive=False,next_round_authorized=False,experiments_stopped=True,manuscript_written=False,
 claim_decisions=[
 dict(claim='Increment beyond the tested independent-support/QUADOL serial control',status='SUPPORTED_WITH_SCOPE',evidence='9-bit and10-bit core LUT69→66 and64→62;8-bit52→52. All same declared WCE bound and clock; this does not exclude every possible serial algorithm.'),
 dict(claim='Controller-inclusive equal-work resource gain at fixed clock',status='SUPPORTED',evidence='Three16-term kernels: best measured baseline107/121/125→103/118/123 LUT;3.74/2.48/1.60%; FF/CARRY4 unchanged within each width,15ns target passed.'),
 dict(claim='Mechanism contributions',status='SUPPORTED_NOT_UNIVERSAL',evidence='Current relation, nonconstantI5 and numerical freedom each have controlled ablation evidence; individual components tie on some cases.'),
 dict(claim='Better resource AND application quality than every baseline',status='NOT_SUPPORTED',evidence='Serial control has higher pooled PSNR in all six width/task summaries. Main spends some accuracy for lower integrated LUT.8-bit exact-output mode has same core LUT and better accuracy than full mode.'),
 dict(claim='Frozen evidence completion',status='SUPPORTED',evidence=d['counts']),
 dict(claim='Universal scalable synthesis, end-to-end speedup, energy improvement or TVLSI acceptance',status='NOT_ESTABLISHED',evidence='Full-domain search remains exponential, single-device OOC implementation, no board/power/maximum-frequency study; venue competitiveness not inferred from completion.')],
 limitations=['All final MACs have24active inputbits; larger dot-product vectors demonstrate modular composition only.','LUT-only Artix7 scope; no claim of superiority when DSP use is unrestricted.','QUADOL uses a common WCE adapter, not the original MRED/nMSE evaluation; serial control is not a full ASPDAC2017 ILP reproduction.','Two author baseline reruns differ due to string-set ordering. Exact frozen graphs/RTL and both rounds are retained; main and ablation canonical RTL are identical toR18.','Original primary evidence_hashes.json is a stage snapshot; expected serial progress updates are reconciled separately and final ZIP manifest verifies delivered bytes.'])
dump(Q/'state/final_evidence_assessment.json',assessment)
report=f'''# R17—R19 三轮最终证据与结项判断

用户要求提高每轮工作量与可获得结论，三轮内完成论文证据。本次 R17、R18、R19 已全部执行并停止实验。最终主模型没有继续换方向或增加机制。**加入最后的串联强对照后，9位和10位孤立核心仍节省4.35%、3.13% LUT；包含控制与累加器的三个计算核分别节省3.74%、2.48%、1.60%，全部满足固定时钟。** 8位孤立核心与串联对照打平，实际应用精度有代价，均保留。

结论是：已形成围绕“小位宽、LUT资源受限的算术网表联合重综合”的完整范围内证据，可以据此组织一篇聚焦的研究论文，实验阶段结束。**不能把这一结论扩写为已经达到TVLSI投稿竞争力或保证录用。** 同一MAC族的三种配置、一个器件和每种位宽一个误差点，支撑范围仍窄；新强对照把最终优势校准到了几个LUT的增量。没有为了维持旧的较大百分比而排除这个对照，也不增加R20来推迟结论。

## 三轮各自完成了什么

|轮次|固定工作量|新增可用结论|评分|
|---|---|---|---|
|R17|12核心模型、两种算术起点；10项新物理实现|强列截断起点后仍有资源余量；停止使用较弱起点作为主标题|84/100|
|R18|18核心、9集成核、108应用记录；19项新物理实现|实际作者基线、三项因果消融、控制成本和精度代价齐全，锁定主模型|85/100|
|R19|21核心、12集成核、126应用记录；33项全新物理实现|有限审查、冻结正式复跑、最后串联对照及完整证据校验|84/100|

三轮共62项新增物理实现，不把继承结果重复计为新运行。R19包含原定18+9矩阵与补齐原论文路线缺口的3+3串联对照；该对照在看到其结果前已固定并登记，不是第四轮。串联CPU阶段使用隔离目录与主批次物理实现重叠，所有Vivado任务仍依次执行。

分数是固定目标下的证据质量判断：创新20/25、物理收益19/25、计划内证据覆盖18/20、正确性20/20、成本7/10。R19的强对照支持了具体增量，也缩小了相对优势，因此分数没有因工作量增加而机械提高。评分不是期刊录用概率。

## 固定方法与创新归属

最终方法对当前已接受修改后的电路构造全局数值许可关系，联合选择两个根函数的真值表与支持，使它们满足真实LUT6_2的五个共享输入、共用半表以及第六输入选择规则，再用独立整网检查验收。固定支持可行性归约为2-CNF；候选池、拓扑保留数、支持枚举和单遍顺序均有上限，不能称为全局面积最优。

代码入口为 `tools/state19.py`（当前关系与逐项验收）、`tools/configure19.py`（真实原语拓扑与支持配置）、`../round2/tools/core2.py`（支持完成与求解基础）、`tools/model19.py`（完整域检查与RTL导出）、`tools/integration19.py`（等工作量集成核）。数学契约见 `../../research_review/FINAL_METHOD_CONTRACT_AND_COMPOSITION_ZH.md`。

误差关系本身已有[ICCAD2013工作](https://slam.ece.utexas.edu/pubs/iccad13.ALS.pdf)，去掉输入并改变局部函数已有[ASP-DAC2017工作](https://gc.sjtu.edu.cn/~wkqian/papers/Wu_Shen_Jia_Qian_Approximate_Logic_Synthesis_for_FPGA_by_Wire_Removal_and_Local_Function_Change.pdf)。本项目不把这些概念、状态刷新或2-SAT分别包装为首创。与[QUADOL](https://arxiv.org/html/2411.18330v1)的具体差别是直接在全局数值许可关系下联合生成可实现函数，而非仅配置已有的局部相似函数。更完整的最近邻边界见 `NEAREST_WORK_SCOPE_ZH.md`。

最后串联对照在相同候选根及顺序上，逐个构造单根当前WCE关系，枚举自身引脚的支持子集，按支持数、WCE、HD等固定规则选择后逐步全域验收，再运行固定作者QUADOL代码。它是透明、可复现的受控串联策略，**不是ASP-DAC2017完整ILP流程或所有串联方法的代表性最优解**。由它可判断本次联合生成是否有独立增量，不能证明任何串联算法都无法达到该结果。

## 最终全部核心资源

{core_table}

三列分别为8×8乘法+8位加数、9×9+6位加数、10×10+4位加数，均为24个活动输入位。WCE上限256、1024、4096，分别采用10ns、12.5ns、15ns核心时钟。器件为xc7a100tcsg324-1，DSP全部禁用且实测为0；每列所有方法的FF/CARRY4分别相同，为40/8、40/8、39/11。表中LUT是布线后的Slice LUT占用，不是把逻辑原语个数直接当作物理LUT数。

与新串联对照比较：8位52→52，孤立核心没有增量；9位69→66，减少3个LUT（4.35%）；10位64→62，减少2个LUT（3.13%）。相对本次作者QUADOL单独流程，三列为56→52、70→66、69→62，但最终主标题采用包括串联方法在内的更强基线。

{err_table}

相同误差预算并不意味着实际WCE或MAE相同。9位主方法相对串联方法的WCE更小（968对977），MAE却更大（383.180对346.408）；10位两者WCE同为4096，主方法MAE更大。主方法贡献是已给定误差约束内的资源选择，不能写成所有精度指标同时占优。

## 消融与因果解释

当前关系刷新相对初始静态全域关系：8位53→52，10位66→62；9位都是66，但WCE从1024降至968，MAE从389.500降至383.180。刷新有独立作用，并非每例都减少面积。

非恒定第六输入相对固定I5：8位53→52，9位69→66，10位同为62。因此这个硬件自由度在部分结构有价值，不是全部收益的共同原因。

额外数值自由度相对保持当前整网输出：9位67→66，10位70→62。8位两者同为52，而输出保持模式的WCE161、MAE84.6685优于完整模式的225、119.330。不能宣称完整近似模式处处优于同框架的输出保持模式。本轮没有事后选择各模式最佳值组成新的“主算法”，集成主标题始终采用固定完整模式。

以上与串联对照一起说明：收益来自物理函数生成空间及当前全局数值许可的配合，而不只是重复验证已有函数能否通过误差阈值。数据支持该能力在已测试实例上有效；没有证据把它提升为联合修改理论上必不可少、所有单独修改都无解的结论。

## 控制与累加器计入后的净资源收益

{int_table}

三类方法加上串联对照，全部执行相同16项乘法与精确32位累加，具有同样的valid/start/last接口、两级核心流水线和15ns时钟，每周期接收一个有效操作数对；连续输入时每16个周期完成一个新块。各宽度四方法的FF/CARRY4分别相同，为88/22、85/20、84/23。12项集成实现的时序、完整约束检查与DRC均通过。

8位孤立核心LUT相同，集成后103对107产生4个LUT差异。常量绑定及整核综合会改变可裁剪和可共享的结构，但本轮没有逐项归因这4个LUT；这里只报告实测整核差异，不能反向声称8位孤立核心已有联合方法面积优势。

本结论是固定吞吐和固定目标时钟下的LUT资源效率。部分主方法时序余量小于基线，不能宣称最高频率、更低时延或所有性能指标占优。没有上板、功耗、外部存储与端到端软件加速实验，故不写这些主张。DSP资源可自由使用时的比较也不在本轮范围内。

## 全部应用精度与负例

{app_table}

数据为固定camera、coins、moon三幅公开样例，固定256×256预处理，PSNR由三图合并MSE计算；不是单图最佳值或最低值。原始126行还保留SSIM、MAE、偏差、裁剪数与输出图像。混合任务主方法最大像素误差均为2；16项滤波暴露更明显的累积偏差。

主方法9位在两种任务均优于种子及单独QUADOL，但**串联对照在全部六个位宽/任务汇总中的PSNR均高于完整主方法**。最终能成立的是资源—精度取舍：主方法用更少的集成LUT换取部分应用精度损失，不能沿用“9位同时胜过所有强基线面积与质量”的表述。8位输出保持模式提供同核心面积更高精度的已测选项，但未另做该模式的集成硬件，不推导未测系统数字。

这也解释了为什么最坏误差约束不能替代应用验证：全量程最大幅度不约束误差的符号、频率和低幅值分布，多项累加可放大正偏差。负例没有通过改输入、重设质量阈值或增加模块被消掉。

## 正确性、时序与复现证据

R19共21个最终核心模型，每个验证2^24个完整输入，合计352,321,536次模型—输入校验；不是3.52亿个互不重复的输入。独立整数数学参考验证最终WCE，核心RTL对照90,593项，集成核done周期检查26,172项、输出总和检查1,536项，含空拍和背靠背块。

有限核心审查另外用独立穷举核验128个缩减支持的2-SAT实例及256次遍历，对已接受配置检查4,832个可达关系行，并核验引用函数、24位活动域和32位组合不溢出。固定支持正确性有数学推导；整网RTL采用厂商原语仿真和独立向量比较，不能写成已经执行全输入RTL形式等价证明。

16项组合满足 `abs(sum(p_hat)-sum(p_exact)) <= 16B`，且32位累加不溢出。最终四方法、三位宽的128块输入又进行了独立数学核对。组合向量更大不意味着本综合算法处理过任意相互耦合的256—320输入网表。

所有33项正式物理实现都重新运行，不继承先前PPA；全部通过登记时钟、建立/保持、完整约束和DRC检查。环境为本机Vivado2026.1、Windows Python和WSL g++15.2.0，精确版本及二进制哈希见 `state/tool_versions.json` 和 `state/freeze_manifest.json`。

## 修复与复现差异没有混同于科学结果

R18保留了一次集成仿真启动失败：测试激励早于厂商glbl全局复位释放，改为200ns后启动；硬件RTL和输入块不变。R19冻结前只修了版本采集的编码和返回码处理：WSL诊断流保留原始字节；Vivado `-version` 的完整版本输出虽返回1，但实际实验命令仍必须返回0。原失败日志和旧脚本均保留。

冻结后的原作者QUADOL重生成暴露了字符串集合遍历顺序差异，导致8位和10位的基线RTL与R18不同；10位实际WCE也从3551变为3519，正式LUT从70变为69。15个非基线模型（种子、主方法及三个消融）均与R18规范化RTL一致。没有为了匹配旧结果修改作者源代码或挑选PPA：在任何R19物理结果出现之前锁定新基线图与RTL，并独立验证、正式实现。两份历史结果及失败的过严身份检查均保留，具体见 `state/baseline_identity_amendment.json`。

因此，复现承诺是提供确定的冻结电路、RTL、约束和全部原始结果以重放本次证据；未固定字符串哈希环境的作者搜索重新运行不保证逐字节相同。这个限制已显式记录，不能说整个作者搜索链完全确定。原冻结135项文件均未改变；串联电路也在物理执行前另行锁定。

主流水线有19个有效成功阶段、22条记录，包含3次保留的失败尝试；串联流水线11阶段全部成功。原 `state/evidence_hashes.json` 是主批次结束时的快照；随后串联执行进度、命令和流水线元数据的预期更新列于 `state/evidence_snapshot_reconciliation.json`。最终ZIP逐文件清单与旁侧校验JSON是交付字节的最终校验依据。

## 搜索成本和泛化范围

{cost_table}

上述主方法时间为已有固定候选池上的当前关系/配置/验收阶段，不能与只列出的串联单根阶段简单作端到端速度比；完整命令和各阶段时间均保留。串联列还不含随后的作者QUADOL与物理实现。三例总输入位数都为24，因此这不是随输入域扩大后的可扩展性实验。全域构造仍有指数成本。

R17的两种算术起点及早期失败记录保留了探索边界。此前平方根案例被更强映射起点压过的结果没有被删除，当前主张不外推到平方根、地址翻译或工业大网表。单一FPGA、同MAC族三配置、单预算点及三个图像样例足以完成本次收窄后的固定证据链，但不能替代普适工具或顶刊级广覆盖的验证。

## 最终决定与交付导航

**实验阶段结束，架构与主模型保持冻结，不启动R20。** 当前正结果是真实的同频资源收益，机制对照和强串联对照提供了具体创新增量的证据。可按这个明确范围整理论文；TVLSI竞争力尚未被本轮证据确认，不将工作量、84分或“已完成实验”直接换算为期刊档次，也不标记整项目成功投稿归档。

- 完整机器可读汇总：`state/final_tables.json`。
- 分项科学判定：`state/final_evidence_assessment.json`。
- 核心、集成、应用和增益全表：本目录 `FINAL_CORE.csv`、`FINAL_INTEGRATED.csv`、`FINAL_QUALITY.csv`、`FINAL_GAINS.csv`。
- 总览图：`FINAL_COMBINED_EVIDENCE.png` / `.svg`。
- 串联控制全部代码与原始结果：`../results/serial_claim_check/`。
- 历史轮次和正式结果均保留；交付包包含R17—R19源码、数据、作者查询、约束、RTL、日志、分析与哈希，以及R1—R16结论入口。

没有编写论文正文、投递稿件、创建定时任务、委派代理或开启后继项目。
'''
(Q/'reports/FINAL_THREE_ROUND_REPORT_ZH.md').write_text(report,encoding='utf-8')
print('Final report and scoped assessment written',len(report))
