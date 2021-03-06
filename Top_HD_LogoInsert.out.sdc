## Generated SDC file "Top_HD_LogoInsert.out.sdc"

## Copyright (C) 1991-2009 Altera Corporation
## Your use of Altera Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Altera Program License 
## Subscription Agreement, Altera MegaCore Function License 
## Agreement, or other applicable license agreement, including, 
## without limitation, that your use is for the sole purpose of 
## programming logic devices manufactured by Altera and sold by 
## Altera or its authorized distributors.  Please refer to the 
## applicable agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus II"
## VERSION "Version 9.1 Build 222 10/21/2009 SJ Full Version"

## DATE    "Mon May 16 16:20:36 2011"

##
## DEVICE  "EP3C40F484C8"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

#derive_clocks -period "13"


#**************************************************************
# Create Generated Clock
#**************************************************************
create_clock -period 13 -name bkgd_clk [get_ports {Pclk_Rx}]
create_clock -period 6.5 -name keyvideo_clk [get_ports {Pclk_KeyVideo}]
create_clock -period 6.5 -name keyanpha_clk [get_ports {Pclk_KeyAnpha}]
create_clock -period 13 -name ref_clk [get_ports {Pclk_GS4911}]
create_clock -period 352 -name aclock [get_ports {Rx_Audio[1]}]
create_clock -period 20833 -name wclock [get_ports {Rx_Audio[0]}]



#create_clock -period 20833 -name test [get_ports {Rx_Audio[0]}]

#create_clock -period 352 -name virt_a_clk

#virt_a_clk
create_clock -period 13 -name rx_bkgd_clk
#
create_clock -period 13 -name tx_video_clk


create_clock -period 6.5 -name virt_key_clk


create_clock -period 12.5 -name mcu_wr [get_ports {NWR0}]
#create_clock -period 34000 -name hvf_to_logo_insert_clk [get_nets {hvf_to_logo_insert[0]}]

#create_clock -period 13 -name clk_anpha_clk [get_nets {Convert10b_Inst_Anpha|selection}]
#create_clock -period 13 -name clk_key_clk [get_nets {Convert10b_Inst|selection}]
#create_clock -period 325.52 -name rx_audio_clk [get_ports {Rx_Audio[1]}]

# Set the two clocks as exclusive clocks
#set_clock_groups -exclusive -group {ref_clk bkgd_clk clk_key_clk}
#set_clock_groups -asynchronous -group {ref_clk} -group{bkgd_clk}


set_clock_groups -asynchronous -group {ref_clk} -group {bkgd_clk} -group {aclock} -group {keyanpha_clk} -group {keyvideo_clk} -group {mcu_wr} -group {wclock} -group {DDR2_IF_inst|DDR2_IF_controller_phy_inst|DDR2_IF_phy_inst|DDR2_IF_phy_alt_mem_phy_inst|clk|pll|altpll_component|auto_generated|pll1|clk[0]}

#set_clock_groups -asynchronous \
				-group {aclock } -group {keyanpha_clk} \
				-group {keyvideo_clk} -group {mcu_wr} -group {hvf_to_logo_insert_clk} -group {wclock} 
#\
#				-group {DDR2_IF_inst|DDR2_IF_controller_phy_inst|DDR2_IF_phy_inst|DDR2_IF_phy_alt_mem_phy_inst|clk|pll|altpll_component|auto_generated|pll1|clk[0]}
				
#aclock bkgd_clk clock_source DDR2_IF_inst|DDR2_IF_controller_phy_inst|DDR2_IF_phy_inst|DDR2_IF_phy_mem_clk[0]_mimic_launch_clock
#keyanpha_clk keyvideo_clk ref_clk virt_a_clk virt_key_clk virt_sys_clk				

#specify the maximum external clock delay from the external device
set CLKs_max 0.200
#specify the minimum external clock delay from the external device
set CLKs_min 0.100
#specify the maximum external clock delay to the FPGA
set CLKd_max 0.200
#specify the minimum external clock delay to the FPGA
set CLKd_min 0.100
#specify the maximum clock-to-out of the external device
set tCO_max 0.525
#specify the minimum clock-to-out of the external device
set tCO_min 0.415
#specify the maximum board delay
set BD_max 0.180
#specify the minimum board delay
set BD_min 0.120

#specify the maximum setup time of the external device
set tSU 0.125
#specify the minimum setup time of the external device
set tH 0.100
#specify the maximum board delay
set BD_max 0.180
#specify the minimum board delay
set BD_min 0.120
#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

derive_clock_uncertainty


#**************************************************************
# Set Input Delay
#**************************************************************
set_input_delay -clock rx_bkgd_clk \
-max [expr $CLKs_max + $tCO_max + $BD_max - $CLKd_min] [get_ports {Rx_Data[*]}]

set_input_delay -clock rx_bkgd_clk \
-min [expr $CLKs_min + $tCO_min + $BD_min - $CLKd_max] [get_ports {Rx_Data[*]}]

set_input_delay -clock virt_key_clk \
-max [expr $CLKs_max + $tCO_max + $BD_max - $CLKd_min] [get_ports {Rx_KeyVideo[*]}]

set_input_delay -clock virt_key_clk \
-min [expr $CLKs_min + $tCO_min + $BD_min - $CLKd_max] [get_ports {Rx_KeyVideo[*]}]

set_input_delay -clock virt_key_clk \
-max [expr $CLKs_max + $tCO_max + $BD_max - $CLKd_min] [get_ports {Rx_KeyAnpha[*]}]

set_input_delay -clock virt_key_clk \
-min [expr $CLKs_min + $tCO_min + $BD_min - $CLKd_max] [get_ports {Rx_KeyAnpha[*]}]






#**************************************************************
# Set Output Delay
#**************************************************************
set_output_delay -clock tx_video_clk \
-max [expr $CLKs_max + $BD_max + $tSU - $CLKd_min] [get_ports {Tx_Data[*]}]


set_output_delay -clock tx_video_clk \
-min [expr $CLKs_min + $BD_min - $tH - $CLKd_max] [get_ports {Tx_Data[*]}]



#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************

#set_false_path -from [get_keepers {*delayed_wrptr_g*}] -to [get_keepers {*rs_dgwp|dffpipe_tu8:dffpipe4|dffe5a*}]
set_false_path -from * -to [get_cells {key_control[0]}]
set_false_path -from * -to [get_cells {key_control[1]}]


#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

