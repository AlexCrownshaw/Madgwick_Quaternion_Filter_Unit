# Madgwick Quaternion Filter Unit (MQFU)

The **Madgwick Quaternion Filter Unit (MQFU)** is a high-performance FPGA-based hardware accelerator designed for real-time inertial attitude estimation. This project implements the Madgwick Quaternion Filter using fixed-point arithmetic, significantly improving throughput and reducing processor workload compared to software-based implementations.

## Key Features

- **Configurable Fixed-Point Design:** Python-based configuration tool for dynamic adjustment of range and precision.
- **Efficient Hardware Integration:** Packaged as a Xilinx IP block with AXI interface for seamless SoC integration.
- **Wishbone Interface Support:** Includes a Wishbone-compatible interface for easy integration with open-source and custom SoC architectures.
- **VeeRWolfX SoC Integration:** Demonstrated integration into the VeeRWolfX SoC, showcasing compatibility with a RISC-V-based processor and peripheral system.
- **Improved Performance:** Offloads computationally intensive attitude estimation from the CPU, enhancing real-time capabilities.

The MQFU is synthesizable on Xilinx FPGAs, such as the Artix-7, and can be adapted for various inertial measurement systems, making it ideal for applications in drones, satellites, and robotics.
