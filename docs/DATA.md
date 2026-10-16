# Data guide

Results are organized by scientific study: `relation`, `arithmetic`,
`quality`, `transfer`, and `fir`. Machine method identifiers are:

| Identifier | Meaning |
|---|---|
| `quadol_wce` | QUADOL baseline constrained by worst-case error |
| `serial_then_quadol` | Serial construction followed by the same baseline |
| `state_window` | Joint current-state numerical construction |
| `quality_window` | Complete JARL method with fixed-support quality completion |
| `static_full` | Static-context ablation |
| `state_const5` | Constant-selector ablation |
| `state_exact` | Exact-to-current-state ablation |

## Core fields

- WCE: worst-case absolute numerical error; SAE/SSE: exact sums over the input domain.
- MAE/RMSE/bias: mean absolute error, root mean squared error and signed mean error.
- LUT/FF/CARRY4/DSP: implementation resources; synthesis and routed counts are distinguished.
- WNS/WHS and TNS/THS: setup/hold timing slacks and total negative slacks, in nanoseconds.
- `timing_pass`: completion of the recorded timing criteria, not a board measurement.

FIR `.u32` files are little-endian unsigned 32-bit product tables, indexed as
`table[abs(coefficient) * 2**width + abs(sample)]`. Coefficients and samples
are signed hexadecimal values at the indicated width. Golden outputs are
signed 40-bit hexadecimal values. Each design has six blocks of 1,024 samples
covering two filters and three deterministic constructed signal classes.
No zero-input bypass or offset correction is added by the replay.

The signed-multiplier transfer study supports equivalence/area observations.
Its negative full-I/O hold slack remains in the data; those entries do not
establish a fully timing-closed I/O implementation.

Published design identifiers and filesystem paths are normalized for this
artifact. Numeric measurements are retained. `PROVENANCE.json` provides source
and distributed-content hashes; `MANIFEST.json` lists the distributed files.
Original tool reports can contain source hashes of pre-normalization RTL.
