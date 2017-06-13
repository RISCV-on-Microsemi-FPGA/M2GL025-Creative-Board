// ****************************************************************************/
// Microsemi Corporation Proprietary and Confidential
// Copyright 2016 Microsemi Corporation.  All rights reserved.
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
// ACCORDANCE WITH THE MICROSEMI LICENSE AGREEMENT AND MUST BE APPROVED
// IN ADVANCE IN WRITING.
//
// Description: 
//
// SVN Revision Information:
// SVN $Revision: 29005 $
// SVN $Date: 2017-02-16 14:46:24 +0000 (Thu, 16 Feb 2017) $
//
// Resolved SARs
// SAR      Date     Who   Description
//
// Notes:
//
// ****************************************************************************/
module CORERISCV_AXI4_D_CACHE_DATA_ARRAY(
  input         clk,
  input         reset,
  input         io_req_valid,
  input  [12:0] io_req_bits_addr,
  input         io_req_bits_write,
  input  [63:0] io_req_bits_wdata,
  input  [7:0]  io_req_bits_wmask,
  input         io_req_bits_way_en,
  output [63:0] io_resp_0
);

////////////////////////////////////////////////////////////////////////////////
// Internal signals
////////////////////////////////////////////////////////////////////////////////
wire            wrEnByteLane0;
wire            wrEnByteLane1;
wire            wrEnByteLane2;
wire            wrEnByteLane3;
wire            wrEnByteLane4;
wire            wrEnByteLane5;
wire            wrEnByteLane6;
wire            wrEnByteLane7;
wire [17:0]     rdDataByteLane0;
wire [17:0]     rdDataByteLane1;
wire [17:0]     rdDataByteLane2;
wire [17:0]     rdDataByteLane3;
wire [17:0]     rdDataByteLane4;
wire [17:0]     rdDataByteLane5;
wire [17:0]     rdDataByteLane6;
wire [17:0]     rdDataByteLane7;
wire            VCC;
wire            GND;

assign wrEnByteLane0 = io_req_valid & io_req_bits_write & io_req_bits_wmask[0];
assign wrEnByteLane1 = io_req_valid & io_req_bits_write & io_req_bits_wmask[1];
assign wrEnByteLane2 = io_req_valid & io_req_bits_write & io_req_bits_wmask[2];
assign wrEnByteLane3 = io_req_valid & io_req_bits_write & io_req_bits_wmask[3];
assign wrEnByteLane4 = io_req_valid & io_req_bits_write & io_req_bits_wmask[4];
assign wrEnByteLane5 = io_req_valid & io_req_bits_write & io_req_bits_wmask[5];
assign wrEnByteLane6 = io_req_valid & io_req_bits_write & io_req_bits_wmask[6];
assign wrEnByteLane7 = io_req_valid & io_req_bits_write & io_req_bits_wmask[7];

assign io_resp_0[63:0] = {rdDataByteLane7[7:0], rdDataByteLane6[7:0],
                          rdDataByteLane5[7:0], rdDataByteLane4[7:0],
                          rdDataByteLane3[7:0], rdDataByteLane2[7:0],
                          rdDataByteLane1[7:0], rdDataByteLane0[7:0]
                         };

////////////////////////////////////////////////////////////////////////////////
// VCC & GND Macro instantiations
////////////////////////////////////////////////////////////////////////////////  
GND GND_power_inst1 (
    .Y  (GND)
);

VCC VCC_power_inst1 (
    .Y  (VCC)
);

////////////////////////////////////////////////////////////////////////////////
// RAM Instantiation (1K18 LSRAM - DP mode)
////////////////////////////////////////////////////////////////////////////////  
RAM1K18 DCACHE_BYTE_LANE_1_ND_0_R0C0(
    .A_DOUT         (rdDataByteLane0), 
    .B_DOUT         (rdDataByteLane1),
    .BUSY           (), // Unused
    .A_CLK          (clk),
    .A_DOUT_CLK     (VCC),
    .A_ARST_N       (VCC),
    .A_DOUT_EN      (VCC),
    .A_BLK          ({VCC, VCC, VCC}),
    .A_DOUT_ARST_N  (VCC),
    .A_DOUT_SRST_N  (VCC),
    .A_DIN          ({{10{GND}}, io_req_bits_wdata[7:0]}),
    .A_ADDR         ({GND, io_req_bits_addr[12:3], {3{GND}}}),
    .A_WEN          ({GND, wrEnByteLane0}),
    .B_CLK          (clk),
    .B_DOUT_CLK     (VCC),
    .B_ARST_N       (VCC),
    .B_DOUT_EN      (VCC),
    .B_BLK          ({VCC, VCC, VCC}),
    .B_DOUT_ARST_N  (VCC),
    .B_DOUT_SRST_N  (VCC),
    .B_DIN          ({{10{GND}}, io_req_bits_wdata[15:8]}), 
    .B_ADDR         ({VCC, io_req_bits_addr[12:3], {3{GND}}}),
    .B_WEN          ({GND, wrEnByteLane1}),
    .A_EN           (VCC),
    .A_DOUT_LAT     (VCC),
    .A_WIDTH        ({GND, VCC, VCC}),
    .A_WMODE        (GND),
    .B_EN           (VCC),
    .B_DOUT_LAT     (VCC),
    .B_WIDTH        ({GND, VCC, VCC}),
    .B_WMODE        (GND),
    .SII_LOCK       (GND)
);

