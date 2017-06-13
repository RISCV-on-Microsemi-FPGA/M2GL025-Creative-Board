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
module CORERISCV_AXI4_ARBITER_2(
  input   clk,
  input   reset,
  output  io_in_0_ready,
  input   io_in_0_valid,
  input  [12:0] io_in_0_bits_addr,
  input   io_in_0_bits_write,
  input  [63:0] io_in_0_bits_wdata,
  input  [7:0] io_in_0_bits_wmask,
  input   io_in_0_bits_way_en,
  output  io_in_1_ready,
  input   io_in_1_valid,
  input  [12:0] io_in_1_bits_addr,
  input   io_in_1_bits_write,
  input  [63:0] io_in_1_bits_wdata,
  input  [7:0] io_in_1_bits_wmask,
  input   io_in_1_bits_way_en,
  output  io_in_2_ready,
  input   io_in_2_valid,
  input  [12:0] io_in_2_bits_addr,
  input   io_in_2_bits_write,
  input  [63:0] io_in_2_bits_wdata,
  input  [7:0] io_in_2_bits_wmask,
  input   io_in_2_bits_way_en,
  output  io_in_3_ready,
  input   io_in_3_valid,
  input  [12:0] io_in_3_bits_addr,
  input   io_in_3_bits_write,
  input  [63:0] io_in_3_bits_wdata,
  input  [7:0] io_in_3_bits_wmask,
  input   io_in_3_bits_way_en,
  input   io_out_ready,
  output  io_out_valid,
  output [12:0] io_out_bits_addr,
  output  io_out_bits_write,
  output [63:0] io_out_bits_wdata,
  output [7:0] io_out_bits_wmask,
  output  io_out_bits_way_en,
  output [1:0] io_chosen
);
  wire [1:0] GEN_0;
  wire [12:0] GEN_1;
  wire  GEN_2;
  wire [63:0] GEN_3;
  wire [7:0] GEN_4;
  wire  GEN_5;
  wire [1:0] GEN_6;
  wire [12:0] GEN_7;
  wire  GEN_8;
  wire [63:0] GEN_9;
  wire [7:0] GEN_10;
  wire  GEN_11;
  wire [1:0] GEN_12;
  wire [12:0] GEN_13;
  wire  GEN_14;
  wire [63:0] GEN_15;
  wire [7:0] GEN_16;
  wire  GEN_17;
  wire  T_2025;
  wire  T_2026;
  wire  T_2028;
  wire  T_2030;
  wire  T_2032;
  wire  T_2034;
  wire  T_2035;
  wire  T_2036;
  wire  T_2038;
  wire  T_2039;
  assign io_in_0_ready = io_out_ready;
  assign io_in_1_ready = T_2034;
  assign io_in_2_ready = T_2035;
  assign io_in_3_ready = T_2036;
  assign io_out_valid = T_2039;
  assign io_out_bits_addr = GEN_13;
  assign io_out_bits_write = GEN_14;
  assign io_out_bits_wdata = GEN_15;
  assign io_out_bits_wmask = GEN_16;
  assign io_out_bits_way_en = GEN_17;
  assign io_chosen = GEN_12;
  assign GEN_0 = io_in_2_valid ? 2'h2 : 2'h3;
  assign GEN_1 = io_in_2_valid ? io_in_2_bits_addr : io_in_3_bits_addr;
  assign GEN_2 = io_in_2_valid ? io_in_2_bits_write : io_in_3_bits_write;
  assign GEN_3 = io_in_2_valid ? io_in_2_bits_wdata : io_in_3_bits_wdata;
  assign GEN_4 = io_in_2_valid ? io_in_2_bits_wmask : io_in_3_bits_wmask;
  assign GEN_5 = io_in_2_valid ? io_in_2_bits_way_en : io_in_3_bits_way_en;
  assign GEN_6 = io_in_1_valid ? 2'h1 : GEN_0;
  assign GEN_7 = io_in_1_valid ? io_in_1_bits_addr : GEN_1;
  assign GEN_8 = io_in_1_valid ? io_in_1_bits_write : GEN_2;
  assign GEN_9 = io_in_1_valid ? io_in_1_bits_wdata : GEN_3;
  assign GEN_10 = io_in_1_valid ? io_in_1_bits_wmask : GEN_4;
  assign GEN_11 = io_in_1_valid ? io_in_1_bits_way_en : GEN_5;
  assign GEN_12 = io_in_0_valid ? 2'h0 : GEN_6;
  assign GEN_13 = io_in_0_valid ? io_in_0_bits_addr : GEN_7;
  assign GEN_14 = io_in_0_valid ? io_in_0_bits_write : GEN_8;
  assign GEN_15 = io_in_0_valid ? io_in_0_bits_wdata : GEN_9;
  assign GEN_16 = io_in_0_valid ? io_in_0_bits_wmask : GEN_10;
  assign GEN_17 = io_in_0_valid ? io_in_0_bits_way_en : GEN_11;
  assign T_2025 = io_in_0_valid | io_in_1_valid;
  assign T_2026 = T_2025 | io_in_2_valid;
  assign T_2028 = io_in_0_valid == 1'h0;
  assign T_2030 = T_2025 == 1'h0;
  assign T_2032 = T_2026 == 1'h0;
  assign T_2034 = T_2028 & io_out_ready;
  assign T_2035 = T_2030 & io_out_ready;
  assign T_2036 = T_2032 & io_out_ready;
  assign T_2038 = T_2032 == 1'h0;
  assign T_2039 = T_2038 | io_in_3_valid;
endmodule
