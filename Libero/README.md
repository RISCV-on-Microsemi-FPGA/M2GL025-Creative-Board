### RISCV_BaseDesign for the IGLOOO2 Creative Development Kit

 
This design is targeted at the IGLOO2 Creative Development Kit. It uses
the CoreRISCV_AXI4 as its soft processor.
 
### Overview
   IGLOO2 M2GL025 Creative Development Board
   These projects use the DDR and eNVM.
   When setting up the DDR of the HPMS for a similar project, select "2T" as the timing
   mode in the Memory Initialization tab. Then continue to use the DDR configurations
   from the M2GL025 [manual](http://www.futureelectronics.com/en/Technologies/Product.aspx?ProductID=FUTUREM2SFEVBMICROSEMI8075272&IM=0) and request the manuals via the "Microsemi Click Here" button.
 
 
   After regenerating the smart design for the M2GL025/M2S025 RISCV Base Designs
   the following step must be taken before synthesis.
   Go to File-Component-Work-"SmartDesign-Name"-CoreRISCV_AXI-rtl-vlog-core-coreriscv_axi4_defines.v
   and uncomment " `define USE_REGISTERS"

	When setting up the DDR of the HPMS for a similar project, select "2T" as the timing 
	mode in the Memory Initialization tab. Then continue to use the DDR configurations 
	from the M2GL025 manual. 
 
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
 
--------------------------------------------------------------------------------
    Mirror Slave to Mirror Master AHB Bridge
--------------------------------------------------------------------------------
The Mirror Slave to Mirror Master AHB Bridge core is available from [IP-packages](https://github.com/RISCV-on-Microsemi-FPGA/riscv-junk-drawer/tree/master/IP-packages). This core allows for the connection of eNVM to the MMIO interface at 0x60000000.

### Notes
If UserCore is missing from the projects, they can be found at the link below in the IP-Packages [folder](https://github.com/RISCV-on-Microsemi-FPGA/riscv-junk-drawer) .


