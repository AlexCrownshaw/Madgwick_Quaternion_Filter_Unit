onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+MQFU_AXI4_Lite_IP -L xilinx_vip -L xil_defaultlib -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.MQFU_AXI4_Lite_IP xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {MQFU_AXI4_Lite_IP.udo}

run -all

endsim

quit -force
