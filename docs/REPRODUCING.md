# Reproduction

## Result reconstruction

Run `python -B scripts/reproduce_results.py all` from the repository root.
This checks `MANIFEST.json`, reconstructs the FIR outputs using integer
arithmetic and the provided product tables, and compares numerical statistics
and saved resource measurements. The product tables are inputs to this check;
the command does not rerun synthesis or independently prove the tables.

## Numerical resynthesis

Install the method package: `python -m pip install -e .`.
A C++17 compiler compatible with GCC's `unsigned __int128` is required.
Select a case from `benchmarks/quality/cases.json`, then use a new directory:

```sh
python scripts/run_resynthesis.py --suite quality --case mac8_add8_b256_column_mse --out /absolute/path/to/jarl-work --cxx g++
```

This starts from the provided seed graph and fixed candidate list, reconstructs
the current-state numerical pass, and performs the fixed-support quality pass.
`--suite relation` runs the numerical pass on the relation-study cases. These
are full-domain computations and can take substantially longer than table
reconstruction. Use a GCC installation on Linux or a compatible local setup.
No vendor tool is needed for this stage. The candidate discovery stage and
external author baselines are separate from this seeded replay.

Generated arithmetic C++ checkers are also provided in
`benchmarks/quality/checkers/`; compile with `g++ -O3 -std=c++17` in a scratch
directory. These checkers evaluate the supplied final circuits over their
recorded domains. Scalar references and generator source are included.

## Hardware simulation and implementation

Install Vivado, including the two Artix-7 device parts and simulation libraries.

```sh
python scripts/prepare_hardware.py --out /absolute/path/to/jarl-hardware --vivado-bin /absolute/path/to/Vivado/bin
```

The preparer emits explicit `cwd`/`argv` records in `commands.json` for 12 RTL
simulations and 24 physical jobs. Execute selected records in order with
`subprocess.run(record["argv"], cwd=record["cwd"], check=True)`.
RTL records are compile/elaborate/simulate triples. Preparation does not run
the jobs. Expected markers are `JARL_FIR_PASS` and `JARL_ROUTE_COMPLETE`.

Recorded settings: Vivado 2026.1 build 6511674;
`xc7a100tcsg324-1` and `xc7a200tfbg676-1`; 15 ns period; DSP use disabled.
FIR stimulus files are relative to each prepared simulation directory.
`scripts/vivado/power.tcl` records the power-estimation procedure; activity
must be supplied from a corresponding simulation. Report values are estimates.

## External baselines

Author sources are linked at fixed revisions in `THIRD_PARTY_NOTICES.md`.
They are not installed or redistributed by this repository. Generated
benchmark measurements are provided alongside JARL results for comparison.
Use matched inputs, budgets, clocks and effective work when rebuilding them.

The published interfaces reorganize existing implementation and evidence.
No new performance or hardware experiment is implied by source packaging.
