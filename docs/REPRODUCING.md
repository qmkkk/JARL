# Reproducing the artifact

## 1. Numerical evidence replay

From the repository root, run `python -B tools/review_release.py all`.
The script first checks `MANIFEST.json`, then uses Python integer arithmetic
to reconstruct FIR outputs from the supplied unsigned product tables,
coefficients, and signals. It compares every output to the archived golden
file, recomputes SSE/MAE/RMSE/bias, and checks the saved physical comparisons.
No commercial tool or Python package installation is needed for this step.

The product table itself is an input to this replay. Its independent circuit
checks belong to the historical experiment, not to this numerical command.

## 2. RTL simulation and physical rebuild

Use `tools/prepare_r23_replay.py --out <fresh-absolute-directory> --vivado-bin <Vivado-bin>`.
It copies frozen RTL and inputs, maps testbench data paths, and emits
`commands.json`. Run each selected record's `argv` with its `cwd`, in order.
Records of kind `RTL` come in compile/elaborate/simulate triples; records of
kind `PHYSICAL` perform synthesis, placement and routing. All output must go
to the fresh directory. Preparation alone is not a successful simulation.

Expected completion markers:

- RTL: `R23_FIR_PASS checks=6144 latency=19 II=20`
- Physical: `R23_ROUTE_COMPLETE <top> <part>`

Recorded tool: Vivado 2026.1, build 6511674. Parts:
`xc7a100tcsg324-1`, `xc7a200tfbg676-1`; period 15 ns; DSP use disabled.
The portable preparer was inherited from the prior release. Its `.bat`
executables target Windows; Linux users must use the native tool filenames.
The full archived `run23.py` additionally records routed functional simulation
and SAIF-based estimates, but contains historical tool/path settings which
must be mapped to a separate working copy before execution.

## 3. Method implementation and full-domain arithmetic checks

`round19/tools/state19.py` generates contexts from the current circuit after
each accepted edit; `configure19.py` searches the registered LUT6_2 topologies
and calls support-constrained completion. `round21/tools/quality21.py` adds
one fixed-support SSE pass; context CSVs and accepted configurations are
provided in the corresponding results/state directories.

The original code uses NumPy/NetworkX and a C++/WSL toolchain. Historical
versions are in `round19/state/tool_versions.json`; signal generation also
uses SciPy. Standalone generated final-check C++ files retained in
`round21/src/` can be built with a compatible GCC C++17 compiler (`-O3`) and
run outside the archive. They enumerate the recorded arithmetic domain;
they do not constitute a new topology search.

These research scripts are preserved source, not a newly validated
cross-platform end-to-end product. Some scripts contain original absolute
paths and reference omitted intermediate artifacts. Recreate missing build
products or map paths explicitly in a working copy. Never blindly execute
all historical prepare/finish/close scripts.

## Baselines

The generated measurements and benchmark outputs are included. Original
QUADOL/FABM author sources are not. Fixed source URLs and revisions are in
`THIRD_PARTY_NOTICES.md`; obtain them separately under their applicable terms
when rebuilding those baselines. Keep the same inputs, error budgets, tool
settings and effective work across comparisons.

## Release status

This publication repackages existing completed experiments. At the user's
request no new experiments or validation reruns were launched for this GitHub
upload. Historical pass records remain dated historical evidence.
