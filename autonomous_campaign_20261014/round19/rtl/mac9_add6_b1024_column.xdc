create_clock -period 12.5 -name clk [get_ports clk]
set_input_delay 2.0 -clock clk [get_ports {A* B*}]
set_output_delay 2.0 -clock clk [get_ports Y*]
set_property HD.CLK_SRC BUFGCTRL_X0Y0 [get_ports clk]
