# Third-party sources and attribution

The MIT license covers original JARL implementation and documentation, not
third-party code or tools. Baseline measurement data and generated benchmark
outputs are included for reproducibility with attribution below.

## QUADOL

Source: https://github.com/SJTU-ECTL/QUADOL

Pinned revision: `a1693cabf8c07d75782d33fa5fa0a950e70634a4`.
The previously inspected pinned tree did not contain a LICENSE/COPYING file.
Copied author Python files are therefore omitted. Our adapters and recorded
measurements remain, along with generated outputs for our own benchmarks.
Obtain author code directly and respect the upstream terms before reuse.

## FPGA signed approximate multiplier (FABM)

Source: https://github.com/YnuGuoLab/FPGA_Signed_Approx_Mul

Pinned revision: `86d94d1286286d2ab7be2dc78910b02ec00feaeb`.
The previously inspected pinned tree did not contain a LICENSE/COPYING file.
Author RTL and derived R22 RTL/netlists are omitted. R22 aggregate result
tables and original JARL driver code are retained. These summaries do not
provide a self-contained reproduction of the third-party circuit.

## Tools and libraries

Vivado and its simulation primitive libraries must be installed separately.
ABC, Yosys, Python and Python packages retain their own licenses. No tool
binaries or vendor library sources are bundled. Standard 2-SAT, maximum-flow
and submodular-energy reductions are used; these algorithms are not claimed
as new JARL inventions.
