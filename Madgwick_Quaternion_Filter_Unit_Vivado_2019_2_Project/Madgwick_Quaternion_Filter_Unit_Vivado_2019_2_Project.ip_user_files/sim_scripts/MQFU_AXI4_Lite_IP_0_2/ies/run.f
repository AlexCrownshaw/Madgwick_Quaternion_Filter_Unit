-makelib ies_lib/xil_defaultlib \
  "../../../../Madgwick_Quaternion_Filter_Unit_Vivado_2019_2_Project.srcs/sources_1/ip/MQFU_AXI4_Lite_IP_0_2/hdl/MQFU_AXI4_Lite_IP_v1_0_S_AXI.v" \
-endlib
-makelib ies_lib/xil_defaultlib -sv \
  "../../../../Madgwick_Quaternion_Filter_Unit_Vivado_2019_2_Project.srcs/sources_1/ip/MQFU_AXI4_Lite_IP_0_2/src/MPU6050.sv" \
  "../../../../Madgwick_Quaternion_Filter_Unit_Vivado_2019_2_Project.srcs/sources_1/ip/MQFU_AXI4_Lite_IP_0_2/src/fastInvSqrt.sv" \
  "../../../../Madgwick_Quaternion_Filter_Unit_Vivado_2019_2_Project.srcs/sources_1/ip/MQFU_AXI4_Lite_IP_0_2/src/fixToSingle.sv" \
  "../../../../Madgwick_Quaternion_Filter_Unit_Vivado_2019_2_Project.srcs/sources_1/ip/MQFU_AXI4_Lite_IP_0_2/src/madgwick.sv" \
  "../../../../Madgwick_Quaternion_Filter_Unit_Vivado_2019_2_Project.srcs/sources_1/ip/MQFU_AXI4_Lite_IP_0_2/src/newtonRaphson.sv" \
  "../../../../Madgwick_Quaternion_Filter_Unit_Vivado_2019_2_Project.srcs/sources_1/ip/MQFU_AXI4_Lite_IP_0_2/src/singleToFix.sv" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../Madgwick_Quaternion_Filter_Unit_Vivado_2019_2_Project.srcs/sources_1/ip/MQFU_AXI4_Lite_IP_0_2/src/MQFU_AXI4_Lite_IP_v1_0.v" \
  "../../../../Madgwick_Quaternion_Filter_Unit_Vivado_2019_2_Project.srcs/sources_1/ip/MQFU_AXI4_Lite_IP_0_2/sim/MQFU_AXI4_Lite_IP_0.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

