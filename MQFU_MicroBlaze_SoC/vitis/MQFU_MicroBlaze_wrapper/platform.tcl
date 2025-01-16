# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\Dev\Madgwick_Quaternion_Filter_Unit\MQFU_MicroBlaze_SoC\vitis\MQFU_MicroBlaze_wrapper\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\Dev\Madgwick_Quaternion_Filter_Unit\MQFU_MicroBlaze_SoC\vitis\MQFU_MicroBlaze_wrapper\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {MQFU_MicroBlaze_wrapper}\
-hw {C:\Dev\Madgwick_Quaternion_Filter_Unit\MQFU_MicroBlaze_SoC\MQFU_MicroBlaze_wrapper.xsa}\
-out {C:/Dev/Madgwick_Quaternion_Filter_Unit/MQFU_MicroBlaze_SoC/vitis}

platform write
domain create -name {standalone_microblaze_0} -display-name {standalone_microblaze_0} -os {standalone} -proc {microblaze_0} -runtime {cpp} -arch {32-bit} -support-app {hello_world}
platform generate -domains 
platform active {MQFU_MicroBlaze_wrapper}
platform generate -quick
