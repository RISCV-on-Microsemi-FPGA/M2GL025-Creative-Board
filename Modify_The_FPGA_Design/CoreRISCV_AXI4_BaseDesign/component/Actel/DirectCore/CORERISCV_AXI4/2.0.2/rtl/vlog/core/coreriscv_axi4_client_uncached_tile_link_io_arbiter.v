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
module CORERISCV_AXI4_CLIENT_UNCACHED_TILE_LINK_IO_ARBITER(
  input   clk,
  input   reset,
  output  io_in_0_acquire_ready,
  input   io_in_0_acquire_valid,
  input  [25:0] io_in_0_acquire_bits_addr_block,
  input   io_in_0_acquire_bits_client_xact_id,
  input  [2:0] io_in_0_acquire_bits_addr_beat,
  input   io_in_0_acquire_bits_is_builtin_type,
  input  [2:0] io_in_0_acquire_bits_a_type,
  input  [11:0] io_in_0_acquire_bits_union,
  input  [63:0] io_in_0_acquire_bits_data,
  input   io_in_0_grant_ready,
  output  io_in_0_grant_valid,
  output [2:0] io_in_0_grant_bits_addr_beat,
  output  io_in_0_grant_bits_client_xact_id,
  output [1:0] io_in_0_grant_bits_manager_xact_id,
  output  io_in_0_grant_bits_is_builtin_type,
  output [3:0] io_in_0_grant_bits_g_type,
  output [63:0] io_in_0_grant_bits_data,
  input   io_out_acquire_ready,
  output  io_out_acquire_valid,
  output [25:0] io_out_acquire_bits_addr_block,
  output  io_out_acquire_bits_client_xact_id,
  output [2:0] io_out_acquire_bits_addr_beat,
  output  io_out_acquire_bits_is_builtin_type,
  output [2:0] io_out_acquire_bits_a_type,
  output [11:0] io_out_acquire_bits_union,
  output [63:0] io_out_acquire_bits_data,
  output  io_out_grant_ready,
  input   io_out_grant_valid,
  input  [2:0] io_out_grant_bits_addr_beat,
  input   io_out_grant_bits_client_xact_id,
  input  [1:0] io_out_grant_bits_manager_xact_id,
  input   io_out_grant_bits_is_builtin_type,
  input  [3:0] io_out_grant_bits_g_type,
  input  [63:0] io_out_grant_bits_data
);
  assign io_in_0_acquire_ready = io_out_acquire_ready;
  assign io_in_0_grant_valid = io_out_grant_valid;
  assign io_in_0_grant_bits_addr_beat = io_out_grant_bits_addr_beat;
  assign io_in_0_grant_bits_client_xact_id = io_out_grant_bits_client_xact_id;
  assign io_in_0_grant_bits_manager_xact_id = io_out_grant_bits_manager_xact_id;
  assign io_in_0_grant_bits_is_builtin_type = io_out_grant_bits_is_builtin_type;
  assign io_in_0_grant_bits_g_type = io_out_grant_bits_g_type;
  assign io_in_0_grant_bits_data = io_out_grant_bits_data;
  assign io_out_acquire_valid = io_in_0_acquire_valid;
  assign io_out_acquire_bits_addr_block = io_in_0_acquire_bits_addr_block;
  assign io_out_acquire_bits_client_xact_id = io_in_0_acquire_bits_client_xact_id;
  assign io_out_acquire_bits_addr_beat = io_in_0_acquire_bits_addr_beat;
  assign io_out_acquire_bits_is_builtin_type = io_in_0_acquire_bits_is_builtin_type;
  assign io_out_acquire_bits_a_type = io_in_0_acquire_bits_a_type;
  assign io_out_acquire_bits_union = io_in_0_acquire_bits_union;
  assign io_out_acquire_bits_data = io_in_0_acquire_bits_data;
  assign io_out_grant_ready = io_in_0_grant_ready;
endmodule
