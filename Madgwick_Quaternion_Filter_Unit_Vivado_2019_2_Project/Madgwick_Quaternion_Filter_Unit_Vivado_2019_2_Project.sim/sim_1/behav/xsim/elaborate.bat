@echo off
REM ****************************************************************************
REM Vivado (TM) v2019.2 (64-bit)
REM
REM Filename    : elaborate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for elaborating the compiled design
REM
REM Generated by Vivado on Fri Jan 03 11:06:16 +0000 2025
REM SW Build 2708876 on Wed Nov  6 21:40:23 MST 2019
REM
REM Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
REM
REM usage: elaborate.bat
REM
REM ****************************************************************************
echo "xelab -wto 3328f6b0d67d4ec18ead50b77e83ef54 --incr --debug typical --relax --mt 2 -L axi_infrastructure_v1_1_0 -L xil_defaultlib -L axi_vip_v1_1_6 -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -L xpm --snapshot tb_MQFU_AXI4_Lite_IP_v1_0_behav xil_defaultlib.tb_MQFU_AXI4_Lite_IP_v1_0 xil_defaultlib.glbl -log elaborate.log"
call xelab  -wto 3328f6b0d67d4ec18ead50b77e83ef54 --incr --debug typical --relax --mt 2 -L axi_infrastructure_v1_1_0 -L xil_defaultlib -L axi_vip_v1_1_6 -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -L xpm --snapshot tb_MQFU_AXI4_Lite_IP_v1_0_behav xil_defaultlib.tb_MQFU_AXI4_Lite_IP_v1_0 xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0