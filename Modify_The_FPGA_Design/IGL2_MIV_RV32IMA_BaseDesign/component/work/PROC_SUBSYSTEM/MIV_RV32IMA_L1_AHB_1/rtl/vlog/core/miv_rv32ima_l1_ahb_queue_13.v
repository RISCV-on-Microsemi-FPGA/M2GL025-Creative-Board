// Copyright (c) 2017, Microsemi Corporation
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of the <organization> nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL MICROSEMI CORPORATIONM BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
// APACHE LICENSE
// Copyright (c) 2017, Microsemi Corporation 
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
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
module PROC_SUBSYSTEM_MIV_RV32IMA_L1_AHB_1_MIV_RV32IMA_L1_AHB_QUEUE_13(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input         io_enq_bits_read,
  input  [23:0] io_enq_bits_index,
  input  [31:0] io_enq_bits_data,
  input  [3:0]  io_enq_bits_mask,
  input  [8:0]  io_enq_bits_extra,
  input         io_deq_ready,
  output        io_deq_valid,
  output        io_deq_bits_read,
  output [23:0] io_deq_bits_index,
  output [31:0] io_deq_bits_data,
  output [3:0]  io_deq_bits_mask,
  output [8:0]  io_deq_bits_extra
);
  reg  ram_read [0:0];
  reg [31:0] _RAND_0;
  wire  ram_read__T_35_data;
  wire  ram_read__T_35_addr;
  wire  ram_read__T_26_data;
  wire  ram_read__T_26_addr;
  wire  ram_read__T_26_mask;
  wire  ram_read__T_26_en;
  reg [23:0] ram_index [0:0] /* synthesis syn_ramstyle = "registers" */;
  reg [31:0] _RAND_1;
  wire [23:0] ram_index__T_35_data;
  wire  ram_index__T_35_addr;
  wire [23:0] ram_index__T_26_data;
  wire  ram_index__T_26_addr;
  wire  ram_index__T_26_mask;
  wire  ram_index__T_26_en;
  reg [31:0] ram_data [0:0] /* synthesis syn_ramstyle = "registers" */;
  reg [31:0] _RAND_2;
  wire [31:0] ram_data__T_35_data;
  wire  ram_data__T_35_addr;
  wire [31:0] ram_data__T_26_data;
  wire  ram_data__T_26_addr;
  wire  ram_data__T_26_mask;
  wire  ram_data__T_26_en;
  reg [3:0] ram_mask [0:0] /* synthesis syn_ramstyle = "registers" */;
  reg [31:0] _RAND_3;
  wire [3:0] ram_mask__T_35_data;
  wire  ram_mask__T_35_addr;
  wire [3:0] ram_mask__T_26_data;
  wire  ram_mask__T_26_addr;
  wire  ram_mask__T_26_mask;
  wire  ram_mask__T_26_en;
  reg [8:0] ram_extra [0:0] /* synthesis syn_ramstyle = "registers" */;
  reg [31:0] _RAND_4;
  wire [8:0] ram_extra__T_35_data;
  wire  ram_extra__T_35_addr;
  wire [8:0] ram_extra__T_26_data;
  wire  ram_extra__T_26_addr;
  wire  ram_extra__T_26_mask;
  wire  ram_extra__T_26_en;
  reg  maybe_full;
  reg [31:0] _RAND_5;
  wire  _T_18;
  wire  _T_21;
  wire  _T_23;
  wire  _T_29;
  wire  _GEN_8;
  wire  _T_31;
  assign io_enq_ready = _T_18;
  assign io_deq_valid = _T_31;
  assign io_deq_bits_read = ram_read__T_35_data;
  assign io_deq_bits_index = ram_index__T_35_data;
  assign io_deq_bits_data = ram_data__T_35_data;
  assign io_deq_bits_mask = ram_mask__T_35_data;
  assign io_deq_bits_extra = ram_extra__T_35_data;
  assign ram_read__T_35_addr = 1'h0;
  assign ram_read__T_35_data = ram_read[ram_read__T_35_addr];
  assign ram_read__T_26_data = io_enq_bits_read;
  assign ram_read__T_26_addr = 1'h0;
  assign ram_read__T_26_mask = _T_21;
  assign ram_read__T_26_en = _T_21;
  assign ram_index__T_35_addr = 1'h0;
  assign ram_index__T_35_data = ram_index[ram_index__T_35_addr];
  assign ram_index__T_26_data = io_enq_bits_index;
  assign ram_index__T_26_addr = 1'h0;
  assign ram_index__T_26_mask = _T_21;
  assign ram_index__T_26_en = _T_21;
  assign ram_data__T_35_addr = 1'h0;
  assign ram_data__T_35_data = ram_data[ram_data__T_35_addr];
  assign ram_data__T_26_data = io_enq_bits_data;
  assign ram_data__T_26_addr = 1'h0;
  assign ram_data__T_26_mask = _T_21;
  assign ram_data__T_26_en = _T_21;
  assign ram_mask__T_35_addr = 1'h0;
  assign ram_mask__T_35_data = ram_mask[ram_mask__T_35_addr];
  assign ram_mask__T_26_data = io_enq_bits_mask;
  assign ram_mask__T_26_addr = 1'h0;
  assign ram_mask__T_26_mask = _T_21;
  assign ram_mask__T_26_en = _T_21;
  assign ram_extra__T_35_addr = 1'h0;
  assign ram_extra__T_35_data = ram_extra[ram_extra__T_35_addr];
  assign ram_extra__T_26_data = io_enq_bits_extra;
  assign ram_extra__T_26_addr = 1'h0;
  assign ram_extra__T_26_mask = _T_21;
  assign ram_extra__T_26_en = _T_21;
  assign _T_18 = maybe_full == 1'h0;
  assign _T_21 = io_enq_ready & io_enq_valid;
  assign _T_23 = io_deq_ready & io_deq_valid;
  assign _T_29 = _T_21 != _T_23;
  assign _GEN_8 = _T_29 ? _T_21 : maybe_full;
  assign _T_31 = _T_18 == 1'h0;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  _RAND_0 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_read[initvar] = _RAND_0[0:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_1 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_index[initvar] = _RAND_1[23:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_2 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_data[initvar] = _RAND_2[31:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_3 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_mask[initvar] = _RAND_3[3:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_4 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_extra[initvar] = _RAND_4[8:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{$random}};
  maybe_full = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if(ram_read__T_26_en & ram_read__T_26_mask) begin
      ram_read[ram_read__T_26_addr] <= ram_read__T_26_data;
    end
    if(ram_index__T_26_en & ram_index__T_26_mask) begin
      ram_index[ram_index__T_26_addr] <= ram_index__T_26_data;
    end
    if(ram_data__T_26_en & ram_data__T_26_mask) begin
      ram_data[ram_data__T_26_addr] <= ram_data__T_26_data;
    end
    if(ram_mask__T_26_en & ram_mask__T_26_mask) begin
      ram_mask[ram_mask__T_26_addr] <= ram_mask__T_26_data;
    end
    if(ram_extra__T_26_en & ram_extra__T_26_mask) begin
      ram_extra[ram_extra__T_26_addr] <= ram_extra__T_26_data;
    end
    if (reset) begin
      maybe_full <= 1'h0;
    end else begin
      if (_T_29) begin
        maybe_full <= _T_21;
      end
    end
  end
endmodule
