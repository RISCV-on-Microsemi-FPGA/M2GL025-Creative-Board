# IGLOO2 Creative Development Board RISC-V Device Programming 

This folder contains FlashProExpress projects containing FPGA designs including a RISC-V RV32IM soft processor.

### Target Hardware
The IGLOO2 Creative Development Board includes a IGLOO2 M2GL025 FPGA. Details of the features available for this development board are available [here](https://www.microsemi.com/products/fpga-soc/design-resources/dev-kits/smartfusion2/future-creative-board).

### FlashPro Express
This folder includes two FlashPro Express projects that can be used to program the development boards FPGA. A standalone installer for FlashPro Express is available [here](https://www.microsemi.com/products/fpga-soc/design-resources/programming/flashpro#software) . Please note that you only need to install this standalone version of FlashPro Express if you do not have Libero tools installed.

* PROC_SUBSYSTEM_BaseDesign, contains a simple RISCV design which allows users to use basic peripherals such as GPIO, UART and Timers. 
* PROC_SUBSYSTEM_TickTackToe, contains the design used along side of the TickTackToe example software found [here](https://github.com/RISCV-on-Microsemi-FPGA/M2GL025-Creative-Board/tree/master/ExampleSoftware). To use this deisgn a daughter board is needed from Adafruit, more information on this can be found [here](https://www.adafruit.com/product/1651).


