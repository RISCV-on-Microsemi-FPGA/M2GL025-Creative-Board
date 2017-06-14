# IGLOO2 Creative Development Board RISC-V Sample Designs 
Sample RISC-V Libero projects for the IGLOO2 (M2GL025) Creative Development Board.

This project contains Libero projects containing FPGA designs including a RISC-V RV32IM soft processor. Programming bitstreams are also included so you don't have to run through the full FPGA design flow in order to start developing software for RISC-V.

### Design Feature
The FPGA Designs include the following features
* CoreRISCV_AXI4 RV32IM RISC-V processor 
* RISC-V debug block allowing on-target debug using openocd/GDB
* On-chip NVM used as boot/execution memory
* DDR2 memory for code/data
* User peripherals such as GPIO, Timers, UART

The memory map for each design is available within each Libero project.

### Target Hardware
The IGLOO2 Creative Development Board includes a IGLOO2 M2GL025 FPGA. Details of the features available for this development board are available [here](https://www.microsemi.com/products/fpga-soc/design-resources/dev-kits/smartfusion2/future-creative-board) .

### Libero Projects
This folder contains CoreRISCV_AXI4 Libero V11.8 projects.

* CoreRISCV_AXI4_BaseDesign, contains a simple RISCV design which allows users to use basic peripherals such as GPIO, UART and Timers. 
* IGL2_CoreRISCV_AXI4_TickTackToe, contains the design used along side of the TickTackToe example software found [here](https://github.com/RISCV-on-Microsemi-FPGA/M2GL025-Creative-Board/tree/master/ExampleSoftware). To use this deisgn a daughter board is needed from Adafruit, more information on this can be found [here](https://www.adafruit.com/product/1651)


