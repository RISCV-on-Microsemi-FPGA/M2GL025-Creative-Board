//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Sun Dec 10 15:57:37 2017
// Version: v11.8 SP1 11.8.1.12
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// HPMS_0_sb_HPMS
module HPMS_0_sb_HPMS(
    // Inputs
    FIC_0_AHB_S_HADDR,
    FIC_0_AHB_S_HMASTLOCK,
    FIC_0_AHB_S_HREADY,
    FIC_0_AHB_S_HSEL,
    FIC_0_AHB_S_HSIZE,
    FIC_0_AHB_S_HTRANS,
    FIC_0_AHB_S_HWDATA,
    FIC_0_AHB_S_HWRITE,
    FIC_2_APB_M_PRDATA,
    FIC_2_APB_M_PREADY,
    FIC_2_APB_M_PSLVERR,
    M3_RESET_N,
    MCCC_CLK_BASE,
    MCCC_CLK_BASE_PLL_LOCK,
    MDDR_APB_S_PADDR,
    MDDR_APB_S_PCLK,
    MDDR_APB_S_PENABLE,
    MDDR_APB_S_PRESET_N,
    MDDR_APB_S_PSEL,
    MDDR_APB_S_PWDATA,
    MDDR_APB_S_PWRITE,
    MDDR_DDR_AHB0_S_HADDR,
    MDDR_DDR_AHB0_S_HBURST,
    MDDR_DDR_AHB0_S_HMASTLOCK,
    MDDR_DDR_AHB0_S_HREADY,
    MDDR_DDR_AHB0_S_HSEL,
    MDDR_DDR_AHB0_S_HSIZE,
    MDDR_DDR_AHB0_S_HTRANS,
    MDDR_DDR_AHB0_S_HWDATA,
    MDDR_DDR_AHB0_S_HWRITE,
    MDDR_DDR_CORE_RESET_N,
    MDDR_DQS_TMATCH_0_IN,
    MSS_INT_F2M,
    MSS_RESET_N_F2M,
    // Outputs
    COMM_BLK_INT,
    FIC_0_AHB_S_HRDATA,
    FIC_0_AHB_S_HREADYOUT,
    FIC_0_AHB_S_HRESP,
    FIC_2_APB_M_PADDR,
    FIC_2_APB_M_PCLK,
    FIC_2_APB_M_PENABLE,
    FIC_2_APB_M_PRESET_N,
    FIC_2_APB_M_PSEL,
    FIC_2_APB_M_PWDATA,
    FIC_2_APB_M_PWRITE,
    M3_NMI,
    MDDR_ADDR,
    MDDR_APB_S_PRDATA,
    MDDR_APB_S_PREADY,
    MDDR_APB_S_PSLVERR,
    MDDR_BA,
    MDDR_CAS_N,
    MDDR_CKE,
    MDDR_CLK,
    MDDR_CLK_N,
    MDDR_CS_N,
    MDDR_DDR_AHB0_S_HRDATA,
    MDDR_DDR_AHB0_S_HREADYOUT,
    MDDR_DDR_AHB0_S_HRESP,
    MDDR_DQS_TMATCH_0_OUT,
    MDDR_ODT,
    MDDR_RAS_N,
    MDDR_RESET_N,
    MDDR_WE_N,
    MSS_INT_M2F,
    MSS_RESET_N_M2F,
    // Inouts
    MDDR_DM_RDQS,
    MDDR_DQ,
    MDDR_DQS,
    MDDR_DQS_N
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  [31:0] FIC_0_AHB_S_HADDR;
input         FIC_0_AHB_S_HMASTLOCK;
input         FIC_0_AHB_S_HREADY;
input         FIC_0_AHB_S_HSEL;
input  [1:0]  FIC_0_AHB_S_HSIZE;
input  [1:0]  FIC_0_AHB_S_HTRANS;
input  [31:0] FIC_0_AHB_S_HWDATA;
input         FIC_0_AHB_S_HWRITE;
input  [31:0] FIC_2_APB_M_PRDATA;
input         FIC_2_APB_M_PREADY;
input         FIC_2_APB_M_PSLVERR;
input         M3_RESET_N;
input         MCCC_CLK_BASE;
input         MCCC_CLK_BASE_PLL_LOCK;
input  [10:2] MDDR_APB_S_PADDR;
input         MDDR_APB_S_PCLK;
input         MDDR_APB_S_PENABLE;
input         MDDR_APB_S_PRESET_N;
input         MDDR_APB_S_PSEL;
input  [15:0] MDDR_APB_S_PWDATA;
input         MDDR_APB_S_PWRITE;
input  [31:0] MDDR_DDR_AHB0_S_HADDR;
input  [2:0]  MDDR_DDR_AHB0_S_HBURST;
input         MDDR_DDR_AHB0_S_HMASTLOCK;
input         MDDR_DDR_AHB0_S_HREADY;
input         MDDR_DDR_AHB0_S_HSEL;
input  [1:0]  MDDR_DDR_AHB0_S_HSIZE;
input  [1:0]  MDDR_DDR_AHB0_S_HTRANS;
input  [31:0] MDDR_DDR_AHB0_S_HWDATA;
input         MDDR_DDR_AHB0_S_HWRITE;
input         MDDR_DDR_CORE_RESET_N;
input         MDDR_DQS_TMATCH_0_IN;
input  [15:0] MSS_INT_F2M;
input         MSS_RESET_N_F2M;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output        COMM_BLK_INT;
output [31:0] FIC_0_AHB_S_HRDATA;
output        FIC_0_AHB_S_HREADYOUT;
output        FIC_0_AHB_S_HRESP;
output [15:2] FIC_2_APB_M_PADDR;
output        FIC_2_APB_M_PCLK;
output        FIC_2_APB_M_PENABLE;
output        FIC_2_APB_M_PRESET_N;
output        FIC_2_APB_M_PSEL;
output [31:0] FIC_2_APB_M_PWDATA;
output        FIC_2_APB_M_PWRITE;
output        M3_NMI;
output [15:0] MDDR_ADDR;
output [15:0] MDDR_APB_S_PRDATA;
output        MDDR_APB_S_PREADY;
output        MDDR_APB_S_PSLVERR;
output [2:0]  MDDR_BA;
output        MDDR_CAS_N;
output        MDDR_CKE;
output        MDDR_CLK;
output        MDDR_CLK_N;
output        MDDR_CS_N;
output [31:0] MDDR_DDR_AHB0_S_HRDATA;
output        MDDR_DDR_AHB0_S_HREADYOUT;
output        MDDR_DDR_AHB0_S_HRESP;
output        MDDR_DQS_TMATCH_0_OUT;
output        MDDR_ODT;
output        MDDR_RAS_N;
output        MDDR_RESET_N;
output        MDDR_WE_N;
output [15:0] MSS_INT_M2F;
output        MSS_RESET_N_M2F;
//--------------------------------------------------------------------
// Inout
//--------------------------------------------------------------------
inout  [1:0]  MDDR_DM_RDQS;
inout  [15:0] MDDR_DQ;
inout  [1:0]  MDDR_DQS;
inout  [1:0]  MDDR_DQS_N;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire           COMM_BLK_INT_net_0;
wire   [31:0]  FIC_0_AHB_S_HADDR;
wire           FIC_0_AHB_S_HMASTLOCK;
wire   [31:0]  FIC_0_AHB_S_HRDATA_net_0;
wire           FIC_0_AHB_S_HREADY;
wire           FIC_0_AHB_S_HREADYOUT_net_0;
wire           FIC_0_AHB_S_HRESP_net_0;
wire           FIC_0_AHB_S_HSEL;
wire   [1:0]   FIC_0_AHB_S_HSIZE;
wire   [1:1]   FIC_0_AHB_S_HTRANS_slice_0;
wire   [0:0]   FIC_0_AHB_S_HTRANS_slice_1;
wire   [31:0]  FIC_0_AHB_S_HWDATA;
wire           FIC_0_AHB_S_HWRITE;
wire           FIC_2_APB_M_PCLK_0;
wire           FIC_2_APB_M_PRESET_N_0;
wire   [15:2]  FIC_2_APB_MASTER_0_PADDR;
wire           FIC_2_APB_MASTER_0_PENABLE;
wire   [31:0]  FIC_2_APB_M_PRDATA;
wire           FIC_2_APB_M_PREADY;
wire           FIC_2_APB_MASTER_0_PSELx;
wire           FIC_2_APB_M_PSLVERR;
wire   [31:0]  FIC_2_APB_MASTER_0_PWDATA;
wire           FIC_2_APB_MASTER_0_PWRITE;
wire           M3_NMI_net_0;
wire           M3_RESET_N;
wire           MCCC_CLK_BASE;
wire           MCCC_CLK_BASE_PLL_LOCK;
wire           MDDR_ADDR_net_0;
wire           MDDR_ADDR_0;
wire           MDDR_ADDR_1;
wire           MDDR_ADDR_2;
wire           MDDR_ADDR_3;
wire           MDDR_ADDR_4;
wire           MDDR_ADDR_5;
wire           MDDR_ADDR_6;
wire           MDDR_ADDR_7;
wire           MDDR_ADDR_8;
wire           MDDR_ADDR_9;
wire           MDDR_ADDR_10;
wire           MDDR_ADDR_11;
wire           MDDR_ADDR_12;
wire           MDDR_ADDR_13;
wire           MDDR_ADDR_14;
wire           MDDR_APB_S_PCLK;
wire           MDDR_APB_S_PRESET_N;
wire   [10:2]  MDDR_APB_S_PADDR;
wire           MDDR_APB_S_PENABLE;
wire   [15:0]  MDDR_APB_SLAVE_PRDATA;
wire           MDDR_APB_SLAVE_PREADY;
wire           MDDR_APB_S_PSEL;
wire           MDDR_APB_SLAVE_PSLVERR;
wire   [15:0]  MDDR_APB_S_PWDATA;
wire           MDDR_APB_S_PWRITE;
wire           MDDR_BA_net_0;
wire           MDDR_BA_0;
wire           MDDR_BA_1;
wire           MDDR_CAS_N_net_0;
wire           MDDR_CKE_net_0;
wire           MDDR_CLK_net_0;
wire           MDDR_CLK_N_net_0;
wire           MDDR_CS_N_net_0;
wire   [31:0]  MDDR_DDR_AHB0_S_HADDR;
wire   [2:2]   MDDR_DDR_AHB0_S_HBURST_slice_0;
wire   [1:1]   MDDR_DDR_AHB0_S_HBURST_slice_1;
wire   [0:0]   MDDR_DDR_AHB0_S_HBURST_slice_2;
wire           MDDR_DDR_AHB0_S_HMASTLOCK;
wire   [31:31] MDDR_DDR_AHB0_S_HRDATA_net_0;
wire   [30:30] MDDR_DDR_AHB0_S_HRDATA_0;
wire   [29:29] MDDR_DDR_AHB0_S_HRDATA_1;
wire   [28:28] MDDR_DDR_AHB0_S_HRDATA_2;
wire   [27:27] MDDR_DDR_AHB0_S_HRDATA_3;
wire   [26:26] MDDR_DDR_AHB0_S_HRDATA_4;
wire   [25:25] MDDR_DDR_AHB0_S_HRDATA_5;
wire   [24:24] MDDR_DDR_AHB0_S_HRDATA_6;
wire   [23:23] MDDR_DDR_AHB0_S_HRDATA_7;
wire   [22:22] MDDR_DDR_AHB0_S_HRDATA_8;
wire   [21:21] MDDR_DDR_AHB0_S_HRDATA_9;
wire   [20:20] MDDR_DDR_AHB0_S_HRDATA_10;
wire   [19:19] MDDR_DDR_AHB0_S_HRDATA_11;
wire   [18:18] MDDR_DDR_AHB0_S_HRDATA_12;
wire   [17:17] MDDR_DDR_AHB0_S_HRDATA_13;
wire   [16:16] MDDR_DDR_AHB0_S_HRDATA_14;
wire   [15:15] MDDR_DDR_AHB0_S_HRDATA_15;
wire   [14:14] MDDR_DDR_AHB0_S_HRDATA_16;
wire   [13:13] MDDR_DDR_AHB0_S_HRDATA_17;
wire   [12:12] MDDR_DDR_AHB0_S_HRDATA_18;
wire   [11:11] MDDR_DDR_AHB0_S_HRDATA_19;
wire   [10:10] MDDR_DDR_AHB0_S_HRDATA_20;
wire   [9:9]   MDDR_DDR_AHB0_S_HRDATA_21;
wire   [8:8]   MDDR_DDR_AHB0_S_HRDATA_22;
wire   [7:7]   MDDR_DDR_AHB0_S_HRDATA_23;
wire   [6:6]   MDDR_DDR_AHB0_S_HRDATA_24;
wire   [5:5]   MDDR_DDR_AHB0_S_HRDATA_25;
wire   [4:4]   MDDR_DDR_AHB0_S_HRDATA_26;
wire   [3:3]   MDDR_DDR_AHB0_S_HRDATA_27;
wire   [2:2]   MDDR_DDR_AHB0_S_HRDATA_28;
wire   [1:1]   MDDR_DDR_AHB0_S_HRDATA_29;
wire   [0:0]   MDDR_DDR_AHB0_S_HRDATA_30;
wire           MDDR_DDR_AHB0_S_HREADY;
wire           MDDR_DDR_AHB0_S_HREADYOUT_net_0;
wire   [0:0]   MDDR_DDR_AHB0_S_HRESP_net_0;
wire           MDDR_DDR_AHB0_S_HSEL;
wire   [1:0]   MDDR_DDR_AHB0_S_HSIZE;
wire   [1:0]   MDDR_DDR_AHB0_S_HTRANS;
wire   [31:31] MDDR_DDR_AHB0_S_HWDATA_slice_0;
wire   [30:30] MDDR_DDR_AHB0_S_HWDATA_slice_1;
wire   [29:29] MDDR_DDR_AHB0_S_HWDATA_slice_2;
wire   [28:28] MDDR_DDR_AHB0_S_HWDATA_slice_3;
wire   [27:27] MDDR_DDR_AHB0_S_HWDATA_slice_4;
wire   [26:26] MDDR_DDR_AHB0_S_HWDATA_slice_5;
wire   [25:25] MDDR_DDR_AHB0_S_HWDATA_slice_6;
wire   [24:24] MDDR_DDR_AHB0_S_HWDATA_slice_7;
wire   [23:23] MDDR_DDR_AHB0_S_HWDATA_slice_8;
wire   [22:22] MDDR_DDR_AHB0_S_HWDATA_slice_9;
wire   [21:21] MDDR_DDR_AHB0_S_HWDATA_slice_10;
wire   [20:20] MDDR_DDR_AHB0_S_HWDATA_slice_11;
wire   [19:19] MDDR_DDR_AHB0_S_HWDATA_slice_12;
wire   [18:18] MDDR_DDR_AHB0_S_HWDATA_slice_13;
wire   [17:17] MDDR_DDR_AHB0_S_HWDATA_slice_14;
wire   [16:16] MDDR_DDR_AHB0_S_HWDATA_slice_15;
wire   [15:15] MDDR_DDR_AHB0_S_HWDATA_slice_16;
wire   [14:14] MDDR_DDR_AHB0_S_HWDATA_slice_17;
wire   [13:13] MDDR_DDR_AHB0_S_HWDATA_slice_18;
wire   [12:12] MDDR_DDR_AHB0_S_HWDATA_slice_19;
wire   [11:11] MDDR_DDR_AHB0_S_HWDATA_slice_20;
wire   [10:10] MDDR_DDR_AHB0_S_HWDATA_slice_21;
wire   [9:9]   MDDR_DDR_AHB0_S_HWDATA_slice_22;
wire   [8:8]   MDDR_DDR_AHB0_S_HWDATA_slice_23;
wire   [7:7]   MDDR_DDR_AHB0_S_HWDATA_slice_24;
wire   [6:6]   MDDR_DDR_AHB0_S_HWDATA_slice_25;
wire   [5:5]   MDDR_DDR_AHB0_S_HWDATA_slice_26;
wire   [4:4]   MDDR_DDR_AHB0_S_HWDATA_slice_27;
wire   [3:3]   MDDR_DDR_AHB0_S_HWDATA_slice_28;
wire   [2:2]   MDDR_DDR_AHB0_S_HWDATA_slice_29;
wire   [1:1]   MDDR_DDR_AHB0_S_HWDATA_slice_30;
wire   [0:0]   MDDR_DDR_AHB0_S_HWDATA_slice_31;
wire           MDDR_DDR_AHB0_S_HWRITE;
wire           MDDR_DDR_CORE_RESET_N;
wire           MDDR_DM_RDQS_0_PAD_Y;
wire           MDDR_DM_RDQS_1_PAD_Y;
wire           MDDR_DQ_0_PAD_Y;
wire           MDDR_DQ_1_PAD_Y;
wire           MDDR_DQ_2_PAD_Y;
wire           MDDR_DQ_3_PAD_Y;
wire           MDDR_DQ_4_PAD_Y;
wire           MDDR_DQ_5_PAD_Y;
wire           MDDR_DQ_6_PAD_Y;
wire           MDDR_DQ_7_PAD_Y;
wire           MDDR_DQ_8_PAD_Y;
wire           MDDR_DQ_9_PAD_Y;
wire           MDDR_DQ_10_PAD_Y;
wire           MDDR_DQ_11_PAD_Y;
wire           MDDR_DQ_12_PAD_Y;
wire           MDDR_DQ_13_PAD_Y;
wire           MDDR_DQ_14_PAD_Y;
wire           MDDR_DQ_15_PAD_Y;
wire           MDDR_DQS_0_PAD_Y;
wire           MDDR_DQS_1_PAD_Y;
wire           MDDR_DQS_TMATCH_0_IN;
wire           MDDR_DQS_TMATCH_0_IN_PAD_Y;
wire           MDDR_DQS_TMATCH_0_OUT_net_0;
wire           MDDR_ODT_net_0;
wire           MDDR_RAS_N_net_0;
wire           MDDR_RESET_N_net_0;
wire           MDDR_WE_N_net_0;
wire   [0:0]   MSS_ADLIB_INST_DM_OE0to0;
wire   [1:1]   MSS_ADLIB_INST_DM_OE1to1;
wire   [0:0]   MSS_ADLIB_INST_DRAM_ADDR0to0;
wire   [1:1]   MSS_ADLIB_INST_DRAM_ADDR1to1;
wire   [2:2]   MSS_ADLIB_INST_DRAM_ADDR2to2;
wire   [3:3]   MSS_ADLIB_INST_DRAM_ADDR3to3;
wire   [4:4]   MSS_ADLIB_INST_DRAM_ADDR4to4;
wire   [5:5]   MSS_ADLIB_INST_DRAM_ADDR5to5;
wire   [6:6]   MSS_ADLIB_INST_DRAM_ADDR6to6;
wire   [7:7]   MSS_ADLIB_INST_DRAM_ADDR7to7;
wire   [8:8]   MSS_ADLIB_INST_DRAM_ADDR8to8;
wire   [9:9]   MSS_ADLIB_INST_DRAM_ADDR9to9;
wire   [10:10] MSS_ADLIB_INST_DRAM_ADDR10to10;
wire   [11:11] MSS_ADLIB_INST_DRAM_ADDR11to11;
wire   [12:12] MSS_ADLIB_INST_DRAM_ADDR12to12;
wire   [13:13] MSS_ADLIB_INST_DRAM_ADDR13to13;
wire   [14:14] MSS_ADLIB_INST_DRAM_ADDR14to14;
wire   [15:15] MSS_ADLIB_INST_DRAM_ADDR15to15;
wire   [0:0]   MSS_ADLIB_INST_DRAM_BA0to0;
wire   [1:1]   MSS_ADLIB_INST_DRAM_BA1to1;
wire   [2:2]   MSS_ADLIB_INST_DRAM_BA2to2;
wire           MSS_ADLIB_INST_DRAM_CASN;
wire           MSS_ADLIB_INST_DRAM_CKE;
wire           MSS_ADLIB_INST_DRAM_CLK;
wire           MSS_ADLIB_INST_DRAM_CSN;
wire   [0:0]   MSS_ADLIB_INST_DRAM_DM_RDQS_OUT0to0;
wire   [1:1]   MSS_ADLIB_INST_DRAM_DM_RDQS_OUT1to1;
wire   [0:0]   MSS_ADLIB_INST_DRAM_DQ_OE0to0;
wire   [1:1]   MSS_ADLIB_INST_DRAM_DQ_OE1to1;
wire   [2:2]   MSS_ADLIB_INST_DRAM_DQ_OE2to2;
wire   [3:3]   MSS_ADLIB_INST_DRAM_DQ_OE3to3;
wire   [4:4]   MSS_ADLIB_INST_DRAM_DQ_OE4to4;
wire   [5:5]   MSS_ADLIB_INST_DRAM_DQ_OE5to5;
wire   [6:6]   MSS_ADLIB_INST_DRAM_DQ_OE6to6;
wire   [7:7]   MSS_ADLIB_INST_DRAM_DQ_OE7to7;
wire   [8:8]   MSS_ADLIB_INST_DRAM_DQ_OE8to8;
wire   [9:9]   MSS_ADLIB_INST_DRAM_DQ_OE9to9;
wire   [10:10] MSS_ADLIB_INST_DRAM_DQ_OE10to10;
wire   [11:11] MSS_ADLIB_INST_DRAM_DQ_OE11to11;
wire   [12:12] MSS_ADLIB_INST_DRAM_DQ_OE12to12;
wire   [13:13] MSS_ADLIB_INST_DRAM_DQ_OE13to13;
wire   [14:14] MSS_ADLIB_INST_DRAM_DQ_OE14to14;
wire   [15:15] MSS_ADLIB_INST_DRAM_DQ_OE15to15;
wire   [0:0]   MSS_ADLIB_INST_DRAM_DQ_OUT0to0;
wire   [1:1]   MSS_ADLIB_INST_DRAM_DQ_OUT1to1;
wire   [2:2]   MSS_ADLIB_INST_DRAM_DQ_OUT2to2;
wire   [3:3]   MSS_ADLIB_INST_DRAM_DQ_OUT3to3;
wire   [4:4]   MSS_ADLIB_INST_DRAM_DQ_OUT4to4;
wire   [5:5]   MSS_ADLIB_INST_DRAM_DQ_OUT5to5;
wire   [6:6]   MSS_ADLIB_INST_DRAM_DQ_OUT6to6;
wire   [7:7]   MSS_ADLIB_INST_DRAM_DQ_OUT7to7;
wire   [8:8]   MSS_ADLIB_INST_DRAM_DQ_OUT8to8;
wire   [9:9]   MSS_ADLIB_INST_DRAM_DQ_OUT9to9;
wire   [10:10] MSS_ADLIB_INST_DRAM_DQ_OUT10to10;
wire   [11:11] MSS_ADLIB_INST_DRAM_DQ_OUT11to11;
wire   [12:12] MSS_ADLIB_INST_DRAM_DQ_OUT12to12;
wire   [13:13] MSS_ADLIB_INST_DRAM_DQ_OUT13to13;
wire   [14:14] MSS_ADLIB_INST_DRAM_DQ_OUT14to14;
wire   [15:15] MSS_ADLIB_INST_DRAM_DQ_OUT15to15;
wire   [0:0]   MSS_ADLIB_INST_DRAM_DQS_OE0to0;
wire   [1:1]   MSS_ADLIB_INST_DRAM_DQS_OE1to1;
wire   [0:0]   MSS_ADLIB_INST_DRAM_DQS_OUT0to0;
wire   [1:1]   MSS_ADLIB_INST_DRAM_DQS_OUT1to1;
wire   [0:0]   MSS_ADLIB_INST_DRAM_FIFO_WE_OUT0to0;
wire           MSS_ADLIB_INST_DRAM_ODT;
wire           MSS_ADLIB_INST_DRAM_RASN;
wire           MSS_ADLIB_INST_DRAM_RSTN;
wire           MSS_ADLIB_INST_DRAM_WEN;
wire   [15:0]  MSS_INT_F2M;
wire   [15:0]  MSS_INT_M2F_net_0;
wire           MSS_RESET_N_F2M;
wire           MSS_RESET_N_M2F_net_0;
wire           MSS_RESET_N_M2F_net_1;
wire           FIC_0_AHB_S_HRESP_net_1;
wire           FIC_0_AHB_S_HREADYOUT_net_1;
wire           FIC_2_APB_M_PRESET_N_0_net_0;
wire           FIC_2_APB_M_PCLK_0_net_0;
wire           FIC_2_APB_MASTER_0_PWRITE_net_0;
wire           FIC_2_APB_MASTER_0_PENABLE_net_0;
wire           FIC_2_APB_MASTER_0_PSELx_net_0;
wire           MDDR_APB_SLAVE_PREADY_net_0;
wire           MDDR_APB_SLAVE_PSLVERR_net_0;
wire           M3_NMI_net_1;
wire           COMM_BLK_INT_net_1;
wire           MDDR_DQS_TMATCH_0_OUT_net_1;
wire           MDDR_CAS_N_net_1;
wire           MDDR_CLK_net_1;
wire           MDDR_CLK_N_net_1;
wire           MDDR_CKE_net_1;
wire           MDDR_CS_N_net_1;
wire           MDDR_ODT_net_1;
wire           MDDR_RAS_N_net_1;
wire           MDDR_RESET_N_net_1;
wire           MDDR_WE_N_net_1;
wire           MDDR_DDR_AHB0_S_HREADYOUT_net_1;
wire           MDDR_DDR_AHB0_S_HRESP_net_1;
wire   [31:0]  FIC_0_AHB_S_HRDATA_net_1;
wire   [15:2]  FIC_2_APB_MASTER_0_PADDR_net_0;
wire   [31:0]  FIC_2_APB_MASTER_0_PWDATA_net_0;
wire   [15:0]  MDDR_APB_SLAVE_PRDATA_net_0;
wire   [15:0]  MSS_INT_M2F_net_1;
wire   [0:0]   MDDR_ADDR_14_net_0;
wire   [10:10] MDDR_ADDR_4_net_0;
wire   [11:11] MDDR_ADDR_3_net_0;
wire   [12:12] MDDR_ADDR_2_net_0;
wire   [13:13] MDDR_ADDR_1_net_0;
wire   [14:14] MDDR_ADDR_0_net_0;
wire   [15:15] MDDR_ADDR_net_1;
wire   [1:1]   MDDR_ADDR_13_net_0;
wire   [2:2]   MDDR_ADDR_12_net_0;
wire   [3:3]   MDDR_ADDR_11_net_0;
wire   [4:4]   MDDR_ADDR_10_net_0;
wire   [5:5]   MDDR_ADDR_9_net_0;
wire   [6:6]   MDDR_ADDR_8_net_0;
wire   [7:7]   MDDR_ADDR_7_net_0;
wire   [8:8]   MDDR_ADDR_6_net_0;
wire   [9:9]   MDDR_ADDR_5_net_0;
wire   [0:0]   MDDR_BA_1_net_0;
wire   [1:1]   MDDR_BA_0_net_0;
wire   [2:2]   MDDR_BA_net_1;
wire   [0:0]   MDDR_DDR_AHB0_S_HRDATA_30_net_0;
wire   [10:10] MDDR_DDR_AHB0_S_HRDATA_20_net_0;
wire   [11:11] MDDR_DDR_AHB0_S_HRDATA_19_net_0;
wire   [12:12] MDDR_DDR_AHB0_S_HRDATA_18_net_0;
wire   [13:13] MDDR_DDR_AHB0_S_HRDATA_17_net_0;
wire   [14:14] MDDR_DDR_AHB0_S_HRDATA_16_net_0;
wire   [15:15] MDDR_DDR_AHB0_S_HRDATA_15_net_0;
wire   [16:16] MDDR_DDR_AHB0_S_HRDATA_14_net_0;
wire   [17:17] MDDR_DDR_AHB0_S_HRDATA_13_net_0;
wire   [18:18] MDDR_DDR_AHB0_S_HRDATA_12_net_0;
wire   [19:19] MDDR_DDR_AHB0_S_HRDATA_11_net_0;
wire   [1:1]   MDDR_DDR_AHB0_S_HRDATA_29_net_0;
wire   [20:20] MDDR_DDR_AHB0_S_HRDATA_10_net_0;
wire   [21:21] MDDR_DDR_AHB0_S_HRDATA_9_net_0;
wire   [22:22] MDDR_DDR_AHB0_S_HRDATA_8_net_0;
wire   [23:23] MDDR_DDR_AHB0_S_HRDATA_7_net_0;
wire   [24:24] MDDR_DDR_AHB0_S_HRDATA_6_net_0;
wire   [25:25] MDDR_DDR_AHB0_S_HRDATA_5_net_0;
wire   [26:26] MDDR_DDR_AHB0_S_HRDATA_4_net_0;
wire   [27:27] MDDR_DDR_AHB0_S_HRDATA_3_net_0;
wire   [28:28] MDDR_DDR_AHB0_S_HRDATA_2_net_0;
wire   [29:29] MDDR_DDR_AHB0_S_HRDATA_1_net_0;
wire   [2:2]   MDDR_DDR_AHB0_S_HRDATA_28_net_0;
wire   [30:30] MDDR_DDR_AHB0_S_HRDATA_0_net_0;
wire   [31:31] MDDR_DDR_AHB0_S_HRDATA_net_1;
wire   [3:3]   MDDR_DDR_AHB0_S_HRDATA_27_net_0;
wire   [4:4]   MDDR_DDR_AHB0_S_HRDATA_26_net_0;
wire   [5:5]   MDDR_DDR_AHB0_S_HRDATA_25_net_0;
wire   [6:6]   MDDR_DDR_AHB0_S_HRDATA_24_net_0;
wire   [7:7]   MDDR_DDR_AHB0_S_HRDATA_23_net_0;
wire   [8:8]   MDDR_DDR_AHB0_S_HRDATA_22_net_0;
wire   [9:9]   MDDR_DDR_AHB0_S_HRDATA_21_net_0;
wire   [1:1]   F_BRESP_HRESP0_slice_0;
wire   [32:32] F_RDATA_HRDATA01_slice_0;
wire   [33:33] F_RDATA_HRDATA01_slice_1;
wire   [34:34] F_RDATA_HRDATA01_slice_2;
wire   [35:35] F_RDATA_HRDATA01_slice_3;
wire   [36:36] F_RDATA_HRDATA01_slice_4;
wire   [37:37] F_RDATA_HRDATA01_slice_5;
wire   [38:38] F_RDATA_HRDATA01_slice_6;
wire   [39:39] F_RDATA_HRDATA01_slice_7;
wire   [40:40] F_RDATA_HRDATA01_slice_8;
wire   [41:41] F_RDATA_HRDATA01_slice_9;
wire   [42:42] F_RDATA_HRDATA01_slice_10;
wire   [43:43] F_RDATA_HRDATA01_slice_11;
wire   [44:44] F_RDATA_HRDATA01_slice_12;
wire   [45:45] F_RDATA_HRDATA01_slice_13;
wire   [46:46] F_RDATA_HRDATA01_slice_14;
wire   [47:47] F_RDATA_HRDATA01_slice_15;
wire   [48:48] F_RDATA_HRDATA01_slice_16;
wire   [49:49] F_RDATA_HRDATA01_slice_17;
wire   [50:50] F_RDATA_HRDATA01_slice_18;
wire   [51:51] F_RDATA_HRDATA01_slice_19;
wire   [52:52] F_RDATA_HRDATA01_slice_20;
wire   [53:53] F_RDATA_HRDATA01_slice_21;
wire   [54:54] F_RDATA_HRDATA01_slice_22;
wire   [55:55] F_RDATA_HRDATA01_slice_23;
wire   [56:56] F_RDATA_HRDATA01_slice_24;
wire   [57:57] F_RDATA_HRDATA01_slice_25;
wire   [58:58] F_RDATA_HRDATA01_slice_26;
wire   [59:59] F_RDATA_HRDATA01_slice_27;
wire   [60:60] F_RDATA_HRDATA01_slice_28;
wire   [61:61] F_RDATA_HRDATA01_slice_29;
wire   [62:62] F_RDATA_HRDATA01_slice_30;
wire   [63:63] F_RDATA_HRDATA01_slice_31;
wire   [2:2]   DRAM_DM_RDQS_OUT_slice_0;
wire   [16:16] DRAM_DQ_OUT_slice_0;
wire   [17:17] DRAM_DQ_OUT_slice_1;
wire   [2:2]   DRAM_DQS_OUT_slice_0;
wire   [1:1]   DRAM_FIFO_WE_OUT_slice_0;
wire   [2:2]   DM_OE_slice_0;
wire   [16:16] DRAM_DQ_OE_slice_0;
wire   [17:17] DRAM_DQ_OE_slice_1;
wire   [2:2]   DRAM_DQS_OE_slice_0;
wire   [3:0]   F_AWID_HSEL0_net_0;
wire   [3:0]   F_AWLEN_HBURST0_net_0;
wire   [1:0]   F_AWLOCK_HMASTLOCK0_net_0;
wire   [63:0]  F_WDATA_HWDATA01_net_0;
wire   [3:0]   F_WID_HREADY01_net_0;
wire   [1:0]   FIC_0_AHB_S_HTRANS;
wire   [2:0]   MDDR_DDR_AHB0_S_HBURST;
wire   [31:0]  MDDR_DDR_AHB0_S_HWDATA;
wire   [1:0]   F_BRESP_HRESP0_net_0;
wire   [63:0]  F_RDATA_HRDATA01_net_0;
wire   [2:0]   DM_IN_net_0;
wire   [17:0]  DRAM_DQ_IN_net_0;
wire   [2:0]   DRAM_DQS_IN_net_0;
wire   [1:0]   DRAM_FIFO_WE_IN_net_0;
wire   [15:0]  DRAM_ADDR_net_0;
wire   [2:0]   DRAM_BA_net_0;
wire   [2:0]   DRAM_DM_RDQS_OUT_net_0;
wire   [17:0]  DRAM_DQ_OUT_net_0;
wire   [2:0]   DRAM_DQS_OUT_net_0;
wire   [1:0]   DRAM_FIFO_WE_OUT_net_0;
wire   [2:0]   DM_OE_net_0;
wire   [17:0]  DRAM_DQ_OE_net_0;
wire   [2:0]   DRAM_DQS_OE_net_0;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire           GND_net;
wire           VCC_net;
wire   [1:0]   F2_DMAREADY_const_net_0;
wire   [1:0]   F_DMAREADY_const_net_0;
wire   [31:0]  F_HM0_RDATA_const_net_0;
wire   [1:0]   FAB_LINESTATE_const_net_0;
wire   [7:0]   FAB_VSTATUS_const_net_0;
wire   [7:0]   FAB_XDATAIN_const_net_0;
wire   [9:0]   RCGF_const_net_0;
wire   [7:0]   RXDF_const_net_0;
wire   [31:0]  F_ARADDR_HADDR1_const_net_0;
wire   [1:0]   F_ARBURST_HTRANS1_const_net_0;
wire   [3:0]   F_ARID_HSEL1_const_net_0;
wire   [3:0]   F_ARLEN_HBURST1_const_net_0;
wire   [1:0]   F_ARLOCK_HMASTLOCK1_const_net_0;
wire   [1:0]   F_ARSIZE_HSIZE1_const_net_0;
wire   [7:0]   F_WSTRB_const_net_0;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net                         = 1'b0;
assign VCC_net                         = 1'b1;
assign F2_DMAREADY_const_net_0         = 2'h3;
assign F_DMAREADY_const_net_0          = 2'h3;
assign F_HM0_RDATA_const_net_0         = 32'h00000000;
assign FAB_LINESTATE_const_net_0       = 2'h3;
assign FAB_VSTATUS_const_net_0         = 8'hFF;
assign FAB_XDATAIN_const_net_0         = 8'hFF;
assign RCGF_const_net_0                = 10'h3FF;
assign RXDF_const_net_0                = 8'hFF;
assign F_ARADDR_HADDR1_const_net_0     = 32'hFFFFFFFF;
assign F_ARBURST_HTRANS1_const_net_0   = 2'h0;
assign F_ARID_HSEL1_const_net_0        = 4'h0;
assign F_ARLEN_HBURST1_const_net_0     = 4'h0;
assign F_ARLOCK_HMASTLOCK1_const_net_0 = 2'h0;
assign F_ARSIZE_HSIZE1_const_net_0     = 2'h0;
assign F_WSTRB_const_net_0             = 8'h00;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign MSS_RESET_N_M2F_net_1               = MSS_RESET_N_M2F_net_0;
assign MSS_RESET_N_M2F                     = MSS_RESET_N_M2F_net_1;
assign FIC_0_AHB_S_HRESP_net_1             = FIC_0_AHB_S_HRESP_net_0;
assign FIC_0_AHB_S_HRESP                   = FIC_0_AHB_S_HRESP_net_1;
assign FIC_0_AHB_S_HREADYOUT_net_1         = FIC_0_AHB_S_HREADYOUT_net_0;
assign FIC_0_AHB_S_HREADYOUT               = FIC_0_AHB_S_HREADYOUT_net_1;
assign FIC_2_APB_M_PRESET_N_0_net_0        = FIC_2_APB_M_PRESET_N_0;
assign FIC_2_APB_M_PRESET_N                = FIC_2_APB_M_PRESET_N_0_net_0;
assign FIC_2_APB_M_PCLK_0_net_0            = FIC_2_APB_M_PCLK_0;
assign FIC_2_APB_M_PCLK                    = FIC_2_APB_M_PCLK_0_net_0;
assign FIC_2_APB_MASTER_0_PWRITE_net_0     = FIC_2_APB_MASTER_0_PWRITE;
assign FIC_2_APB_M_PWRITE                  = FIC_2_APB_MASTER_0_PWRITE_net_0;
assign FIC_2_APB_MASTER_0_PENABLE_net_0    = FIC_2_APB_MASTER_0_PENABLE;
assign FIC_2_APB_M_PENABLE                 = FIC_2_APB_MASTER_0_PENABLE_net_0;
assign FIC_2_APB_MASTER_0_PSELx_net_0      = FIC_2_APB_MASTER_0_PSELx;
assign FIC_2_APB_M_PSEL                    = FIC_2_APB_MASTER_0_PSELx_net_0;
assign MDDR_APB_SLAVE_PREADY_net_0         = MDDR_APB_SLAVE_PREADY;
assign MDDR_APB_S_PREADY                   = MDDR_APB_SLAVE_PREADY_net_0;
assign MDDR_APB_SLAVE_PSLVERR_net_0        = MDDR_APB_SLAVE_PSLVERR;
assign MDDR_APB_S_PSLVERR                  = MDDR_APB_SLAVE_PSLVERR_net_0;
assign M3_NMI_net_1                        = M3_NMI_net_0;
assign M3_NMI                              = M3_NMI_net_1;
assign COMM_BLK_INT_net_1                  = COMM_BLK_INT_net_0;
assign COMM_BLK_INT                        = COMM_BLK_INT_net_1;
assign MDDR_DQS_TMATCH_0_OUT_net_1         = MDDR_DQS_TMATCH_0_OUT_net_0;
assign MDDR_DQS_TMATCH_0_OUT               = MDDR_DQS_TMATCH_0_OUT_net_1;
assign MDDR_CAS_N_net_1                    = MDDR_CAS_N_net_0;
assign MDDR_CAS_N                          = MDDR_CAS_N_net_1;
assign MDDR_CLK_net_1                      = MDDR_CLK_net_0;
assign MDDR_CLK                            = MDDR_CLK_net_1;
assign MDDR_CLK_N_net_1                    = MDDR_CLK_N_net_0;
assign MDDR_CLK_N                          = MDDR_CLK_N_net_1;
assign MDDR_CKE_net_1                      = MDDR_CKE_net_0;
assign MDDR_CKE                            = MDDR_CKE_net_1;
assign MDDR_CS_N_net_1                     = MDDR_CS_N_net_0;
assign MDDR_CS_N                           = MDDR_CS_N_net_1;
assign MDDR_ODT_net_1                      = MDDR_ODT_net_0;
assign MDDR_ODT                            = MDDR_ODT_net_1;
assign MDDR_RAS_N_net_1                    = MDDR_RAS_N_net_0;
assign MDDR_RAS_N                          = MDDR_RAS_N_net_1;
assign MDDR_RESET_N_net_1                  = MDDR_RESET_N_net_0;
assign MDDR_RESET_N                        = MDDR_RESET_N_net_1;
assign MDDR_WE_N_net_1                     = MDDR_WE_N_net_0;
assign MDDR_WE_N                           = MDDR_WE_N_net_1;
assign MDDR_DDR_AHB0_S_HREADYOUT_net_1     = MDDR_DDR_AHB0_S_HREADYOUT_net_0;
assign MDDR_DDR_AHB0_S_HREADYOUT           = MDDR_DDR_AHB0_S_HREADYOUT_net_1;
assign MDDR_DDR_AHB0_S_HRESP_net_1         = MDDR_DDR_AHB0_S_HRESP_net_0[0];
assign MDDR_DDR_AHB0_S_HRESP               = MDDR_DDR_AHB0_S_HRESP_net_1;
assign FIC_0_AHB_S_HRDATA_net_1            = FIC_0_AHB_S_HRDATA_net_0;
assign FIC_0_AHB_S_HRDATA[31:0]            = FIC_0_AHB_S_HRDATA_net_1;
assign FIC_2_APB_MASTER_0_PADDR_net_0      = FIC_2_APB_MASTER_0_PADDR;
assign FIC_2_APB_M_PADDR[15:2]             = FIC_2_APB_MASTER_0_PADDR_net_0;
assign FIC_2_APB_MASTER_0_PWDATA_net_0     = FIC_2_APB_MASTER_0_PWDATA;
assign FIC_2_APB_M_PWDATA[31:0]            = FIC_2_APB_MASTER_0_PWDATA_net_0;
assign MDDR_APB_SLAVE_PRDATA_net_0         = MDDR_APB_SLAVE_PRDATA;
assign MDDR_APB_S_PRDATA[15:0]             = MDDR_APB_SLAVE_PRDATA_net_0;
assign MSS_INT_M2F_net_1                   = MSS_INT_M2F_net_0;
assign MSS_INT_M2F[15:0]                   = MSS_INT_M2F_net_1;
assign MDDR_ADDR_14_net_0[0]               = MDDR_ADDR_14;
assign MDDR_ADDR[0:0]                      = MDDR_ADDR_14_net_0[0];
assign MDDR_ADDR_4_net_0[10]               = MDDR_ADDR_4;
assign MDDR_ADDR[10:10]                    = MDDR_ADDR_4_net_0[10];
assign MDDR_ADDR_3_net_0[11]               = MDDR_ADDR_3;
assign MDDR_ADDR[11:11]                    = MDDR_ADDR_3_net_0[11];
assign MDDR_ADDR_2_net_0[12]               = MDDR_ADDR_2;
assign MDDR_ADDR[12:12]                    = MDDR_ADDR_2_net_0[12];
assign MDDR_ADDR_1_net_0[13]               = MDDR_ADDR_1;
assign MDDR_ADDR[13:13]                    = MDDR_ADDR_1_net_0[13];
assign MDDR_ADDR_0_net_0[14]               = MDDR_ADDR_0;
assign MDDR_ADDR[14:14]                    = MDDR_ADDR_0_net_0[14];
assign MDDR_ADDR_net_1[15]                 = MDDR_ADDR_net_0;
assign MDDR_ADDR[15:15]                    = MDDR_ADDR_net_1[15];
assign MDDR_ADDR_13_net_0[1]               = MDDR_ADDR_13;
assign MDDR_ADDR[1:1]                      = MDDR_ADDR_13_net_0[1];
assign MDDR_ADDR_12_net_0[2]               = MDDR_ADDR_12;
assign MDDR_ADDR[2:2]                      = MDDR_ADDR_12_net_0[2];
assign MDDR_ADDR_11_net_0[3]               = MDDR_ADDR_11;
assign MDDR_ADDR[3:3]                      = MDDR_ADDR_11_net_0[3];
assign MDDR_ADDR_10_net_0[4]               = MDDR_ADDR_10;
assign MDDR_ADDR[4:4]                      = MDDR_ADDR_10_net_0[4];
assign MDDR_ADDR_9_net_0[5]                = MDDR_ADDR_9;
assign MDDR_ADDR[5:5]                      = MDDR_ADDR_9_net_0[5];
assign MDDR_ADDR_8_net_0[6]                = MDDR_ADDR_8;
assign MDDR_ADDR[6:6]                      = MDDR_ADDR_8_net_0[6];
assign MDDR_ADDR_7_net_0[7]                = MDDR_ADDR_7;
assign MDDR_ADDR[7:7]                      = MDDR_ADDR_7_net_0[7];
assign MDDR_ADDR_6_net_0[8]                = MDDR_ADDR_6;
assign MDDR_ADDR[8:8]                      = MDDR_ADDR_6_net_0[8];
assign MDDR_ADDR_5_net_0[9]                = MDDR_ADDR_5;
assign MDDR_ADDR[9:9]                      = MDDR_ADDR_5_net_0[9];
assign MDDR_BA_1_net_0[0]                  = MDDR_BA_1;
assign MDDR_BA[0:0]                        = MDDR_BA_1_net_0[0];
assign MDDR_BA_0_net_0[1]                  = MDDR_BA_0;
assign MDDR_BA[1:1]                        = MDDR_BA_0_net_0[1];
assign MDDR_BA_net_1[2]                    = MDDR_BA_net_0;
assign MDDR_BA[2:2]                        = MDDR_BA_net_1[2];
assign MDDR_DDR_AHB0_S_HRDATA_30_net_0[0]  = MDDR_DDR_AHB0_S_HRDATA_30[0];
assign MDDR_DDR_AHB0_S_HRDATA[0:0]         = MDDR_DDR_AHB0_S_HRDATA_30_net_0[0];
assign MDDR_DDR_AHB0_S_HRDATA_20_net_0[10] = MDDR_DDR_AHB0_S_HRDATA_20[10];
assign MDDR_DDR_AHB0_S_HRDATA[10:10]       = MDDR_DDR_AHB0_S_HRDATA_20_net_0[10];
assign MDDR_DDR_AHB0_S_HRDATA_19_net_0[11] = MDDR_DDR_AHB0_S_HRDATA_19[11];
assign MDDR_DDR_AHB0_S_HRDATA[11:11]       = MDDR_DDR_AHB0_S_HRDATA_19_net_0[11];
assign MDDR_DDR_AHB0_S_HRDATA_18_net_0[12] = MDDR_DDR_AHB0_S_HRDATA_18[12];
assign MDDR_DDR_AHB0_S_HRDATA[12:12]       = MDDR_DDR_AHB0_S_HRDATA_18_net_0[12];
assign MDDR_DDR_AHB0_S_HRDATA_17_net_0[13] = MDDR_DDR_AHB0_S_HRDATA_17[13];
assign MDDR_DDR_AHB0_S_HRDATA[13:13]       = MDDR_DDR_AHB0_S_HRDATA_17_net_0[13];
assign MDDR_DDR_AHB0_S_HRDATA_16_net_0[14] = MDDR_DDR_AHB0_S_HRDATA_16[14];
assign MDDR_DDR_AHB0_S_HRDATA[14:14]       = MDDR_DDR_AHB0_S_HRDATA_16_net_0[14];
assign MDDR_DDR_AHB0_S_HRDATA_15_net_0[15] = MDDR_DDR_AHB0_S_HRDATA_15[15];
assign MDDR_DDR_AHB0_S_HRDATA[15:15]       = MDDR_DDR_AHB0_S_HRDATA_15_net_0[15];
assign MDDR_DDR_AHB0_S_HRDATA_14_net_0[16] = MDDR_DDR_AHB0_S_HRDATA_14[16];
assign MDDR_DDR_AHB0_S_HRDATA[16:16]       = MDDR_DDR_AHB0_S_HRDATA_14_net_0[16];
assign MDDR_DDR_AHB0_S_HRDATA_13_net_0[17] = MDDR_DDR_AHB0_S_HRDATA_13[17];
assign MDDR_DDR_AHB0_S_HRDATA[17:17]       = MDDR_DDR_AHB0_S_HRDATA_13_net_0[17];
assign MDDR_DDR_AHB0_S_HRDATA_12_net_0[18] = MDDR_DDR_AHB0_S_HRDATA_12[18];
assign MDDR_DDR_AHB0_S_HRDATA[18:18]       = MDDR_DDR_AHB0_S_HRDATA_12_net_0[18];
assign MDDR_DDR_AHB0_S_HRDATA_11_net_0[19] = MDDR_DDR_AHB0_S_HRDATA_11[19];
assign MDDR_DDR_AHB0_S_HRDATA[19:19]       = MDDR_DDR_AHB0_S_HRDATA_11_net_0[19];
assign MDDR_DDR_AHB0_S_HRDATA_29_net_0[1]  = MDDR_DDR_AHB0_S_HRDATA_29[1];
assign MDDR_DDR_AHB0_S_HRDATA[1:1]         = MDDR_DDR_AHB0_S_HRDATA_29_net_0[1];
assign MDDR_DDR_AHB0_S_HRDATA_10_net_0[20] = MDDR_DDR_AHB0_S_HRDATA_10[20];
assign MDDR_DDR_AHB0_S_HRDATA[20:20]       = MDDR_DDR_AHB0_S_HRDATA_10_net_0[20];
assign MDDR_DDR_AHB0_S_HRDATA_9_net_0[21]  = MDDR_DDR_AHB0_S_HRDATA_9[21];
assign MDDR_DDR_AHB0_S_HRDATA[21:21]       = MDDR_DDR_AHB0_S_HRDATA_9_net_0[21];
assign MDDR_DDR_AHB0_S_HRDATA_8_net_0[22]  = MDDR_DDR_AHB0_S_HRDATA_8[22];
assign MDDR_DDR_AHB0_S_HRDATA[22:22]       = MDDR_DDR_AHB0_S_HRDATA_8_net_0[22];
assign MDDR_DDR_AHB0_S_HRDATA_7_net_0[23]  = MDDR_DDR_AHB0_S_HRDATA_7[23];
assign MDDR_DDR_AHB0_S_HRDATA[23:23]       = MDDR_DDR_AHB0_S_HRDATA_7_net_0[23];
assign MDDR_DDR_AHB0_S_HRDATA_6_net_0[24]  = MDDR_DDR_AHB0_S_HRDATA_6[24];
assign MDDR_DDR_AHB0_S_HRDATA[24:24]       = MDDR_DDR_AHB0_S_HRDATA_6_net_0[24];
assign MDDR_DDR_AHB0_S_HRDATA_5_net_0[25]  = MDDR_DDR_AHB0_S_HRDATA_5[25];
assign MDDR_DDR_AHB0_S_HRDATA[25:25]       = MDDR_DDR_AHB0_S_HRDATA_5_net_0[25];
assign MDDR_DDR_AHB0_S_HRDATA_4_net_0[26]  = MDDR_DDR_AHB0_S_HRDATA_4[26];
assign MDDR_DDR_AHB0_S_HRDATA[26:26]       = MDDR_DDR_AHB0_S_HRDATA_4_net_0[26];
assign MDDR_DDR_AHB0_S_HRDATA_3_net_0[27]  = MDDR_DDR_AHB0_S_HRDATA_3[27];
assign MDDR_DDR_AHB0_S_HRDATA[27:27]       = MDDR_DDR_AHB0_S_HRDATA_3_net_0[27];
assign MDDR_DDR_AHB0_S_HRDATA_2_net_0[28]  = MDDR_DDR_AHB0_S_HRDATA_2[28];
assign MDDR_DDR_AHB0_S_HRDATA[28:28]       = MDDR_DDR_AHB0_S_HRDATA_2_net_0[28];
assign MDDR_DDR_AHB0_S_HRDATA_1_net_0[29]  = MDDR_DDR_AHB0_S_HRDATA_1[29];
assign MDDR_DDR_AHB0_S_HRDATA[29:29]       = MDDR_DDR_AHB0_S_HRDATA_1_net_0[29];
assign MDDR_DDR_AHB0_S_HRDATA_28_net_0[2]  = MDDR_DDR_AHB0_S_HRDATA_28[2];
assign MDDR_DDR_AHB0_S_HRDATA[2:2]         = MDDR_DDR_AHB0_S_HRDATA_28_net_0[2];
assign MDDR_DDR_AHB0_S_HRDATA_0_net_0[30]  = MDDR_DDR_AHB0_S_HRDATA_0[30];
assign MDDR_DDR_AHB0_S_HRDATA[30:30]       = MDDR_DDR_AHB0_S_HRDATA_0_net_0[30];
assign MDDR_DDR_AHB0_S_HRDATA_net_1[31]    = MDDR_DDR_AHB0_S_HRDATA_net_0[31];
assign MDDR_DDR_AHB0_S_HRDATA[31:31]       = MDDR_DDR_AHB0_S_HRDATA_net_1[31];
assign MDDR_DDR_AHB0_S_HRDATA_27_net_0[3]  = MDDR_DDR_AHB0_S_HRDATA_27[3];
assign MDDR_DDR_AHB0_S_HRDATA[3:3]         = MDDR_DDR_AHB0_S_HRDATA_27_net_0[3];
assign MDDR_DDR_AHB0_S_HRDATA_26_net_0[4]  = MDDR_DDR_AHB0_S_HRDATA_26[4];
assign MDDR_DDR_AHB0_S_HRDATA[4:4]         = MDDR_DDR_AHB0_S_HRDATA_26_net_0[4];
assign MDDR_DDR_AHB0_S_HRDATA_25_net_0[5]  = MDDR_DDR_AHB0_S_HRDATA_25[5];
assign MDDR_DDR_AHB0_S_HRDATA[5:5]         = MDDR_DDR_AHB0_S_HRDATA_25_net_0[5];
assign MDDR_DDR_AHB0_S_HRDATA_24_net_0[6]  = MDDR_DDR_AHB0_S_HRDATA_24[6];
assign MDDR_DDR_AHB0_S_HRDATA[6:6]         = MDDR_DDR_AHB0_S_HRDATA_24_net_0[6];
assign MDDR_DDR_AHB0_S_HRDATA_23_net_0[7]  = MDDR_DDR_AHB0_S_HRDATA_23[7];
assign MDDR_DDR_AHB0_S_HRDATA[7:7]         = MDDR_DDR_AHB0_S_HRDATA_23_net_0[7];
assign MDDR_DDR_AHB0_S_HRDATA_22_net_0[8]  = MDDR_DDR_AHB0_S_HRDATA_22[8];
assign MDDR_DDR_AHB0_S_HRDATA[8:8]         = MDDR_DDR_AHB0_S_HRDATA_22_net_0[8];
assign MDDR_DDR_AHB0_S_HRDATA_21_net_0[9]  = MDDR_DDR_AHB0_S_HRDATA_21[9];
assign MDDR_DDR_AHB0_S_HRDATA[9:9]         = MDDR_DDR_AHB0_S_HRDATA_21_net_0[9];
//--------------------------------------------------------------------
// Slices assignments
//--------------------------------------------------------------------
assign FIC_0_AHB_S_HTRANS_slice_0[1]          = FIC_0_AHB_S_HTRANS[1:1];
assign FIC_0_AHB_S_HTRANS_slice_1[0]          = FIC_0_AHB_S_HTRANS[0:0];
assign MDDR_DDR_AHB0_S_HBURST_slice_0[2]      = MDDR_DDR_AHB0_S_HBURST[2:2];
assign MDDR_DDR_AHB0_S_HBURST_slice_1[1]      = MDDR_DDR_AHB0_S_HBURST[1:1];
assign MDDR_DDR_AHB0_S_HBURST_slice_2[0]      = MDDR_DDR_AHB0_S_HBURST[0:0];
assign MDDR_DDR_AHB0_S_HRDATA_net_0[31]       = F_RDATA_HRDATA01_net_0[31:31];
assign MDDR_DDR_AHB0_S_HRDATA_0[30]           = F_RDATA_HRDATA01_net_0[30:30];
assign MDDR_DDR_AHB0_S_HRDATA_1[29]           = F_RDATA_HRDATA01_net_0[29:29];
assign MDDR_DDR_AHB0_S_HRDATA_2[28]           = F_RDATA_HRDATA01_net_0[28:28];
assign MDDR_DDR_AHB0_S_HRDATA_3[27]           = F_RDATA_HRDATA01_net_0[27:27];
assign MDDR_DDR_AHB0_S_HRDATA_4[26]           = F_RDATA_HRDATA01_net_0[26:26];
assign MDDR_DDR_AHB0_S_HRDATA_5[25]           = F_RDATA_HRDATA01_net_0[25:25];
assign MDDR_DDR_AHB0_S_HRDATA_6[24]           = F_RDATA_HRDATA01_net_0[24:24];
assign MDDR_DDR_AHB0_S_HRDATA_7[23]           = F_RDATA_HRDATA01_net_0[23:23];
assign MDDR_DDR_AHB0_S_HRDATA_8[22]           = F_RDATA_HRDATA01_net_0[22:22];
assign MDDR_DDR_AHB0_S_HRDATA_9[21]           = F_RDATA_HRDATA01_net_0[21:21];
assign MDDR_DDR_AHB0_S_HRDATA_10[20]          = F_RDATA_HRDATA01_net_0[20:20];
assign MDDR_DDR_AHB0_S_HRDATA_11[19]          = F_RDATA_HRDATA01_net_0[19:19];
assign MDDR_DDR_AHB0_S_HRDATA_12[18]          = F_RDATA_HRDATA01_net_0[18:18];
assign MDDR_DDR_AHB0_S_HRDATA_13[17]          = F_RDATA_HRDATA01_net_0[17:17];
assign MDDR_DDR_AHB0_S_HRDATA_14[16]          = F_RDATA_HRDATA01_net_0[16:16];
assign MDDR_DDR_AHB0_S_HRDATA_15[15]          = F_RDATA_HRDATA01_net_0[15:15];
assign MDDR_DDR_AHB0_S_HRDATA_16[14]          = F_RDATA_HRDATA01_net_0[14:14];
assign MDDR_DDR_AHB0_S_HRDATA_17[13]          = F_RDATA_HRDATA01_net_0[13:13];
assign MDDR_DDR_AHB0_S_HRDATA_18[12]          = F_RDATA_HRDATA01_net_0[12:12];
assign MDDR_DDR_AHB0_S_HRDATA_19[11]          = F_RDATA_HRDATA01_net_0[11:11];
assign MDDR_DDR_AHB0_S_HRDATA_20[10]          = F_RDATA_HRDATA01_net_0[10:10];
assign MDDR_DDR_AHB0_S_HRDATA_21[9]           = F_RDATA_HRDATA01_net_0[9:9];
assign MDDR_DDR_AHB0_S_HRDATA_22[8]           = F_RDATA_HRDATA01_net_0[8:8];
assign MDDR_DDR_AHB0_S_HRDATA_23[7]           = F_RDATA_HRDATA01_net_0[7:7];
assign MDDR_DDR_AHB0_S_HRDATA_24[6]           = F_RDATA_HRDATA01_net_0[6:6];
assign MDDR_DDR_AHB0_S_HRDATA_25[5]           = F_RDATA_HRDATA01_net_0[5:5];
assign MDDR_DDR_AHB0_S_HRDATA_26[4]           = F_RDATA_HRDATA01_net_0[4:4];
assign MDDR_DDR_AHB0_S_HRDATA_27[3]           = F_RDATA_HRDATA01_net_0[3:3];
assign MDDR_DDR_AHB0_S_HRDATA_28[2]           = F_RDATA_HRDATA01_net_0[2:2];
assign MDDR_DDR_AHB0_S_HRDATA_29[1]           = F_RDATA_HRDATA01_net_0[1:1];
assign MDDR_DDR_AHB0_S_HRDATA_30[0]           = F_RDATA_HRDATA01_net_0[0:0];
assign MDDR_DDR_AHB0_S_HRESP_net_0[0]         = F_BRESP_HRESP0_net_0[0:0];
assign MDDR_DDR_AHB0_S_HWDATA_slice_0[31]     = MDDR_DDR_AHB0_S_HWDATA[31:31];
assign MDDR_DDR_AHB0_S_HWDATA_slice_1[30]     = MDDR_DDR_AHB0_S_HWDATA[30:30];
assign MDDR_DDR_AHB0_S_HWDATA_slice_2[29]     = MDDR_DDR_AHB0_S_HWDATA[29:29];
assign MDDR_DDR_AHB0_S_HWDATA_slice_3[28]     = MDDR_DDR_AHB0_S_HWDATA[28:28];
assign MDDR_DDR_AHB0_S_HWDATA_slice_4[27]     = MDDR_DDR_AHB0_S_HWDATA[27:27];
assign MDDR_DDR_AHB0_S_HWDATA_slice_5[26]     = MDDR_DDR_AHB0_S_HWDATA[26:26];
assign MDDR_DDR_AHB0_S_HWDATA_slice_6[25]     = MDDR_DDR_AHB0_S_HWDATA[25:25];
assign MDDR_DDR_AHB0_S_HWDATA_slice_7[24]     = MDDR_DDR_AHB0_S_HWDATA[24:24];
assign MDDR_DDR_AHB0_S_HWDATA_slice_8[23]     = MDDR_DDR_AHB0_S_HWDATA[23:23];
assign MDDR_DDR_AHB0_S_HWDATA_slice_9[22]     = MDDR_DDR_AHB0_S_HWDATA[22:22];
assign MDDR_DDR_AHB0_S_HWDATA_slice_10[21]    = MDDR_DDR_AHB0_S_HWDATA[21:21];
assign MDDR_DDR_AHB0_S_HWDATA_slice_11[20]    = MDDR_DDR_AHB0_S_HWDATA[20:20];
assign MDDR_DDR_AHB0_S_HWDATA_slice_12[19]    = MDDR_DDR_AHB0_S_HWDATA[19:19];
assign MDDR_DDR_AHB0_S_HWDATA_slice_13[18]    = MDDR_DDR_AHB0_S_HWDATA[18:18];
assign MDDR_DDR_AHB0_S_HWDATA_slice_14[17]    = MDDR_DDR_AHB0_S_HWDATA[17:17];
assign MDDR_DDR_AHB0_S_HWDATA_slice_15[16]    = MDDR_DDR_AHB0_S_HWDATA[16:16];
assign MDDR_DDR_AHB0_S_HWDATA_slice_16[15]    = MDDR_DDR_AHB0_S_HWDATA[15:15];
assign MDDR_DDR_AHB0_S_HWDATA_slice_17[14]    = MDDR_DDR_AHB0_S_HWDATA[14:14];
assign MDDR_DDR_AHB0_S_HWDATA_slice_18[13]    = MDDR_DDR_AHB0_S_HWDATA[13:13];
assign MDDR_DDR_AHB0_S_HWDATA_slice_19[12]    = MDDR_DDR_AHB0_S_HWDATA[12:12];
assign MDDR_DDR_AHB0_S_HWDATA_slice_20[11]    = MDDR_DDR_AHB0_S_HWDATA[11:11];
assign MDDR_DDR_AHB0_S_HWDATA_slice_21[10]    = MDDR_DDR_AHB0_S_HWDATA[10:10];
assign MDDR_DDR_AHB0_S_HWDATA_slice_22[9]     = MDDR_DDR_AHB0_S_HWDATA[9:9];
assign MDDR_DDR_AHB0_S_HWDATA_slice_23[8]     = MDDR_DDR_AHB0_S_HWDATA[8:8];
assign MDDR_DDR_AHB0_S_HWDATA_slice_24[7]     = MDDR_DDR_AHB0_S_HWDATA[7:7];
assign MDDR_DDR_AHB0_S_HWDATA_slice_25[6]     = MDDR_DDR_AHB0_S_HWDATA[6:6];
assign MDDR_DDR_AHB0_S_HWDATA_slice_26[5]     = MDDR_DDR_AHB0_S_HWDATA[5:5];
assign MDDR_DDR_AHB0_S_HWDATA_slice_27[4]     = MDDR_DDR_AHB0_S_HWDATA[4:4];
assign MDDR_DDR_AHB0_S_HWDATA_slice_28[3]     = MDDR_DDR_AHB0_S_HWDATA[3:3];
assign MDDR_DDR_AHB0_S_HWDATA_slice_29[2]     = MDDR_DDR_AHB0_S_HWDATA[2:2];
assign MDDR_DDR_AHB0_S_HWDATA_slice_30[1]     = MDDR_DDR_AHB0_S_HWDATA[1:1];
assign MDDR_DDR_AHB0_S_HWDATA_slice_31[0]     = MDDR_DDR_AHB0_S_HWDATA[0:0];
assign MSS_ADLIB_INST_DM_OE0to0[0]            = DM_OE_net_0[0:0];
assign MSS_ADLIB_INST_DM_OE1to1[1]            = DM_OE_net_0[1:1];
assign MSS_ADLIB_INST_DRAM_ADDR0to0[0]        = DRAM_ADDR_net_0[0:0];
assign MSS_ADLIB_INST_DRAM_ADDR1to1[1]        = DRAM_ADDR_net_0[1:1];
assign MSS_ADLIB_INST_DRAM_ADDR2to2[2]        = DRAM_ADDR_net_0[2:2];
assign MSS_ADLIB_INST_DRAM_ADDR3to3[3]        = DRAM_ADDR_net_0[3:3];
assign MSS_ADLIB_INST_DRAM_ADDR4to4[4]        = DRAM_ADDR_net_0[4:4];
assign MSS_ADLIB_INST_DRAM_ADDR5to5[5]        = DRAM_ADDR_net_0[5:5];
assign MSS_ADLIB_INST_DRAM_ADDR6to6[6]        = DRAM_ADDR_net_0[6:6];
assign MSS_ADLIB_INST_DRAM_ADDR7to7[7]        = DRAM_ADDR_net_0[7:7];
assign MSS_ADLIB_INST_DRAM_ADDR8to8[8]        = DRAM_ADDR_net_0[8:8];
assign MSS_ADLIB_INST_DRAM_ADDR9to9[9]        = DRAM_ADDR_net_0[9:9];
assign MSS_ADLIB_INST_DRAM_ADDR10to10[10]     = DRAM_ADDR_net_0[10:10];
assign MSS_ADLIB_INST_DRAM_ADDR11to11[11]     = DRAM_ADDR_net_0[11:11];
assign MSS_ADLIB_INST_DRAM_ADDR12to12[12]     = DRAM_ADDR_net_0[12:12];
assign MSS_ADLIB_INST_DRAM_ADDR13to13[13]     = DRAM_ADDR_net_0[13:13];
assign MSS_ADLIB_INST_DRAM_ADDR14to14[14]     = DRAM_ADDR_net_0[14:14];
assign MSS_ADLIB_INST_DRAM_ADDR15to15[15]     = DRAM_ADDR_net_0[15:15];
assign MSS_ADLIB_INST_DRAM_BA0to0[0]          = DRAM_BA_net_0[0:0];
assign MSS_ADLIB_INST_DRAM_BA1to1[1]          = DRAM_BA_net_0[1:1];
assign MSS_ADLIB_INST_DRAM_BA2to2[2]          = DRAM_BA_net_0[2:2];
assign MSS_ADLIB_INST_DRAM_DM_RDQS_OUT0to0[0] = DRAM_DM_RDQS_OUT_net_0[0:0];
assign MSS_ADLIB_INST_DRAM_DM_RDQS_OUT1to1[1] = DRAM_DM_RDQS_OUT_net_0[1:1];
assign MSS_ADLIB_INST_DRAM_DQ_OE0to0[0]       = DRAM_DQ_OE_net_0[0:0];
assign MSS_ADLIB_INST_DRAM_DQ_OE1to1[1]       = DRAM_DQ_OE_net_0[1:1];
assign MSS_ADLIB_INST_DRAM_DQ_OE2to2[2]       = DRAM_DQ_OE_net_0[2:2];
assign MSS_ADLIB_INST_DRAM_DQ_OE3to3[3]       = DRAM_DQ_OE_net_0[3:3];
assign MSS_ADLIB_INST_DRAM_DQ_OE4to4[4]       = DRAM_DQ_OE_net_0[4:4];
assign MSS_ADLIB_INST_DRAM_DQ_OE5to5[5]       = DRAM_DQ_OE_net_0[5:5];
assign MSS_ADLIB_INST_DRAM_DQ_OE6to6[6]       = DRAM_DQ_OE_net_0[6:6];
assign MSS_ADLIB_INST_DRAM_DQ_OE7to7[7]       = DRAM_DQ_OE_net_0[7:7];
assign MSS_ADLIB_INST_DRAM_DQ_OE8to8[8]       = DRAM_DQ_OE_net_0[8:8];
assign MSS_ADLIB_INST_DRAM_DQ_OE9to9[9]       = DRAM_DQ_OE_net_0[9:9];
assign MSS_ADLIB_INST_DRAM_DQ_OE10to10[10]    = DRAM_DQ_OE_net_0[10:10];
assign MSS_ADLIB_INST_DRAM_DQ_OE11to11[11]    = DRAM_DQ_OE_net_0[11:11];
assign MSS_ADLIB_INST_DRAM_DQ_OE12to12[12]    = DRAM_DQ_OE_net_0[12:12];
assign MSS_ADLIB_INST_DRAM_DQ_OE13to13[13]    = DRAM_DQ_OE_net_0[13:13];
assign MSS_ADLIB_INST_DRAM_DQ_OE14to14[14]    = DRAM_DQ_OE_net_0[14:14];
assign MSS_ADLIB_INST_DRAM_DQ_OE15to15[15]    = DRAM_DQ_OE_net_0[15:15];
assign MSS_ADLIB_INST_DRAM_DQ_OUT0to0[0]      = DRAM_DQ_OUT_net_0[0:0];
assign MSS_ADLIB_INST_DRAM_DQ_OUT1to1[1]      = DRAM_DQ_OUT_net_0[1:1];
assign MSS_ADLIB_INST_DRAM_DQ_OUT2to2[2]      = DRAM_DQ_OUT_net_0[2:2];
assign MSS_ADLIB_INST_DRAM_DQ_OUT3to3[3]      = DRAM_DQ_OUT_net_0[3:3];
assign MSS_ADLIB_INST_DRAM_DQ_OUT4to4[4]      = DRAM_DQ_OUT_net_0[4:4];
assign MSS_ADLIB_INST_DRAM_DQ_OUT5to5[5]      = DRAM_DQ_OUT_net_0[5:5];
assign MSS_ADLIB_INST_DRAM_DQ_OUT6to6[6]      = DRAM_DQ_OUT_net_0[6:6];
assign MSS_ADLIB_INST_DRAM_DQ_OUT7to7[7]      = DRAM_DQ_OUT_net_0[7:7];
assign MSS_ADLIB_INST_DRAM_DQ_OUT8to8[8]      = DRAM_DQ_OUT_net_0[8:8];
assign MSS_ADLIB_INST_DRAM_DQ_OUT9to9[9]      = DRAM_DQ_OUT_net_0[9:9];
assign MSS_ADLIB_INST_DRAM_DQ_OUT10to10[10]   = DRAM_DQ_OUT_net_0[10:10];
assign MSS_ADLIB_INST_DRAM_DQ_OUT11to11[11]   = DRAM_DQ_OUT_net_0[11:11];
assign MSS_ADLIB_INST_DRAM_DQ_OUT12to12[12]   = DRAM_DQ_OUT_net_0[12:12];
assign MSS_ADLIB_INST_DRAM_DQ_OUT13to13[13]   = DRAM_DQ_OUT_net_0[13:13];
assign MSS_ADLIB_INST_DRAM_DQ_OUT14to14[14]   = DRAM_DQ_OUT_net_0[14:14];
assign MSS_ADLIB_INST_DRAM_DQ_OUT15to15[15]   = DRAM_DQ_OUT_net_0[15:15];
assign MSS_ADLIB_INST_DRAM_DQS_OE0to0[0]      = DRAM_DQS_OE_net_0[0:0];
assign MSS_ADLIB_INST_DRAM_DQS_OE1to1[1]      = DRAM_DQS_OE_net_0[1:1];
assign MSS_ADLIB_INST_DRAM_DQS_OUT0to0[0]     = DRAM_DQS_OUT_net_0[0:0];
assign MSS_ADLIB_INST_DRAM_DQS_OUT1to1[1]     = DRAM_DQS_OUT_net_0[1:1];
assign MSS_ADLIB_INST_DRAM_FIFO_WE_OUT0to0[0] = DRAM_FIFO_WE_OUT_net_0[0:0];
assign F_BRESP_HRESP0_slice_0[1]              = F_BRESP_HRESP0_net_0[1:1];
assign F_RDATA_HRDATA01_slice_0[32]           = F_RDATA_HRDATA01_net_0[32:32];
assign F_RDATA_HRDATA01_slice_1[33]           = F_RDATA_HRDATA01_net_0[33:33];
assign F_RDATA_HRDATA01_slice_2[34]           = F_RDATA_HRDATA01_net_0[34:34];
assign F_RDATA_HRDATA01_slice_3[35]           = F_RDATA_HRDATA01_net_0[35:35];
assign F_RDATA_HRDATA01_slice_4[36]           = F_RDATA_HRDATA01_net_0[36:36];
assign F_RDATA_HRDATA01_slice_5[37]           = F_RDATA_HRDATA01_net_0[37:37];
assign F_RDATA_HRDATA01_slice_6[38]           = F_RDATA_HRDATA01_net_0[38:38];
assign F_RDATA_HRDATA01_slice_7[39]           = F_RDATA_HRDATA01_net_0[39:39];
assign F_RDATA_HRDATA01_slice_8[40]           = F_RDATA_HRDATA01_net_0[40:40];
assign F_RDATA_HRDATA01_slice_9[41]           = F_RDATA_HRDATA01_net_0[41:41];
assign F_RDATA_HRDATA01_slice_10[42]          = F_RDATA_HRDATA01_net_0[42:42];
assign F_RDATA_HRDATA01_slice_11[43]          = F_RDATA_HRDATA01_net_0[43:43];
assign F_RDATA_HRDATA01_slice_12[44]          = F_RDATA_HRDATA01_net_0[44:44];
assign F_RDATA_HRDATA01_slice_13[45]          = F_RDATA_HRDATA01_net_0[45:45];
assign F_RDATA_HRDATA01_slice_14[46]          = F_RDATA_HRDATA01_net_0[46:46];
assign F_RDATA_HRDATA01_slice_15[47]          = F_RDATA_HRDATA01_net_0[47:47];
assign F_RDATA_HRDATA01_slice_16[48]          = F_RDATA_HRDATA01_net_0[48:48];
assign F_RDATA_HRDATA01_slice_17[49]          = F_RDATA_HRDATA01_net_0[49:49];
assign F_RDATA_HRDATA01_slice_18[50]          = F_RDATA_HRDATA01_net_0[50:50];
assign F_RDATA_HRDATA01_slice_19[51]          = F_RDATA_HRDATA01_net_0[51:51];
assign F_RDATA_HRDATA01_slice_20[52]          = F_RDATA_HRDATA01_net_0[52:52];
assign F_RDATA_HRDATA01_slice_21[53]          = F_RDATA_HRDATA01_net_0[53:53];
assign F_RDATA_HRDATA01_slice_22[54]          = F_RDATA_HRDATA01_net_0[54:54];
assign F_RDATA_HRDATA01_slice_23[55]          = F_RDATA_HRDATA01_net_0[55:55];
assign F_RDATA_HRDATA01_slice_24[56]          = F_RDATA_HRDATA01_net_0[56:56];
assign F_RDATA_HRDATA01_slice_25[57]          = F_RDATA_HRDATA01_net_0[57:57];
assign F_RDATA_HRDATA01_slice_26[58]          = F_RDATA_HRDATA01_net_0[58:58];
assign F_RDATA_HRDATA01_slice_27[59]          = F_RDATA_HRDATA01_net_0[59:59];
assign F_RDATA_HRDATA01_slice_28[60]          = F_RDATA_HRDATA01_net_0[60:60];
assign F_RDATA_HRDATA01_slice_29[61]          = F_RDATA_HRDATA01_net_0[61:61];
assign F_RDATA_HRDATA01_slice_30[62]          = F_RDATA_HRDATA01_net_0[62:62];
assign F_RDATA_HRDATA01_slice_31[63]          = F_RDATA_HRDATA01_net_0[63:63];
assign DRAM_DM_RDQS_OUT_slice_0[2]            = DRAM_DM_RDQS_OUT_net_0[2:2];
assign DRAM_DQ_OUT_slice_0[16]                = DRAM_DQ_OUT_net_0[16:16];
assign DRAM_DQ_OUT_slice_1[17]                = DRAM_DQ_OUT_net_0[17:17];
assign DRAM_DQS_OUT_slice_0[2]                = DRAM_DQS_OUT_net_0[2:2];
assign DRAM_FIFO_WE_OUT_slice_0[1]            = DRAM_FIFO_WE_OUT_net_0[1:1];
assign DM_OE_slice_0[2]                       = DM_OE_net_0[2:2];
assign DRAM_DQ_OE_slice_0[16]                 = DRAM_DQ_OE_net_0[16:16];
assign DRAM_DQ_OE_slice_1[17]                 = DRAM_DQ_OE_net_0[17:17];
assign DRAM_DQS_OE_slice_0[2]                 = DRAM_DQS_OE_net_0[2:2];
//--------------------------------------------------------------------
// Concatenation assignments
//--------------------------------------------------------------------
assign F_AWID_HSEL0_net_0        = { 1'b0 , 1'b0 , 1'b0 , MDDR_DDR_AHB0_S_HSEL };
assign F_AWLEN_HBURST0_net_0     = { 1'b0 , MDDR_DDR_AHB0_S_HBURST_slice_0[2] , MDDR_DDR_AHB0_S_HBURST_slice_1[1] , MDDR_DDR_AHB0_S_HBURST_slice_2[0] };
assign F_AWLOCK_HMASTLOCK0_net_0 = { 1'b0 , MDDR_DDR_AHB0_S_HMASTLOCK };
assign F_WDATA_HWDATA01_net_0    = { 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , MDDR_DDR_AHB0_S_HWDATA_slice_0[31] , MDDR_DDR_AHB0_S_HWDATA_slice_1[30] , MDDR_DDR_AHB0_S_HWDATA_slice_2[29] , MDDR_DDR_AHB0_S_HWDATA_slice_3[28] , MDDR_DDR_AHB0_S_HWDATA_slice_4[27] , MDDR_DDR_AHB0_S_HWDATA_slice_5[26] , MDDR_DDR_AHB0_S_HWDATA_slice_6[25] , MDDR_DDR_AHB0_S_HWDATA_slice_7[24] , MDDR_DDR_AHB0_S_HWDATA_slice_8[23] , MDDR_DDR_AHB0_S_HWDATA_slice_9[22] , MDDR_DDR_AHB0_S_HWDATA_slice_10[21] , MDDR_DDR_AHB0_S_HWDATA_slice_11[20] , MDDR_DDR_AHB0_S_HWDATA_slice_12[19] , MDDR_DDR_AHB0_S_HWDATA_slice_13[18] , MDDR_DDR_AHB0_S_HWDATA_slice_14[17] , MDDR_DDR_AHB0_S_HWDATA_slice_15[16] , MDDR_DDR_AHB0_S_HWDATA_slice_16[15] , MDDR_DDR_AHB0_S_HWDATA_slice_17[14] , MDDR_DDR_AHB0_S_HWDATA_slice_18[13] , MDDR_DDR_AHB0_S_HWDATA_slice_19[12] , MDDR_DDR_AHB0_S_HWDATA_slice_20[11] , MDDR_DDR_AHB0_S_HWDATA_slice_21[10] , MDDR_DDR_AHB0_S_HWDATA_slice_22[9] , MDDR_DDR_AHB0_S_HWDATA_slice_23[8] , MDDR_DDR_AHB0_S_HWDATA_slice_24[7] , MDDR_DDR_AHB0_S_HWDATA_slice_25[6] , MDDR_DDR_AHB0_S_HWDATA_slice_26[5] , MDDR_DDR_AHB0_S_HWDATA_slice_27[4] , MDDR_DDR_AHB0_S_HWDATA_slice_28[3] , MDDR_DDR_AHB0_S_HWDATA_slice_29[2] , MDDR_DDR_AHB0_S_HWDATA_slice_30[1] , MDDR_DDR_AHB0_S_HWDATA_slice_31[0] };
assign F_WID_HREADY01_net_0      = { 1'b0 , 1'b0 , 1'b0 , MDDR_DDR_AHB0_S_HREADY };
assign DM_IN_net_0               = { 1'b0 , MDDR_DM_RDQS_1_PAD_Y , MDDR_DM_RDQS_0_PAD_Y };
assign DRAM_DQ_IN_net_0          = { 1'b0 , 1'b0 , MDDR_DQ_15_PAD_Y , MDDR_DQ_14_PAD_Y , MDDR_DQ_13_PAD_Y , MDDR_DQ_12_PAD_Y , MDDR_DQ_11_PAD_Y , MDDR_DQ_10_PAD_Y , MDDR_DQ_9_PAD_Y , MDDR_DQ_8_PAD_Y , MDDR_DQ_7_PAD_Y , MDDR_DQ_6_PAD_Y , MDDR_DQ_5_PAD_Y , MDDR_DQ_4_PAD_Y , MDDR_DQ_3_PAD_Y , MDDR_DQ_2_PAD_Y , MDDR_DQ_1_PAD_Y , MDDR_DQ_0_PAD_Y };
assign DRAM_DQS_IN_net_0         = { 1'b0 , MDDR_DQS_1_PAD_Y , MDDR_DQS_0_PAD_Y };
assign DRAM_FIFO_WE_IN_net_0     = { 1'b0 , MDDR_DQS_TMATCH_0_IN_PAD_Y };
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------OUTBUF
OUTBUF #( 
        .IOSTD ( "SSTL18II" ) )
MDDR_ADDR_0_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_ADDR0to0 ),
        // Outputs
        .PAD ( MDDR_ADDR_14 ) 
        );

//--------OUTBUF
OUTBUF #( 
        .IOSTD ( "SSTL18II" ) )
MDDR_ADDR_1_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_ADDR1to1 ),
        // Outputs
        .PAD ( MDDR_ADDR_13 ) 
        );

//--------OUTBUF
OUTBUF #( 
        .IOSTD ( "SSTL18II" ) )
MDDR_ADDR_2_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_ADDR2to2 ),
        // Outputs
        .PAD ( MDDR_ADDR_12 ) 
        );

