create_clock -name clk -period 30 [get_ports clk]
set_input_delay 2 -clock clk [get_ports {A[*] B[*]}]
set_output_delay 2 -clock clk [get_ports {Y[*]}]
set_property HD.CLK_SRC BUFGCTRL_X0Y0 [get_ports clk]
