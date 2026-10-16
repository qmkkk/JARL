set out [lindex $argv 0]
open_checkpoint $out/route.dcp
read_saif -strip_path tb/dut -out_file $out/saif_annotation.rpt $out/sim/activity.saif
report_power -file $out/power.rpt
puts "JARL_POWER_COMPLETE"
close_project
