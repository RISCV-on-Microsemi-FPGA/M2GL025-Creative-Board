### M2GL025-Creative-Board

### Overview
	IGLOO2 M2GL025 Creative Development Board
	This project uses the DDR and an CoreAHBLSRAM. It is an example project which can be
	used as a starting point for developement on the RISCV platform.

	When setting up the DDR of the HPMS for a similar project, select "2T" as the timing 
	mode in the Memory Initialization tab. Then continue to use the DDR configurations 
	from the M2GL025 manual. 
	

	After regenerating the smart design for either RISCV projects for the M2GL025 
	add the	following line to each of the signals below:

	/* synthesis syn_ramstyle = "registers" */

	If this is not added the design will fail synthesis with a ram error.

### Signals 

	CoreRISCV_AXI4 -> Top.v 
	ram_payload_addr_beat [0:1]; 
	ram_payload_addr_block [0:1]; 
	ram_payload_data [0:1];
	ram_data [0:1]; 
	ram_id [0:1]; 
	ram_strb [0:1];

	Files -> Component -> Actel -> DirectCore -> COREAXITOAHBL -> 3.0.101 -> rtl -> vlog 
	-> core -> CoreAXItoAHB_RAM_syncWrAsyncRd.v

	reg [63:0] mem [15:0];

	e.g. ram_id [0:1] /* synthesis syn_ramstyle = "registers" */;


