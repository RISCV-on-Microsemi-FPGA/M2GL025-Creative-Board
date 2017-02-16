// ****************************************************************************/
// Microsemi Corporation Proprietary and Confidential
// Copyright 2017 Microsemi Corporation.  All rights reserved.
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
// ACCORDANCE WITH THE MICROSEMI LICENSE AGREEMENT AND MUST BE APPROVED
// IN ADVANCE IN WRITING.
//
// Description: AHB Mirrored slave to Mirrored master bridge
//
// SVN Revision Information:
// SVN $Revision: $
// SVN $Date: $
//
// Resolved SARs
// SAR      Date     Who   Description
//
// Notes:
//
// ****************************************************************************/
module MIRSLV2MIRMSTRBRIDGE_AHB (
    // General inputs
    clock,
    resetn,

    // Slave inputs (Inputs from mirrored slave) 
    HADDR_SLAVE,
    HTRANS_SLAVE,
    HSIZE_SLAVE,
    HWDATA_SLAVE,
    HBURST_SLAVE,
    HPROT_SLAVE,
    HWRITE_SLAVE,
    HMASTLOCK_SLAVE,
    HREADY_SLAVE,
    HSEL_SLAVE,

    // Master inputs (Inputs from mirrored master)
    HREADY_MASTER,
    HRDATA_MASTER,
    HRESP_MASTER,

    // Slave outputs (Outputs to mirrored slave)
    HREADYOUT_SLAVE, 
    HRDATA_SLAVE,
    HRESP_SLAVE,

    // Master outputs (Outputs to mirrored master)
    HADDR_MASTER,
    HTRANS_MASTER,
    HSIZE_MASTER,
    HWDATA_MASTER,
    HBURST_MASTER,
    HPROT_MASTER,
    HWRITE_MASTER,
    HMASTLOCK_MASTER
);

////////////////////////////////////////////////////////////////////////////////
// Parameters
////////////////////////////////////////////////////////////////////////////////
parameter MSTR_DRI_UPR_4_ADDR_BITS = 1;
parameter UPR_4_ADDR_BITS          = 4'b0000;

////////////////////////////////////////////////////////////////////////////////
// Port directions
////////////////////////////////////////////////////////////////////////////////
// General inputs
input               clock;
input               resetn;

// Slave inputs (Inputs from mirrored slave) 
input   [31:0]      HADDR_SLAVE;
input   [1:0]       HTRANS_SLAVE;
input   [2:0]       HSIZE_SLAVE;
input   [31:0]      HWDATA_SLAVE;
input   [2:0]       HBURST_SLAVE;
input   [3:0]       HPROT_SLAVE;
input               HWRITE_SLAVE;
input               HMASTLOCK_SLAVE;
input               HREADY_SLAVE;
input               HSEL_SLAVE;

// Master inputs (Inputs from mirrored master)
input               HREADY_MASTER;
input   [31:0]      HRDATA_MASTER;
input   [1:0]       HRESP_MASTER;

// Slave outputs (Outputs to mirrored slave)
output              HREADYOUT_SLAVE; 
output  [31:0]      HRDATA_SLAVE;
output  [1:0]       HRESP_SLAVE;

// Master outputs (Outputs to mirrored master)
output  [31:0]      HADDR_MASTER;
output  [1:0]       HTRANS_MASTER;
output  [2:0]       HSIZE_MASTER;
output  [31:0]      HWDATA_MASTER;
output  [2:0]       HBURST_MASTER;
output  [3:0]       HPROT_MASTER;
output              HWRITE_MASTER;
output              HMASTLOCK_MASTER;

////////////////////////////////////////////////////////////////////////////////
// Constants
////////////////////////////////////////////////////////////////////////////////
localparam [1:0]    ADDR = 2'b01;
localparam [1:0]    DATA = 2'b10;

////////////////////////////////////////////////////////////////////////////////
// Internal signals
////////////////////////////////////////////////////////////////////////////////
reg [1:0]           currState;
reg [1:0]           nextState;
reg                 driveMaster; // Combinatorial

////////////////////////////////////////////////////////////////////////////////
// driveMaster FSM: Current state register
////////////////////////////////////////////////////////////////////////////////
always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
            currState <= ADDR;
        else
            currState <= nextState;
    end

////////////////////////////////////////////////////////////////////////////////
// driveMaster FSM: Next state & driveMaster combinatorial logic
////////////////////////////////////////////////////////////////////////////////
always @ (*)
    begin
        case (currState)
            ADDR:
                begin
                    if (HSEL_SLAVE & HREADY_SLAVE)
                        begin
                            driveMaster = 1'b1;
                            nextState   = DATA;
                        end
                    else
                        begin
                            driveMaster = 1'b0;
                            nextState   = ADDR;
                        end
                end
            DATA:
                begin
                    driveMaster = 1'b1;
                    if (HREADY_MASTER)
                        begin
                            // AHB pipelined address phase
                            if (HSEL_SLAVE & HREADY_SLAVE)
                                begin
                                    nextState   = DATA;
                                end
                            else
                                begin
                                    nextState   = ADDR;
                                end
                        end
                    else
                        begin
                            nextState = DATA;
                        end
                end
            default:
                begin
                    nextState   = ADDR;
                    driveMaster = 1'b0;
                end
        endcase
    end

////////////////////////////////////////////////////////////////////////////////
// Master outputs (Outputs to mirrored master)
////////////////////////////////////////////////////////////////////////////////
generate
    if (MSTR_DRI_UPR_4_ADDR_BITS == 1'b1)
        begin
            assign HADDR_MASTER = (driveMaster == 1'b1) ? HADDR_SLAVE: {32{1'b0}};
        end
    else
        begin
            assign HADDR_MASTER = (driveMaster == 1'b1) ? {UPR_4_ADDR_BITS[3:0] ,HADDR_SLAVE[27:0]} : {32{1'b0}};
        end
endgenerate

assign HTRANS_MASTER     = (driveMaster == 1'b1) ? HTRANS_SLAVE    : {2{1'b0}};
assign HSIZE_MASTER      = (driveMaster == 1'b1) ? HSIZE_SLAVE     : {3{1'b0}};
assign HWDATA_MASTER     = (driveMaster == 1'b1) ? HWDATA_SLAVE    : {32{1'b0}};
assign HBURST_MASTER     = (driveMaster == 1'b1) ? HBURST_SLAVE    : {3{1'b0}};
assign HPROT_MASTER      = (driveMaster == 1'b1) ? HPROT_SLAVE     : {4{1'b0}};
assign HWRITE_MASTER     = (driveMaster == 1'b1) ? HWRITE_SLAVE    : 1'b0;
assign HMASTLOCK_MASTER  = (driveMaster == 1'b1) ? HMASTLOCK_SLAVE : 1'b0;

////////////////////////////////////////////////////////////////////////////////
// Slave outputs (Outputs to mirrored slave)
////////////////////////////////////////////////////////////////////////////////
assign HRDATA_SLAVE    = HRDATA_MASTER;
assign HRESP_SLAVE     = HRESP_MASTER;
assign HREADYOUT_SLAVE = HREADY_MASTER;

endmodule // MIRSLV2MIRMSTRBRIDGE_AHB