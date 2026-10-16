# JARL

**Joint Approximate Resynthesis of Dual-Output LUTs for FPGAs**

JARL jointly resynthesizes two LUT outputs under a numerical-error constraint
while respecting the shared truth-table structure of FPGA dual-output LUTs.
The repository provides the method implementation, arithmetic benchmarks,
experimental data, and a programmable FIR application.

## Method

1. Build a numerical permission relation for a pair of outputs in the current circuit.
2. Project that relation onto legal LUT6_2 shared inputs and half-table supports.
3. Construct feasible functions using support-constrained Boolean completion.
4. Recompute the relation after an accepted change. Optionally complete the
   fixed-support functions to reduce squared error without violating the error budget.

The implementation uses standard 2-SAT and graph-cut reductions. The latter
solves an orientable fixed-factor energy; it does not imply a globally optimal
FPGA area result. See [method and API](docs/METHOD.md).

## Reproduce the published data

```sh
git clone https://github.com/qmkkk/JARL.git
cd JARL
python -B scripts/reproduce_results.py all
```

Python 3.10+ is sufficient for this standard-library entry point. It verifies
the distributed files and reconstructs 73,728 FIR outputs, 72 quality records,
and comparisons for 24 recorded implementation endpoints. Vivado is needed
only for hardware simulation and implementation.

To use the method code, install the package with `python -m pip install -e .`.
See [reproduction instructions](docs/REPRODUCING.md) for resynthesis and hardware jobs.

## Repository layout

| Directory | Contents |
|---|---|
| `src/jarl/` | Numerical relations, LUT function construction, quality completion, netlist and RTL utilities |
| `benchmarks/` | Arithmetic cases, circuit graphs, saved configurations, FIR stimuli and full-domain checkers |
| `results/` | Numerical, resource, timing and application measurements, grouped by experiment |
| `rtl/` | Arithmetic and programmable FIR implementations and testbenches |
| `scripts/` | Result reproduction, method execution and Vivado job preparation |
| `docs/` | Method, data schema and reproduction guidance |

## Experiments

| Study | Data |
|---|---|
| Numerical relations and ablations | [results/relation](results/relation) |
| Six arithmetic structures and five error budgets | [results/arithmetic](results/arithmetic) |
| Fixed-support quality completion at three widths | [results/quality](results/quality) |
| Exact transfer to signed multiplier circuits | [results/transfer](results/transfer) |
| Programmable 16-tap FIR | [results/fir](results/fir) |

The FIR experiment compares two baselines, an ablation and the complete
method at three operand widths on two Artix-7 devices. Routed LUT counts for
the complete method and the smaller of the two baselines are:

| Device | Width | Best baseline | JARL |
|---|---:|---:|---:|
| xc7a100t | 8 | 190 | 187 |
| xc7a100t | 9 | 229 | 227 |
| xc7a100t | 10 | 215 | 214 |
| xc7a200t | 8 | 191 | 187 |
| xc7a200t | 9 | 229 | 226 |
| xc7a200t | 10 | 215 | 214 |

All 24 FIR endpoints meet the 15 ns implementation target. The design has an
initiation interval of 20 cycles and latency of 19 cycles. Accuracy/resource
trade-offs and non-improving cases are retained in the data. The two devices
are from the same FPGA family. The supplied power estimates do not establish
an energy reduction. See [data guide](docs/DATA.md) for definitions and scope.

## License and attribution

Original JARL source code is distributed under the [MIT License](LICENSE).
See [third-party notices](THIRD_PARTY_NOTICES.md) for baseline sources and tool
requirements. When using the artifact, cite the title above and this repository.

## 中文

本仓库按方法、基准、实验数据和复现流程组织。快速复核入口为
`scripts/reproduce_results.py`；方法实现位于 `src/jarl/`。