//--------OUTBUF
OUTBUF #( 
        .IOSTD ( "SSTL18II" ) )
MDDR_ADDR_3_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_ADDR3to3 ),
        // Outputs
        .PAD ( MDDR_ADDR_11 ) 
        );

//--------OUTBUF
OUTBUF #( 
        .IOSTD ( "SSTL18II" ) )
MDDR_ADDR_4_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_ADDR4to4 ),
        // Outputs
        .PAD ( MDDR_ADDR_10 ) 
        );

//--------OUTBUF
OUTBUF #( 
        .IOSTD ( "SSTL18II" ) )
MDDR_ADDR_5_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_ADDR5to5 ),
        // Outputs
        .PAD ( MDDR_ADDR_9 ) 
        );

//--------OUTBUF
OUTBUF #( 
        .IOSTD ( "SSTL18II" ) )
MDDR_ADDR_6_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_ADDR6to6 ),
        // Outputs
        .PAD ( MDDR_ADDR_8 ) 
        );

//--------OUTBUF
OUTBUF #( 
        .IOSTD ( "SSTL18II" ) )
MDDR_ADDR_7_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_ADDR7to7 ),
        // Outputs
        .PAD ( MDDR_ADDR_7 ) 
        );

//--------OUTBUF
OUTBUF #( 
        .IOSTD ( "SSTL18II" ) )
