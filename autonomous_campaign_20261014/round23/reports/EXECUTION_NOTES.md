# R23 execution notes

The source circuits are byte-verified frozen R21 exports. All inputs and signal formulas were saved before method evaluation. Source methods, budgets, filters and workloads were not changed based on intermediate outcomes.

The first RTL testbench stopped with `not ready` immediately after `coeff_we=0`: the continuous ready assignment had not settled in the same simulator delta cycle. A 1ns testbench-only settling delay after coefficient loading fixed the race. Original prepare script and failed simulator log are retained. The DUT, expected outputs, clock, latency and initiation interval are unchanged. All12 complete RTL testbenches subsequently passed6144 outputs each, asserting latency19/II20.

R22 is now analyzed separately. It contributes9 carried-over physical endpoints, not24 new R23 endpoints. Its input-hold failures originate at zero-delay external input ports in the registered OOC interface; setup is satisfied for all9. The report preserves both positive area and the exact full-timing status.

R23 is a fixed24-endpoint matrix:12 circuits on each of two7-series devices. All include history, coefficient storage, control, signed wrapper and40-bit accumulation. Device-level I/O buffers, board peripherals and board power are not included. PPA is OOC physical core data with the same declared2ns interface delay for every method.

Power uses each routed functional netlist's6144-output replay, not default input toggle estimates. SAIF-matched net coverage is extracted from the power report. Unannotated nets use Vivado default propagation; the measurement does not model timing glitches. The textual power report has0.001W precision, so small differences cannot be asserted below that resolution. Additional report formatting from the same saved checkpoint/activity may be used to inspect precision without changing any experiment.

2026-10-15 16:38: Endpoint Artix10 quality failed after successful synthesis and DRC0 with empty Vivado ERROR [Synth 20-411] at opt_design. No active R23 writer remained. Preserved original physical_1.log and failure receipt. Resume once with identical RTL, constraints, tool and strategy; completed endpoints skipped by receipts. This is an execution retry, not a scientific matrix change.


## Second-device availability amendment
Registered Kintex7 part unavailable locally; get_parts xc7k* returns empty. Before any second-device outcome, replace all 12 second-device endpoints by installed Artix7 200T, speed -1, 676-pin package. No architecture-generalization claim. No RTL/input/budget/clock/method changes. Prior endpoints retained, not rerun.
Original and revised plan hashes are in state/device_availability_amendment.json. This is an execution-availability repair, not a performance-driven selection. Original Kintex12 unavailable; replacement Artix200T12 remains mandatory.

Identical empty Synth20-411 at first Artix200 optimization, with retry_open_fs file-channel warnings. Artix100 identical retry already passed. Limited retry handler extended to this exact diagnostic, at most two physical attempts per endpoint; no strategy/source/constraint edits. Root cause remains unconfirmed. Old runner and all failed logs retained.

The Artix200 9-bit serial baseline repeated the empty opt_design failure twice. A separate-process open_checkpoint of the unchanged synth.dcp followed by identical opt/place/route commands succeeded. Checkpoint SHA before/after is identical; receipt at results/hardware/xc7a200tfbg676-1__r23_fir9_serial_then_quadol/checkpoint_recovery.json. AMD documented checkpoint workflow: https://docs.amd.com/r/en-US/ug835-vivado-tcl-commands/open_checkpoint . This resolved execution but does not identify the root cause of the original tool error.
