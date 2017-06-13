// ***********************************************************************/
// Microsemi Corporation Proprietary and Confidential
// Copyright 2013 Microsemi Corporation.  All rights reserved.
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
// ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
// IN ADVANCE IN WRITING.
//
// Description:	Control state machine for mastering peripheral
//              configuration from fabric.
//              AHB-Lite master used to read config instructions/data
//              (typically from eNVM) and write the data to peripherals
//              via FIC_0 -> MSS -> FIC_2.
//
//
// SVN Revision Information:
// SVN $Revision: 22399 $
// SVN $Date: 2014-04-19 21:44:50 +0100 (Sat, 19 Apr 2014) $
//
// Notes:
//
// ***********************************************************************/

module CoreConfigMaster (
    input                   HCLK,
    input                   HRESETN,
    // AHB-Lite master interface
    output  reg     [31:0]  HADDR,
    output  reg      [2:0]  HSIZE,
    output  reg      [1:0]  HTRANS,
    output  reg             HWRITE,
    output  reg     [31:0]  HWDATA,
    output  wire            HMASTLOCK,
    output  wire     [2:0]  HBURST,
    output  wire     [3:0]  HPROT,
    input                   HREADY,
    input           [31:0]  HRDATA
    );

    parameter DATA_LOCATION = 0;

    parameter ADDR_SYSREG_SOFT_RESET = 32'h40038048;
    parameter ADDR_SYSREG_ENVM_BUSY  = 32'h40038158;

    // State names
    parameter S0  =  0;
    parameter S1  =  1;
    parameter S2  =  2;
    parameter S3  =  3;
    parameter S4  =  4;
    parameter S5  =  5;
    parameter S6  =  6;
    parameter S7  =  7;
    parameter S8  =  8;
    parameter S9  =  9;
    parameter S10 = 10;
    parameter S11 = 11;
    parameter S12 = 12;
    parameter S13 = 13;
    parameter S14 = 14;
    parameter S15 = 15;
    parameter S16 = 16;
    parameter S17 = 17;
    parameter S18 = 18;
    parameter S19 = 19;
    parameter S20 = 20;
    parameter S21 = 21;
    parameter S22 = 22;

    parameter P0  = 32;
    parameter P1  = 33;
    parameter P2  = 34;
    parameter P3  = 35;
    parameter P4  = 36;
    parameter P5  = 37;
    parameter P6  = 38;


    // Operation codes
    parameter [6:0] OP_COPY     = 7'b0000000;
    //                            7'b0000001;
    parameter [6:0] OP_POLL     = 7'b0000010;
    parameter [6:0] OP_LOAD     = 7'b0000011;
    parameter [6:0] OP_STORE    = 7'b0000100;
    parameter [6:0] OP_AND      = 7'b0000101;
    parameter [6:0] OP_OR       = 7'b0000110;


    reg [5:0]   state;
    reg [31:0]  haddr_fetch;
    reg [31:0]  haddr_write;
    reg [31:0]  ins1;
    reg [31:0]  ins2;
    reg         last;
    reg [6:0]   opcode;
    reg [3:0]   size;
    reg [3:0]   addrinc;
    reg [15:0]  numbytes;
    reg [31:0]  addr;
    reg [31:0]  rdata;
    reg [15:0]  bytecount;
    reg [1:0]   count;
    reg [31:0]  mask;
    reg [31:0]  expected;
    reg [1:0]   envm_soft_reset;
    reg [1:0]   envm_busy;
    reg         busy;
    reg [4:0]   pause_count;
    reg [31:0]  acc;

    reg [5:0]   d_state;
    reg [31:0]  d_HADDR;
    reg [31:0]  d_haddr_fetch;
    reg [31:0]  d_haddr_write;
    reg [2:0]   d_HSIZE;
    reg [1:0]   d_HTRANS;
    reg         d_HWRITE;
    reg [31:0]  d_HWDATA;
    reg [31:0]  d_ins1;
    reg [31:0]  d_ins2;
    reg [31:0]  d_rdata;
    reg [15:0]  d_bytecount;
    reg [1:0]   d_count;
    reg [31:0]  d_mask;
    reg [31:0]  d_expected;
    reg [1:0]   d_envm_soft_reset;
    reg [1:0]   d_envm_busy;
    reg         d_busy;
    reg [4:0]   d_pause_count;
    reg [31:0]  d_acc;

    //---------------------------------------------------------------------
    // Signal tie-offs
    //---------------------------------------------------------------------
    assign HMASTLOCK = 1'b0;
    assign HBURST    = 3'b0;
    assign HPROT     = 4'b0;

    //---------------------------------------------------------------------
    // Main state machine
    //---------------------------------------------------------------------
    always @(*)
    begin
        d_state = state;
        d_HADDR = HADDR;
        d_haddr_fetch = haddr_fetch;
        d_haddr_write = haddr_write;
        d_HSIZE = HSIZE;
        d_HTRANS = HTRANS;
        d_HWRITE = HWRITE;
        d_HWDATA = HWDATA;
        d_ins1 = ins1;
        d_ins2 = ins2;
        d_bytecount = bytecount;
        d_count = count;
        d_rdata = rdata;
        d_mask = mask;
        d_expected = expected;
        d_envm_soft_reset = envm_soft_reset;
        d_envm_busy = envm_busy;
        d_busy = busy;
        d_pause_count = pause_count;
        d_acc = acc;
        case (state)
            //-------------------------------------------------------------
            // First check that eNVM is ready to be read (i.e. not busy)
            //-------------------------------------------------------------
            P0:
            begin
                d_state = P1;
                d_HTRANS = 2'b10;
            end
            P1:
            begin
                d_HADDR = ADDR_SYSREG_ENVM_BUSY;
                d_state = P2;
            end
            P2:
            begin
                if (HREADY)
                begin
                    d_envm_soft_reset = HRDATA[1:0];
                    d_HTRANS = 2'b00;
                    d_state = P3;
                end
            end
            P3:
            begin
                if (HREADY)
                begin
                    d_envm_busy = HRDATA[1:0];
                    d_state = P4;
                end
            end
            P4:
            begin
                // envm_soft_reset bits are high if eNVM is being held in reset
                // envm_busy bits are high if eNVM is busy
                d_busy = |(~envm_soft_reset & envm_busy);
                d_state = P5;
            end
            P5:
            begin
                if (busy)
                begin
                    d_pause_count = 5'b00000;
                    d_state = P6;
                end
                else
                begin
                    d_HADDR = DATA_LOCATION;
                    d_state = S0;
                end
            end
            P6:
            begin
                if (pause_count == 5'b11111)
                begin
                    d_HADDR = ADDR_SYSREG_SOFT_RESET;
                    d_state = P0;
                end
                else
                begin
                    d_pause_count = pause_count + 1'b1;
                end
            end
            //-------------------------------------------------------------
            // Start reading from eNVM
            //-------------------------------------------------------------
            S0:
            begin
                d_state = S1;
                d_HTRANS = 2'b10;
            end
            S1:
            begin
                d_HADDR = HADDR + 4;
                d_state = S2;
            end
            S2:
            begin
                if (HREADY)
                begin
                    d_ins1 = HRDATA;
                    d_HADDR = HADDR + 4;
                    d_state = S3;
                end
            end
            S3:
            begin
                if (opcode == OP_COPY)
                begin
                    d_bytecount = numbytes;
                    d_haddr_fetch = HADDR + 4;
                    if (HREADY)
                    begin
                        d_ins2 = HRDATA;
                        d_HTRANS = 2'b00;
                        d_state = S4;
                    end
                end
                else if (opcode == OP_POLL) // poll
                begin
                    if (HREADY)
                    begin
                        d_ins2 = HRDATA;
                        d_HADDR = HADDR + 4;
                        d_state = S10;
                    end
                end
                else if (opcode == OP_LOAD) // load
                begin
                    if (HREADY)
                    begin
                        d_ins2 = HRDATA;
                        d_haddr_fetch = HADDR;
                        d_HTRANS = 2'b00;
                        d_state = S15;
                    end
                end
                else if (opcode == OP_STORE) // store
                begin
                    if (HREADY)
                    begin
                        d_ins2 = HRDATA;
                        d_haddr_fetch = HADDR;
                        d_HTRANS = 2'b00;
                        d_state = S18;
                    end
                end
                else if (opcode == OP_AND) // AND
                begin
                    if (HREADY)
                    begin
                        d_ins2 = HRDATA;
                        d_haddr_fetch = HADDR;
                        d_state = S21;
                    end
                end
                else if (opcode == OP_OR) // OR
                begin
                    if (HREADY)
                    begin
                        d_ins2 = HRDATA;
                        d_haddr_fetch = HADDR;
                        d_state = S22;
                    end
                end
                else // default to ORing acc with 0x00000000
                begin
                    if (HREADY)
                    begin
                        d_ins2 = 32'b0;
                        d_haddr_fetch = HADDR;
                        d_state = S22;
                    end
                end
            end
            //-------------------------------------------------------------
            // Copy
            //-------------------------------------------------------------
            S4:
            begin
                if (HREADY)
                begin
                    d_rdata = HRDATA;
                    d_HADDR = addr;
                    d_HTRANS = 2'b10;
                    d_HWRITE = 1'b1;
                    d_state = S6;
                    d_count = 2'b00;

                    if (size == 4'b0010)        // word
                    begin
                        d_HSIZE = 3'b010;
                    end
                    else if (size == 4'b0001)   // halfword
                    begin
                        d_HSIZE = 3'b001;
                    end
                    else                        // byte
                    begin
                        d_HSIZE = 3'b000;
                    end
                end
            end
            S5:
            begin
                if (HREADY)
                begin
                    d_rdata = HRDATA;
                    d_haddr_fetch = HADDR + 4;
                    d_HADDR = haddr_write;
                    d_HTRANS = 2'b10;
                    d_HWRITE = 1'b1;
                    d_state = S6;
                    d_count = 2'b00;
                end
            end
            S6:
            begin
                d_HADDR = HADDR + addrinc;
                d_state = S7;
                if (size == 4'b0010)        // word
                begin
                    d_bytecount = bytecount - 4;
                    d_count = count + 4;
                    d_HWDATA = rdata;
                    d_haddr_write = HADDR + addrinc;
                    d_HADDR = haddr_fetch;
                    d_HWRITE = 1'b0;
                    // Detect if there's only one write left to perform
                    if (bytecount == 4)
                    begin
                        if (last)
                        begin
                            d_HTRANS = 2'b00;
                        end
                    end
                end
                else if (size == 4'b0001)   // halfword
                begin
                    d_bytecount = bytecount - 2;
                    d_count = count + 2;
                    if (count[1])
                    begin
                        d_HWDATA = {rdata[31:16], rdata[31:16]};
                    end
                    else
                    begin
                        d_HWDATA = {rdata[15:0], rdata[15:0]};
                    end
                    // Detect if there's only one write left to perform
                    if (bytecount == 2)
                    begin
                        d_haddr_write = HADDR + addrinc;
                        d_HADDR = haddr_fetch;
                        d_HWRITE = 1'b0;
                        if (last)
                        begin
                            d_HTRANS = 2'b00;
                        end
                    end
                end
                else                        // byte
                begin
                    d_bytecount = bytecount - 1;
                    d_count = count + 1;
                    case (count[1:0])
                        2'b00: d_HWDATA = {rdata[ 7: 0],rdata[ 7: 0],rdata[ 7: 0],rdata[ 7: 0]};
                        2'b01: d_HWDATA = {rdata[15: 8],rdata[15: 8],rdata[15: 8],rdata[15: 8]};
                        2'b10: d_HWDATA = {rdata[23:16],rdata[23:16],rdata[23:16],rdata[23:16]};
                        2'b11: d_HWDATA = {rdata[31:24],rdata[31:24],rdata[31:24],rdata[31:24]};
                        default: d_HWDATA = rdata;
                    endcase
                    // Detect if there's only one write left to perform
                    if (bytecount == 1)
                    begin
                        d_haddr_write = HADDR + addrinc;
                        d_HADDR = haddr_fetch;
                        d_HWRITE = 1'b0;
                        if (last)
                        begin
                            d_HTRANS = 2'b00;
                        end
                    end
                end
            end
            S7:
            begin
                if (bytecount == 0)
                begin
                    if (last)
                    begin
                        if (HREADY)
                        begin
                            d_HWRITE = 1'b0;
                            d_HTRANS = 2'b00;
                            d_state = S9;
                        end
                    end
                    else // get next record
                    begin
                        if (HREADY)
                        begin
                            d_HADDR = HADDR + 4;
                            d_HSIZE = 3'b010;
                            d_HWRITE = 1'b0;
                            d_HTRANS = 2'b10;
                            d_state = S2;
                        end
                    end
                end
                else
                begin
                    if (size == 4'b0010)
                    begin
                        if (HREADY)
                        begin
                            d_state = S5;
                            d_HWRITE = 1'b0;
                            d_HTRANS = 2'b00;
                        end
                    end
                    else if (size == 4'b0001)
                    begin
                        if (count == 2'b00)
                        begin
                            if (HREADY)
                            begin
                                d_HWRITE = 1'b0;
                                d_HTRANS = 2'b00;
                                d_state = S5;
                            end
                        end
                        else
                        begin
                            if (HREADY)
                            begin
                                d_HADDR = HADDR + addrinc;
                                d_count = count + 2;
                                d_bytecount = bytecount - 2;
                                if (count[1])
                                begin
                                    d_HWDATA = {rdata[31:16], rdata[31:16]};
                                    d_haddr_write = HADDR + addrinc;
                                    d_HADDR = haddr_fetch;
                                    d_HWRITE = 1'b0;
                                    d_HTRANS = 2'b10;
                                end
                                else
                                begin
                                    d_HWDATA = {rdata[15:0], rdata[15:0]};
                                end
                            end
                        end
                    end
                    else
                    begin
                        if (count == 2'b00)
                        begin
                            if (HREADY)
                            begin
                                d_HWRITE = 1'b0;
                                d_HTRANS = 2'b00;
                                d_state = S5;
                            end
                        end
                        else
                        begin
                            if (HREADY)
                            begin
                                d_HADDR = HADDR + addrinc;
                                d_count = count + 1;
                                d_bytecount = bytecount - 1;
                                case (count[1:0])
                                    2'b00: d_HWDATA = {rdata[ 7: 0],rdata[ 7: 0],rdata[ 7: 0],rdata[ 7: 0]};
                                    2'b01: d_HWDATA = {rdata[15: 8],rdata[15: 8],rdata[15: 8],rdata[15: 8]};
                                    2'b10: d_HWDATA = {rdata[23:16],rdata[23:16],rdata[23:16],rdata[23:16]};
                                    2'b11: begin
                                                d_HWDATA = {rdata[31:24],rdata[31:24],rdata[31:24],rdata[31:24]};
                                                d_haddr_write = HADDR + addrinc;
                                                d_HADDR = haddr_fetch;
                                                d_HWRITE = 1'b0;
                                                d_HTRANS = 2'b10;
                                           end
                                    default: d_HWDATA = rdata;
                                endcase
                            end
                        end
                    end
                end
            end
            //-------------------------------------------------------------
            // Finish
            //-------------------------------------------------------------
            S9:
            begin
                d_state = S9;
            end
            //-------------------------------------------------------------
            // Poll
            //-------------------------------------------------------------
            S10:
            begin
                if (HREADY)
                begin
                    d_mask = HRDATA;
                    d_HADDR = addr;
                    d_haddr_fetch = HADDR + 4;
                    d_state = S11;
                end
            end
            S11:
            begin
                if (HREADY)
                begin
                    d_expected = HRDATA;
                    d_HTRANS = 2'b00;
                    d_state = S12;
                end
            end
            S12:
            begin
                if (HREADY)
                begin
                    d_rdata = HRDATA;
                    d_state = S13;
                end
            end
            S13:
            begin
                if ((rdata & mask) == expected)
                begin
                    if (last)
                    begin
                        d_state = S9;
                    end
                    else // get next instruction
                    begin
                        d_HADDR = haddr_fetch;
                        d_HTRANS = 2'b10;
                        d_state = S1;
                    end
                end
                else // poll again
                begin
                    d_HTRANS = 2'b10;
                    d_state = S14;
                end
            end
            S14:
            begin
                d_HTRANS = 2'b00;
                d_state = S12;
            end
            //-------------------------------------------------------------
            // Load
            //-------------------------------------------------------------
            S15:
            begin
                if (HREADY)
                begin
                    d_HADDR = addr;
                    d_HTRANS = 2'b10;
                    d_state = S16;
                end
            end
            S16:
            begin
                if (HREADY)
                begin
                    d_HTRANS = 2'b00;
                    d_state = S17;
                end
            end
            S17:
            begin
                if (HREADY)
                begin
                    d_acc = HRDATA;
                    if (last)
                    begin
                        d_state = S9;
                    end
                    else // get next instruction
                    begin
                        d_HADDR = haddr_fetch;
                        d_HTRANS = 2'b10;
                        d_state = S1;
                    end
                end
            end
            //-------------------------------------------------------------
            // Store
            //-------------------------------------------------------------
            S18:
            begin
                if (HREADY)
                begin
                    d_HADDR = addr;
                    d_HTRANS = 2'b10;
                    d_HWRITE = 1'b1;
                    d_state = S19;
                end
            end
            S19:
            begin
                if (HREADY)
                begin
                    d_HWDATA = acc;
                    d_HTRANS = 2'b00;
                    d_HWRITE = 1'b0;
                    d_state = S20;
                end
            end
            S20:
            begin
                if (HREADY)
                begin
                    if (last)
                    begin
                        d_state = S9;
                    end
                    else // get next instruction
                    begin
                        d_HADDR = haddr_fetch;
                        d_HTRANS = 2'b10;
                        d_state = S1;
                    end
                end
            end
            //-------------------------------------------------------------
            // AND
            //-------------------------------------------------------------
            S21:
            begin
                d_HTRANS = 2'b00;
                d_acc = acc & ins2;
                if (HREADY)
                begin
                    if (last)
                    begin
                        d_state = S9;
                    end
                    else // get next instruction
                    begin
                        d_HADDR = haddr_fetch;
                        d_HTRANS = 2'b10;
                        d_state = S1;
                    end
                end
            end
            //-------------------------------------------------------------
            // OR
            //-------------------------------------------------------------
            S22:
            begin
                d_HTRANS = 2'b00;
                d_acc = acc | ins2;
                if (HREADY)
                begin
                    if (last)
                    begin
                        d_state = S9;
                    end
                    else // get next instruction
                    begin
                        d_HADDR = haddr_fetch;
                        d_HTRANS = 2'b10;
                        d_state = S1;
                    end
                end
            end
            default:
            begin
                d_state = S9;
            end
        endcase
    end

    // Synchronous part of state machine
    always @(posedge HCLK or negedge HRESETN)
    begin
        if (!HRESETN)
        begin
            state           <= P0;
            HADDR           <= ADDR_SYSREG_SOFT_RESET;
            haddr_fetch     <= 32'b0;
            haddr_write     <= 32'b0;
            HSIZE           <= 3'b010;      // word
            HTRANS          <= 2'b00;
            HWRITE          <= 1'b0;
            HWDATA          <= 32'b0;
            ins1            <= 32'b0;
            ins2            <= 32'b0;
            rdata           <= 32'b0;
            bytecount       <= 16'b0;
            count           <= 2'b0;
            mask            <= 32'b0;
            expected        <= 32'b0;
            envm_soft_reset <= 2'b0;
            envm_busy       <= 2'b0;
            busy            <= 1'b0;
            pause_count     <= 5'b0;
            acc             <= 32'b0;
        end
        else
        begin
            state           <= d_state;
            HADDR           <= d_HADDR;
            haddr_fetch     <= d_haddr_fetch;
            haddr_write     <= d_haddr_write;
            HSIZE           <= d_HSIZE;
            HTRANS          <= d_HTRANS;
            HWRITE          <= d_HWRITE;
            HWDATA          <= d_HWDATA;
            ins1            <= d_ins1;
            ins2            <= d_ins2;
            rdata           <= d_rdata;
            bytecount       <= d_bytecount;
            count           <= d_count;
            mask            <= d_mask;
            expected        <= d_expected;
            envm_soft_reset <= d_envm_soft_reset;
            envm_busy       <= d_envm_busy;
            busy            <= d_busy;
            pause_count     <= d_pause_count;
            acc             <= d_acc;
        end
    end

    always @(*)
    begin
        last     = ins1[31];
        opcode   = ins1[30:24];
        size     = ins1[23:20];
        addrinc  = ins1[19:16];
        numbytes = ins1[15: 0];
        addr     = ins2;
    end

endmodule