MDDR_ADDR_8_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_ADDR8to8 ),
        // Outputs
        .PAD ( MDDR_ADDR_6 ) 
        );

//--------OUTBUF
OUTBUF #( 
        .IOSTD ( "SSTL18II" ) )
MDDR_ADDR_9_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_ADDR9to9 ),
        // Outputs
        .PAD ( MDDR_ADDR_5 ) 
        );

//--------OUTBUF
OUTBUF #( 
        .IOSTD ( "SSTL18II" ) )
MDDR_ADDR_10_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_ADDR10to10 ),
        // Outputs
        .PAD ( MDDR_ADDR_4 ) 
        );

//--------OUTBUF
OUTBUF #( 
        .IOSTD ( "SSTL18II" ) )
MDDR_ADDR_11_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_ADDR11to11 ),
        // Outputs
        .PAD ( MDDR_ADDR_3 ) 
        );

//--------OUTBUF
OUTBUF #( 
        .IOSTD ( "SSTL18II" ) )
MDDR_ADDR_12_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_ADDR12to12 ),
        // Outputs
        .PAD ( MDDR_ADDR_2 ) 
        );

//--------OUTBUF
OUTBUF #( 
        .IOSTD ( "SSTL18II" ) )
MDDR_ADDR_13_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_ADDR13to13 ),
        // Outputs
        .PAD ( MDDR_ADDR_1 ) 
        );

