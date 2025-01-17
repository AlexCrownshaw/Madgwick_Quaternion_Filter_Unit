onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L xilinx_vip -L axi_infrastructure_v1_1_0 -L xil_defaultlib -L axi_vip_v1_1_6 -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.axi4_lite_m_vip_0 xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {axi4_lite_m_vip_0.udo}

run -all

quit -force