////////////////////////////////////////////////////////////////////////////////
// RAM Instantiation (1K18 LSRAM - DP mode)
////////////////////////////////////////////////////////////////////////////////  
RAM1K18 DCACHE_BYTE_LANE_3_ND_2_R0C0(
    .A_DOUT         (rdDataByteLane2), 
    .B_DOUT         (rdDataByteLane3),
    .BUSY           (), // Unused
    .A_CLK          (clk),
    .A_DOUT_CLK     (VCC),
    .A_ARST_N       (VCC),
    .A_DOUT_EN      (VCC),
    .A_BLK          ({VCC, VCC, VCC}),
    .A_DOUT_ARST_N  (VCC),
    .A_DOUT_SRST_N  (VCC),
    .A_DIN          ({{10{GND}}, io_req_bits_wdata[23:16]}),
    .A_ADDR         ({GND, io_req_bits_addr[12:3], {3{GND}}}),
    .A_WEN          ({GND, wrEnByteLane2}),
    .B_CLK          (clk),
    .B_DOUT_CLK     (VCC),
    .B_ARST_N       (VCC),
    .B_DOUT_EN      (VCC),
    .B_BLK          ({VCC, VCC, VCC}),
    .B_DOUT_ARST_N  (VCC),
    .B_DOUT_SRST_N  (VCC),
    .B_DIN          ({{10{GND}}, io_req_bits_wdata[31:24]}), 
    .B_ADDR         ({VCC, io_req_bits_addr[12:3], {3{GND}}}),
    .B_WEN          ({GND, wrEnByteLane3}),
    .A_EN           (VCC),
    .A_DOUT_LAT     (VCC),
    .A_WIDTH        ({GND, VCC, VCC}),
    .A_WMODE        (GND),
    .B_EN           (VCC),
    .B_DOUT_LAT     (VCC),
    .B_WIDTH        ({GND, VCC, VCC}),
    .B_WMODE        (GND),
    .SII_LOCK       (GND)
);

////////////////////////////////////////////////////////////////////////////////
// RAM Instantiation (1K18 LSRAM - DP mode)
////////////////////////////////////////////////////////////////////////////////  
RAM1K18 DCACHE_BYTE_LANE_5_ND_4_R0C0(
    .A_DOUT         (rdDataByteLane4), 
    .B_DOUT         (rdDataByteLane5),
    .BUSY           (), // Unused
    .A_CLK          (clk),
    .A_DOUT_CLK     (VCC),
    .A_ARST_N       (VCC),
    .A_DOUT_EN      (VCC),
    .A_BLK          ({VCC, VCC, VCC}),
    .A_DOUT_ARST_N  (VCC),
    .A_DOUT_SRST_N  (VCC),
    .A_DIN          ({{10{GND}}, io_req_bits_wdata[39:32]}),
    .A_ADDR         ({GND, io_req_bits_addr[12:3], {3{GND}}}),
    .A_WEN          ({GND, wrEnByteLane4}),
    .B_CLK          (clk),
    .B_DOUT_CLK     (VCC),
    .B_ARST_N       (VCC),
    .B_DOUT_EN      (VCC),
    .B_BLK          ({VCC, VCC, VCC}),
    .B_DOUT_ARST_N  (VCC),
    .B_DOUT_SRST_N  (VCC),
    .B_DIN          ({{10{GND}}, io_req_bits_wdata[47:40]}), 
    .B_ADDR         ({VCC, io_req_bits_addr[12:3], {3{GND}}}),
    .B_WEN          ({GND, wrEnByteLane5}),
    .A_EN           (VCC),
    .A_DOUT_LAT     (VCC),
    .A_WIDTH        ({GND, VCC, VCC}),
    .A_WMODE        (GND),
    .B_EN           (VCC),
    .B_DOUT_LAT     (VCC),
    .B_WIDTH        ({GND, VCC, VCC}),
    .B_WMODE        (GND),
    .SII_LOCK       (GND)
);

////////////////////////////////////////////////////////////////////////////////
// RAM Instantiation (1K18 LSRAM - DP mode)
////////////////////////////////////////////////////////////////////////////////  
RAM1K18 DCACHE_BYTE_LANE_7_ND_6_R0C0(
    .A_DOUT         (rdDataByteLane6), 
    .B_DOUT         (rdDataByteLane7),
    .BUSY           (), // Unused
    .A_CLK          (clk),
    .A_DOUT_CLK     (VCC),
    .A_ARST_N       (VCC),
    .A_DOUT_EN      (VCC),
    .A_BLK          ({VCC, VCC, VCC}),
    .A_DOUT_ARST_N  (VCC),
    .A_DOUT_SRST_N  (VCC),
    .A_DIN          ({{10{GND}}, io_req_bits_wdata[55:48]}),
    .A_ADDR         ({GND, io_req_bits_addr[12:3], {3{GND}}}),
    .A_WEN          ({GND, wrEnByteLane6}),
    .B_CLK          (clk),
    .B_DOUT_CLK     (VCC),
    .B_ARST_N       (VCC),
    .B_DOUT_EN      (VCC),
    .B_BLK          ({VCC, VCC, VCC}),
    .B_DOUT_ARST_N  (VCC),
    .B_DOUT_SRST_N  (VCC),
    .B_DIN          ({{10{GND}}, io_req_bits_wdata[63:56]}), 
    .B_ADDR         ({VCC, io_req_bits_addr[12:3], {3{GND}}}),
    .B_WEN          ({GND, wrEnByteLane7}),
    .A_EN           (VCC),
    .A_DOUT_LAT     (VCC),
    .A_WIDTH        ({GND, VCC, VCC}),
    .A_WMODE        (GND),
    .B_EN           (VCC),
    .B_DOUT_LAT     (VCC),
    .B_WIDTH        ({GND, VCC, VCC}),
    .B_WMODE        (GND),
    .SII_LOCK       (GND)
);

endmodule // DCacheDataArray