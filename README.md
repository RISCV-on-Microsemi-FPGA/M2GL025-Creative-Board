# IGLOO2 Creative Development Board RISC-V Projects
This project contains Libero projects containing FPGA designs including a RISC-V RV32IM soft processor. Programming bitstreams are also included so you don't have to run through the full FPGA design flow in order to start developing software for RISC-V.

Documentation is available [here](https://github.com/RISCV-on-Microsemi-FPGA/Documentation) to help you get started with tools and IP.

### Target Hardware
The IGLOO2 Creative Development Board includes a IGLOO2 M2GL025 FPGA. Details of the features available for this development board are available [here](https://www.microsemi.com/products/fpga-soc/design-resources/dev-kits/smartfusion2/future-creative-board).

### Programming The Target Device
The Programming_The_Target_Device folder includes FlashPro Express projects that can be used to program the development boards FPGA. A standalone installer for FlashPro Express is available [here](https://www.microsemi.com/products/fpga-soc/design-resources/programming/flashpro#software) . Please note that you only need to install this standalone version of FlashPro Express if you do not have Libero tools installed.

### Modify The FPGA Design 
The Modify_The_FPGA_Design folder contains Libero example designs. Libero is Microsemi's FPGA design tool. You will need this tool if you wish to modify the example FPGA designs. Libero is available from [here](https://www.microsemi.com/products/fpga-soc/design-resources/design-software/libero-soc#downloads).

### Example Software Projects
The Example_Software_Projects folder contains example software projects specifically targeted at the IGLOO2 Creative Development Board. The TickTackToe and riscv-systic-blinky example firmware  can be found in this directory.
A set of more generic RISC-V example software projects are also available for these designs from the SoftConsole [page](https://github.com/RISCV-on-Microsemi-FPGA/SoftConsole). 
