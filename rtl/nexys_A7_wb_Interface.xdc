## Clock signal
create_clock -add -name sys_clk_pin -period 20.00 -waveform {0 5} [get_ports {clk}];
set_property PACKAGE_PIN E3 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

## Reset signal
set_property PACKAGE_PIN C12 [get_ports rst_n]
set_property IOSTANDARD LVCMOS33 [get_ports rst_n]

## Madgwick module signals

# Input signals
set_property PACKAGE_PIN U12 [get_ports valid_in]
set_property IOSTANDARD LVCMOS33 [get_ports valid_in]

set_property PACKAGE_PIN V12 [get_ports ready_in]
set_property IOSTANDARD LVCMOS33 [get_ports ready_in]

set_property PACKAGE_PIN W12 [get_ports a_x]
set_property IOSTANDARD LVCMOS33 [get_ports a_x]
set_property PACKAGE_PIN Y12 [get_ports a_y]
set_property IOSTANDARD LVCMOS33 [get_ports a_y]
set_property PACKAGE_PIN AA12 [get_ports a_z]
set_property IOSTANDARD LVCMOS33 [get_ports a_z]

set_property PACKAGE_PIN AB12 [get_ports w_x]
set_property IOSTANDARD LVCMOS33 [get_ports w_x]
set_property PACKAGE_PIN P15 [get_ports w_y]
set_property IOSTANDARD LVCMOS33 [get_ports w_y]
set_property PACKAGE_PIN P16 [get_ports w_z]
set_property IOSTANDARD LVCMOS33 [get_ports w_z]

# Output signals
set_property PACKAGE_PIN R12 [get_ports valid_out]
set_property IOSTANDARD LVCMOS33 [get_ports valid_out]

set_property PACKAGE_PIN R13 [get_ports ready_out]
set_property IOSTANDARD LVCMOS33 [get_ports ready_out]

set_property PACKAGE_PIN T14 [get_ports q_w_norm_output]
set_property IOSTANDARD LVCMOS33 [get_ports q_w_norm_output]
set_property PACKAGE_PIN T15 [get_ports q_x_norm_output]
set_property IOSTANDARD LVCMOS33 [get_ports q_x_norm_output]
set_property PACKAGE_PIN V14 [get_ports q_y_norm_output]
set_property IOSTANDARD LVCMOS33 [get_ports q_y_norm_output]
set_property PACKAGE_PIN W14 [get_ports q_z_norm_output]
set_property IOSTANDARD LVCMOS33 [get_ports q_z_norm_output]
