set out [lindex $argv 0]
set source_list [lindex $argv 1]
set top [lindex $argv 2]
set policy [lindex $argv 3]
set phase [lindex $argv 4]
set xdc [lindex $argv 5]
set_param general.maxThreads 4
if {$phase eq "synth"} {
 create_project -in_memory -part xc7a100tcsg324-1
 set f [open $source_list r]
 foreach source [split [string trim [read $f]] "\n"] {read_verilog -sv [string trim $source]}
 close $f
 set maxdsp -1
 if {$policy eq "forbid"} {set maxdsp 0}
 synth_design -mode out_of_context -top $top -part xc7a100tcsg324-1 -max_dsp $maxdsp
 read_xdc $xdc
 report_utilization -file $out/util_synth.rpt
 write_checkpoint -force $out/synth.dcp
 close_project
 return
}
open_checkpoint $out/synth.dcp
set_property HD.CLK_SRC BUFGCTRL_X0Y0 [get_ports clk]
opt_design
place_design
route_design
report_utilization -file $out/util_route.rpt
report_timing_summary -delay_type min_max -report_unconstrained -file $out/timing_route.rpt
check_timing -verbose -file $out/check_timing.rpt
report_drc -file $out/drc.rpt
set regs [all_registers]
set p [get_timing_paths -from $regs -to $regs -max_paths 1]
set ffd NA
set ffs NA
if {[llength $p]>0} {
 set ffd [get_property DATAPATH_DELAY [lindex $p 0]]
 set ffs [get_property SLACK [lindex $p 0]]
}
report_timing -from $regs -to $regs -max_paths 1 -file $out/ff_critical_path.rpt
set lut [llength [get_cells -hier -filter {REF_NAME =~ LUT*}]]
set ff [llength [get_cells -hier -filter {REF_NAME =~ FD*}]]
set carry [llength [get_cells -hier -filter {REF_NAME =~ CARRY*}]]
set dsp [llength [get_cells -hier -filter {REF_NAME =~ DSP*}]]
set f [open $out/metrics.json w]
puts $f [format {"LUT_primitive_instances_diagnostic":%d,"FF":%d,"CARRY4":%d,"DSP":%d,"ff_data_delay_ns":"%s","ff_slack_ns":"%s"} $lut $ff $carry $dsp $ffd $ffs]
close $f
write_checkpoint -force $out/route.dcp
write_verilog -force $out/routed.v
puts "ROUND10_ROUTED top=$top policy=$policy LUT=$lut FF=$ff carry=$carry DSP=$dsp ff_slack=$ffs"
close_project
