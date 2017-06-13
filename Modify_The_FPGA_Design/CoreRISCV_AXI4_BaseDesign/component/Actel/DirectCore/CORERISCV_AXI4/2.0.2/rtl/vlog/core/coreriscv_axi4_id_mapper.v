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
module CORERISCV_AXI4_ID_MAPPER(
  input   clk,
  input   reset,
  input   io_req_valid,
  output  io_req_ready,
  input  [1:0] io_req_in_id,
  output [4:0] io_req_out_id,
  input   io_resp_valid,
  output  io_resp_matches,
  input  [4:0] io_resp_out_id,
  output [1:0] io_resp_in_id
);
  assign io_req_ready = 1'h1;
  assign io_req_out_id = {{3'd0}, io_req_in_id};
  assign io_resp_matches = 1'h1;
  assign io_resp_in_id = io_resp_out_id[1:0];
endmodule