//--------OUTBUF
OUTBUF #( 
        .IOSTD ( "SSTL18II" ) )
MDDR_ADDR_14_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_ADDR14to14 ),
        // Outputs
        .PAD ( MDDR_ADDR_0 ) 
        );

//--------OUTBUF
OUTBUF #( 
        .IOSTD ( "SSTL18II" ) )
MDDR_ADDR_15_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_ADDR15to15 ),
        // Outputs
        .PAD ( MDDR_ADDR_net_0 ) 
        );

//--------OUTBUF
OUTBUF #( 
        .IOSTD ( "SSTL18II" ) )
MDDR_BA_0_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_BA0to0 ),
        // Outputs
        .PAD ( MDDR_BA_1 ) 
        );

//--------OUTBUF
OUTBUF #( 
        .IOSTD ( "SSTL18II" ) )
MDDR_BA_1_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_BA1to1 ),
        // Outputs
        .PAD ( MDDR_BA_0 ) 
        );

//--------OUTBUF
OUTBUF #( 
        .IOSTD ( "SSTL18II" ) )
MDDR_BA_2_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_BA2to2 ),
        // Outputs
        .PAD ( MDDR_BA_net_0 ) 
        );

//--------OUTBUF
OUTBUF #( 
        .IOSTD ( "SSTL18II" ) )
