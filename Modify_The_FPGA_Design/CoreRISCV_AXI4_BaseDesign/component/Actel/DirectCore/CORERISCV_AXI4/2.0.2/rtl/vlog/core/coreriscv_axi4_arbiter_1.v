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
module CORERISCV_AXI4_ARBITER_1(
  input   clk,
  input   reset,
  output  io_in_0_ready,
  input   io_in_0_valid,
  input  [6:0] io_in_0_bits_idx,
  input   io_in_0_bits_way_en,
  input  [18:0] io_in_0_bits_data_tag,
  input  [1:0] io_in_0_bits_data_coh_state,
  output  io_in_1_ready,
  input   io_in_1_valid,
  input  [6:0] io_in_1_bits_idx,
  input   io_in_1_bits_way_en,
  input  [18:0] io_in_1_bits_data_tag,
  input  [1:0] io_in_1_bits_data_coh_state,
  output  io_in_2_ready,
  input   io_in_2_valid,
  input  [6:0] io_in_2_bits_idx,
  input   io_in_2_bits_way_en,
  input  [18:0] io_in_2_bits_data_tag,
  input  [1:0] io_in_2_bits_data_coh_state,
  input   io_out_ready,
  output  io_out_valid,
  output [6:0] io_out_bits_idx,
  output  io_out_bits_way_en,
  output [18:0] io_out_bits_data_tag,
  output [1:0] io_out_bits_data_coh_state,
  output [1:0] io_chosen
);
  wire [1:0] GEN_0;
  wire [6:0] GEN_1;
  wire  GEN_2;
  wire [18:0] GEN_3;
  wire [1:0] GEN_4;
  wire [1:0] GEN_5;
  wire [6:0] GEN_6;
  wire  GEN_7;
  wire [18:0] GEN_8;
  wire [1:0] GEN_9;
  wire  T_2822;
  wire  T_2824;
  wire  T_2826;
  wire  T_2828;
  wire  T_2829;
  wire  T_2831;
  wire  T_2832;
  assign io_in_0_ready = io_out_ready;
  assign io_in_1_ready = T_2828;
  assign io_in_2_ready = T_2829;
  assign io_out_valid = T_2832;
  assign io_out_bits_idx = GEN_6;
  assign io_out_bits_way_en = GEN_7;
  assign io_out_bits_data_tag = GEN_8;
  assign io_out_bits_data_coh_state = GEN_9;
  assign io_chosen = GEN_5;
  assign GEN_0 = io_in_1_valid ? 2'h1 : 2'h2;
  assign GEN_1 = io_in_1_valid ? io_in_1_bits_idx : io_in_2_bits_idx;
  assign GEN_2 = io_in_1_valid ? io_in_1_bits_way_en : io_in_2_bits_way_en;
  assign GEN_3 = io_in_1_valid ? io_in_1_bits_data_tag : io_in_2_bits_data_tag;
  assign GEN_4 = io_in_1_valid ? io_in_1_bits_data_coh_state : io_in_2_bits_data_coh_state;
  assign GEN_5 = io_in_0_valid ? 2'h0 : GEN_0;
  assign GEN_6 = io_in_0_valid ? io_in_0_bits_idx : GEN_1;
  assign GEN_7 = io_in_0_valid ? io_in_0_bits_way_en : GEN_2;
  assign GEN_8 = io_in_0_valid ? io_in_0_bits_data_tag : GEN_3;
  assign GEN_9 = io_in_0_valid ? io_in_0_bits_data_coh_state : GEN_4;
  assign T_2822 = io_in_0_valid | io_in_1_valid;
  assign T_2824 = io_in_0_valid == 1'h0;
  assign T_2826 = T_2822 == 1'h0;
  assign T_2828 = T_2824 & io_out_ready;
  assign T_2829 = T_2826 & io_out_ready;
  assign T_2831 = T_2826 == 1'h0;
  assign T_2832 = T_2831 | io_in_2_valid;
endmodule
