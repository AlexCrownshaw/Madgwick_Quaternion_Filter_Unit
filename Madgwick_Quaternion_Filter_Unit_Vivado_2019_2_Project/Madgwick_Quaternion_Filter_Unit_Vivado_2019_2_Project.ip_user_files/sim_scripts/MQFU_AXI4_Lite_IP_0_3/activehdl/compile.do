vlib work
vlib activehdl

vlib activehdl/xil_defaultlib

vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Madgwick_Quaternion_Filter_Unit_Vivado_2019_2_Project.srcs/sources_1/ip/MQFU_AXI4_Lite_IP_0_3/src" "+incdir+../../../../Madgwick_Quaternion_Filter_Unit_Vivado_2019_2_Project.srcs/sources_1/ip/MQFU_AXI4_Lite_IP_0_3/drivers/MQFU_AXI4_Lite_IP_v1_0/src" \
"../../../../Madgwick_Quaternion_Filter_Unit_Vivado_2019_2_Project.srcs/sources_1/ip/MQFU_AXI4_Lite_IP_0_3/hdl/MQFU_AXI4_Lite_IP_v1_0_S_AXI.v" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../Madgwick_Quaternion_Filter_Unit_Vivado_2019_2_Project.srcs/sources_1/ip/MQFU_AXI4_Lite_IP_0_3/src" "+incdir+../../../../Madgwick_Quaternion_Filter_Unit_Vivado_2019_2_Project.srcs/sources_1/ip/MQFU_AXI4_Lite_IP_0_3/drivers/MQFU_AXI4_Lite_IP_v1_0/src" \
"../../../../Madgwick_Quaternion_Filter_Unit_Vivado_2019_2_Project.srcs/sources_1/ip/MQFU_AXI4_Lite_IP_0_3/src/MPU6050.sv" \
"../../../../Madgwick_Quaternion_Filter_Unit_Vivado_2019_2_Project.srcs/sources_1/ip/MQFU_AXI4_Lite_IP_0_3/src/fastInvSqrt.sv" \
"../../../../Madgwick_Quaternion_Filter_Unit_Vivado_2019_2_Project.srcs/sources_1/ip/MQFU_AXI4_Lite_IP_0_3/src/fixToSingle.sv" \
"../../../../Madgwick_Quaternion_Filter_Unit_Vivado_2019_2_Project.srcs/sources_1/ip/MQFU_AXI4_Lite_IP_0_3/src/madgwick.sv" \
"../../../../Madgwick_Quaternion_Filter_Unit_Vivado_2019_2_Project.srcs/sources_1/ip/MQFU_AXI4_Lite_IP_0_3/src/newtonRaphson.sv" \
"../../../../Madgwick_Quaternion_Filter_Unit_Vivado_2019_2_Project.srcs/sources_1/ip/MQFU_AXI4_Lite_IP_0_3/src/singleToFix.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Madgwick_Quaternion_Filter_Unit_Vivado_2019_2_Project.srcs/sources_1/ip/MQFU_AXI4_Lite_IP_0_3/src" "+incdir+../../../../Madgwick_Quaternion_Filter_Unit_Vivado_2019_2_Project.srcs/sources_1/ip/MQFU_AXI4_Lite_IP_0_3/drivers/MQFU_AXI4_Lite_IP_v1_0/src" \
"../../../../Madgwick_Quaternion_Filter_Unit_Vivado_2019_2_Project.srcs/sources_1/ip/MQFU_AXI4_Lite_IP_0_3/src/MQFU_AXI4_Lite_IP_v1_0.v" \
"../../../../Madgwick_Quaternion_Filter_Unit_Vivado_2019_2_Project.srcs/sources_1/ip/MQFU_AXI4_Lite_IP_0_3/sim/MQFU_AXI4_Lite_IP_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

