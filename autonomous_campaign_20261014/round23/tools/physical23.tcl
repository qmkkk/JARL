set out [lindex $argv 0]
set rtl [lindex $argv 1]
set top [lindex $argv 2]
set part [lindex $argv 3]
set xdc [lindex $argv 4]
set_param general.maxThreads 4
create_project -in_memory -part $part
read_verilog -sv $rtl
synth_design -mode out_of_context -top $top -part $part -max_dsp 0
read_xdc $xdc
report_utilization -file $out/util_synth.rpt
write_checkpoint -force $out/synth.dcp
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
