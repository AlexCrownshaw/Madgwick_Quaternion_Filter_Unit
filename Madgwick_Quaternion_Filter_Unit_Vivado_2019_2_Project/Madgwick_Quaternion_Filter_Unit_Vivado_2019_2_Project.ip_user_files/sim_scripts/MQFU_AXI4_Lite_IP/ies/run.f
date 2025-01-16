-makelib ies_lib/xilinx_vip -sv \
  "C:/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
  "C:/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
  "C:/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
  "C:/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
  "C:/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
  "C:/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
  "C:/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
  "C:/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
  "C:/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/rst_vip_if.sv" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../../ip/MQFU_AXI4_Lite_IP/hdl/MQFU_AXI4_Lite_IP_v1_0_S_AXI.v" \
-endlib
-makelib ies_lib/xil_defaultlib -sv \
  "../../../../../ip/MQFU_AXI4_Lite_IP/src/MPU6050.sv" \
  "../../../../../ip/MQFU_AXI4_Lite_IP/src/fastInvSqrt.sv" \
  "../../../../../ip/MQFU_AXI4_Lite_IP/src/fixToSingle.sv" \
  "../../../../../ip/MQFU_AXI4_Lite_IP/src/madgwick.sv" \
  "../../../../../ip/MQFU_AXI4_Lite_IP/src/newtonRaphson.sv" \
  "../../../../../ip/MQFU_AXI4_Lite_IP/src/singleToFix.sv" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../../ip/MQFU_AXI4_Lite_IP/hdl/MQFU_AXI4_Lite_IP_v1_0.v" \
  "../../../../../ip/MQFU_AXI4_Lite_IP/sim/MQFU_AXI4_Lite_IP.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

