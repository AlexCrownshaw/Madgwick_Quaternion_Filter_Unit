vlib work
vlib activehdl

vlib activehdl/xilinx_vip
vlib activehdl/xil_defaultlib

vmap xilinx_vip activehdl/xilinx_vip
vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xilinx_vip  -sv2k12 "+incdir+C:/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"C:/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"C:/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"C:/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"C:/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"C:/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"C:/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"C:/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"C:/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"C:/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../../ip/MQFU_AXI4_Lite_IP/src" "+incdir+../../../../../ip/MQFU_AXI4_Lite_IP/drivers/MQFU_AXI4_Lite_IP_v1_0/src" "+incdir+C:/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../../ip/MQFU_AXI4_Lite_IP/hdl/MQFU_AXI4_Lite_IP_v1_0_S_AXI.v" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../../ip/MQFU_AXI4_Lite_IP/src" "+incdir+../../../../../ip/MQFU_AXI4_Lite_IP/drivers/MQFU_AXI4_Lite_IP_v1_0/src" "+incdir+C:/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../../ip/MQFU_AXI4_Lite_IP/src/MPU6050.sv" \
"../../../../../ip/MQFU_AXI4_Lite_IP/src/fastInvSqrt.sv" \
"../../../../../ip/MQFU_AXI4_Lite_IP/src/fixToSingle.sv" \
"../../../../../ip/MQFU_AXI4_Lite_IP/src/madgwick.sv" \
"../../../../../ip/MQFU_AXI4_Lite_IP/src/newtonRaphson.sv" \
"../../../../../ip/MQFU_AXI4_Lite_IP/src/singleToFix.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../../ip/MQFU_AXI4_Lite_IP/src" "+incdir+../../../../../ip/MQFU_AXI4_Lite_IP/drivers/MQFU_AXI4_Lite_IP_v1_0/src" "+incdir+C:/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../../ip/MQFU_AXI4_Lite_IP/hdl/MQFU_AXI4_Lite_IP_v1_0.v" \
"../../../../../ip/MQFU_AXI4_Lite_IP/sim/MQFU_AXI4_Lite_IP.v" \

vlog -work xil_defaultlib \
"glbl.v"
