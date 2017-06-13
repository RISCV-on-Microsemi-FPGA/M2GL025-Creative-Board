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
module CORERISCV_AXI4_BASIC_BUS_4(
  input   clk,
  input   reset,
  output  io_in_0_ready,
  input   io_in_0_valid,
  input  [1:0] io_in_0_bits_header_src,
  input  [1:0] io_in_0_bits_header_dst,
  input  [1:0] io_in_0_bits_payload_manager_xact_id,
  output  io_in_1_ready,
  input   io_in_1_valid,
  input  [1:0] io_in_1_bits_header_src,
  input  [1:0] io_in_1_bits_header_dst,
  input  [1:0] io_in_1_bits_payload_manager_xact_id,
  output  io_in_2_ready,
  input   io_in_2_valid,
  input  [1:0] io_in_2_bits_header_src,
  input  [1:0] io_in_2_bits_header_dst,
  input  [1:0] io_in_2_bits_payload_manager_xact_id,
  output  io_in_3_ready,
  input   io_in_3_valid,
  input  [1:0] io_in_3_bits_header_src,
  input  [1:0] io_in_3_bits_header_dst,
  input  [1:0] io_in_3_bits_payload_manager_xact_id,
  input   io_out_0_ready,
  output  io_out_0_valid,
  output [1:0] io_out_0_bits_header_src,
  output [1:0] io_out_0_bits_header_dst,
  output [1:0] io_out_0_bits_payload_manager_xact_id,
  input   io_out_1_ready,
  output  io_out_1_valid,
  output [1:0] io_out_1_bits_header_src,
  output [1:0] io_out_1_bits_header_dst,
  output [1:0] io_out_1_bits_payload_manager_xact_id,
  input   io_out_2_ready,
  output  io_out_2_valid,
  output [1:0] io_out_2_bits_header_src,
  output [1:0] io_out_2_bits_header_dst,
  output [1:0] io_out_2_bits_payload_manager_xact_id,
  input   io_out_3_ready,
  output  io_out_3_valid,
  output [1:0] io_out_3_bits_header_src,
  output [1:0] io_out_3_bits_header_dst,
  output [1:0] io_out_3_bits_payload_manager_xact_id
);
  wire  arb_clk;
  wire  arb_reset;
  wire  arb_io_in_0_ready;
  wire  arb_io_in_0_valid;
  wire [1:0] arb_io_in_0_bits_header_src;
  wire [1:0] arb_io_in_0_bits_header_dst;
  wire [1:0] arb_io_in_0_bits_payload_manager_xact_id;
  wire  arb_io_in_1_ready;
  wire  arb_io_in_1_valid;
  wire [1:0] arb_io_in_1_bits_header_src;
  wire [1:0] arb_io_in_1_bits_header_dst;
  wire [1:0] arb_io_in_1_bits_payload_manager_xact_id;
  wire  arb_io_in_2_ready;
  wire  arb_io_in_2_valid;
  wire [1:0] arb_io_in_2_bits_header_src;
  wire [1:0] arb_io_in_2_bits_header_dst;
  wire [1:0] arb_io_in_2_bits_payload_manager_xact_id;
  wire  arb_io_in_3_ready;
  wire  arb_io_in_3_valid;
  wire [1:0] arb_io_in_3_bits_header_src;
  wire [1:0] arb_io_in_3_bits_header_dst;
  wire [1:0] arb_io_in_3_bits_payload_manager_xact_id;
  wire  arb_io_out_ready;
  wire  arb_io_out_valid;
  wire [1:0] arb_io_out_bits_header_src;
  wire [1:0] arb_io_out_bits_header_dst;
  wire [1:0] arb_io_out_bits_payload_manager_xact_id;
  wire [1:0] arb_io_chosen;
  wire  GEN_0;
  wire  GEN_1;
  wire  GEN_2;
  wire  GEN_3;
  wire  T_1253;
  wire  T_1254;
  wire  T_1256;
  wire  T_1257;
  wire  T_1259;
  wire  T_1260;
  wire  T_1262;
  wire  T_1263;
  CORERISCV_AXI4_LOCKING_RR_ARBITER_4 arb (
    .clk(arb_clk),
    .reset(arb_reset),
    .io_in_0_ready(arb_io_in_0_ready),
    .io_in_0_valid(arb_io_in_0_valid),
    .io_in_0_bits_header_src(arb_io_in_0_bits_header_src),
    .io_in_0_bits_header_dst(arb_io_in_0_bits_header_dst),
    .io_in_0_bits_payload_manager_xact_id(arb_io_in_0_bits_payload_manager_xact_id),
    .io_in_1_ready(arb_io_in_1_ready),
    .io_in_1_valid(arb_io_in_1_valid),
    .io_in_1_bits_header_src(arb_io_in_1_bits_header_src),
    .io_in_1_bits_header_dst(arb_io_in_1_bits_header_dst),
    .io_in_1_bits_payload_manager_xact_id(arb_io_in_1_bits_payload_manager_xact_id),
    .io_in_2_ready(arb_io_in_2_ready),
    .io_in_2_valid(arb_io_in_2_valid),
    .io_in_2_bits_header_src(arb_io_in_2_bits_header_src),
    .io_in_2_bits_header_dst(arb_io_in_2_bits_header_dst),
    .io_in_2_bits_payload_manager_xact_id(arb_io_in_2_bits_payload_manager_xact_id),
    .io_in_3_ready(arb_io_in_3_ready),
    .io_in_3_valid(arb_io_in_3_valid),
    .io_in_3_bits_header_src(arb_io_in_3_bits_header_src),
    .io_in_3_bits_header_dst(arb_io_in_3_bits_header_dst),
    .io_in_3_bits_payload_manager_xact_id(arb_io_in_3_bits_payload_manager_xact_id),
    .io_out_ready(arb_io_out_ready),
    .io_out_valid(arb_io_out_valid),
    .io_out_bits_header_src(arb_io_out_bits_header_src),
    .io_out_bits_header_dst(arb_io_out_bits_header_dst),
    .io_out_bits_payload_manager_xact_id(arb_io_out_bits_payload_manager_xact_id),
    .io_chosen(arb_io_chosen)
  );
  assign io_in_0_ready = arb_io_in_0_ready;
  assign io_in_1_ready = arb_io_in_1_ready;
  assign io_in_2_ready = arb_io_in_2_ready;
  assign io_in_3_ready = arb_io_in_3_ready;
  assign io_out_0_valid = T_1254;
  assign io_out_0_bits_header_src = arb_io_out_bits_header_src;
  assign io_out_0_bits_header_dst = arb_io_out_bits_header_dst;
  assign io_out_0_bits_payload_manager_xact_id = arb_io_out_bits_payload_manager_xact_id;
  assign io_out_1_valid = T_1257;
  assign io_out_1_bits_header_src = arb_io_out_bits_header_src;
  assign io_out_1_bits_header_dst = arb_io_out_bits_header_dst;
  assign io_out_1_bits_payload_manager_xact_id = arb_io_out_bits_payload_manager_xact_id;
  assign io_out_2_valid = T_1260;
  assign io_out_2_bits_header_src = arb_io_out_bits_header_src;
  assign io_out_2_bits_header_dst = arb_io_out_bits_header_dst;
  assign io_out_2_bits_payload_manager_xact_id = arb_io_out_bits_payload_manager_xact_id;
  assign io_out_3_valid = T_1263;
  assign io_out_3_bits_header_src = arb_io_out_bits_header_src;
  assign io_out_3_bits_header_dst = arb_io_out_bits_header_dst;
  assign io_out_3_bits_payload_manager_xact_id = arb_io_out_bits_payload_manager_xact_id;
  assign arb_clk = clk;
  assign arb_reset = reset;
  assign arb_io_in_0_valid = io_in_0_valid;
  assign arb_io_in_0_bits_header_src = io_in_0_bits_header_src;
  assign arb_io_in_0_bits_header_dst = io_in_0_bits_header_dst;
  assign arb_io_in_0_bits_payload_manager_xact_id = io_in_0_bits_payload_manager_xact_id;
  assign arb_io_in_1_valid = io_in_1_valid;
  assign arb_io_in_1_bits_header_src = io_in_1_bits_header_src;
  assign arb_io_in_1_bits_header_dst = io_in_1_bits_header_dst;
  assign arb_io_in_1_bits_payload_manager_xact_id = io_in_1_bits_payload_manager_xact_id;
  assign arb_io_in_2_valid = io_in_2_valid;
  assign arb_io_in_2_bits_header_src = io_in_2_bits_header_src;
  assign arb_io_in_2_bits_header_dst = io_in_2_bits_header_dst;
  assign arb_io_in_2_bits_payload_manager_xact_id = io_in_2_bits_payload_manager_xact_id;
  assign arb_io_in_3_valid = io_in_3_valid;
  assign arb_io_in_3_bits_header_src = io_in_3_bits_header_src;
  assign arb_io_in_3_bits_header_dst = io_in_3_bits_header_dst;
  assign arb_io_in_3_bits_payload_manager_xact_id = io_in_3_bits_payload_manager_xact_id;
  assign arb_io_out_ready = GEN_0;
  assign GEN_0 = GEN_3;
  assign GEN_1 = 2'h1 == arb_io_out_bits_header_dst ? io_out_1_ready : io_out_0_ready;
  assign GEN_2 = 2'h2 == arb_io_out_bits_header_dst ? io_out_2_ready : GEN_1;
  assign GEN_3 = 2'h3 == arb_io_out_bits_header_dst ? io_out_3_ready : GEN_2;
  assign T_1253 = arb_io_out_bits_header_dst == 2'h0;
  assign T_1254 = arb_io_out_valid & T_1253;
  assign T_1256 = arb_io_out_bits_header_dst == 2'h1;
  assign T_1257 = arb_io_out_valid & T_1256;
  assign T_1259 = arb_io_out_bits_header_dst == 2'h2;
  assign T_1260 = arb_io_out_valid & T_1259;
  assign T_1262 = arb_io_out_bits_header_dst == 2'h3;
  assign T_1263 = arb_io_out_valid & T_1262;
endmodule
