vlib work
vlib riviera

vlib riviera/xil_defaultlib

vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Madgwick_Quaternion_Filter_Unit_Vivado_2019_2_Project.srcs/sources_1/ip/MQFU_AXI4_Lite_IP_0_4/src" "+incdir+../../../../Madgwick_Quaternion_Filter_Unit_Vivado_2019_2_Project.srcs/sources_1/ip/MQFU_AXI4_Lite_IP_0_4/drivers/MQFU_AXI4_Lite_IP_v1_0/src" \
"../../../../Madgwick_Quaternion_Filter_Unit_Vivado_2019_2_Project.srcs/sources_1/ip/MQFU_AXI4_Lite_IP_0_4/hdl/MQFU_AXI4_Lite_IP_v1_0_S_AXI.v" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../Madgwick_Quaternion_Filter_Unit_Vivado_2019_2_Project.srcs/sources_1/ip/MQFU_AXI4_Lite_IP_0_4/src" "+incdir+../../../../Madgwick_Quaternion_Filter_Unit_Vivado_2019_2_Project.srcs/sources_1/ip/MQFU_AXI4_Lite_IP_0_4/drivers/MQFU_AXI4_Lite_IP_v1_0/src" \
"../../../../Madgwick_Quaternion_Filter_Unit_Vivado_2019_2_Project.srcs/sources_1/ip/MQFU_AXI4_Lite_IP_0_4/src/MPU6050.sv" \
"../../../../Madgwick_Quaternion_Filter_Unit_Vivado_2019_2_Project.srcs/sources_1/ip/MQFU_AXI4_Lite_IP_0_4/src/fastInvSqrt.sv" \
"../../../../Madgwick_Quaternion_Filter_Unit_Vivado_2019_2_Project.srcs/sources_1/ip/MQFU_AXI4_Lite_IP_0_4/src/fixToSingle.sv" \
"../../../../Madgwick_Quaternion_Filter_Unit_Vivado_2019_2_Project.srcs/sources_1/ip/MQFU_AXI4_Lite_IP_0_4/src/madgwick.sv" \
"../../../../Madgwick_Quaternion_Filter_Unit_Vivado_2019_2_Project.srcs/sources_1/ip/MQFU_AXI4_Lite_IP_0_4/src/newtonRaphson.sv" \
"../../../../Madgwick_Quaternion_Filter_Unit_Vivado_2019_2_Project.srcs/sources_1/ip/MQFU_AXI4_Lite_IP_0_4/src/singleToFix.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Madgwick_Quaternion_Filter_Unit_Vivado_2019_2_Project.srcs/sources_1/ip/MQFU_AXI4_Lite_IP_0_4/src" "+incdir+../../../../Madgwick_Quaternion_Filter_Unit_Vivado_2019_2_Project.srcs/sources_1/ip/MQFU_AXI4_Lite_IP_0_4/drivers/MQFU_AXI4_Lite_IP_v1_0/src" \
"../../../../Madgwick_Quaternion_Filter_Unit_Vivado_2019_2_Project.srcs/sources_1/ip/MQFU_AXI4_Lite_IP_0_4/hdl/MQFU_AXI4_Lite_IP_v1_0.v" \
"../../../../Madgwick_Quaternion_Filter_Unit_Vivado_2019_2_Project.srcs/sources_1/ip/MQFU_AXI4_Lite_IP_0_4/sim/MQFU_AXI4_Lite_IP_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

