create_clock -name clk -period 15 [get_ports clk]
set_input_delay 2 -clock clk [get_ports {reset coeff_we coeff_addr[*] coeff_data[*] sample_valid sample_data[*]}]
set_output_delay 2 -clock clk [get_ports {sample_ready result_valid result[*]}]
set_property HD.CLK_SRC BUFGCTRL_X0Y0 [get_ports clk]
