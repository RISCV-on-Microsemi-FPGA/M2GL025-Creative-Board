///////////////////////////////////////////////////////////////////////////////////////////////////
// Company: <Name>
//
// File: tesgsrg.v
// File history:
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//
// Description: 
//
// <Description here>
//
// Targeted device: <Family::IGLOO2> <Die::M2GL025> <Package::256 VF>
// Author: <Name>
//
/////////////////////////////////////////////////////////////////////////////////////////////////// 

`timescale 1ns/100ps

module tesgsrg;

parameter SYSCLK_PERIOD = 100;// 10MHZ

reg SYSCLK;
reg NSYSRESET;

initial
begin
    SYSCLK = 1'b0;
    NSYSRESET = 1'b0;
end

//////////////////////////////////////////////////////////////////////
// Reset Pulse
//////////////////////////////////////////////////////////////////////
initial
begin
    #(SYSCLK_PERIOD * 10 )
        NSYSRESET = 1'b1;
end


//////////////////////////////////////////////////////////////////////
// Clock Driver
//////////////////////////////////////////////////////////////////////
always @(SYSCLK)
    #(SYSCLK_PERIOD / 2.0) SYSCLK <= !SYSCLK;


//////////////////////////////////////////////////////////////////////
// Instantiate Unit Under Test:  PROC_SUBSYSTEM
//////////////////////////////////////////////////////////////////////
PROC_SUBSYSTEM PROC_SUBSYSTEM_0 (
    // Inputs
    .MDDR_DQS_TMATCH_0_IN(NSYSRESET),
    .DEVRST_N(NSYSRESET),
    .RX({1{1'b0}}),
    .TRSTB(NSYSRESET),
    .TDI({1{1'b0}}),
    .TMS({1{1'b0}}),
    .TCK({1{1'b0}}),
    .CLK0_PAD(SYSCLK),
    .SPI_FLASH_SDI({1{1'b0}}),
    .GPIO_IN({2{1'b0}}),

    // Outputs
    .MDDR_DQS_TMATCH_0_OUT( ),
    .MDDR_CAS_N( ),
    .MDDR_CLK( ),
    .MDDR_CLK_N( ),
    .MDDR_CKE( ),
    .MDDR_CS_N( ),
    .MDDR_ODT( ),
    .MDDR_RAS_N( ),
    .MDDR_RESET_N( ),
    .MDDR_WE_N( ),
    .TX( ),
    .TDO( ),
    .INIT_DONE( ),
    .SPI_FLASH_SCLK( ),
    .TFT_EN( ),
    .SPI_FLASH_SDO( ),
    .MDDR_ADDR( ),
    .MDDR_BA( ),
    .GPIO_OUT_0( ),

    // Inouts
    .MDDR_DM_RDQS( ),
    .MDDR_DQ( ),
    .MDDR_DQS( ),
    .MDDR_DQS_N( )

);

endmodule