MDDR_CAS_N_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_CASN ),
        // Outputs
        .PAD ( MDDR_CAS_N_net_0 ) 
        );

//--------OUTBUF
OUTBUF #( 
        .IOSTD ( "SSTL18II" ) )
MDDR_CKE_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_CKE ),
        // Outputs
        .PAD ( MDDR_CKE_net_0 ) 
        );

//--------OUTBUF_DIFF
OUTBUF_DIFF #( 
        .IOSTD ( "SSTL18II" ) )
MDDR_CLK_PAD(
        // Inputs
        .D    ( MSS_ADLIB_INST_DRAM_CLK ),
        // Outputs
        .PADP ( MDDR_CLK_net_0 ),
        .PADN ( MDDR_CLK_N_net_0 ) 
        );

//--------OUTBUF
OUTBUF #( 
        .IOSTD ( "SSTL18II" ) )
MDDR_CS_N_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_CSN ),
        // Outputs
        .PAD ( MDDR_CS_N_net_0 ) 
        );

//--------BIBUF
BIBUF #( 
        .IOSTD ( "SSTL18II" ) )
MDDR_DM_RDQS_0_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_DM_RDQS_OUT0to0 ),
        .E   ( MSS_ADLIB_INST_DM_OE0to0 ),
        // Outputs
        .Y   ( MDDR_DM_RDQS_0_PAD_Y ),
        // Inouts
        .PAD ( MDDR_DM_RDQS[0:0] ) 
        );

