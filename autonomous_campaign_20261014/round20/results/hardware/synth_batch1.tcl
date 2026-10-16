set_param general.maxThreads 4
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_umul8_b1_quadol_wce.v
synth_design -mode out_of_context -top r20_umul8_b1_quadol_wce -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/umul8_b1.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_umul8_b1_quadol_wce/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_umul8_b1_quadol_wce/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_umul8_b1_quadol_wce/synth.done w]
puts $f "r20_umul8_b1_quadol_wce"
close $f
close_project
puts "R20_SYNTH_PASS r20_umul8_b1_quadol_wce"
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_umul8_b1_serial_then_quadol.v
synth_design -mode out_of_context -top r20_umul8_b1_serial_then_quadol -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/umul8_b1.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_umul8_b1_serial_then_quadol/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_umul8_b1_serial_then_quadol/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_umul8_b1_serial_then_quadol/synth.done w]
puts $f "r20_umul8_b1_serial_then_quadol"
close $f
close_project
puts "R20_SYNTH_PASS r20_umul8_b1_serial_then_quadol"
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_umul8_b1_state_window.v
synth_design -mode out_of_context -top r20_umul8_b1_state_window -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/umul8_b1.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_umul8_b1_state_window/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_umul8_b1_state_window/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_umul8_b1_state_window/synth.done w]
puts $f "r20_umul8_b1_state_window"
close $f
close_project
puts "R20_SYNTH_PASS r20_umul8_b1_state_window"
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_umul8_b4_serial_then_quadol.v
synth_design -mode out_of_context -top r20_umul8_b4_serial_then_quadol -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/umul8_b4.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_umul8_b4_serial_then_quadol/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_umul8_b4_serial_then_quadol/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_umul8_b4_serial_then_quadol/synth.done w]
puts $f "r20_umul8_b4_serial_then_quadol"
close $f
close_project
puts "R20_SYNTH_PASS r20_umul8_b4_serial_then_quadol"
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_umul8_b4_state_window.v
synth_design -mode out_of_context -top r20_umul8_b4_state_window -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/umul8_b4.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_umul8_b4_state_window/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_umul8_b4_state_window/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_umul8_b4_state_window/synth.done w]
puts $f "r20_umul8_b4_state_window"
close $f
close_project
puts "R20_SYNTH_PASS r20_umul8_b4_state_window"
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_umul8_b16_quadol_wce.v
synth_design -mode out_of_context -top r20_umul8_b16_quadol_wce -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/umul8_b16.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_umul8_b16_quadol_wce/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_umul8_b16_quadol_wce/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_umul8_b16_quadol_wce/synth.done w]
puts $f "r20_umul8_b16_quadol_wce"
close $f
close_project
puts "R20_SYNTH_PASS r20_umul8_b16_quadol_wce"
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_umul8_b16_serial_then_quadol.v
synth_design -mode out_of_context -top r20_umul8_b16_serial_then_quadol -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/umul8_b16.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_umul8_b16_serial_then_quadol/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_umul8_b16_serial_then_quadol/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_umul8_b16_serial_then_quadol/synth.done w]
puts $f "r20_umul8_b16_serial_then_quadol"
close $f
close_project
puts "R20_SYNTH_PASS r20_umul8_b16_serial_then_quadol"
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_umul8_b16_state_window.v
synth_design -mode out_of_context -top r20_umul8_b16_state_window -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/umul8_b16.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_umul8_b16_state_window/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_umul8_b16_state_window/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_umul8_b16_state_window/synth.done w]
puts $f "r20_umul8_b16_state_window"
close $f
close_project
puts "R20_SYNTH_PASS r20_umul8_b16_state_window"
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_umul8_b64_quadol_wce.v
synth_design -mode out_of_context -top r20_umul8_b64_quadol_wce -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/umul8_b64.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_umul8_b64_quadol_wce/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_umul8_b64_quadol_wce/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_umul8_b64_quadol_wce/synth.done w]
puts $f "r20_umul8_b64_quadol_wce"
close $f
close_project
puts "R20_SYNTH_PASS r20_umul8_b64_quadol_wce"
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_umul8_b64_serial_then_quadol.v
synth_design -mode out_of_context -top r20_umul8_b64_serial_then_quadol -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/umul8_b64.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_umul8_b64_serial_then_quadol/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_umul8_b64_serial_then_quadol/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_umul8_b64_serial_then_quadol/synth.done w]
puts $f "r20_umul8_b64_serial_then_quadol"
close $f
close_project
puts "R20_SYNTH_PASS r20_umul8_b64_serial_then_quadol"
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_umul8_b64_state_window.v
synth_design -mode out_of_context -top r20_umul8_b64_state_window -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/umul8_b64.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_umul8_b64_state_window/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_umul8_b64_state_window/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_umul8_b64_state_window/synth.done w]
puts $f "r20_umul8_b64_state_window"
close $f
close_project
puts "R20_SYNTH_PASS r20_umul8_b64_state_window"
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_umul8_b256_quadol_wce.v
synth_design -mode out_of_context -top r20_umul8_b256_quadol_wce -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/umul8_b256.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_umul8_b256_quadol_wce/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_umul8_b256_quadol_wce/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_umul8_b256_quadol_wce/synth.done w]
puts $f "r20_umul8_b256_quadol_wce"
close $f
close_project
puts "R20_SYNTH_PASS r20_umul8_b256_quadol_wce"
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_umul8_b256_serial_then_quadol.v
synth_design -mode out_of_context -top r20_umul8_b256_serial_then_quadol -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/umul8_b256.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_umul8_b256_serial_then_quadol/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_umul8_b256_serial_then_quadol/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_umul8_b256_serial_then_quadol/synth.done w]
puts $f "r20_umul8_b256_serial_then_quadol"
close $f
close_project
puts "R20_SYNTH_PASS r20_umul8_b256_serial_then_quadol"
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_umul8_b256_state_window.v
synth_design -mode out_of_context -top r20_umul8_b256_state_window -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/umul8_b256.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_umul8_b256_state_window/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_umul8_b256_state_window/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_umul8_b256_state_window/synth.done w]
puts $f "r20_umul8_b256_state_window"
close $f
close_project
puts "R20_SYNTH_PASS r20_umul8_b256_state_window"
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_mac6_add4_b1_quadol_wce.v
synth_design -mode out_of_context -top r20_mac6_add4_b1_quadol_wce -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/mac6_add4_b1.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_mac6_add4_b1_quadol_wce/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_mac6_add4_b1_quadol_wce/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_mac6_add4_b1_quadol_wce/synth.done w]
puts $f "r20_mac6_add4_b1_quadol_wce"
close $f
close_project
puts "R20_SYNTH_PASS r20_mac6_add4_b1_quadol_wce"
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_mac6_add4_b1_serial_then_quadol.v
synth_design -mode out_of_context -top r20_mac6_add4_b1_serial_then_quadol -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/mac6_add4_b1.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_mac6_add4_b1_serial_then_quadol/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_mac6_add4_b1_serial_then_quadol/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_mac6_add4_b1_serial_then_quadol/synth.done w]
puts $f "r20_mac6_add4_b1_serial_then_quadol"
close $f
close_project
puts "R20_SYNTH_PASS r20_mac6_add4_b1_serial_then_quadol"
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_mac6_add4_b1_state_window.v
synth_design -mode out_of_context -top r20_mac6_add4_b1_state_window -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/mac6_add4_b1.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_mac6_add4_b1_state_window/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_mac6_add4_b1_state_window/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_mac6_add4_b1_state_window/synth.done w]
puts $f "r20_mac6_add4_b1_state_window"
close $f
close_project
puts "R20_SYNTH_PASS r20_mac6_add4_b1_state_window"
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_mac6_add4_b4_serial_then_quadol.v
synth_design -mode out_of_context -top r20_mac6_add4_b4_serial_then_quadol -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/mac6_add4_b4.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_mac6_add4_b4_serial_then_quadol/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_mac6_add4_b4_serial_then_quadol/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_mac6_add4_b4_serial_then_quadol/synth.done w]
puts $f "r20_mac6_add4_b4_serial_then_quadol"
close $f
close_project
puts "R20_SYNTH_PASS r20_mac6_add4_b4_serial_then_quadol"
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_mac6_add4_b4_state_window.v
synth_design -mode out_of_context -top r20_mac6_add4_b4_state_window -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/mac6_add4_b4.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_mac6_add4_b4_state_window/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_mac6_add4_b4_state_window/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_mac6_add4_b4_state_window/synth.done w]
puts $f "r20_mac6_add4_b4_state_window"
close $f
close_project
puts "R20_SYNTH_PASS r20_mac6_add4_b4_state_window"
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_mac6_add4_b16_quadol_wce.v
synth_design -mode out_of_context -top r20_mac6_add4_b16_quadol_wce -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/mac6_add4_b16.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_mac6_add4_b16_quadol_wce/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_mac6_add4_b16_quadol_wce/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_mac6_add4_b16_quadol_wce/synth.done w]
puts $f "r20_mac6_add4_b16_quadol_wce"
close $f
close_project
puts "R20_SYNTH_PASS r20_mac6_add4_b16_quadol_wce"
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_mac6_add4_b16_serial_then_quadol.v
synth_design -mode out_of_context -top r20_mac6_add4_b16_serial_then_quadol -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/mac6_add4_b16.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_mac6_add4_b16_serial_then_quadol/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_mac6_add4_b16_serial_then_quadol/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_mac6_add4_b16_serial_then_quadol/synth.done w]
puts $f "r20_mac6_add4_b16_serial_then_quadol"
close $f
close_project
puts "R20_SYNTH_PASS r20_mac6_add4_b16_serial_then_quadol"
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_mac6_add4_b16_state_window.v
synth_design -mode out_of_context -top r20_mac6_add4_b16_state_window -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/mac6_add4_b16.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_mac6_add4_b16_state_window/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_mac6_add4_b16_state_window/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_mac6_add4_b16_state_window/synth.done w]
puts $f "r20_mac6_add4_b16_state_window"
close $f
close_project
puts "R20_SYNTH_PASS r20_mac6_add4_b16_state_window"
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_mac6_add4_b64_quadol_wce.v
synth_design -mode out_of_context -top r20_mac6_add4_b64_quadol_wce -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/mac6_add4_b64.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_mac6_add4_b64_quadol_wce/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_mac6_add4_b64_quadol_wce/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_mac6_add4_b64_quadol_wce/synth.done w]
puts $f "r20_mac6_add4_b64_quadol_wce"
close $f
close_project
puts "R20_SYNTH_PASS r20_mac6_add4_b64_quadol_wce"
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_mac6_add4_b64_serial_then_quadol.v
synth_design -mode out_of_context -top r20_mac6_add4_b64_serial_then_quadol -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/mac6_add4_b64.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_mac6_add4_b64_serial_then_quadol/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_mac6_add4_b64_serial_then_quadol/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_mac6_add4_b64_serial_then_quadol/synth.done w]
puts $f "r20_mac6_add4_b64_serial_then_quadol"
close $f
close_project
puts "R20_SYNTH_PASS r20_mac6_add4_b64_serial_then_quadol"
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_mac6_add4_b64_state_window.v
synth_design -mode out_of_context -top r20_mac6_add4_b64_state_window -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/mac6_add4_b64.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_mac6_add4_b64_state_window/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_mac6_add4_b64_state_window/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_mac6_add4_b64_state_window/synth.done w]
puts $f "r20_mac6_add4_b64_state_window"
close $f
close_project
puts "R20_SYNTH_PASS r20_mac6_add4_b64_state_window"
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_mac6_add4_b128_quadol_wce.v
synth_design -mode out_of_context -top r20_mac6_add4_b128_quadol_wce -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/mac6_add4_b128.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_mac6_add4_b128_quadol_wce/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_mac6_add4_b128_quadol_wce/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_mac6_add4_b128_quadol_wce/synth.done w]
puts $f "r20_mac6_add4_b128_quadol_wce"
close $f
close_project
puts "R20_SYNTH_PASS r20_mac6_add4_b128_quadol_wce"
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_mac6_add4_b128_serial_then_quadol.v
synth_design -mode out_of_context -top r20_mac6_add4_b128_serial_then_quadol -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/mac6_add4_b128.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_mac6_add4_b128_serial_then_quadol/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_mac6_add4_b128_serial_then_quadol/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_mac6_add4_b128_serial_then_quadol/synth.done w]
puts $f "r20_mac6_add4_b128_serial_then_quadol"
close $f
close_project
puts "R20_SYNTH_PASS r20_mac6_add4_b128_serial_then_quadol"
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_mac6_add4_b128_state_window.v
synth_design -mode out_of_context -top r20_mac6_add4_b128_state_window -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/mac6_add4_b128.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_mac6_add4_b128_state_window/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_mac6_add4_b128_state_window/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_mac6_add4_b128_state_window/synth.done w]
puts $f "r20_mac6_add4_b128_state_window"
close $f
close_project
puts "R20_SYNTH_PASS r20_mac6_add4_b128_state_window"
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_dot2_u4_b1_quadol_wce.v
synth_design -mode out_of_context -top r20_dot2_u4_b1_quadol_wce -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/dot2_u4_b1.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_dot2_u4_b1_quadol_wce/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_dot2_u4_b1_quadol_wce/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_dot2_u4_b1_quadol_wce/synth.done w]
puts $f "r20_dot2_u4_b1_quadol_wce"
close $f
close_project
puts "R20_SYNTH_PASS r20_dot2_u4_b1_quadol_wce"
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_dot2_u4_b1_serial_then_quadol.v
synth_design -mode out_of_context -top r20_dot2_u4_b1_serial_then_quadol -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/dot2_u4_b1.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_dot2_u4_b1_serial_then_quadol/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_dot2_u4_b1_serial_then_quadol/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_dot2_u4_b1_serial_then_quadol/synth.done w]
puts $f "r20_dot2_u4_b1_serial_then_quadol"
close $f
close_project
puts "R20_SYNTH_PASS r20_dot2_u4_b1_serial_then_quadol"
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_dot2_u4_b1_state_window.v
synth_design -mode out_of_context -top r20_dot2_u4_b1_state_window -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/dot2_u4_b1.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_dot2_u4_b1_state_window/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_dot2_u4_b1_state_window/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_dot2_u4_b1_state_window/synth.done w]
puts $f "r20_dot2_u4_b1_state_window"
close $f
close_project
puts "R20_SYNTH_PASS r20_dot2_u4_b1_state_window"
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_dot2_u4_b2_serial_then_quadol.v
synth_design -mode out_of_context -top r20_dot2_u4_b2_serial_then_quadol -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/dot2_u4_b2.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_dot2_u4_b2_serial_then_quadol/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_dot2_u4_b2_serial_then_quadol/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_dot2_u4_b2_serial_then_quadol/synth.done w]
puts $f "r20_dot2_u4_b2_serial_then_quadol"
close $f
close_project
puts "R20_SYNTH_PASS r20_dot2_u4_b2_serial_then_quadol"
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_dot2_u4_b2_state_window.v
synth_design -mode out_of_context -top r20_dot2_u4_b2_state_window -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/dot2_u4_b2.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_dot2_u4_b2_state_window/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_dot2_u4_b2_state_window/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_dot2_u4_b2_state_window/synth.done w]
puts $f "r20_dot2_u4_b2_state_window"
close $f
close_project
puts "R20_SYNTH_PASS r20_dot2_u4_b2_state_window"
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_dot2_u4_b4_serial_then_quadol.v
synth_design -mode out_of_context -top r20_dot2_u4_b4_serial_then_quadol -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/dot2_u4_b4.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_dot2_u4_b4_serial_then_quadol/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_dot2_u4_b4_serial_then_quadol/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_dot2_u4_b4_serial_then_quadol/synth.done w]
puts $f "r20_dot2_u4_b4_serial_then_quadol"
close $f
close_project
puts "R20_SYNTH_PASS r20_dot2_u4_b4_serial_then_quadol"
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_dot2_u4_b4_state_window.v
synth_design -mode out_of_context -top r20_dot2_u4_b4_state_window -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/dot2_u4_b4.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_dot2_u4_b4_state_window/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_dot2_u4_b4_state_window/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_dot2_u4_b4_state_window/synth.done w]
puts $f "r20_dot2_u4_b4_state_window"
close $f
close_project
puts "R20_SYNTH_PASS r20_dot2_u4_b4_state_window"
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_dot2_u4_b8_serial_then_quadol.v
synth_design -mode out_of_context -top r20_dot2_u4_b8_serial_then_quadol -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/dot2_u4_b8.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_dot2_u4_b8_serial_then_quadol/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_dot2_u4_b8_serial_then_quadol/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_dot2_u4_b8_serial_then_quadol/synth.done w]
puts $f "r20_dot2_u4_b8_serial_then_quadol"
close $f
close_project
puts "R20_SYNTH_PASS r20_dot2_u4_b8_serial_then_quadol"
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_dot2_u4_b8_state_window.v
synth_design -mode out_of_context -top r20_dot2_u4_b8_state_window -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/dot2_u4_b8.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_dot2_u4_b8_state_window/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_dot2_u4_b8_state_window/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_dot2_u4_b8_state_window/synth.done w]
puts $f "r20_dot2_u4_b8_state_window"
close $f
close_project
puts "R20_SYNTH_PASS r20_dot2_u4_b8_state_window"
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_dot2_u4_b16_quadol_wce.v
synth_design -mode out_of_context -top r20_dot2_u4_b16_quadol_wce -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/dot2_u4_b16.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_dot2_u4_b16_quadol_wce/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_dot2_u4_b16_quadol_wce/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_dot2_u4_b16_quadol_wce/synth.done w]
puts $f "r20_dot2_u4_b16_quadol_wce"
close $f
close_project
puts "R20_SYNTH_PASS r20_dot2_u4_b16_quadol_wce"
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_dot2_u4_b16_serial_then_quadol.v
synth_design -mode out_of_context -top r20_dot2_u4_b16_serial_then_quadol -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/dot2_u4_b16.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_dot2_u4_b16_serial_then_quadol/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_dot2_u4_b16_serial_then_quadol/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_dot2_u4_b16_serial_then_quadol/synth.done w]
puts $f "r20_dot2_u4_b16_serial_then_quadol"
close $f
close_project
puts "R20_SYNTH_PASS r20_dot2_u4_b16_serial_then_quadol"
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_dot2_u4_b16_state_window.v
synth_design -mode out_of_context -top r20_dot2_u4_b16_state_window -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/dot2_u4_b16.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_dot2_u4_b16_state_window/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_dot2_u4_b16_state_window/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_dot2_u4_b16_state_window/synth.done w]
puts $f "r20_dot2_u4_b16_state_window"
close $f
close_project
puts "R20_SYNTH_PASS r20_dot2_u4_b16_state_window"
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_udiv8_b1_quadol_wce.v
synth_design -mode out_of_context -top r20_udiv8_b1_quadol_wce -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/udiv8_b1.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_udiv8_b1_quadol_wce/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_udiv8_b1_quadol_wce/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_udiv8_b1_quadol_wce/synth.done w]
puts $f "r20_udiv8_b1_quadol_wce"
close $f
close_project
puts "R20_SYNTH_PASS r20_udiv8_b1_quadol_wce"
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_udiv8_b1_serial_then_quadol.v
synth_design -mode out_of_context -top r20_udiv8_b1_serial_then_quadol -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/udiv8_b1.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_udiv8_b1_serial_then_quadol/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_udiv8_b1_serial_then_quadol/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_udiv8_b1_serial_then_quadol/synth.done w]
puts $f "r20_udiv8_b1_serial_then_quadol"
close $f
close_project
puts "R20_SYNTH_PASS r20_udiv8_b1_serial_then_quadol"
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_udiv8_b1_state_window.v
synth_design -mode out_of_context -top r20_udiv8_b1_state_window -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/udiv8_b1.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_udiv8_b1_state_window/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_udiv8_b1_state_window/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_udiv8_b1_state_window/synth.done w]
puts $f "r20_udiv8_b1_state_window"
close $f
close_project
puts "R20_SYNTH_PASS r20_udiv8_b1_state_window"
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_udiv8_b16_serial_then_quadol.v
synth_design -mode out_of_context -top r20_udiv8_b16_serial_then_quadol -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/udiv8_b16.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_udiv8_b16_serial_then_quadol/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_udiv8_b16_serial_then_quadol/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_udiv8_b16_serial_then_quadol/synth.done w]
puts $f "r20_udiv8_b16_serial_then_quadol"
close $f
close_project
puts "R20_SYNTH_PASS r20_udiv8_b16_serial_then_quadol"
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_udiv8_b16_state_window.v
synth_design -mode out_of_context -top r20_udiv8_b16_state_window -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/udiv8_b16.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_udiv8_b16_state_window/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_udiv8_b16_state_window/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_udiv8_b16_state_window/synth.done w]
puts $f "r20_udiv8_b16_state_window"
close $f
close_project
puts "R20_SYNTH_PASS r20_udiv8_b16_state_window"
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_isqrt16_b1_quadol_wce.v
synth_design -mode out_of_context -top r20_isqrt16_b1_quadol_wce -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/isqrt16_b1.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_isqrt16_b1_quadol_wce/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_isqrt16_b1_quadol_wce/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_isqrt16_b1_quadol_wce/synth.done w]
puts $f "r20_isqrt16_b1_quadol_wce"
close $f
close_project
puts "R20_SYNTH_PASS r20_isqrt16_b1_quadol_wce"
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_isqrt16_b1_serial_then_quadol.v
synth_design -mode out_of_context -top r20_isqrt16_b1_serial_then_quadol -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/isqrt16_b1.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_isqrt16_b1_serial_then_quadol/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_isqrt16_b1_serial_then_quadol/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_isqrt16_b1_serial_then_quadol/synth.done w]
puts $f "r20_isqrt16_b1_serial_then_quadol"
close $f
close_project
puts "R20_SYNTH_PASS r20_isqrt16_b1_serial_then_quadol"
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_isqrt16_b1_state_window.v
synth_design -mode out_of_context -top r20_isqrt16_b1_state_window -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/isqrt16_b1.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_isqrt16_b1_state_window/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_isqrt16_b1_state_window/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_isqrt16_b1_state_window/synth.done w]
puts $f "r20_isqrt16_b1_state_window"
close $f
close_project
puts "R20_SYNTH_PASS r20_isqrt16_b1_state_window"
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_isqrt16_b2_serial_then_quadol.v
synth_design -mode out_of_context -top r20_isqrt16_b2_serial_then_quadol -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/isqrt16_b2.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_isqrt16_b2_serial_then_quadol/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_isqrt16_b2_serial_then_quadol/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_isqrt16_b2_serial_then_quadol/synth.done w]
puts $f "r20_isqrt16_b2_serial_then_quadol"
close $f
close_project
puts "R20_SYNTH_PASS r20_isqrt16_b2_serial_then_quadol"
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_isqrt16_b2_state_window.v
synth_design -mode out_of_context -top r20_isqrt16_b2_state_window -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/isqrt16_b2.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_isqrt16_b2_state_window/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_isqrt16_b2_state_window/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_isqrt16_b2_state_window/synth.done w]
puts $f "r20_isqrt16_b2_state_window"
close $f
close_project
puts "R20_SYNTH_PASS r20_isqrt16_b2_state_window"
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_isqrt16_b4_quadol_wce.v
synth_design -mode out_of_context -top r20_isqrt16_b4_quadol_wce -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/isqrt16_b4.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_isqrt16_b4_quadol_wce/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_isqrt16_b4_quadol_wce/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_isqrt16_b4_quadol_wce/synth.done w]
puts $f "r20_isqrt16_b4_quadol_wce"
close $f
close_project
puts "R20_SYNTH_PASS r20_isqrt16_b4_quadol_wce"
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_isqrt16_b4_serial_then_quadol.v
synth_design -mode out_of_context -top r20_isqrt16_b4_serial_then_quadol -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/isqrt16_b4.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_isqrt16_b4_serial_then_quadol/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_isqrt16_b4_serial_then_quadol/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_isqrt16_b4_serial_then_quadol/synth.done w]
puts $f "r20_isqrt16_b4_serial_then_quadol"
close $f
close_project
puts "R20_SYNTH_PASS r20_isqrt16_b4_serial_then_quadol"
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_isqrt16_b4_state_window.v
synth_design -mode out_of_context -top r20_isqrt16_b4_state_window -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/isqrt16_b4.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_isqrt16_b4_state_window/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_isqrt16_b4_state_window/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_isqrt16_b4_state_window/synth.done w]
puts $f "r20_isqrt16_b4_state_window"
close $f
close_project
puts "R20_SYNTH_PASS r20_isqrt16_b4_state_window"
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_isqrt16_b8_quadol_wce.v
synth_design -mode out_of_context -top r20_isqrt16_b8_quadol_wce -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/isqrt16_b8.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_isqrt16_b8_quadol_wce/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_isqrt16_b8_quadol_wce/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_isqrt16_b8_quadol_wce/synth.done w]
puts $f "r20_isqrt16_b8_quadol_wce"
close $f
close_project
puts "R20_SYNTH_PASS r20_isqrt16_b8_quadol_wce"
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_isqrt16_b8_serial_then_quadol.v
synth_design -mode out_of_context -top r20_isqrt16_b8_serial_then_quadol -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/isqrt16_b8.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_isqrt16_b8_serial_then_quadol/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_isqrt16_b8_serial_then_quadol/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_isqrt16_b8_serial_then_quadol/synth.done w]
puts $f "r20_isqrt16_b8_serial_then_quadol"
close $f
close_project
puts "R20_SYNTH_PASS r20_isqrt16_b8_serial_then_quadol"
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_isqrt16_b8_state_window.v
synth_design -mode out_of_context -top r20_isqrt16_b8_state_window -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/isqrt16_b8.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_isqrt16_b8_state_window/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_isqrt16_b8_state_window/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_isqrt16_b8_state_window/synth.done w]
puts $f "r20_isqrt16_b8_state_window"
close $f
close_project
puts "R20_SYNTH_PASS r20_isqrt16_b8_state_window"
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_isqrt16_b16_quadol_wce.v
synth_design -mode out_of_context -top r20_isqrt16_b16_quadol_wce -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/isqrt16_b16.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_isqrt16_b16_quadol_wce/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_isqrt16_b16_quadol_wce/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_isqrt16_b16_quadol_wce/synth.done w]
puts $f "r20_isqrt16_b16_quadol_wce"
close $f
close_project
puts "R20_SYNTH_PASS r20_isqrt16_b16_quadol_wce"
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_isqrt16_b16_serial_then_quadol.v
synth_design -mode out_of_context -top r20_isqrt16_b16_serial_then_quadol -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/isqrt16_b16.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_isqrt16_b16_serial_then_quadol/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_isqrt16_b16_serial_then_quadol/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_isqrt16_b16_serial_then_quadol/synth.done w]
puts $f "r20_isqrt16_b16_serial_then_quadol"
close $f
close_project
puts "R20_SYNTH_PASS r20_isqrt16_b16_serial_then_quadol"
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_isqrt16_b16_state_window.v
synth_design -mode out_of_context -top r20_isqrt16_b16_state_window -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/isqrt16_b16.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_isqrt16_b16_state_window/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_isqrt16_b16_state_window/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_isqrt16_b16_state_window/synth.done w]
puts $f "r20_isqrt16_b16_state_window"
close $f
close_project
puts "R20_SYNTH_PASS r20_isqrt16_b16_state_window"
create_project -in_memory -part xc7a100tcsg324-1
read_verilog -sv D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/r20_absdiff8_b1_quadol_wce.v
synth_design -mode out_of_context -top r20_absdiff8_b1_quadol_wce -part xc7a100tcsg324-1 -max_dsp 0
read_xdc D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/rtl/absdiff8_b1.xdc
report_utilization -file D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_absdiff8_b1_quadol_wce/util_synth.rpt
write_checkpoint -force D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_absdiff8_b1_quadol_wce/synth.dcp
set f [open D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_absdiff8_b1_quadol_wce/synth.done w]
puts $f "r20_absdiff8_b1_quadol_wce"
close $f
close_project
puts "R20_SYNTH_PASS r20_absdiff8_b1_quadol_wce"
