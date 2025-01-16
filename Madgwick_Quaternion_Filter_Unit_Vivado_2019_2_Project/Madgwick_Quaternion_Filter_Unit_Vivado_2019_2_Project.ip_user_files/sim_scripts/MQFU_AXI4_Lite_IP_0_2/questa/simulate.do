onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib MQFU_AXI4_Lite_IP_0_opt

do {wave.do}

view wave
view structure
view signals

do {MQFU_AXI4_Lite_IP_0.udo}

run -all

quit -force
