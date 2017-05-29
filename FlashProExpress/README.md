RISCV_BaseDesign for the IGLOOO2 Creative Development Kit

 
These designs target the IGLOO2 Creative Development Kit. They use
the CoreRISCV_AXI4 as its soft processor.

* The first FlashPro Express Project, IGL2_CoreRISCV_BaseDesign, contains a simple RISCV design which allows users to use basic peripherals such as GPIO, UART and Timers. 
* The second FlashPro Express Project, IGL2_CoreRISCV_TickTackToe, contains the design used along side of the TickTackToe example software found [here](https://github.com/RISCV-on-Microsemi-FPGA/M2GL025-Creative-Board/tree/master/ExampleSoftware) . To use this deisgn a daughter board is needed from Adafruit, more information on this can be found [here](https://www.adafruit.com/product/1651)

 
--------------------------------------------------------------------------------
    Memory map
--------------------------------------------------------------------------------
 
0x60000000: NVM Flash memory containing the RISC-V processor reset vector and
            application code.
 
0x70001000: CoreUART
0x70002000: CoreGPIO inputs
0x70003000: CoreTimer0
0x70004000: CoreTimer1
0x70005000: CoreGPIO outputs
 
0x80000000: DDR memory.
 
