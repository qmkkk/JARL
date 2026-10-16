set out [lindex $argv 0]
set top [lindex $argv 1]
set part [lindex $argv 2]
set_param general.maxThreads 4
open_checkpoint $out/synth.dcp
if {[get_property PART [current_design]] ne $part} {error "Checkpoint part mismatch"}
opt_design
place_design
route_design
report_utilization -file $out/util_route.rpt
report_timing_summary -delay_type min_max -report_unconstrained -file $out/timing_route.rpt
check_timing -verbose -file $out/check_timing.rpt
report_drc -file $out/drc.rpt
report_timing -from [all_registers] -to [all_registers] -max_paths 1 -file $out/ff_critical_path.rpt
write_checkpoint -force $out/route.dcp
write_verilog -mode funcsim -force $out/routed.v
puts "R23_ROUTE_COMPLETE $top $part"
close_project
