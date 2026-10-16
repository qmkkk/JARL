# JARL

**Joint Approximate Resynthesis of Dual-Output LUTs for FPGAs**

Research code, frozen experimental results, RTL, and reproduction entry points
for JARL. This repository publishes the existing Project 3 evidence through
R23; publication of the artifact does not imply journal acceptance.

JARL jointly chooses the functions of two LUT outputs using downstream
numerical-error constraints, while respecting the shared half-table structure
of an FPGA LUT6_2. A fixed-support quality pass minimizes squared error when
the resulting binary energy admits a consistent submodular orientation.

## Quick start

```sh
git clone https://github.com/qmkkk/JARL.git
cd JARL
python -B tools/review_release.py all
```

Python 3.10+; this entry point uses only the standard library. It checks the
artifact manifest and recomputes **73,728 FIR outputs**, **72 quality records**,
and the paired resource comparisons from the **24 saved physical endpoints**.
It reanalyzes archived evidence; it does not launch synthesis or manufacture
new measurement results.

## Hardware replay

Install Vivado separately. In a fresh output directory:

```sh
python -B tools/prepare_r23_replay.py --out /absolute/path/to/jarl-replay --vivado-bin /absolute/path/to/Vivado/bin
```

The preparer emits `commands.json` with explicit working directories and
argument arrays for 12 RTL simulations and 24 implementation jobs. The
original launcher targets Windows (`.bat` tool entry points); on Linux use the
corresponding executable names. See [reproduction instructions](docs/REPRODUCING.md).

## Main implementation

All paths below are under `autonomous_campaign_20261014/`.

| Component | Source |
|---|---|
| Numerical relation and state-conditioned pass | `round19/tools/state19.py` |
| Joint physical LUT6_2 function construction | `round19/tools/configure19.py` |
| Support aliasing and 2-SAT completion | `tools/core.py` |
| Circuit representation and RTL emission | `input/legacy_code/` |
| Fixed-support quality pass | `round21/tools/quality21.py` |
| Binary energy / min-cut implementation | `tools/candidate_quality_tables.py`, `tools/candidate_quality_cut.py` |
| FIR system generator | `tools/fir_system_harness.py`, `round23/tools/prepare23.py` |
| Frozen final RTL and testbenches | `round23/rtl/` |
| Physical implementation and power scripts | `round23/tools/physical23.tcl`, `power23.tcl`, `run23.py` |

2-SAT and graph-cut optimization are standard techniques, not claimed as new
algorithms. Exactness of the energy solution applies to its fixed variables,
supports and factors, not to globally optimal FPGA area.

## Evidence

| Round | Included evidence |
|---|---|
| R19 | Numerical relation, ablations, strong serial baseline, formal core results |
| R20 | Six arithmetic structures, five error budgets, positive and negative outcomes |
| R21 | Fixed-support quality completion, three widths, unchanged error budgets |
| R22 | Summary measurements for 16-bit author-circuit equivalence transfer; author RTL is external |
| R23 | Complete programmable 16-tap FIR, four methods, three widths, two Artix-7 devices |

In R23, the final method uses fewer routed LUTs than the better of the two
baselines at all six width/device points:

| Device | Width | Best baseline LUTs | JARL LUTs |
|---|---:|---:|---:|
| xc7a100t | 8 | 190 | 187 |
| xc7a100t | 9 | 229 | 227 |
| xc7a100t | 10 | 215 | 214 |
| xc7a200t | 8 | 191 | 187 |
| xc7a200t | 9 | 229 | 226 |
| xc7a200t | 10 | 215 | 214 |

The 24 archived physical endpoints meet the registered 15 ns timing target.
The FIR has initiation interval 20 cycles and latency 19 cycles. Quality
trade-offs, non-improving cases, and engineering limitations remain in the
data. Two devices here belong to the same Artix-7 family. Power estimates do
not establish a power/energy reduction; these are not board measurements.

Primary tables: `round23/results/baseline_comparison.csv`,
`quality_aggregate.csv`, `system_quality.csv`, and `physical_results.csv`.
See [artifact scope](docs/ARTIFACT_SCOPE.md) and [third-party notices](THIRD_PARTY_NOTICES.md).

## License and citation

Original JARL code is released under the [MIT License](LICENSE). External
author implementations and vendor tools are not redistributed or relicensed.
When using this artifact, cite the title above and this repository URL. No
publication DOI or accepted-paper status is asserted.

## 中文说明

本仓库公开 JARL 的方法代码、R19–R23 核心数据、最终 FIR RTL、测试输入和复现入口。
先运行上面的 `review_release.py all` 可离线复核现有结果；完整硬件重放需要自行安装 Vivado。
原始研究脚本保留历史目录与路径，不能在冻结证据目录中直接批量重跑。
本次发布不追加实验；未捆绑许可未明确的第三方作者原码。
