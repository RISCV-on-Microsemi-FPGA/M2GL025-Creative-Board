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
module CORERISCV_AXI4_TILE_LINK_ENQUEUER_2(
  input   clk,
  input   reset,
  output  io_client_acquire_ready,
  input   io_client_acquire_valid,
  input  [1:0] io_client_acquire_bits_header_src,
  input  [1:0] io_client_acquire_bits_header_dst,
  input  [25:0] io_client_acquire_bits_payload_addr_block,
  input   io_client_acquire_bits_payload_client_xact_id,
  input  [2:0] io_client_acquire_bits_payload_addr_beat,
  input   io_client_acquire_bits_payload_is_builtin_type,
  input  [2:0] io_client_acquire_bits_payload_a_type,
  input  [11:0] io_client_acquire_bits_payload_union,
  input  [63:0] io_client_acquire_bits_payload_data,
  input   io_client_grant_ready,
  output  io_client_grant_valid,
  output [1:0] io_client_grant_bits_header_src,
  output [1:0] io_client_grant_bits_header_dst,
  output [2:0] io_client_grant_bits_payload_addr_beat,
  output  io_client_grant_bits_payload_client_xact_id,
  output [1:0] io_client_grant_bits_payload_manager_xact_id,
  output  io_client_grant_bits_payload_is_builtin_type,
  output [3:0] io_client_grant_bits_payload_g_type,
  output [63:0] io_client_grant_bits_payload_data,
  output  io_client_finish_ready,
  input   io_client_finish_valid,
  input  [1:0] io_client_finish_bits_header_src,
  input  [1:0] io_client_finish_bits_header_dst,
  input  [1:0] io_client_finish_bits_payload_manager_xact_id,
  input   io_client_probe_ready,
  output  io_client_probe_valid,
  output [1:0] io_client_probe_bits_header_src,
  output [1:0] io_client_probe_bits_header_dst,
  output [25:0] io_client_probe_bits_payload_addr_block,
  output [1:0] io_client_probe_bits_payload_p_type,
  output  io_client_release_ready,
  input   io_client_release_valid,
  input  [1:0] io_client_release_bits_header_src,
  input  [1:0] io_client_release_bits_header_dst,
  input  [2:0] io_client_release_bits_payload_addr_beat,
  input  [25:0] io_client_release_bits_payload_addr_block,
  input   io_client_release_bits_payload_client_xact_id,
  input   io_client_release_bits_payload_voluntary,
  input  [2:0] io_client_release_bits_payload_r_type,
  input  [63:0] io_client_release_bits_payload_data,
  input   io_manager_acquire_ready,
  output  io_manager_acquire_valid,
  output [1:0] io_manager_acquire_bits_header_src,
  output [1:0] io_manager_acquire_bits_header_dst,
  output [25:0] io_manager_acquire_bits_payload_addr_block,
  output  io_manager_acquire_bits_payload_client_xact_id,
  output [2:0] io_manager_acquire_bits_payload_addr_beat,
  output  io_manager_acquire_bits_payload_is_builtin_type,
  output [2:0] io_manager_acquire_bits_payload_a_type,
  output [11:0] io_manager_acquire_bits_payload_union,
  output [63:0] io_manager_acquire_bits_payload_data,
  output  io_manager_grant_ready,
  input   io_manager_grant_valid,
  input  [1:0] io_manager_grant_bits_header_src,
  input  [1:0] io_manager_grant_bits_header_dst,
  input  [2:0] io_manager_grant_bits_payload_addr_beat,
  input   io_manager_grant_bits_payload_client_xact_id,
  input  [1:0] io_manager_grant_bits_payload_manager_xact_id,
  input   io_manager_grant_bits_payload_is_builtin_type,
  input  [3:0] io_manager_grant_bits_payload_g_type,
  input  [63:0] io_manager_grant_bits_payload_data,
  input   io_manager_finish_ready,
  output  io_manager_finish_valid,
  output [1:0] io_manager_finish_bits_header_src,
  output [1:0] io_manager_finish_bits_header_dst,
  output [1:0] io_manager_finish_bits_payload_manager_xact_id,
  output  io_manager_probe_ready,
  input   io_manager_probe_valid,
  input  [1:0] io_manager_probe_bits_header_src,
  input  [1:0] io_manager_probe_bits_header_dst,
  input  [25:0] io_manager_probe_bits_payload_addr_block,
  input  [1:0] io_manager_probe_bits_payload_p_type,
  input   io_manager_release_ready,
  output  io_manager_release_valid,
  output [1:0] io_manager_release_bits_header_src,
  output [1:0] io_manager_release_bits_header_dst,
  output [2:0] io_manager_release_bits_payload_addr_beat,
  output [25:0] io_manager_release_bits_payload_addr_block,
  output  io_manager_release_bits_payload_client_xact_id,
  output  io_manager_release_bits_payload_voluntary,
  output [2:0] io_manager_release_bits_payload_r_type,
  output [63:0] io_manager_release_bits_payload_data
);
  assign io_client_acquire_ready = io_manager_acquire_ready;
  assign io_client_grant_valid = io_manager_grant_valid;
  assign io_client_grant_bits_header_src = io_manager_grant_bits_header_src;
  assign io_client_grant_bits_header_dst = io_manager_grant_bits_header_dst;
  assign io_client_grant_bits_payload_addr_beat = io_manager_grant_bits_payload_addr_beat;
  assign io_client_grant_bits_payload_client_xact_id = io_manager_grant_bits_payload_client_xact_id;
  assign io_client_grant_bits_payload_manager_xact_id = io_manager_grant_bits_payload_manager_xact_id;
  assign io_client_grant_bits_payload_is_builtin_type = io_manager_grant_bits_payload_is_builtin_type;
  assign io_client_grant_bits_payload_g_type = io_manager_grant_bits_payload_g_type;
  assign io_client_grant_bits_payload_data = io_manager_grant_bits_payload_data;
  assign io_client_finish_ready = io_manager_finish_ready;
  assign io_client_probe_valid = io_manager_probe_valid;
  assign io_client_probe_bits_header_src = io_manager_probe_bits_header_src;
  assign io_client_probe_bits_header_dst = io_manager_probe_bits_header_dst;
  assign io_client_probe_bits_payload_addr_block = io_manager_probe_bits_payload_addr_block;
  assign io_client_probe_bits_payload_p_type = io_manager_probe_bits_payload_p_type;
  assign io_client_release_ready = io_manager_release_ready;
  assign io_manager_acquire_valid = io_client_acquire_valid;
  assign io_manager_acquire_bits_header_src = io_client_acquire_bits_header_src;
  assign io_manager_acquire_bits_header_dst = io_client_acquire_bits_header_dst;
  assign io_manager_acquire_bits_payload_addr_block = io_client_acquire_bits_payload_addr_block;
  assign io_manager_acquire_bits_payload_client_xact_id = io_client_acquire_bits_payload_client_xact_id;
  assign io_manager_acquire_bits_payload_addr_beat = io_client_acquire_bits_payload_addr_beat;
  assign io_manager_acquire_bits_payload_is_builtin_type = io_client_acquire_bits_payload_is_builtin_type;
  assign io_manager_acquire_bits_payload_a_type = io_client_acquire_bits_payload_a_type;
  assign io_manager_acquire_bits_payload_union = io_client_acquire_bits_payload_union;
  assign io_manager_acquire_bits_payload_data = io_client_acquire_bits_payload_data;
  assign io_manager_grant_ready = io_client_grant_ready;
  assign io_manager_finish_valid = io_client_finish_valid;
  assign io_manager_finish_bits_header_src = io_client_finish_bits_header_src;
  assign io_manager_finish_bits_header_dst = io_client_finish_bits_header_dst;
  assign io_manager_finish_bits_payload_manager_xact_id = io_client_finish_bits_payload_manager_xact_id;
  assign io_manager_probe_ready = io_client_probe_ready;
  assign io_manager_release_valid = io_client_release_valid;
  assign io_manager_release_bits_header_src = io_client_release_bits_header_src;
  assign io_manager_release_bits_header_dst = io_client_release_bits_header_dst;
  assign io_manager_release_bits_payload_addr_beat = io_client_release_bits_payload_addr_beat;
  assign io_manager_release_bits_payload_addr_block = io_client_release_bits_payload_addr_block;
  assign io_manager_release_bits_payload_client_xact_id = io_client_release_bits_payload_client_xact_id;
  assign io_manager_release_bits_payload_voluntary = io_client_release_bits_payload_voluntary;
  assign io_manager_release_bits_payload_r_type = io_client_release_bits_payload_r_type;
  assign io_manager_release_bits_payload_data = io_client_release_bits_payload_data;
endmodule
