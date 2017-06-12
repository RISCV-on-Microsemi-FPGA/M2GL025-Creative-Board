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
module CORERISCV_AXI4_HELLA_CACHE_ARBITER(
  input   clk,
  input   reset,
  output  io_requestor_0_req_ready,
  input   io_requestor_0_req_valid,
  input  [31:0] io_requestor_0_req_bits_addr,
  input  [8:0] io_requestor_0_req_bits_tag,
  input  [4:0] io_requestor_0_req_bits_cmd,
  input  [2:0] io_requestor_0_req_bits_typ,
  input   io_requestor_0_req_bits_phys,
  input  [31:0] io_requestor_0_req_bits_data,
  input   io_requestor_0_s1_kill,
  input  [31:0] io_requestor_0_s1_data,
  output  io_requestor_0_s2_nack,
  output  io_requestor_0_resp_valid,
  output [31:0] io_requestor_0_resp_bits_addr,
  output [8:0] io_requestor_0_resp_bits_tag,
  output [4:0] io_requestor_0_resp_bits_cmd,
  output [2:0] io_requestor_0_resp_bits_typ,
  output [31:0] io_requestor_0_resp_bits_data,
  output  io_requestor_0_resp_bits_replay,
  output  io_requestor_0_resp_bits_has_data,
  output [31:0] io_requestor_0_resp_bits_data_word_bypass,
  output [31:0] io_requestor_0_resp_bits_store_data,
  output  io_requestor_0_replay_next,
  output  io_requestor_0_xcpt_ma_ld,
  output  io_requestor_0_xcpt_ma_st,
  output  io_requestor_0_xcpt_pf_ld,
  output  io_requestor_0_xcpt_pf_st,
  input   io_requestor_0_invalidate_lr,
  output  io_requestor_0_ordered,
  input   io_mem_req_ready,
  output  io_mem_req_valid,
  output [31:0] io_mem_req_bits_addr,
  output [8:0] io_mem_req_bits_tag,
  output [4:0] io_mem_req_bits_cmd,
  output [2:0] io_mem_req_bits_typ,
  output  io_mem_req_bits_phys,
  output [31:0] io_mem_req_bits_data,
  output  io_mem_s1_kill,
  output [31:0] io_mem_s1_data,
  input   io_mem_s2_nack,
  input   io_mem_resp_valid,
  input  [31:0] io_mem_resp_bits_addr,
  input  [8:0] io_mem_resp_bits_tag,
  input  [4:0] io_mem_resp_bits_cmd,
  input  [2:0] io_mem_resp_bits_typ,
  input  [31:0] io_mem_resp_bits_data,
  input   io_mem_resp_bits_replay,
  input   io_mem_resp_bits_has_data,
  input  [31:0] io_mem_resp_bits_data_word_bypass,
  input  [31:0] io_mem_resp_bits_store_data,
  input   io_mem_replay_next,
  input   io_mem_xcpt_ma_ld,
  input   io_mem_xcpt_ma_st,
  input   io_mem_xcpt_pf_ld,
  input   io_mem_xcpt_pf_st,
  output  io_mem_invalidate_lr,
  input   io_mem_ordered
);
  assign io_requestor_0_req_ready = io_mem_req_ready;
  assign io_requestor_0_s2_nack = io_mem_s2_nack;
  assign io_requestor_0_resp_valid = io_mem_resp_valid;
  assign io_requestor_0_resp_bits_addr = io_mem_resp_bits_addr;
  assign io_requestor_0_resp_bits_tag = io_mem_resp_bits_tag;
  assign io_requestor_0_resp_bits_cmd = io_mem_resp_bits_cmd;
  assign io_requestor_0_resp_bits_typ = io_mem_resp_bits_typ;
  assign io_requestor_0_resp_bits_data = io_mem_resp_bits_data;
  assign io_requestor_0_resp_bits_replay = io_mem_resp_bits_replay;
  assign io_requestor_0_resp_bits_has_data = io_mem_resp_bits_has_data;
  assign io_requestor_0_resp_bits_data_word_bypass = io_mem_resp_bits_data_word_bypass;
  assign io_requestor_0_resp_bits_store_data = io_mem_resp_bits_store_data;
  assign io_requestor_0_replay_next = io_mem_replay_next;
  assign io_requestor_0_xcpt_ma_ld = io_mem_xcpt_ma_ld;
  assign io_requestor_0_xcpt_ma_st = io_mem_xcpt_ma_st;
  assign io_requestor_0_xcpt_pf_ld = io_mem_xcpt_pf_ld;
  assign io_requestor_0_xcpt_pf_st = io_mem_xcpt_pf_st;
  assign io_requestor_0_ordered = io_mem_ordered;
  assign io_mem_req_valid = io_requestor_0_req_valid;
  assign io_mem_req_bits_addr = io_requestor_0_req_bits_addr;
  assign io_mem_req_bits_tag = io_requestor_0_req_bits_tag;
  assign io_mem_req_bits_cmd = io_requestor_0_req_bits_cmd;
  assign io_mem_req_bits_typ = io_requestor_0_req_bits_typ;
  assign io_mem_req_bits_phys = io_requestor_0_req_bits_phys;
  assign io_mem_req_bits_data = io_requestor_0_req_bits_data;
  assign io_mem_s1_kill = io_requestor_0_s1_kill;
  assign io_mem_s1_data = io_requestor_0_s1_data;
  assign io_mem_invalidate_lr = io_requestor_0_invalidate_lr;
endmodule
