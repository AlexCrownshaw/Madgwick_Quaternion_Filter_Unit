vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 "+incdir+../../../../Madgwick_Quaternion_Filter_Unit_Vivado_2019_2_Project.srcs/sources_1/ip/MQFU_AXI4_Lite_IP_0_2/src" "+incdir+../../../../Madgwick_Quaternion_Filter_Unit_Vivado_2019_2_Project.srcs/sources_1/ip/MQFU_AXI4_Lite_IP_0_2/drivers/MQFU_AXI4_Lite_IP_v1_0/src" \
"../../../../Madgwick_Quaternion_Filter_Unit_Vivado_2019_2_Project.srcs/sources_1/ip/MQFU_AXI4_Lite_IP_0_2/hdl/MQFU_AXI4_Lite_IP_v1_0_S_AXI.v" \

vlog -work xil_defaultlib -64 -sv "+incdir+../../../../Madgwick_Quaternion_Filter_Unit_Vivado_2019_2_Project.srcs/sources_1/ip/MQFU_AXI4_Lite_IP_0_2/src" "+incdir+../../../../Madgwick_Quaternion_Filter_Unit_Vivado_2019_2_Project.srcs/sources_1/ip/MQFU_AXI4_Lite_IP_0_2/drivers/MQFU_AXI4_Lite_IP_v1_0/src" \
"../../../../Madgwick_Quaternion_Filter_Unit_Vivado_2019_2_Project.srcs/sources_1/ip/MQFU_AXI4_Lite_IP_0_2/src/MPU6050.sv" \
"../../../../Madgwick_Quaternion_Filter_Unit_Vivado_2019_2_Project.srcs/sources_1/ip/MQFU_AXI4_Lite_IP_0_2/src/fastInvSqrt.sv" \
"../../../../Madgwick_Quaternion_Filter_Unit_Vivado_2019_2_Project.srcs/sources_1/ip/MQFU_AXI4_Lite_IP_0_2/src/fixToSingle.sv" \
"../../../../Madgwick_Quaternion_Filter_Unit_Vivado_2019_2_Project.srcs/sources_1/ip/MQFU_AXI4_Lite_IP_0_2/src/madgwick.sv" \
"../../../../Madgwick_Quaternion_Filter_Unit_Vivado_2019_2_Project.srcs/sources_1/ip/MQFU_AXI4_Lite_IP_0_2/src/newtonRaphson.sv" \
"../../../../Madgwick_Quaternion_Filter_Unit_Vivado_2019_2_Project.srcs/sources_1/ip/MQFU_AXI4_Lite_IP_0_2/src/singleToFix.sv" \

vlog -work xil_defaultlib -64 "+incdir+../../../../Madgwick_Quaternion_Filter_Unit_Vivado_2019_2_Project.srcs/sources_1/ip/MQFU_AXI4_Lite_IP_0_2/src" "+incdir+../../../../Madgwick_Quaternion_Filter_Unit_Vivado_2019_2_Project.srcs/sources_1/ip/MQFU_AXI4_Lite_IP_0_2/drivers/MQFU_AXI4_Lite_IP_v1_0/src" \
"../../../../Madgwick_Quaternion_Filter_Unit_Vivado_2019_2_Project.srcs/sources_1/ip/MQFU_AXI4_Lite_IP_0_2/src/MQFU_AXI4_Lite_IP_v1_0.v" \
"../../../../Madgwick_Quaternion_Filter_Unit_Vivado_2019_2_Project.srcs/sources_1/ip/MQFU_AXI4_Lite_IP_0_2/sim/MQFU_AXI4_Lite_IP_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

