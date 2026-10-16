# Method and implementation

A LUT6_2 is represented by two 32-row half-tables A and B. For shared inputs
t and selector I5, O5=B(t) and O6=I5?A(t):B(t). Candidate roots must have a
stable support independent of the rewritten outputs and their descendants.

For each reachable support row and each forced two-output assignment, the
context records bounds on the final numerical error. A candidate is allowed
only if every represented input respects the error budget. Rebuilding this
relation after an accepted rewrite accounts for cumulative circuit changes.

`jarl.numerical.configure` searches the registered shared-input/selector
choices. `jarl.core.sat_assignment` aliases rows with identical masked
supports and turns forbidden output pairs into 2-CNF constraints.
`physical_complete` enumerates finite mask choices and ranks feasible
functions with a structural cost estimate. Physical savings are measured
separately after implementation.

`jarl.quality_tables.optimize_half_tables` uses whole-domain SSE costs for
fixed supports. A sufficiently large penalty represents prohibited WCE
choices. Consistent polarity flips permit a standard min-cut reduction for
orientable energies; non-orientable instances preserve the incumbent.
Acceptance also checks the structural proxy and the complete circuit error.

## Main modules

| Module | Purpose |
|---|---|
| `stateful.py` | Current-circuit context construction and sequential admission |
| `numerical.py` | Physical topology projection and feasible function search |
| `core.py` | Support masks, 2-SAT, structural scoring and forced evaluation |
| `quality.py`, `quality_tables.py`, `quality_cut.py` | Fixed-support quality completion |
| `netlist.py`, `edif.py`, `rewriting.py` | Graph parsing, simulation and replacements |
| `oracle.py`, `stats.py`, `context_codegen.py` | Scalar checks and integer C++ contexts |
| `rtl.py`, `fir.py` | Primitive RTL emission and FIR composition |

The packaged function bodies come from the experiment implementation. The
workspace/compiler adapter and module imports are separated from those bodies
so source consumers do not need the original laboratory directory layout.