//--------BIBUF
BIBUF #( 
        .IOSTD ( "SSTL18II" ) )
MDDR_DM_RDQS_1_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_DM_RDQS_OUT1to1 ),
        .E   ( MSS_ADLIB_INST_DM_OE1to1 ),
        // Outputs
        .Y   ( MDDR_DM_RDQS_1_PAD_Y ),
        // Inouts
        .PAD ( MDDR_DM_RDQS[1:1] ) 
        );

//--------BIBUF
BIBUF #( 
        .IOSTD ( "SSTL18II" ) )
MDDR_DQ_0_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_DQ_OUT0to0 ),
        .E   ( MSS_ADLIB_INST_DRAM_DQ_OE0to0 ),
        // Outputs
        .Y   ( MDDR_DQ_0_PAD_Y ),
        // Inouts
        .PAD ( MDDR_DQ[0:0] ) 
        );

//--------BIBUF
BIBUF #( 
        .IOSTD ( "SSTL18II" ) )
MDDR_DQ_1_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_DQ_OUT1to1 ),
        .E   ( MSS_ADLIB_INST_DRAM_DQ_OE1to1 ),
        // Outputs
        .Y   ( MDDR_DQ_1_PAD_Y ),
        // Inouts
        .PAD ( MDDR_DQ[1:1] ) 
        );

//--------BIBUF
BIBUF #( 
        .IOSTD ( "SSTL18II" ) )
MDDR_DQ_2_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_DQ_OUT2to2 ),
        .E   ( MSS_ADLIB_INST_DRAM_DQ_OE2to2 ),
        // Outputs
        .Y   ( MDDR_DQ_2_PAD_Y ),
        // Inouts
        .PAD ( MDDR_DQ[2:2] ) 
        );

//--------BIBUF
BIBUF #( 
        .IOSTD ( "SSTL18II" ) )
MDDR_DQ_3_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_DQ_OUT3to3 ),
        .E   ( MSS_ADLIB_INST_DRAM_DQ_OE3to3 ),
        // Outputs
        .Y   ( MDDR_DQ_3_PAD_Y ),
        // Inouts
        .PAD ( MDDR_DQ[3:3] ) 
        );

//--------BIBUF
BIBUF #( 
        .IOSTD ( "SSTL18II" ) )
MDDR_DQ_4_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_DQ_OUT4to4 ),
        .E   ( MSS_ADLIB_INST_DRAM_DQ_OE4to4 ),
        // Outputs
        .Y   ( MDDR_DQ_4_PAD_Y ),
        // Inouts
        .PAD ( MDDR_DQ[4:4] ) 
        );

//--------BIBUF
BIBUF #( 
        .IOSTD ( "SSTL18II" ) )
MDDR_DQ_5_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_DQ_OUT5to5 ),
        .E   ( MSS_ADLIB_INST_DRAM_DQ_OE5to5 ),
        // Outputs
        .Y   ( MDDR_DQ_5_PAD_Y ),
        // Inouts
        .PAD ( MDDR_DQ[5:5] ) 
        );

//--------BIBUF
BIBUF #( 
        .IOSTD ( "SSTL18II" ) )
MDDR_DQ_6_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_DQ_OUT6to6 ),
        .E   ( MSS_ADLIB_INST_DRAM_DQ_OE6to6 ),
        // Outputs
        .Y   ( MDDR_DQ_6_PAD_Y ),
        // Inouts
        .PAD ( MDDR_DQ[6:6] ) 
        );

//--------BIBUF
BIBUF #( 
        .IOSTD ( "SSTL18II" ) )
MDDR_DQ_7_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_DQ_OUT7to7 ),
        .E   ( MSS_ADLIB_INST_DRAM_DQ_OE7to7 ),
        // Outputs
        .Y   ( MDDR_DQ_7_PAD_Y ),
        // Inouts
        .PAD ( MDDR_DQ[7:7] ) 
        );

//--------BIBUF
BIBUF #( 
        .IOSTD ( "SSTL18II" ) )
MDDR_DQ_8_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_DQ_OUT8to8 ),
        .E   ( MSS_ADLIB_INST_DRAM_DQ_OE8to8 ),
        // Outputs
        .Y   ( MDDR_DQ_8_PAD_Y ),
        // Inouts
        .PAD ( MDDR_DQ[8:8] ) 
        );

//--------BIBUF
BIBUF #( 
        .IOSTD ( "SSTL18II" ) )
MDDR_DQ_9_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_DQ_OUT9to9 ),
        .E   ( MSS_ADLIB_INST_DRAM_DQ_OE9to9 ),
        // Outputs
        .Y   ( MDDR_DQ_9_PAD_Y ),
        // Inouts
        .PAD ( MDDR_DQ[9:9] ) 
        );

//--------BIBUF
BIBUF #( 
        .IOSTD ( "SSTL18II" ) )
MDDR_DQ_10_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_DQ_OUT10to10 ),
        .E   ( MSS_ADLIB_INST_DRAM_DQ_OE10to10 ),
        // Outputs
        .Y   ( MDDR_DQ_10_PAD_Y ),
        // Inouts
        .PAD ( MDDR_DQ[10:10] ) 
        );

//--------BIBUF
BIBUF #( 
        .IOSTD ( "SSTL18II" ) )
MDDR_DQ_11_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_DQ_OUT11to11 ),
        .E   ( MSS_ADLIB_INST_DRAM_DQ_OE11to11 ),
        // Outputs
        .Y   ( MDDR_DQ_11_PAD_Y ),
        // Inouts
        .PAD ( MDDR_DQ[11:11] ) 
        );

//--------BIBUF
BIBUF #( 
        .IOSTD ( "SSTL18II" ) )
MDDR_DQ_12_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_DQ_OUT12to12 ),
        .E   ( MSS_ADLIB_INST_DRAM_DQ_OE12to12 ),
        // Outputs
        .Y   ( MDDR_DQ_12_PAD_Y ),
        // Inouts
        .PAD ( MDDR_DQ[12:12] ) 
        );

//--------BIBUF
BIBUF #( 
        .IOSTD ( "SSTL18II" ) )
MDDR_DQ_13_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_DQ_OUT13to13 ),
        .E   ( MSS_ADLIB_INST_DRAM_DQ_OE13to13 ),
        // Outputs
        .Y   ( MDDR_DQ_13_PAD_Y ),
        // Inouts
        .PAD ( MDDR_DQ[13:13] ) 
        );

//--------BIBUF
BIBUF #( 
        .IOSTD ( "SSTL18II" ) )
MDDR_DQ_14_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_DQ_OUT14to14 ),
        .E   ( MSS_ADLIB_INST_DRAM_DQ_OE14to14 ),
        // Outputs
        .Y   ( MDDR_DQ_14_PAD_Y ),
        // Inouts
        .PAD ( MDDR_DQ[14:14] ) 
        );

//--------BIBUF
BIBUF #( 
        .IOSTD ( "SSTL18II" ) )
MDDR_DQ_15_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_DQ_OUT15to15 ),
        .E   ( MSS_ADLIB_INST_DRAM_DQ_OE15to15 ),
        // Outputs
        .Y   ( MDDR_DQ_15_PAD_Y ),
        // Inouts
        .PAD ( MDDR_DQ[15:15] ) 
        );

//--------BIBUF_DIFF
BIBUF_DIFF #( 
        .IOSTD ( "SSTL18II" ) )
MDDR_DQS_0_PAD(
        // Inputs
        .D    ( MSS_ADLIB_INST_DRAM_DQS_OUT0to0 ),
        .E    ( MSS_ADLIB_INST_DRAM_DQS_OE0to0 ),
        // Outputs
        .Y    ( MDDR_DQS_0_PAD_Y ),
        // Inouts
        .PADP ( MDDR_DQS[0:0] ),
        .PADN ( MDDR_DQS_N[0:0] ) 
        );

//--------BIBUF_DIFF
BIBUF_DIFF #( 
        .IOSTD ( "SSTL18II" ) )
MDDR_DQS_1_PAD(
        // Inputs
        .D    ( MSS_ADLIB_INST_DRAM_DQS_OUT1to1 ),
        .E    ( MSS_ADLIB_INST_DRAM_DQS_OE1to1 ),
        // Outputs
        .Y    ( MDDR_DQS_1_PAD_Y ),
        // Inouts
        .PADP ( MDDR_DQS[1:1] ),
        .PADN ( MDDR_DQS_N[1:1] ) 
        );

//--------INBUF
INBUF #( 
        .IOSTD ( "SSTL18II" ) )
MDDR_DQS_TMATCH_0_IN_PAD(
        // Inputs
        .PAD ( MDDR_DQS_TMATCH_0_IN ),
        // Outputs
        .Y   ( MDDR_DQS_TMATCH_0_IN_PAD_Y ) 
        );

//--------OUTBUF
OUTBUF #( 
        .IOSTD ( "SSTL18II" ) )
MDDR_DQS_TMATCH_0_OUT_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_FIFO_WE_OUT0to0 ),
        // Outputs
        .PAD ( MDDR_DQS_TMATCH_0_OUT_net_0 ) 
        );

//--------OUTBUF
OUTBUF #( 
        .IOSTD ( "SSTL18II" ) )
MDDR_ODT_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_ODT ),
        // Outputs
        .PAD ( MDDR_ODT_net_0 ) 
        );

//--------OUTBUF
OUTBUF #( 
        .IOSTD ( "SSTL18II" ) )
MDDR_RAS_N_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_RASN ),
        // Outputs
        .PAD ( MDDR_RAS_N_net_0 ) 
        );

//--------OUTBUF
OUTBUF #( 
        .IOSTD ( "SSTL18II" ) )
MDDR_RESET_N_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_RSTN ),
        // Outputs
        .PAD ( MDDR_RESET_N_net_0 ) 
        );

//--------OUTBUF
OUTBUF #( 
        .IOSTD ( "SSTL18II" ) )
MDDR_WE_N_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_DRAM_WEN ),
        // Outputs
        .PAD ( MDDR_WE_N_net_0 ) 
        );

