# R22 execution and evidence interpretation

The registered experiment tests exact-function transfer to three directly implemented signed16 FABM configurations from the pinned published author artifact. It does not turn this project's arithmetic-error claim into a claim that FABM computes exact multiplication.

The baseline pair is the author circuit and pinned QUADOL's zero-local-Hamming-distance candidates with deterministic maximum-cardinality matching. This is an explicitly restricted exact-function task, not a replacement for the approximate QUADOL comparisons in R19–R21. Native author RTL is independently compared against the parsed model; final exported LUT6_2 implementations are also formally checked. Boundary-register assumptions and vendor HDL behavior are checked separately.

The sampling set has 65,536 deterministic 32-bit patterns. Passing it never certifies an endpoint. SAT proof over all 32 primary input bits is required for each accepted proposal. Each window has a ten-second solver budget per attempt and at most two counterexample refinements. Unproven proposals are skipped, not labeled functionally incorrect or scientifically valueless.

Two parser repairs occurred before completion: WSL prepends a non-UTF8 diagnostic to otherwise normal ASCII Yosys output, so log decoding now preserves bytes on disk and uses replacement decoding for inspection; Yosys 0.52 reports its native solver limit as `Interrupted SAT solver: TIMEOUT!`, which is now classified as unproven timeout. The original log and the first parser receipt are retained. No source, sample, clock, search budget, or SAT limit changed, and no running solver was killed. Completed proof logs are recovered only after the exact miter source matches.

SAT-positive and deliberately SAT-negative smoke miters are recorded in `formal/smoke_equal` and `formal/smoke_counterexample`. These are backend checks, not research performance observations.

Known relation resynthesis, graph cuts, and SAT-guided refinement remain prior techniques. Potential contribution must be attributed to the specific numeric constraints, real LUT6_2 shared-cofactor realization, and demonstrated resource/quality outcomes, not to inventing these generic tools.
