onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L xilinx_vip -L xil_defaultlib -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.MQFU_AXI4_Lite_IP xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {MQFU_AXI4_Lite_IP.udo}

run -all

quit -force
