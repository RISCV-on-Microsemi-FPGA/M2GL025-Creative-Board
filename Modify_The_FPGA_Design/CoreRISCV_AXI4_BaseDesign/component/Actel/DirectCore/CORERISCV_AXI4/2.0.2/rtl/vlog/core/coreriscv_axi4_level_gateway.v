// ****************************************************************************/
// Microsemi Corporation Proprietary and Confidential
// Copyright 2017 Microsemi Corporation.  All rights reserved.
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
// ACCORDANCE WITH THE MICROSEMI LICENSE AGREEMENT AND MUST BE APPROVED
// IN ADVANCE IN WRITING.
//
// Description: 
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
`define RANDOMIZE
`timescale 1ns/10ps
module CORERISCV_AXI4_LEVEL_GATEWAY(
  input   clk,
  input   reset,
  input   io_interrupt,
  output  io_plic_valid,
  input   io_plic_ready,
  input   io_plic_complete
);
  reg  inFlight;
  reg [31:0] GEN_2;
  wire  T_6;
  wire  GEN_0;
  wire  GEN_1;
  wire  T_10;
  wire  T_11;
  assign io_plic_valid = T_11;
  assign T_6 = io_interrupt & io_plic_ready;
  assign GEN_0 = T_6 ? 1'h1 : inFlight;
  assign GEN_1 = io_plic_complete ? 1'h0 : GEN_0;
  assign T_10 = inFlight == 1'h0;
  assign T_11 = io_interrupt & T_10;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002;
    `endif
  `ifdef RANDOMIZE
  GEN_2 = {1{$random}};
  inFlight = GEN_2[0:0];
  `endif
  end
`endif
  always @(posedge clk) begin
    if(reset) begin
      inFlight <= 1'h0;
    end else begin
      if(io_plic_complete) begin
        inFlight <= 1'h0;
      end else begin
        if(T_6) begin
          inFlight <= 1'h1;
        end
      end
    end
  end
endmodule