//--------MSS_025
MSS_025 #( 
        .ACT_UBITS         ( 56'hFFFFFFFFFFFFFF ),
        .DDR_CLK_FREQ      ( 132.0 ),
        .INIT              ( 1438'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000F00000000F000000000000000000000000000000007FFFFFFFB000001007C33C80464800609080104003FFFFE400000000000000000000000F11C0000007E5FE4010842108421000001FE34001FF8000000000000000020071007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
        .MEMORYFILE        ( "ENVM_init.mem" ),
        .RTC_MAIN_XTL_FREQ ( 0.0 ),
        .RTC_MAIN_XTL_MODE ( "" ) )
MSS_ADLIB_INST(
        // Inputs
        .CAN_RXBUS_F2H_SCP                       ( VCC_net ), // tied to 1'b1 from definition
        .CAN_TX_EBL_F2H_SCP                      ( VCC_net ), // tied to 1'b1 from definition
        .CAN_TXBUS_F2H_SCP                       ( VCC_net ), // tied to 1'b1 from definition
        .COLF                                    ( VCC_net ), // tied to 1'b1 from definition
        .CRSF                                    ( VCC_net ), // tied to 1'b1 from definition
        .F2_DMAREADY                             ( F2_DMAREADY_const_net_0 ), // tied to 2'h3 from definition
        .F2H_INTERRUPT                           ( MSS_INT_F2M ),
        .F2HCALIB                                ( VCC_net ), // tied to 1'b1 from definition
        .F_DMAREADY                              ( F_DMAREADY_const_net_0 ), // tied to 2'h3 from definition
        .F_FM0_ADDR                              ( FIC_0_AHB_S_HADDR ),
        .F_FM0_ENABLE                            ( GND_net ), // tied to 1'b0 from definition
        .F_FM0_MASTLOCK                          ( FIC_0_AHB_S_HMASTLOCK ),
        .F_FM0_READY                             ( FIC_0_AHB_S_HREADY ),
        .F_FM0_SEL                               ( FIC_0_AHB_S_HSEL ),
        .F_FM0_SIZE                              ( FIC_0_AHB_S_HSIZE ),
        .F_FM0_TRANS1                            ( FIC_0_AHB_S_HTRANS_slice_0 ),
        .F_FM0_WDATA                             ( FIC_0_AHB_S_HWDATA ),
        .F_FM0_WRITE                             ( FIC_0_AHB_S_HWRITE ),
        .F_HM0_RDATA                             ( F_HM0_RDATA_const_net_0 ), // tied to 32'h00000000 from definition
        .F_HM0_READY                             ( VCC_net ), // tied to 1'b1 from definition
        .F_HM0_RESP                              ( GND_net ), // tied to 1'b0 from definition
        .FAB_AVALID                              ( VCC_net ), // tied to 1'b1 from definition
        .FAB_HOSTDISCON                          ( VCC_net ), // tied to 1'b1 from definition
        .FAB_IDDIG                               ( VCC_net ), // tied to 1'b1 from definition
        .FAB_LINESTATE                           ( FAB_LINESTATE_const_net_0 ), // tied to 2'h3 from definition
        .FAB_M3_RESET_N                          ( M3_RESET_N ),
        .FAB_PLL_LOCK                            ( MCCC_CLK_BASE_PLL_LOCK ),
        .FAB_RXACTIVE                            ( VCC_net ), // tied to 1'b1 from definition
        .FAB_RXERROR                             ( VCC_net ), // tied to 1'b1 from definition
        .FAB_RXVALID                             ( VCC_net ), // tied to 1'b1 from definition
        .FAB_RXVALIDH                            ( GND_net ), // tied to 1'b0 from definition
        .FAB_SESSEND                             ( VCC_net ), // tied to 1'b1 from definition
        .FAB_TXREADY                             ( VCC_net ), // tied to 1'b1 from definition
        .FAB_VBUSVALID                           ( VCC_net ), // tied to 1'b1 from definition
        .FAB_VSTATUS                             ( FAB_VSTATUS_const_net_0 ), // tied to 8'hFF from definition
        .FAB_XDATAIN                             ( FAB_XDATAIN_const_net_0 ), // tied to 8'hFF from definition
        .GTX_CLKPF                               ( VCC_net ), // tied to 1'b1 from definition
        .I2C0_BCLK                               ( VCC_net ), // tied to 1'b1 from definition
        .I2C0_SCL_F2H_SCP                        ( VCC_net ), // tied to 1'b1 from definition
        .I2C0_SDA_F2H_SCP                        ( VCC_net ), // tied to 1'b1 from definition
        .I2C1_BCLK                               ( VCC_net ), // tied to 1'b1 from definition
        .I2C1_SCL_F2H_SCP                        ( VCC_net ), // tied to 1'b1 from definition
        .I2C1_SDA_F2H_SCP                        ( VCC_net ), // tied to 1'b1 from definition
        .MDIF                                    ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO0A_F2H_GPIN                        ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO10A_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO11A_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO11B_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO12A_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO13A_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO14A_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO15A_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO16A_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO17B_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO18B_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO19B_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO1A_F2H_GPIN                        ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO20B_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO21B_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO22B_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO24B_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO25B_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO26B_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO27B_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO28B_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO29B_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO2A_F2H_GPIN                        ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO30B_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO31B_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO3A_F2H_GPIN                        ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO4A_F2H_GPIN                        ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO5A_F2H_GPIN                        ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO6A_F2H_GPIN                        ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO7A_F2H_GPIN                        ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO8A_F2H_GPIN                        ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO9A_F2H_GPIN                        ( VCC_net ), // tied to 1'b1 from definition
        .MMUART0_CTS_F2H_SCP                     ( VCC_net ), // tied to 1'b1 from definition
        .MMUART0_DCD_F2H_SCP                     ( VCC_net ), // tied to 1'b1 from definition
        .MMUART0_DSR_F2H_SCP                     ( VCC_net ), // tied to 1'b1 from definition
        .MMUART0_DTR_F2H_SCP                     ( VCC_net ), // tied to 1'b1 from definition
        .MMUART0_RI_F2H_SCP                      ( VCC_net ), // tied to 1'b1 from definition
        .MMUART0_RTS_F2H_SCP                     ( VCC_net ), // tied to 1'b1 from definition
        .MMUART0_RXD_F2H_SCP                     ( VCC_net ), // tied to 1'b1 from definition
        .MMUART0_SCK_F2H_SCP                     ( VCC_net ), // tied to 1'b1 from definition
        .MMUART0_TXD_F2H_SCP                     ( VCC_net ), // tied to 1'b1 from definition
        .MMUART1_CTS_F2H_SCP                     ( VCC_net ), // tied to 1'b1 from definition
        .MMUART1_DCD_F2H_SCP                     ( VCC_net ), // tied to 1'b1 from definition
        .MMUART1_DSR_F2H_SCP                     ( VCC_net ), // tied to 1'b1 from definition
        .MMUART1_RI_F2H_SCP                      ( VCC_net ), // tied to 1'b1 from definition
        .MMUART1_RTS_F2H_SCP                     ( VCC_net ), // tied to 1'b1 from definition
        .MMUART1_RXD_F2H_SCP                     ( VCC_net ), // tied to 1'b1 from definition
        .MMUART1_SCK_F2H_SCP                     ( VCC_net ), // tied to 1'b1 from definition
        .MMUART1_TXD_F2H_SCP                     ( VCC_net ), // tied to 1'b1 from definition
        .PER2_FABRIC_PRDATA                      ( FIC_2_APB_M_PRDATA ),
        .PER2_FABRIC_PREADY                      ( FIC_2_APB_M_PREADY ),
        .PER2_FABRIC_PSLVERR                     ( FIC_2_APB_M_PSLVERR ),
        .RCGF                                    ( RCGF_const_net_0 ), // tied to 10'h3FF from definition
        .RX_CLKPF                                ( VCC_net ), // tied to 1'b1 from definition
        .RX_DVF                                  ( VCC_net ), // tied to 1'b1 from definition
        .RX_ERRF                                 ( VCC_net ), // tied to 1'b1 from definition
        .RX_EV                                   ( VCC_net ), // tied to 1'b1 from definition
        .RXDF                                    ( RXDF_const_net_0 ), // tied to 8'hFF from definition
        .SLEEPHOLDREQ                            ( GND_net ), // tied to 1'b0 from definition
        .SMBALERT_NI0                            ( VCC_net ), // tied to 1'b1 from definition
        .SMBALERT_NI1                            ( VCC_net ), // tied to 1'b1 from definition
        .SMBSUS_NI0                              ( VCC_net ), // tied to 1'b1 from definition
        .SMBSUS_NI1                              ( VCC_net ), // tied to 1'b1 from definition
        .SPI0_CLK_IN                             ( VCC_net ), // tied to 1'b1 from definition
        .SPI0_SDI_F2H_SCP                        ( VCC_net ), // tied to 1'b1 from definition
        .SPI0_SDO_F2H_SCP                        ( VCC_net ), // tied to 1'b1 from definition
        .SPI0_SS0_F2H_SCP                        ( VCC_net ), // tied to 1'b1 from definition
        .SPI0_SS1_F2H_SCP                        ( VCC_net ), // tied to 1'b1 from definition
        .SPI0_SS2_F2H_SCP                        ( VCC_net ), // tied to 1'b1 from definition
        .SPI0_SS3_F2H_SCP                        ( VCC_net ), // tied to 1'b1 from definition
        .SPI1_CLK_IN                             ( VCC_net ), // tied to 1'b1 from definition
        .SPI1_SDI_F2H_SCP                        ( VCC_net ), // tied to 1'b1 from definition
        .SPI1_SDO_F2H_SCP                        ( VCC_net ), // tied to 1'b1 from definition
        .SPI1_SS0_F2H_SCP                        ( VCC_net ), // tied to 1'b1 from definition
        .SPI1_SS1_F2H_SCP                        ( VCC_net ), // tied to 1'b1 from definition
        .SPI1_SS2_F2H_SCP                        ( VCC_net ), // tied to 1'b1 from definition
        .SPI1_SS3_F2H_SCP                        ( VCC_net ), // tied to 1'b1 from definition
        .TX_CLKPF                                ( VCC_net ), // tied to 1'b1 from definition
        .USER_MSS_GPIO_RESET_N                   ( VCC_net ), // tied to 1'b1 from definition
        .USER_MSS_RESET_N                        ( MSS_RESET_N_F2M ),
        .XCLK_FAB                                ( VCC_net ), // tied to 1'b1 from definition
        .CLK_BASE                                ( MCCC_CLK_BASE ),
        .CLK_MDDR_APB                            ( MDDR_APB_S_PCLK ),
        .F_ARADDR_HADDR1                         ( F_ARADDR_HADDR1_const_net_0 ), // tied to 32'hFFFFFFFF from definition
        .F_ARBURST_HTRANS1                       ( F_ARBURST_HTRANS1_const_net_0 ), // tied to 2'h0 from definition
        .F_ARID_HSEL1                            ( F_ARID_HSEL1_const_net_0 ), // tied to 4'h0 from definition
        .F_ARLEN_HBURST1                         ( F_ARLEN_HBURST1_const_net_0 ), // tied to 4'h0 from definition
        .F_ARLOCK_HMASTLOCK1                     ( F_ARLOCK_HMASTLOCK1_const_net_0 ), // tied to 2'h0 from definition
        .F_ARSIZE_HSIZE1                         ( F_ARSIZE_HSIZE1_const_net_0 ), // tied to 2'h0 from definition
        .F_ARVALID_HWRITE1                       ( GND_net ), // tied to 1'b0 from definition
        .F_AWADDR_HADDR0                         ( MDDR_DDR_AHB0_S_HADDR ),
        .F_AWBURST_HTRANS0                       ( MDDR_DDR_AHB0_S_HTRANS ),
        .F_AWID_HSEL0                            ( F_AWID_HSEL0_net_0 ),
        .F_AWLEN_HBURST0                         ( F_AWLEN_HBURST0_net_0 ),
        .F_AWLOCK_HMASTLOCK0                     ( F_AWLOCK_HMASTLOCK0_net_0 ),
        .F_AWSIZE_HSIZE0                         ( MDDR_DDR_AHB0_S_HSIZE ),
        .F_AWVALID_HWRITE0                       ( MDDR_DDR_AHB0_S_HWRITE ),
        .F_BREADY                                ( GND_net ), // tied to 1'b0 from definition
        .F_RMW_AXI                               ( GND_net ), // tied to 1'b0 from definition
        .F_RREADY                                ( GND_net ), // tied to 1'b0 from definition
        .F_WDATA_HWDATA01                        ( F_WDATA_HWDATA01_net_0 ),
        .F_WID_HREADY01                          ( F_WID_HREADY01_net_0 ),
        .F_WLAST                                 ( GND_net ), // tied to 1'b0 from definition
        .F_WSTRB                                 ( F_WSTRB_const_net_0 ), // tied to 8'h00 from definition
        .F_WVALID                                ( GND_net ), // tied to 1'b0 from definition
        .FPGA_MDDR_ARESET_N                      ( MDDR_DDR_CORE_RESET_N ),
        .MDDR_FABRIC_PADDR                       ( MDDR_APB_S_PADDR ),
        .MDDR_FABRIC_PENABLE                     ( MDDR_APB_S_PENABLE ),
        .MDDR_FABRIC_PSEL                        ( MDDR_APB_S_PSEL ),
        .MDDR_FABRIC_PWDATA                      ( MDDR_APB_S_PWDATA ),
        .MDDR_FABRIC_PWRITE                      ( MDDR_APB_S_PWRITE ),
        .PRESET_N                                ( MDDR_APB_S_PRESET_N ),
        .CAN_RXBUS_USBA_DATA1_MGPIO3A_IN         ( GND_net ),
        .CAN_TX_EBL_USBA_DATA2_MGPIO4A_IN        ( GND_net ),
        .CAN_TXBUS_USBA_DATA0_MGPIO2A_IN         ( GND_net ),
        .DM_IN                                   ( DM_IN_net_0 ),
        .DRAM_DQ_IN                              ( DRAM_DQ_IN_net_0 ),
        .DRAM_DQS_IN                             ( DRAM_DQS_IN_net_0 ),
        .DRAM_FIFO_WE_IN                         ( DRAM_FIFO_WE_IN_net_0 ),
        .I2C0_SCL_USBC_DATA1_MGPIO31B_IN         ( GND_net ),
        .I2C0_SDA_USBC_DATA0_MGPIO30B_IN         ( GND_net ),
        .I2C1_SCL_USBA_DATA4_MGPIO1A_IN          ( GND_net ),
        .I2C1_SDA_USBA_DATA3_MGPIO0A_IN          ( GND_net ),
        .MGPIO25A_IN                             ( GND_net ),
        .MGPIO26A_IN                             ( GND_net ),
        .MMUART0_CTS_USBC_DATA7_MGPIO19B_IN      ( GND_net ),
        .MMUART0_DCD_MGPIO22B_IN                 ( GND_net ),
        .MMUART0_DSR_MGPIO20B_IN                 ( GND_net ),
        .MMUART0_DTR_USBC_DATA6_MGPIO18B_IN      ( GND_net ),
        .MMUART0_RI_MGPIO21B_IN                  ( GND_net ),
        .MMUART0_RTS_USBC_DATA5_MGPIO17B_IN      ( GND_net ),
        .MMUART0_RXD_USBC_STP_MGPIO28B_IN        ( GND_net ),
        .MMUART0_SCK_USBC_NXT_MGPIO29B_IN        ( GND_net ),
        .MMUART0_TXD_USBC_DIR_MGPIO27B_IN        ( GND_net ),
        .MMUART1_CTS_MGPIO13B_IN                 ( GND_net ),
        .MMUART1_DCD_MGPIO16B_IN                 ( GND_net ),
        .MMUART1_DSR_MGPIO14B_IN                 ( GND_net ),
        .MMUART1_DTR_MGPIO12B_IN                 ( GND_net ),
        .MMUART1_RI_MGPIO15B_IN                  ( GND_net ),
        .MMUART1_RTS_MGPIO11B_IN                 ( GND_net ),
        .MMUART1_RXD_USBC_DATA3_MGPIO26B_IN      ( GND_net ),
        .MMUART1_SCK_USBC_DATA4_MGPIO25B_IN      ( GND_net ),
        .MMUART1_TXD_USBC_DATA2_MGPIO24B_IN      ( GND_net ),
        .RGMII_GTX_CLK_RMII_CLK_USBB_XCLK_IN     ( GND_net ),
        .RGMII_MDC_RMII_MDC_IN                   ( GND_net ),
        .RGMII_MDIO_RMII_MDIO_USBB_DATA7_IN      ( GND_net ),
        .RGMII_RX_CLK_IN                         ( GND_net ),
        .RGMII_RX_CTL_RMII_CRS_DV_USBB_DATA2_IN  ( GND_net ),
        .RGMII_RXD0_RMII_RXD0_USBB_DATA0_IN      ( GND_net ),
        .RGMII_RXD1_RMII_RXD1_USBB_DATA1_IN      ( GND_net ),
        .RGMII_RXD2_RMII_RX_ER_USBB_DATA3_IN     ( GND_net ),
        .RGMII_RXD3_USBB_DATA4_IN                ( GND_net ),
        .RGMII_TX_CLK_IN                         ( GND_net ),
        .RGMII_TX_CTL_RMII_TX_EN_USBB_NXT_IN     ( GND_net ),
        .RGMII_TXD0_RMII_TXD0_USBB_DIR_IN        ( GND_net ),
        .RGMII_TXD1_RMII_TXD1_USBB_STP_IN        ( GND_net ),
        .RGMII_TXD2_USBB_DATA5_IN                ( GND_net ),
        .RGMII_TXD3_USBB_DATA6_IN                ( GND_net ),
        .SPI0_SCK_USBA_XCLK_IN                   ( GND_net ),
        .SPI0_SDI_USBA_DIR_MGPIO5A_IN            ( GND_net ),
        .SPI0_SDO_USBA_STP_MGPIO6A_IN            ( GND_net ),
        .SPI0_SS0_USBA_NXT_MGPIO7A_IN            ( GND_net ),
        .SPI0_SS1_USBA_DATA5_MGPIO8A_IN          ( GND_net ),
        .SPI0_SS2_USBA_DATA6_MGPIO9A_IN          ( GND_net ),
        .SPI0_SS3_USBA_DATA7_MGPIO10A_IN         ( GND_net ),
        .SPI0_SS4_MGPIO19A_IN                    ( GND_net ),
        .SPI0_SS5_MGPIO20A_IN                    ( GND_net ),
        .SPI0_SS6_MGPIO21A_IN                    ( GND_net ),
        .SPI0_SS7_MGPIO22A_IN                    ( GND_net ),
        .SPI1_SCK_IN                             ( GND_net ),
        .SPI1_SDI_MGPIO11A_IN                    ( GND_net ),
        .SPI1_SDO_MGPIO12A_IN                    ( GND_net ),
        .SPI1_SS0_MGPIO13A_IN                    ( GND_net ),
        .SPI1_SS1_MGPIO14A_IN                    ( GND_net ),
        .SPI1_SS2_MGPIO15A_IN                    ( GND_net ),
        .SPI1_SS3_MGPIO16A_IN                    ( GND_net ),
        .SPI1_SS4_MGPIO17A_IN                    ( GND_net ),
        .SPI1_SS5_MGPIO18A_IN                    ( GND_net ),
        .SPI1_SS6_MGPIO23A_IN                    ( GND_net ),
        .SPI1_SS7_MGPIO24A_IN                    ( GND_net ),
        .USBC_XCLK_IN                            ( GND_net ),
        // Outputs
        .CAN_RXBUS_MGPIO3A_H2F_A                 (  ),
        .CAN_RXBUS_MGPIO3A_H2F_B                 (  ),
        .CAN_TX_EBL_MGPIO4A_H2F_A                (  ),
        .CAN_TX_EBL_MGPIO4A_H2F_B                (  ),
        .CAN_TXBUS_MGPIO2A_H2F_A                 (  ),
        .CAN_TXBUS_MGPIO2A_H2F_B                 (  ),
        .CLK_CONFIG_APB                          ( FIC_2_APB_M_PCLK_0 ),
        .COMMS_INT                               ( COMM_BLK_INT_net_0 ),
        .CONFIG_PRESET_N                         ( FIC_2_APB_M_PRESET_N_0 ),
        .EDAC_ERROR                              (  ),
        .F_FM0_RDATA                             ( FIC_0_AHB_S_HRDATA_net_0 ),
        .F_FM0_READYOUT                          ( FIC_0_AHB_S_HREADYOUT_net_0 ),
        .F_FM0_RESP                              ( FIC_0_AHB_S_HRESP_net_0 ),
        .F_HM0_ADDR                              (  ),
        .F_HM0_ENABLE                            (  ),
        .F_HM0_SEL                               (  ),
        .F_HM0_SIZE                              (  ),
        .F_HM0_TRANS1                            (  ),
        .F_HM0_WDATA                             (  ),
        .F_HM0_WRITE                             (  ),
        .FAB_CHRGVBUS                            (  ),
        .FAB_DISCHRGVBUS                         (  ),
        .FAB_DMPULLDOWN                          (  ),
        .FAB_DPPULLDOWN                          (  ),
        .FAB_DRVVBUS                             (  ),
        .FAB_IDPULLUP                            (  ),
        .FAB_OPMODE                              (  ),
        .FAB_SUSPENDM                            (  ),
        .FAB_TERMSEL                             (  ),
        .FAB_TXVALID                             (  ),
        .FAB_VCONTROL                            (  ),
        .FAB_VCONTROLLOADM                       (  ),
        .FAB_XCVRSEL                             (  ),
        .FAB_XDATAOUT                            (  ),
        .FACC_GLMUX_SEL                          (  ),
        .FIC32_0_MASTER                          (  ),
        .FIC32_1_MASTER                          (  ),
        .FPGA_RESET_N                            ( MSS_RESET_N_M2F_net_0 ),
        .GTX_CLK                                 (  ),
        .H2F_INTERRUPT                           ( MSS_INT_M2F_net_0 ),
        .H2F_NMI                                 ( M3_NMI_net_0 ),
        .H2FCALIB                                (  ),
        .I2C0_SCL_MGPIO31B_H2F_A                 (  ),
        .I2C0_SCL_MGPIO31B_H2F_B                 (  ),
        .I2C0_SDA_MGPIO30B_H2F_A                 (  ),
        .I2C0_SDA_MGPIO30B_H2F_B                 (  ),
        .I2C1_SCL_MGPIO1A_H2F_A                  (  ),
        .I2C1_SCL_MGPIO1A_H2F_B                  (  ),
        .I2C1_SDA_MGPIO0A_H2F_A                  (  ),
        .I2C1_SDA_MGPIO0A_H2F_B                  (  ),
        .MDCF                                    (  ),
        .MDOENF                                  (  ),
        .MDOF                                    (  ),
        .MMUART0_CTS_MGPIO19B_H2F_A              (  ),
        .MMUART0_CTS_MGPIO19B_H2F_B              (  ),
        .MMUART0_DCD_MGPIO22B_H2F_A              (  ),
        .MMUART0_DCD_MGPIO22B_H2F_B              (  ),
        .MMUART0_DSR_MGPIO20B_H2F_A              (  ),
        .MMUART0_DSR_MGPIO20B_H2F_B              (  ),
        .MMUART0_DTR_MGPIO18B_H2F_A              (  ),
        .MMUART0_DTR_MGPIO18B_H2F_B              (  ),
        .MMUART0_RI_MGPIO21B_H2F_A               (  ),
        .MMUART0_RI_MGPIO21B_H2F_B               (  ),
        .MMUART0_RTS_MGPIO17B_H2F_A              (  ),
        .MMUART0_RTS_MGPIO17B_H2F_B              (  ),
        .MMUART0_RXD_MGPIO28B_H2F_A              (  ),
        .MMUART0_RXD_MGPIO28B_H2F_B              (  ),
        .MMUART0_SCK_MGPIO29B_H2F_A              (  ),
        .MMUART0_SCK_MGPIO29B_H2F_B              (  ),
        .MMUART0_TXD_MGPIO27B_H2F_A              (  ),
        .MMUART0_TXD_MGPIO27B_H2F_B              (  ),
        .MMUART1_DTR_MGPIO12B_H2F_A              (  ),
        .MMUART1_RTS_MGPIO11B_H2F_A              (  ),
        .MMUART1_RTS_MGPIO11B_H2F_B              (  ),
        .MMUART1_RXD_MGPIO26B_H2F_A              (  ),
        .MMUART1_RXD_MGPIO26B_H2F_B              (  ),
        .MMUART1_SCK_MGPIO25B_H2F_A              (  ),
        .MMUART1_SCK_MGPIO25B_H2F_B              (  ),
        .MMUART1_TXD_MGPIO24B_H2F_A              (  ),
        .MMUART1_TXD_MGPIO24B_H2F_B              (  ),
        .MPLL_LOCK                               (  ),
        .PER2_FABRIC_PADDR                       ( FIC_2_APB_MASTER_0_PADDR ),
        .PER2_FABRIC_PENABLE                     ( FIC_2_APB_MASTER_0_PENABLE ),
        .PER2_FABRIC_PSEL                        ( FIC_2_APB_MASTER_0_PSELx ),
        .PER2_FABRIC_PWDATA                      ( FIC_2_APB_MASTER_0_PWDATA ),
        .PER2_FABRIC_PWRITE                      ( FIC_2_APB_MASTER_0_PWRITE ),
        .RTC_MATCH                               (  ),
        .SLEEPDEEP                               (  ),
        .SLEEPHOLDACK                            (  ),
        .SLEEPING                                (  ),
        .SMBALERT_NO0                            (  ),
        .SMBALERT_NO1                            (  ),
        .SMBSUS_NO0                              (  ),
        .SMBSUS_NO1                              (  ),
        .SPI0_CLK_OUT                            (  ),
        .SPI0_SDI_MGPIO5A_H2F_A                  (  ),
        .SPI0_SDI_MGPIO5A_H2F_B                  (  ),
        .SPI0_SDO_MGPIO6A_H2F_A                  (  ),
        .SPI0_SDO_MGPIO6A_H2F_B                  (  ),
        .SPI0_SS0_MGPIO7A_H2F_A                  (  ),
        .SPI0_SS0_MGPIO7A_H2F_B                  (  ),
        .SPI0_SS1_MGPIO8A_H2F_A                  (  ),
        .SPI0_SS1_MGPIO8A_H2F_B                  (  ),
        .SPI0_SS2_MGPIO9A_H2F_A                  (  ),
        .SPI0_SS2_MGPIO9A_H2F_B                  (  ),
        .SPI0_SS3_MGPIO10A_H2F_A                 (  ),
        .SPI0_SS3_MGPIO10A_H2F_B                 (  ),
        .SPI0_SS4_MGPIO19A_H2F_A                 (  ),
        .SPI0_SS5_MGPIO20A_H2F_A                 (  ),
        .SPI0_SS6_MGPIO21A_H2F_A                 (  ),
        .SPI0_SS7_MGPIO22A_H2F_A                 (  ),
        .SPI1_CLK_OUT                            (  ),
        .SPI1_SDI_MGPIO11A_H2F_A                 (  ),
        .SPI1_SDI_MGPIO11A_H2F_B                 (  ),
        .SPI1_SDO_MGPIO12A_H2F_A                 (  ),
        .SPI1_SDO_MGPIO12A_H2F_B                 (  ),
        .SPI1_SS0_MGPIO13A_H2F_A                 (  ),
        .SPI1_SS0_MGPIO13A_H2F_B                 (  ),
        .SPI1_SS1_MGPIO14A_H2F_A                 (  ),
        .SPI1_SS1_MGPIO14A_H2F_B                 (  ),
        .SPI1_SS2_MGPIO15A_H2F_A                 (  ),
        .SPI1_SS2_MGPIO15A_H2F_B                 (  ),
        .SPI1_SS3_MGPIO16A_H2F_A                 (  ),
        .SPI1_SS3_MGPIO16A_H2F_B                 (  ),
        .SPI1_SS4_MGPIO17A_H2F_A                 (  ),
        .SPI1_SS5_MGPIO18A_H2F_A                 (  ),
        .SPI1_SS6_MGPIO23A_H2F_A                 (  ),
        .SPI1_SS7_MGPIO24A_H2F_A                 (  ),
        .TCGF                                    (  ),
        .TRACECLK                                (  ),
        .TRACEDATA                               (  ),
        .TX_CLK                                  (  ),
        .TX_ENF                                  (  ),
        .TX_ERRF                                 (  ),
        .TXCTL_EN_RIF                            (  ),
        .TXD_RIF                                 (  ),
        .TXDF                                    (  ),
        .TXEV                                    (  ),
        .WDOGTIMEOUT                             (  ),
        .F_ARREADY_HREADYOUT1                    (  ),
        .F_AWREADY_HREADYOUT0                    ( MDDR_DDR_AHB0_S_HREADYOUT_net_0 ),
        .F_BID                                   (  ),
        .F_BRESP_HRESP0                          ( F_BRESP_HRESP0_net_0 ),
        .F_BVALID                                (  ),
        .F_RDATA_HRDATA01                        ( F_RDATA_HRDATA01_net_0 ),
        .F_RID                                   (  ),
        .F_RLAST                                 (  ),
        .F_RRESP_HRESP1                          (  ),
        .F_RVALID                                (  ),
        .F_WREADY                                (  ),
        .MDDR_FABRIC_PRDATA                      ( MDDR_APB_SLAVE_PRDATA ),
        .MDDR_FABRIC_PREADY                      ( MDDR_APB_SLAVE_PREADY ),
        .MDDR_FABRIC_PSLVERR                     ( MDDR_APB_SLAVE_PSLVERR ),
        .CAN_RXBUS_USBA_DATA1_MGPIO3A_OUT        (  ),
        .CAN_TX_EBL_USBA_DATA2_MGPIO4A_OUT       (  ),
        .CAN_TXBUS_USBA_DATA0_MGPIO2A_OUT        (  ),
        .DRAM_ADDR                               ( DRAM_ADDR_net_0 ),
        .DRAM_BA                                 ( DRAM_BA_net_0 ),
        .DRAM_CASN                               ( MSS_ADLIB_INST_DRAM_CASN ),
        .DRAM_CKE                                ( MSS_ADLIB_INST_DRAM_CKE ),
        .DRAM_CLK                                ( MSS_ADLIB_INST_DRAM_CLK ),
        .DRAM_CSN                                ( MSS_ADLIB_INST_DRAM_CSN ),
        .DRAM_DM_RDQS_OUT                        ( DRAM_DM_RDQS_OUT_net_0 ),
        .DRAM_DQ_OUT                             ( DRAM_DQ_OUT_net_0 ),
        .DRAM_DQS_OUT                            ( DRAM_DQS_OUT_net_0 ),
        .DRAM_FIFO_WE_OUT                        ( DRAM_FIFO_WE_OUT_net_0 ),
        .DRAM_ODT                                ( MSS_ADLIB_INST_DRAM_ODT ),
        .DRAM_RASN                               ( MSS_ADLIB_INST_DRAM_RASN ),
        .DRAM_RSTN                               ( MSS_ADLIB_INST_DRAM_RSTN ),
        .DRAM_WEN                                ( MSS_ADLIB_INST_DRAM_WEN ),
        .I2C0_SCL_USBC_DATA1_MGPIO31B_OUT        (  ),
        .I2C0_SDA_USBC_DATA0_MGPIO30B_OUT        (  ),
        .I2C1_SCL_USBA_DATA4_MGPIO1A_OUT         (  ),
        .I2C1_SDA_USBA_DATA3_MGPIO0A_OUT         (  ),
        .MGPIO25A_OUT                            (  ),
        .MGPIO26A_OUT                            (  ),
        .MMUART0_CTS_USBC_DATA7_MGPIO19B_OUT     (  ),
        .MMUART0_DCD_MGPIO22B_OUT                (  ),
        .MMUART0_DSR_MGPIO20B_OUT                (  ),
        .MMUART0_DTR_USBC_DATA6_MGPIO18B_OUT     (  ),
        .MMUART0_RI_MGPIO21B_OUT                 (  ),
        .MMUART0_RTS_USBC_DATA5_MGPIO17B_OUT     (  ),
        .MMUART0_RXD_USBC_STP_MGPIO28B_OUT       (  ),
        .MMUART0_SCK_USBC_NXT_MGPIO29B_OUT       (  ),
        .MMUART0_TXD_USBC_DIR_MGPIO27B_OUT       (  ),
        .MMUART1_CTS_MGPIO13B_OUT                (  ),
        .MMUART1_DCD_MGPIO16B_OUT                (  ),
        .MMUART1_DSR_MGPIO14B_OUT                (  ),
        .MMUART1_DTR_MGPIO12B_OUT                (  ),
        .MMUART1_RI_MGPIO15B_OUT                 (  ),
        .MMUART1_RTS_MGPIO11B_OUT                (  ),
        .MMUART1_RXD_USBC_DATA3_MGPIO26B_OUT     (  ),
        .MMUART1_SCK_USBC_DATA4_MGPIO25B_OUT     (  ),
        .MMUART1_TXD_USBC_DATA2_MGPIO24B_OUT     (  ),
        .RGMII_GTX_CLK_RMII_CLK_USBB_XCLK_OUT    (  ),
        .RGMII_MDC_RMII_MDC_OUT                  (  ),
        .RGMII_MDIO_RMII_MDIO_USBB_DATA7_OUT     (  ),
        .RGMII_RX_CLK_OUT                        (  ),
        .RGMII_RX_CTL_RMII_CRS_DV_USBB_DATA2_OUT (  ),
        .RGMII_RXD0_RMII_RXD0_USBB_DATA0_OUT     (  ),
        .RGMII_RXD1_RMII_RXD1_USBB_DATA1_OUT     (  ),
        .RGMII_RXD2_RMII_RX_ER_USBB_DATA3_OUT    (  ),
        .RGMII_RXD3_USBB_DATA4_OUT               (  ),
        .RGMII_TX_CLK_OUT                        (  ),
        .RGMII_TX_CTL_RMII_TX_EN_USBB_NXT_OUT    (  ),
        .RGMII_TXD0_RMII_TXD0_USBB_DIR_OUT       (  ),
        .RGMII_TXD1_RMII_TXD1_USBB_STP_OUT       (  ),
        .RGMII_TXD2_USBB_DATA5_OUT               (  ),
        .RGMII_TXD3_USBB_DATA6_OUT               (  ),
        .SPI0_SCK_USBA_XCLK_OUT                  (  ),
        .SPI0_SDI_USBA_DIR_MGPIO5A_OUT           (  ),
        .SPI0_SDO_USBA_STP_MGPIO6A_OUT           (  ),
        .SPI0_SS0_USBA_NXT_MGPIO7A_OUT           (  ),
        .SPI0_SS1_USBA_DATA5_MGPIO8A_OUT         (  ),
        .SPI0_SS2_USBA_DATA6_MGPIO9A_OUT         (  ),
        .SPI0_SS3_USBA_DATA7_MGPIO10A_OUT        (  ),
        .SPI0_SS4_MGPIO19A_OUT                   (  ),
        .SPI0_SS5_MGPIO20A_OUT                   (  ),
        .SPI0_SS6_MGPIO21A_OUT                   (  ),
        .SPI0_SS7_MGPIO22A_OUT                   (  ),
        .SPI1_SCK_OUT                            (  ),
        .SPI1_SDI_MGPIO11A_OUT                   (  ),
        .SPI1_SDO_MGPIO12A_OUT                   (  ),
        .SPI1_SS0_MGPIO13A_OUT                   (  ),
        .SPI1_SS1_MGPIO14A_OUT                   (  ),
        .SPI1_SS2_MGPIO15A_OUT                   (  ),
        .SPI1_SS3_MGPIO16A_OUT                   (  ),
        .SPI1_SS4_MGPIO17A_OUT                   (  ),
        .SPI1_SS5_MGPIO18A_OUT                   (  ),
        .SPI1_SS6_MGPIO23A_OUT                   (  ),
        .SPI1_SS7_MGPIO24A_OUT                   (  ),
        .USBC_XCLK_OUT                           (  ),
        .CAN_RXBUS_USBA_DATA1_MGPIO3A_OE         (  ),
        .CAN_TX_EBL_USBA_DATA2_MGPIO4A_OE        (  ),
        .CAN_TXBUS_USBA_DATA0_MGPIO2A_OE         (  ),
        .DM_OE                                   ( DM_OE_net_0 ),
        .DRAM_DQ_OE                              ( DRAM_DQ_OE_net_0 ),
        .DRAM_DQS_OE                             ( DRAM_DQS_OE_net_0 ),
        .I2C0_SCL_USBC_DATA1_MGPIO31B_OE         (  ),
        .I2C0_SDA_USBC_DATA0_MGPIO30B_OE         (  ),
        .I2C1_SCL_USBA_DATA4_MGPIO1A_OE          (  ),
        .I2C1_SDA_USBA_DATA3_MGPIO0A_OE          (  ),
        .MGPIO25A_OE                             (  ),
        .MGPIO26A_OE                             (  ),
        .MMUART0_CTS_USBC_DATA7_MGPIO19B_OE      (  ),
        .MMUART0_DCD_MGPIO22B_OE                 (  ),
        .MMUART0_DSR_MGPIO20B_OE                 (  ),
        .MMUART0_DTR_USBC_DATA6_MGPIO18B_OE      (  ),
        .MMUART0_RI_MGPIO21B_OE                  (  ),
        .MMUART0_RTS_USBC_DATA5_MGPIO17B_OE      (  ),
        .MMUART0_RXD_USBC_STP_MGPIO28B_OE        (  ),
        .MMUART0_SCK_USBC_NXT_MGPIO29B_OE        (  ),
        .MMUART0_TXD_USBC_DIR_MGPIO27B_OE        (  ),
        .MMUART1_CTS_MGPIO13B_OE                 (  ),
        .MMUART1_DCD_MGPIO16B_OE                 (  ),
        .MMUART1_DSR_MGPIO14B_OE                 (  ),
        .MMUART1_DTR_MGPIO12B_OE                 (  ),
        .MMUART1_RI_MGPIO15B_OE                  (  ),
        .MMUART1_RTS_MGPIO11B_OE                 (  ),
        .MMUART1_RXD_USBC_DATA3_MGPIO26B_OE      (  ),
        .MMUART1_SCK_USBC_DATA4_MGPIO25B_OE      (  ),
        .MMUART1_TXD_USBC_DATA2_MGPIO24B_OE      (  ),
        .RGMII_GTX_CLK_RMII_CLK_USBB_XCLK_OE     (  ),
        .RGMII_MDC_RMII_MDC_OE                   (  ),
        .RGMII_MDIO_RMII_MDIO_USBB_DATA7_OE      (  ),
        .RGMII_RX_CLK_OE                         (  ),
        .RGMII_RX_CTL_RMII_CRS_DV_USBB_DATA2_OE  (  ),
        .RGMII_RXD0_RMII_RXD0_USBB_DATA0_OE      (  ),
        .RGMII_RXD1_RMII_RXD1_USBB_DATA1_OE      (  ),
        .RGMII_RXD2_RMII_RX_ER_USBB_DATA3_OE     (  ),
        .RGMII_RXD3_USBB_DATA4_OE                (  ),
        .RGMII_TX_CLK_OE                         (  ),
        .RGMII_TX_CTL_RMII_TX_EN_USBB_NXT_OE     (  ),
        .RGMII_TXD0_RMII_TXD0_USBB_DIR_OE        (  ),
        .RGMII_TXD1_RMII_TXD1_USBB_STP_OE        (  ),
        .RGMII_TXD2_USBB_DATA5_OE                (  ),
        .RGMII_TXD3_USBB_DATA6_OE                (  ),
        .SPI0_SCK_USBA_XCLK_OE                   (  ),
        .SPI0_SDI_USBA_DIR_MGPIO5A_OE            (  ),
        .SPI0_SDO_USBA_STP_MGPIO6A_OE            (  ),
        .SPI0_SS0_USBA_NXT_MGPIO7A_OE            (  ),
        .SPI0_SS1_USBA_DATA5_MGPIO8A_OE          (  ),
        .SPI0_SS2_USBA_DATA6_MGPIO9A_OE          (  ),
        .SPI0_SS3_USBA_DATA7_MGPIO10A_OE         (  ),
        .SPI0_SS4_MGPIO19A_OE                    (  ),
        .SPI0_SS5_MGPIO20A_OE                    (  ),
        .SPI0_SS6_MGPIO21A_OE                    (  ),
        .SPI0_SS7_MGPIO22A_OE                    (  ),
        .SPI1_SCK_OE                             (  ),
        .SPI1_SDI_MGPIO11A_OE                    (  ),
        .SPI1_SDO_MGPIO12A_OE                    (  ),
        .SPI1_SS0_MGPIO13A_OE                    (  ),
        .SPI1_SS1_MGPIO14A_OE                    (  ),
        .SPI1_SS2_MGPIO15A_OE                    (  ),
        .SPI1_SS3_MGPIO16A_OE                    (  ),
        .SPI1_SS4_MGPIO17A_OE                    (  ),
        .SPI1_SS5_MGPIO18A_OE                    (  ),
        .SPI1_SS6_MGPIO23A_OE                    (  ),
        .SPI1_SS7_MGPIO24A_OE                    (  ),
        .USBC_XCLK_OE                            (  ) 
        );


endmodule
