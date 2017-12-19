//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Sun Dec 10 16:01:57 2017
// Version: v11.8 SP1 11.8.1.12
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// HPMS_0_sb
module HPMS_0_sb(
    // Inputs
    CLK0_PAD,
    DEVRST_N,
    FAB_RESET_N,
    HADDR_M0,
    HBURST_M0,
    HMASTLOCK_M0,
    HPROT_M0,
    HSIZE_M0,
    HTRANS_M0,
    HWDATA_M0,
    HWRITE_M0,
    MDDR_DDR_AHB0_S_HADDR,
    MDDR_DDR_AHB0_S_HBURST,
    MDDR_DDR_AHB0_S_HMASTLOCK,
    MDDR_DDR_AHB0_S_HREADY,
    MDDR_DDR_AHB0_S_HSEL,
    MDDR_DDR_AHB0_S_HSIZE,
    MDDR_DDR_AHB0_S_HTRANS,
    MDDR_DDR_AHB0_S_HWDATA,
    MDDR_DDR_AHB0_S_HWRITE,
    MDDR_DQS_TMATCH_0_IN,
    // Outputs
    COMM_BLK_INT,
    DDR_READY,
    FIC_0_CLK,
    FIC_0_LOCK,
    HPMS_DDR_FIC_SUBSYSTEM_LOCK,
    HPMS_INT_M2F,
    HPMS_READY,
    HRDATA_M0,
    HREADY_M0,
    HRESP_M0,
    INIT_DONE,
    MDDR_ADDR,
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
    POWER_ON_RESET_N,
    // Inouts
    MDDR_DM_RDQS,
    MDDR_DQ,
    MDDR_DQS,
    MDDR_DQS_N
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input         CLK0_PAD;
input         DEVRST_N;
input         FAB_RESET_N;
input  [31:0] HADDR_M0;
input  [2:0]  HBURST_M0;
input         HMASTLOCK_M0;
input  [3:0]  HPROT_M0;
input  [2:0]  HSIZE_M0;
input  [1:0]  HTRANS_M0;
input  [31:0] HWDATA_M0;
input         HWRITE_M0;
input  [31:0] MDDR_DDR_AHB0_S_HADDR;
input  [2:0]  MDDR_DDR_AHB0_S_HBURST;
input         MDDR_DDR_AHB0_S_HMASTLOCK;
input         MDDR_DDR_AHB0_S_HREADY;
input         MDDR_DDR_AHB0_S_HSEL;
input  [1:0]  MDDR_DDR_AHB0_S_HSIZE;
input  [1:0]  MDDR_DDR_AHB0_S_HTRANS;
input  [31:0] MDDR_DDR_AHB0_S_HWDATA;
input         MDDR_DDR_AHB0_S_HWRITE;
input         MDDR_DQS_TMATCH_0_IN;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output        COMM_BLK_INT;
output        DDR_READY;
output        FIC_0_CLK;
output        FIC_0_LOCK;
output        HPMS_DDR_FIC_SUBSYSTEM_LOCK;
output [15:0] HPMS_INT_M2F;
output        HPMS_READY;
output [31:0] HRDATA_M0;
output        HREADY_M0;
output [1:0]  HRESP_M0;
output        INIT_DONE;
output [15:0] MDDR_ADDR;
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
output        POWER_ON_RESET_N;
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
wire          CLK0_PAD;
wire          COMM_BLK_INT_net_0;
wire   [31:0] ConfigMaster_0_M_HADDR;
wire   [2:0]  ConfigMaster_0_M_HBURST;
wire          ConfigMaster_0_M_HLOCK;
wire   [3:0]  ConfigMaster_0_M_HPROT;
wire   [31:0] ConfigMaster_0_M_HRDATA;
wire          ConfigMaster_0_M_HREADY;
wire   [1:0]  ConfigMaster_0_M_HRESP;
wire   [2:0]  ConfigMaster_0_M_HSIZE;
wire   [1:0]  ConfigMaster_0_M_HTRANS;
wire   [31:0] ConfigMaster_0_M_HWDATA;
wire          ConfigMaster_0_M_HWRITE;
wire   [31:0] CoreAHBLite_0_AHBmslave16_HADDR;
wire   [2:0]  CoreAHBLite_0_AHBmslave16_HBURST;
wire          CoreAHBLite_0_AHBmslave16_HMASTLOCK;
wire   [3:0]  CoreAHBLite_0_AHBmslave16_HPROT;
wire   [31:0] CoreAHBLite_0_AHBmslave16_HRDATA;
wire          CoreAHBLite_0_AHBmslave16_HREADY;
wire          CoreAHBLite_0_AHBmslave16_HREADYOUT;
wire          CoreAHBLite_0_AHBmslave16_HSELx;
wire   [1:0]  CoreAHBLite_0_AHBmslave16_HTRANS;
wire   [31:0] CoreAHBLite_0_AHBmslave16_HWDATA;
wire          CoreAHBLite_0_AHBmslave16_HWRITE;
wire          CORECONFIGP_0_APB_S_PCLK;
wire          CORECONFIGP_0_APB_S_PRESET_N;
wire          CORECONFIGP_0_CONFIG1_DONE;
wire          CORECONFIGP_0_CONFIG2_DONE;
wire          CORECONFIGP_0_MDDR_APBmslave_PENABLE;
wire          CORECONFIGP_0_MDDR_APBmslave_PREADY;
wire          CORECONFIGP_0_MDDR_APBmslave_PSELx;
wire          CORECONFIGP_0_MDDR_APBmslave_PSLVERR;
wire          CORECONFIGP_0_MDDR_APBmslave_PWRITE;
wire          CORECONFIGP_0_SOFT_EXT_RESET_OUT;
wire          CORECONFIGP_0_SOFT_M3_RESET;
wire          CORECONFIGP_0_SOFT_MDDR_DDR_AXI_S_CORE_RESET;
wire          CORECONFIGP_0_SOFT_RESET_F2M;
wire          CORERESETP_0_MDDR_DDR_AXI_S_CORE_RESET_N;
wire          CORERESETP_0_RESET_N_F2M;
wire          DDR_READY_net_0;
wire          DEVRST_N;
wire          FAB_RESET_N;
wire          FABOSC_0_RCOSC_25_50MHZ_O2F;
wire          FIC_0_CLK_net_0;
wire          HPMS_0_sb_HPMS_TMP_0_FIC_2_APB_M_PCLK;
wire          HPMS_0_sb_HPMS_TMP_0_FIC_2_APB_M_PRESET_N;
wire          HPMS_0_sb_HPMS_TMP_0_FIC_2_APB_MASTER_PENABLE;
wire   [31:0] HPMS_0_sb_HPMS_TMP_0_FIC_2_APB_MASTER_PRDATA;
wire          HPMS_0_sb_HPMS_TMP_0_FIC_2_APB_MASTER_PREADY;
wire          HPMS_0_sb_HPMS_TMP_0_FIC_2_APB_MASTER_PSELx;
wire          HPMS_0_sb_HPMS_TMP_0_FIC_2_APB_MASTER_PSLVERR;
wire   [31:0] HPMS_0_sb_HPMS_TMP_0_FIC_2_APB_MASTER_PWDATA;
wire          HPMS_0_sb_HPMS_TMP_0_FIC_2_APB_MASTER_PWRITE;
wire          HPMS_0_sb_HPMS_TMP_0_MSS_RESET_N_M2F;
wire          HPMS_DDR_FIC_SUBSYSTEM_LOCK_net_0;
wire   [31:0] HADDR_M0;
wire   [2:0]  HBURST_M0;
wire          HMASTLOCK_M0;
wire   [3:0]  HPROT_M0;
wire   [31:0] HPMS_FIC_0_USER_MASTER_HRDATA;
wire          HPMS_FIC_0_USER_MASTER_HREADY;
wire   [1:0]  HPMS_FIC_0_USER_MASTER_HRESP;
wire   [2:0]  HSIZE_M0;
wire   [1:0]  HTRANS_M0;
wire   [31:0] HWDATA_M0;
wire          HWRITE_M0;
wire   [15:0] HPMS_INT_M2F_net_0;
wire          HPMS_READY_net_0;
wire          INIT_DONE_net_0;
wire   [15:0] MDDR_ADDR_0;
wire   [2:0]  MDDR_BA_0;
wire          MDDR_CAS_N_0;
wire          MDDR_CKE_0;
wire          MDDR_CLK_0;
wire          MDDR_CLK_N_0;
wire          MDDR_CS_N_0;
wire   [31:0] MDDR_DDR_AHB0_S_HADDR;
wire   [2:0]  MDDR_DDR_AHB0_S_HBURST;
wire          MDDR_DDR_AHB0_S_HMASTLOCK;
wire   [31:0] MDDR_DDR_AHB0_SLAVE_HRDATA;
wire          MDDR_DDR_AHB0_S_HREADY;
wire          MDDR_DDR_AHB0_SLAVE_HREADYOUT;
wire          MDDR_DDR_AHB0_SLAVE_HRESP;
wire          MDDR_DDR_AHB0_S_HSEL;
wire   [1:0]  MDDR_DDR_AHB0_S_HSIZE;
wire   [1:0]  MDDR_DDR_AHB0_S_HTRANS;
wire   [31:0] MDDR_DDR_AHB0_S_HWDATA;
wire          MDDR_DDR_AHB0_S_HWRITE;
wire   [1:0]  MDDR_DM_RDQS;
wire   [15:0] MDDR_DQ;
wire   [1:0]  MDDR_DQS;
wire   [1:0]  MDDR_DQS_N;
wire          MDDR_DQS_TMATCH_0_IN;
wire          MDDR_DQS_TMATCH_0_OUT_0;
wire          MDDR_ODT_0;
wire          MDDR_RAS_N_0;
wire          MDDR_RESET_N_0;
wire          MDDR_WE_N_0;
wire          POWER_ON_RESET_N_net_0;
wire          POWER_ON_RESET_N_net_1;
wire          INIT_DONE_net_1;
wire          HPMS_DDR_FIC_SUBSYSTEM_LOCK_net_1;
wire          HPMS_FIC_0_USER_MASTER_HREADY_net_0;
wire          FIC_0_CLK_net_1;
wire          HPMS_DDR_FIC_SUBSYSTEM_LOCK_net_2;
wire          DDR_READY_net_1;
wire          HPMS_READY_net_1;
wire          COMM_BLK_INT_net_1;
wire   [31:0] HPMS_FIC_0_USER_MASTER_HRDATA_net_0;
wire   [1:0]  HPMS_FIC_0_USER_MASTER_HRESP_net_0;
wire   [15:0] HPMS_INT_M2F_net_1;
wire          MDDR_DQS_TMATCH_0_OUT_0_net_0;
wire          MDDR_CAS_N_0_net_0;
wire          MDDR_CLK_0_net_0;
wire          MDDR_CLK_N_0_net_0;
wire          MDDR_CKE_0_net_0;
wire          MDDR_CS_N_0_net_0;
wire          MDDR_ODT_0_net_0;
wire          MDDR_RAS_N_0_net_0;
wire          MDDR_RESET_N_0_net_0;
wire          MDDR_WE_N_0_net_0;
wire   [15:0] MDDR_ADDR_0_net_0;
wire   [2:0]  MDDR_BA_0_net_0;
wire   [31:0] MDDR_DDR_AHB0_SLAVE_HRDATA_net_0;
wire          MDDR_DDR_AHB0_SLAVE_HREADYOUT_net_0;
wire          MDDR_DDR_AHB0_SLAVE_HRESP_net_0;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire          GND_net;
wire   [15:0] MSS_INT_F2M_const_net_0;
wire   [7:2]  PADDR_const_net_0;
wire   [7:0]  PWDATA_const_net_0;
wire          VCC_net;
wire   [31:0] FDDR_PRDATA_const_net_0;
wire   [31:0] SDIF0_PRDATA_const_net_0;
wire   [31:0] SDIF1_PRDATA_const_net_0;
wire   [31:0] SDIF2_PRDATA_const_net_0;
wire   [31:0] SDIF3_PRDATA_const_net_0;
wire   [31:0] SDIF0_PRDATA_const_net_1;
wire   [31:0] SDIF1_PRDATA_const_net_1;
wire   [31:0] SDIF2_PRDATA_const_net_1;
wire   [31:0] SDIF3_PRDATA_const_net_1;
wire   [31:0] HADDR_M2_const_net_0;
wire   [1:0]  HTRANS_M2_const_net_0;
wire   [2:0]  HSIZE_M2_const_net_0;
wire   [2:0]  HBURST_M2_const_net_0;
wire   [3:0]  HPROT_M2_const_net_0;
wire   [31:0] HWDATA_M2_const_net_0;
wire   [31:0] HADDR_M3_const_net_0;
wire   [1:0]  HTRANS_M3_const_net_0;
wire   [2:0]  HSIZE_M3_const_net_0;
wire   [2:0]  HBURST_M3_const_net_0;
wire   [3:0]  HPROT_M3_const_net_0;
wire   [31:0] HWDATA_M3_const_net_0;
wire   [31:0] HRDATA_S0_const_net_0;
wire   [1:0]  HRESP_S0_const_net_0;
wire   [31:0] HRDATA_S1_const_net_0;
wire   [1:0]  HRESP_S1_const_net_0;
wire   [31:0] HRDATA_S2_const_net_0;
wire   [1:0]  HRESP_S2_const_net_0;
wire   [31:0] HRDATA_S3_const_net_0;
wire   [1:0]  HRESP_S3_const_net_0;
wire   [31:0] HRDATA_S4_const_net_0;
wire   [1:0]  HRESP_S4_const_net_0;
wire   [31:0] HRDATA_S5_const_net_0;
wire   [1:0]  HRESP_S5_const_net_0;
wire   [31:0] HRDATA_S6_const_net_0;
wire   [1:0]  HRESP_S6_const_net_0;
wire   [31:0] HRDATA_S7_const_net_0;
wire   [1:0]  HRESP_S7_const_net_0;
wire   [31:0] HRDATA_S8_const_net_0;
wire   [1:0]  HRESP_S8_const_net_0;
wire   [31:0] HRDATA_S9_const_net_0;
wire   [1:0]  HRESP_S9_const_net_0;
wire   [31:0] HRDATA_S10_const_net_0;
wire   [1:0]  HRESP_S10_const_net_0;
wire   [31:0] HRDATA_S11_const_net_0;
wire   [1:0]  HRESP_S11_const_net_0;
wire   [31:0] HRDATA_S12_const_net_0;
wire   [1:0]  HRESP_S12_const_net_0;
wire   [31:0] HRDATA_S13_const_net_0;
wire   [1:0]  HRESP_S13_const_net_0;
wire   [31:0] HRDATA_S14_const_net_0;
wire   [1:0]  HRESP_S14_const_net_0;
wire   [31:0] HRDATA_S15_const_net_0;
wire   [1:0]  HRESP_S15_const_net_0;
//--------------------------------------------------------------------
// Bus Interface Nets Declarations - Unequal Pin Widths
//--------------------------------------------------------------------
wire   [1:1]  CoreAHBLite_0_AHBmslave16_HRESP_0_1to1;
wire   [0:0]  CoreAHBLite_0_AHBmslave16_HRESP_0_0to0;
wire   [1:0]  CoreAHBLite_0_AHBmslave16_HRESP_0;
wire          CoreAHBLite_0_AHBmslave16_HRESP;
wire   [2:0]  CoreAHBLite_0_AHBmslave16_HSIZE;
wire   [1:0]  CoreAHBLite_0_AHBmslave16_HSIZE_0_1to0;
wire   [1:0]  CoreAHBLite_0_AHBmslave16_HSIZE_0;
wire   [15:2] CORECONFIGP_0_MDDR_APBmslave_PADDR;
wire   [10:2] CORECONFIGP_0_MDDR_APBmslave_PADDR_0_10to2;
wire   [10:2] CORECONFIGP_0_MDDR_APBmslave_PADDR_0;
wire   [31:16]CORECONFIGP_0_MDDR_APBmslave_PRDATA_0_31to16;
wire   [15:0] CORECONFIGP_0_MDDR_APBmslave_PRDATA_0_15to0;
wire   [31:0] CORECONFIGP_0_MDDR_APBmslave_PRDATA_0;
wire   [15:0] CORECONFIGP_0_MDDR_APBmslave_PRDATA;
wire   [31:0] CORECONFIGP_0_MDDR_APBmslave_PWDATA;
wire   [15:0] CORECONFIGP_0_MDDR_APBmslave_PWDATA_0_15to0;
wire   [15:0] CORECONFIGP_0_MDDR_APBmslave_PWDATA_0;
wire   [16:16]HPMS_0_sb_HPMS_TMP_0_FIC_2_APB_MASTER_PADDR_0_16to16;
wire   [15:2] HPMS_0_sb_HPMS_TMP_0_FIC_2_APB_MASTER_PADDR_0_15to2;
wire   [16:2] HPMS_0_sb_HPMS_TMP_0_FIC_2_APB_MASTER_PADDR_0;
wire   [15:2] HPMS_0_sb_HPMS_TMP_0_FIC_2_APB_MASTER_PADDR;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net                  = 1'b0;
assign MSS_INT_F2M_const_net_0  = 16'h0000;
assign PADDR_const_net_0        = 6'h00;
assign PWDATA_const_net_0       = 8'h00;
assign VCC_net                  = 1'b1;
assign FDDR_PRDATA_const_net_0  = 32'h00000000;
assign SDIF0_PRDATA_const_net_0 = 32'h00000000;
assign SDIF1_PRDATA_const_net_0 = 32'h00000000;
assign SDIF2_PRDATA_const_net_0 = 32'h00000000;
assign SDIF3_PRDATA_const_net_0 = 32'h00000000;
assign SDIF0_PRDATA_const_net_1 = 32'h00000000;
assign SDIF1_PRDATA_const_net_1 = 32'h00000000;
assign SDIF2_PRDATA_const_net_1 = 32'h00000000;
assign SDIF3_PRDATA_const_net_1 = 32'h00000000;
assign HADDR_M2_const_net_0     = 32'h00000000;
assign HTRANS_M2_const_net_0    = 2'h0;
assign HSIZE_M2_const_net_0     = 3'h0;
assign HBURST_M2_const_net_0    = 3'h0;
assign HPROT_M2_const_net_0     = 4'h0;
assign HWDATA_M2_const_net_0    = 32'h00000000;
assign HADDR_M3_const_net_0     = 32'h00000000;
assign HTRANS_M3_const_net_0    = 2'h0;
assign HSIZE_M3_const_net_0     = 3'h0;
assign HBURST_M3_const_net_0    = 3'h0;
assign HPROT_M3_const_net_0     = 4'h0;
assign HWDATA_M3_const_net_0    = 32'h00000000;
assign HRDATA_S0_const_net_0    = 32'h00000000;
assign HRESP_S0_const_net_0     = 2'h0;
assign HRDATA_S1_const_net_0    = 32'h00000000;
assign HRESP_S1_const_net_0     = 2'h0;
assign HRDATA_S2_const_net_0    = 32'h00000000;
assign HRESP_S2_const_net_0     = 2'h0;
assign HRDATA_S3_const_net_0    = 32'h00000000;
assign HRESP_S3_const_net_0     = 2'h0;
assign HRDATA_S4_const_net_0    = 32'h00000000;
assign HRESP_S4_const_net_0     = 2'h0;
assign HRDATA_S5_const_net_0    = 32'h00000000;
assign HRESP_S5_const_net_0     = 2'h0;
assign HRDATA_S6_const_net_0    = 32'h00000000;
assign HRESP_S6_const_net_0     = 2'h0;
assign HRDATA_S7_const_net_0    = 32'h00000000;
assign HRESP_S7_const_net_0     = 2'h0;
assign HRDATA_S8_const_net_0    = 32'h00000000;
assign HRESP_S8_const_net_0     = 2'h0;
assign HRDATA_S9_const_net_0    = 32'h00000000;
assign HRESP_S9_const_net_0     = 2'h0;
assign HRDATA_S10_const_net_0   = 32'h00000000;
assign HRESP_S10_const_net_0    = 2'h0;
assign HRDATA_S11_const_net_0   = 32'h00000000;
assign HRESP_S11_const_net_0    = 2'h0;
assign HRDATA_S12_const_net_0   = 32'h00000000;
assign HRESP_S12_const_net_0    = 2'h0;
assign HRDATA_S13_const_net_0   = 32'h00000000;
assign HRESP_S13_const_net_0    = 2'h0;
assign HRDATA_S14_const_net_0   = 32'h00000000;
assign HRESP_S14_const_net_0    = 2'h0;
assign HRDATA_S15_const_net_0   = 32'h00000000;
assign HRESP_S15_const_net_0    = 2'h0;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign POWER_ON_RESET_N_net_1              = POWER_ON_RESET_N_net_0;
assign POWER_ON_RESET_N                    = POWER_ON_RESET_N_net_1;
assign INIT_DONE_net_1                     = INIT_DONE_net_0;
assign INIT_DONE                           = INIT_DONE_net_1;
assign HPMS_DDR_FIC_SUBSYSTEM_LOCK_net_1   = HPMS_DDR_FIC_SUBSYSTEM_LOCK_net_0;
assign HPMS_DDR_FIC_SUBSYSTEM_LOCK         = HPMS_DDR_FIC_SUBSYSTEM_LOCK_net_1;
assign HPMS_FIC_0_USER_MASTER_HREADY_net_0 = HPMS_FIC_0_USER_MASTER_HREADY;
assign HREADY_M0                           = HPMS_FIC_0_USER_MASTER_HREADY_net_0;
assign FIC_0_CLK_net_1                     = FIC_0_CLK_net_0;
assign FIC_0_CLK                           = FIC_0_CLK_net_1;
assign HPMS_DDR_FIC_SUBSYSTEM_LOCK_net_2   = HPMS_DDR_FIC_SUBSYSTEM_LOCK_net_0;
assign FIC_0_LOCK                          = HPMS_DDR_FIC_SUBSYSTEM_LOCK_net_2;
assign DDR_READY_net_1                     = DDR_READY_net_0;
assign DDR_READY                           = DDR_READY_net_1;
assign HPMS_READY_net_1                    = HPMS_READY_net_0;
assign HPMS_READY                          = HPMS_READY_net_1;
assign COMM_BLK_INT_net_1                  = COMM_BLK_INT_net_0;
assign COMM_BLK_INT                        = COMM_BLK_INT_net_1;
assign HPMS_FIC_0_USER_MASTER_HRDATA_net_0 = HPMS_FIC_0_USER_MASTER_HRDATA;
assign HRDATA_M0[31:0]                     = HPMS_FIC_0_USER_MASTER_HRDATA_net_0;
assign HPMS_FIC_0_USER_MASTER_HRESP_net_0  = HPMS_FIC_0_USER_MASTER_HRESP;
assign HRESP_M0[1:0]                       = HPMS_FIC_0_USER_MASTER_HRESP_net_0;
assign HPMS_INT_M2F_net_1                  = HPMS_INT_M2F_net_0;
assign HPMS_INT_M2F[15:0]                  = HPMS_INT_M2F_net_1;
assign MDDR_DQS_TMATCH_0_OUT_0_net_0       = MDDR_DQS_TMATCH_0_OUT_0;
assign MDDR_DQS_TMATCH_0_OUT               = MDDR_DQS_TMATCH_0_OUT_0_net_0;
assign MDDR_CAS_N_0_net_0                  = MDDR_CAS_N_0;
assign MDDR_CAS_N                          = MDDR_CAS_N_0_net_0;
assign MDDR_CLK_0_net_0                    = MDDR_CLK_0;
assign MDDR_CLK                            = MDDR_CLK_0_net_0;
assign MDDR_CLK_N_0_net_0                  = MDDR_CLK_N_0;
assign MDDR_CLK_N                          = MDDR_CLK_N_0_net_0;
assign MDDR_CKE_0_net_0                    = MDDR_CKE_0;
assign MDDR_CKE                            = MDDR_CKE_0_net_0;
assign MDDR_CS_N_0_net_0                   = MDDR_CS_N_0;
assign MDDR_CS_N                           = MDDR_CS_N_0_net_0;
assign MDDR_ODT_0_net_0                    = MDDR_ODT_0;
assign MDDR_ODT                            = MDDR_ODT_0_net_0;
assign MDDR_RAS_N_0_net_0                  = MDDR_RAS_N_0;
assign MDDR_RAS_N                          = MDDR_RAS_N_0_net_0;
assign MDDR_RESET_N_0_net_0                = MDDR_RESET_N_0;
assign MDDR_RESET_N                        = MDDR_RESET_N_0_net_0;
assign MDDR_WE_N_0_net_0                   = MDDR_WE_N_0;
assign MDDR_WE_N                           = MDDR_WE_N_0_net_0;
assign MDDR_ADDR_0_net_0                   = MDDR_ADDR_0;
assign MDDR_ADDR[15:0]                     = MDDR_ADDR_0_net_0;
assign MDDR_BA_0_net_0                     = MDDR_BA_0;
assign MDDR_BA[2:0]                        = MDDR_BA_0_net_0;
assign MDDR_DDR_AHB0_SLAVE_HRDATA_net_0    = MDDR_DDR_AHB0_SLAVE_HRDATA;
assign MDDR_DDR_AHB0_S_HRDATA[31:0]        = MDDR_DDR_AHB0_SLAVE_HRDATA_net_0;
assign MDDR_DDR_AHB0_SLAVE_HREADYOUT_net_0 = MDDR_DDR_AHB0_SLAVE_HREADYOUT;
assign MDDR_DDR_AHB0_S_HREADYOUT           = MDDR_DDR_AHB0_SLAVE_HREADYOUT_net_0;
assign MDDR_DDR_AHB0_SLAVE_HRESP_net_0     = MDDR_DDR_AHB0_SLAVE_HRESP;
assign MDDR_DDR_AHB0_S_HRESP               = MDDR_DDR_AHB0_SLAVE_HRESP_net_0;
//--------------------------------------------------------------------
// Bus Interface Nets Assignments - Unequal Pin Widths
//--------------------------------------------------------------------
assign CoreAHBLite_0_AHBmslave16_HRESP_0_1to1 = 1'b0;
assign CoreAHBLite_0_AHBmslave16_HRESP_0_0to0 = CoreAHBLite_0_AHBmslave16_HRESP;
assign CoreAHBLite_0_AHBmslave16_HRESP_0 = { CoreAHBLite_0_AHBmslave16_HRESP_0_1to1, CoreAHBLite_0_AHBmslave16_HRESP_0_0to0 };

assign CoreAHBLite_0_AHBmslave16_HSIZE_0_1to0 = CoreAHBLite_0_AHBmslave16_HSIZE[1:0];
assign CoreAHBLite_0_AHBmslave16_HSIZE_0 = { CoreAHBLite_0_AHBmslave16_HSIZE_0_1to0 };

assign CORECONFIGP_0_MDDR_APBmslave_PADDR_0_10to2 = CORECONFIGP_0_MDDR_APBmslave_PADDR[10:2];
assign CORECONFIGP_0_MDDR_APBmslave_PADDR_0 = { CORECONFIGP_0_MDDR_APBmslave_PADDR_0_10to2 };

assign CORECONFIGP_0_MDDR_APBmslave_PRDATA_0_31to16 = 16'h0;
assign CORECONFIGP_0_MDDR_APBmslave_PRDATA_0_15to0 = CORECONFIGP_0_MDDR_APBmslave_PRDATA[15:0];
assign CORECONFIGP_0_MDDR_APBmslave_PRDATA_0 = { CORECONFIGP_0_MDDR_APBmslave_PRDATA_0_31to16, CORECONFIGP_0_MDDR_APBmslave_PRDATA_0_15to0 };

assign CORECONFIGP_0_MDDR_APBmslave_PWDATA_0_15to0 = CORECONFIGP_0_MDDR_APBmslave_PWDATA[15:0];
assign CORECONFIGP_0_MDDR_APBmslave_PWDATA_0 = { CORECONFIGP_0_MDDR_APBmslave_PWDATA_0_15to0 };

assign HPMS_0_sb_HPMS_TMP_0_FIC_2_APB_MASTER_PADDR_0_16to16 = 1'b0;
assign HPMS_0_sb_HPMS_TMP_0_FIC_2_APB_MASTER_PADDR_0_15to2 = HPMS_0_sb_HPMS_TMP_0_FIC_2_APB_MASTER_PADDR[15:2];
assign HPMS_0_sb_HPMS_TMP_0_FIC_2_APB_MASTER_PADDR_0 = { HPMS_0_sb_HPMS_TMP_0_FIC_2_APB_MASTER_PADDR_0_16to16, HPMS_0_sb_HPMS_TMP_0_FIC_2_APB_MASTER_PADDR_0_15to2 };

//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------HPMS_0_sb_CCC_0_FCCC   -   Actel:SgCore:FCCC:2.0.201
HPMS_0_sb_CCC_0_FCCC CCC_0(
        // Inputs
        .CLK0_PAD ( CLK0_PAD ),
        // Outputs
        .GL0      ( FIC_0_CLK_net_0 ),
        .LOCK     ( HPMS_DDR_FIC_SUBSYSTEM_LOCK_net_0 ) 
        );

//--------CoreConfigMaster   -   Actel:DirectCore:CoreConfigMaster:2.1.102
CoreConfigMaster #( 
        .DATA_LOCATION ( 256000 ) )
ConfigMaster_0(
        // Inputs
        .HCLK      ( FIC_0_CLK_net_0 ),
        .HRESETN   ( HPMS_READY_net_0 ),
        .HREADY    ( ConfigMaster_0_M_HREADY ),
        .HRDATA    ( ConfigMaster_0_M_HRDATA ),
        // Outputs
        .HWRITE    ( ConfigMaster_0_M_HWRITE ),
        .HMASTLOCK ( ConfigMaster_0_M_HLOCK ),
        .HADDR     ( ConfigMaster_0_M_HADDR ),
        .HSIZE     ( ConfigMaster_0_M_HSIZE ),
        .HTRANS    ( ConfigMaster_0_M_HTRANS ),
        .HWDATA    ( ConfigMaster_0_M_HWDATA ),
        .HBURST    ( ConfigMaster_0_M_HBURST ),
        .HPROT     ( ConfigMaster_0_M_HPROT ) 
        );

//--------CoreAHBLite   -   Actel:DirectCore:CoreAHBLite:5.2.100
CoreAHBLite #( 
        .FAMILY             ( 24 ),
        .HADDR_SHG_CFG      ( 1 ),
        .M0_AHBSLOT0ENABLE  ( 0 ),
        .M0_AHBSLOT1ENABLE  ( 0 ),
        .M0_AHBSLOT2ENABLE  ( 0 ),
        .M0_AHBSLOT3ENABLE  ( 0 ),
        .M0_AHBSLOT4ENABLE  ( 0 ),
        .M0_AHBSLOT5ENABLE  ( 0 ),
        .M0_AHBSLOT6ENABLE  ( 0 ),
        .M0_AHBSLOT7ENABLE  ( 0 ),
        .M0_AHBSLOT8ENABLE  ( 0 ),
        .M0_AHBSLOT9ENABLE  ( 0 ),
        .M0_AHBSLOT10ENABLE ( 0 ),
        .M0_AHBSLOT11ENABLE ( 0 ),
        .M0_AHBSLOT12ENABLE ( 0 ),
        .M0_AHBSLOT13ENABLE ( 0 ),
        .M0_AHBSLOT14ENABLE ( 0 ),
        .M0_AHBSLOT15ENABLE ( 0 ),
        .M0_AHBSLOT16ENABLE ( 1 ),
        .M1_AHBSLOT0ENABLE  ( 0 ),
        .M1_AHBSLOT1ENABLE  ( 0 ),
        .M1_AHBSLOT2ENABLE  ( 0 ),
        .M1_AHBSLOT3ENABLE  ( 0 ),
        .M1_AHBSLOT4ENABLE  ( 0 ),
        .M1_AHBSLOT5ENABLE  ( 0 ),
        .M1_AHBSLOT6ENABLE  ( 0 ),
        .M1_AHBSLOT7ENABLE  ( 0 ),
        .M1_AHBSLOT8ENABLE  ( 0 ),
        .M1_AHBSLOT9ENABLE  ( 0 ),
        .M1_AHBSLOT10ENABLE ( 0 ),
        .M1_AHBSLOT11ENABLE ( 0 ),
        .M1_AHBSLOT12ENABLE ( 0 ),
        .M1_AHBSLOT13ENABLE ( 0 ),
        .M1_AHBSLOT14ENABLE ( 0 ),
        .M1_AHBSLOT15ENABLE ( 0 ),
        .M1_AHBSLOT16ENABLE ( 1 ),
        .M2_AHBSLOT0ENABLE  ( 0 ),
        .M2_AHBSLOT1ENABLE  ( 0 ),
        .M2_AHBSLOT2ENABLE  ( 0 ),
        .M2_AHBSLOT3ENABLE  ( 0 ),
        .M2_AHBSLOT4ENABLE  ( 0 ),
        .M2_AHBSLOT5ENABLE  ( 0 ),
        .M2_AHBSLOT6ENABLE  ( 0 ),
        .M2_AHBSLOT7ENABLE  ( 0 ),
        .M2_AHBSLOT8ENABLE  ( 0 ),
        .M2_AHBSLOT9ENABLE  ( 0 ),
        .M2_AHBSLOT10ENABLE ( 0 ),
        .M2_AHBSLOT11ENABLE ( 0 ),
        .M2_AHBSLOT12ENABLE ( 0 ),
        .M2_AHBSLOT13ENABLE ( 0 ),
        .M2_AHBSLOT14ENABLE ( 0 ),
        .M2_AHBSLOT15ENABLE ( 0 ),
        .M2_AHBSLOT16ENABLE ( 0 ),
        .M3_AHBSLOT0ENABLE  ( 0 ),
        .M3_AHBSLOT1ENABLE  ( 0 ),
        .M3_AHBSLOT2ENABLE  ( 0 ),
        .M3_AHBSLOT3ENABLE  ( 0 ),
        .M3_AHBSLOT4ENABLE  ( 0 ),
        .M3_AHBSLOT5ENABLE  ( 0 ),
        .M3_AHBSLOT6ENABLE  ( 0 ),
        .M3_AHBSLOT7ENABLE  ( 0 ),
        .M3_AHBSLOT8ENABLE  ( 0 ),
        .M3_AHBSLOT9ENABLE  ( 0 ),
        .M3_AHBSLOT10ENABLE ( 0 ),
        .M3_AHBSLOT11ENABLE ( 0 ),
        .M3_AHBSLOT12ENABLE ( 0 ),
        .M3_AHBSLOT13ENABLE ( 0 ),
        .M3_AHBSLOT14ENABLE ( 0 ),
        .M3_AHBSLOT15ENABLE ( 0 ),
        .M3_AHBSLOT16ENABLE ( 0 ),
        .MEMSPACE           ( 1 ),
        .SC_0               ( 1 ),
        .SC_1               ( 0 ),
        .SC_2               ( 1 ),
        .SC_3               ( 0 ),
        .SC_4               ( 1 ),
        .SC_5               ( 0 ),
        .SC_6               ( 1 ),
        .SC_7               ( 0 ),
        .SC_8               ( 0 ),
        .SC_9               ( 0 ),
        .SC_10              ( 0 ),
        .SC_11              ( 0 ),
        .SC_12              ( 0 ),
        .SC_13              ( 0 ),
        .SC_14              ( 0 ),
        .SC_15              ( 0 ) )
CoreAHBLite_0(
        // Inputs
        .HCLK          ( FIC_0_CLK_net_0 ),
        .HRESETN       ( HPMS_READY_net_0 ),
        .REMAP_M0      ( GND_net ),
        .HMASTLOCK_M0  ( ConfigMaster_0_M_HLOCK ),
        .HWRITE_M0     ( ConfigMaster_0_M_HWRITE ),
        .HMASTLOCK_M1  ( HMASTLOCK_M0 ),
        .HWRITE_M1     ( HWRITE_M0 ),
        .HMASTLOCK_M2  ( GND_net ), // tied to 1'b0 from definition
        .HWRITE_M2     ( GND_net ), // tied to 1'b0 from definition
        .HMASTLOCK_M3  ( GND_net ), // tied to 1'b0 from definition
        .HWRITE_M3     ( GND_net ), // tied to 1'b0 from definition
        .HREADYOUT_S0  ( VCC_net ), // tied to 1'b1 from definition
        .HREADYOUT_S1  ( VCC_net ), // tied to 1'b1 from definition
        .HREADYOUT_S2  ( VCC_net ), // tied to 1'b1 from definition
        .HREADYOUT_S3  ( VCC_net ), // tied to 1'b1 from definition
        .HREADYOUT_S4  ( VCC_net ), // tied to 1'b1 from definition
        .HREADYOUT_S5  ( VCC_net ), // tied to 1'b1 from definition
        .HREADYOUT_S6  ( VCC_net ), // tied to 1'b1 from definition
        .HREADYOUT_S7  ( VCC_net ), // tied to 1'b1 from definition
        .HREADYOUT_S8  ( VCC_net ), // tied to 1'b1 from definition
        .HREADYOUT_S9  ( VCC_net ), // tied to 1'b1 from definition
        .HREADYOUT_S10 ( VCC_net ), // tied to 1'b1 from definition
        .HREADYOUT_S11 ( VCC_net ), // tied to 1'b1 from definition
        .HREADYOUT_S12 ( VCC_net ), // tied to 1'b1 from definition
        .HREADYOUT_S13 ( VCC_net ), // tied to 1'b1 from definition
        .HREADYOUT_S14 ( VCC_net ), // tied to 1'b1 from definition
        .HREADYOUT_S15 ( VCC_net ), // tied to 1'b1 from definition
        .HREADYOUT_S16 ( CoreAHBLite_0_AHBmslave16_HREADYOUT ),
        .HADDR_M0      ( ConfigMaster_0_M_HADDR ),
        .HSIZE_M0      ( ConfigMaster_0_M_HSIZE ),
        .HTRANS_M0     ( ConfigMaster_0_M_HTRANS ),
        .HWDATA_M0     ( ConfigMaster_0_M_HWDATA ),
        .HBURST_M0     ( ConfigMaster_0_M_HBURST ),
        .HPROT_M0      ( ConfigMaster_0_M_HPROT ),
        .HADDR_M1      ( HADDR_M0 ),
        .HSIZE_M1      ( HSIZE_M0 ),
        .HTRANS_M1     ( HTRANS_M0 ),
        .HWDATA_M1     ( HWDATA_M0 ),
        .HBURST_M1     ( HBURST_M0 ),
        .HPROT_M1      ( HPROT_M0 ),
        .HADDR_M2      ( HADDR_M2_const_net_0 ), // tied to 32'h00000000 from definition
        .HSIZE_M2      ( HSIZE_M2_const_net_0 ), // tied to 3'h0 from definition
        .HTRANS_M2     ( HTRANS_M2_const_net_0 ), // tied to 2'h0 from definition
        .HWDATA_M2     ( HWDATA_M2_const_net_0 ), // tied to 32'h00000000 from definition
        .HBURST_M2     ( HBURST_M2_const_net_0 ), // tied to 3'h0 from definition
        .HPROT_M2      ( HPROT_M2_const_net_0 ), // tied to 4'h0 from definition
        .HADDR_M3      ( HADDR_M3_const_net_0 ), // tied to 32'h00000000 from definition
        .HSIZE_M3      ( HSIZE_M3_const_net_0 ), // tied to 3'h0 from definition
        .HTRANS_M3     ( HTRANS_M3_const_net_0 ), // tied to 2'h0 from definition
        .HWDATA_M3     ( HWDATA_M3_const_net_0 ), // tied to 32'h00000000 from definition
        .HBURST_M3     ( HBURST_M3_const_net_0 ), // tied to 3'h0 from definition
        .HPROT_M3      ( HPROT_M3_const_net_0 ), // tied to 4'h0 from definition
        .HRDATA_S0     ( HRDATA_S0_const_net_0 ), // tied to 32'h00000000 from definition
        .HRESP_S0      ( HRESP_S0_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S1     ( HRDATA_S1_const_net_0 ), // tied to 32'h00000000 from definition
        .HRESP_S1      ( HRESP_S1_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S2     ( HRDATA_S2_const_net_0 ), // tied to 32'h00000000 from definition
        .HRESP_S2      ( HRESP_S2_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S3     ( HRDATA_S3_const_net_0 ), // tied to 32'h00000000 from definition
        .HRESP_S3      ( HRESP_S3_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S4     ( HRDATA_S4_const_net_0 ), // tied to 32'h00000000 from definition
        .HRESP_S4      ( HRESP_S4_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S5     ( HRDATA_S5_const_net_0 ), // tied to 32'h00000000 from definition
        .HRESP_S5      ( HRESP_S5_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S6     ( HRDATA_S6_const_net_0 ), // tied to 32'h00000000 from definition
        .HRESP_S6      ( HRESP_S6_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S7     ( HRDATA_S7_const_net_0 ), // tied to 32'h00000000 from definition
        .HRESP_S7      ( HRESP_S7_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S8     ( HRDATA_S8_const_net_0 ), // tied to 32'h00000000 from definition
        .HRESP_S8      ( HRESP_S8_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S9     ( HRDATA_S9_const_net_0 ), // tied to 32'h00000000 from definition
        .HRESP_S9      ( HRESP_S9_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S10    ( HRDATA_S10_const_net_0 ), // tied to 32'h00000000 from definition
        .HRESP_S10     ( HRESP_S10_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S11    ( HRDATA_S11_const_net_0 ), // tied to 32'h00000000 from definition
        .HRESP_S11     ( HRESP_S11_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S12    ( HRDATA_S12_const_net_0 ), // tied to 32'h00000000 from definition
        .HRESP_S12     ( HRESP_S12_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S13    ( HRDATA_S13_const_net_0 ), // tied to 32'h00000000 from definition
        .HRESP_S13     ( HRESP_S13_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S14    ( HRDATA_S14_const_net_0 ), // tied to 32'h00000000 from definition
        .HRESP_S14     ( HRESP_S14_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S15    ( HRDATA_S15_const_net_0 ), // tied to 32'h00000000 from definition
        .HRESP_S15     ( HRESP_S15_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S16    ( CoreAHBLite_0_AHBmslave16_HRDATA ),
        .HRESP_S16     ( CoreAHBLite_0_AHBmslave16_HRESP_0 ),
        // Outputs
        .HREADY_M0     ( ConfigMaster_0_M_HREADY ),
        .HREADY_M1     ( HPMS_FIC_0_USER_MASTER_HREADY ),
        .HREADY_M2     (  ),
        .HREADY_M3     (  ),
        .HSEL_S0       (  ),
        .HWRITE_S0     (  ),
        .HREADY_S0     (  ),
        .HMASTLOCK_S0  (  ),
        .HSEL_S1       (  ),
        .HWRITE_S1     (  ),
        .HREADY_S1     (  ),
        .HMASTLOCK_S1  (  ),
        .HSEL_S2       (  ),
        .HWRITE_S2     (  ),
        .HREADY_S2     (  ),
        .HMASTLOCK_S2  (  ),
        .HSEL_S3       (  ),
        .HWRITE_S3     (  ),
        .HREADY_S3     (  ),
        .HMASTLOCK_S3  (  ),
        .HSEL_S4       (  ),
        .HWRITE_S4     (  ),
        .HREADY_S4     (  ),
        .HMASTLOCK_S4  (  ),
        .HSEL_S5       (  ),
        .HWRITE_S5     (  ),
        .HREADY_S5     (  ),
        .HMASTLOCK_S5  (  ),
        .HSEL_S6       (  ),
        .HWRITE_S6     (  ),
        .HREADY_S6     (  ),
        .HMASTLOCK_S6  (  ),
        .HSEL_S7       (  ),
        .HWRITE_S7     (  ),
        .HREADY_S7     (  ),
        .HMASTLOCK_S7  (  ),
        .HSEL_S8       (  ),
        .HWRITE_S8     (  ),
        .HREADY_S8     (  ),
        .HMASTLOCK_S8  (  ),
        .HSEL_S9       (  ),
        .HWRITE_S9     (  ),
        .HREADY_S9     (  ),
        .HMASTLOCK_S9  (  ),
        .HSEL_S10      (  ),
        .HWRITE_S10    (  ),
        .HREADY_S10    (  ),
        .HMASTLOCK_S10 (  ),
        .HSEL_S11      (  ),
        .HWRITE_S11    (  ),
        .HREADY_S11    (  ),
        .HMASTLOCK_S11 (  ),
        .HSEL_S12      (  ),
        .HWRITE_S12    (  ),
        .HREADY_S12    (  ),
        .HMASTLOCK_S12 (  ),
        .HSEL_S13      (  ),
        .HWRITE_S13    (  ),
        .HREADY_S13    (  ),
        .HMASTLOCK_S13 (  ),
        .HSEL_S14      (  ),
        .HWRITE_S14    (  ),
        .HREADY_S14    (  ),
        .HMASTLOCK_S14 (  ),
        .HSEL_S15      (  ),
        .HWRITE_S15    (  ),
        .HREADY_S15    (  ),
        .HMASTLOCK_S15 (  ),
        .HSEL_S16      ( CoreAHBLite_0_AHBmslave16_HSELx ),
        .HWRITE_S16    ( CoreAHBLite_0_AHBmslave16_HWRITE ),
        .HREADY_S16    ( CoreAHBLite_0_AHBmslave16_HREADY ),
        .HMASTLOCK_S16 ( CoreAHBLite_0_AHBmslave16_HMASTLOCK ),
        .HRESP_M0      ( ConfigMaster_0_M_HRESP ),
        .HRDATA_M0     ( ConfigMaster_0_M_HRDATA ),
        .HRESP_M1      ( HPMS_FIC_0_USER_MASTER_HRESP ),
        .HRDATA_M1     ( HPMS_FIC_0_USER_MASTER_HRDATA ),
        .HRESP_M2      (  ),
        .HRDATA_M2     (  ),
        .HRESP_M3      (  ),
        .HRDATA_M3     (  ),
        .HADDR_S0      (  ),
        .HSIZE_S0      (  ),
        .HTRANS_S0     (  ),
        .HWDATA_S0     (  ),
        .HBURST_S0     (  ),
        .HPROT_S0      (  ),
        .HADDR_S1      (  ),
        .HSIZE_S1      (  ),
        .HTRANS_S1     (  ),
        .HWDATA_S1     (  ),
        .HBURST_S1     (  ),
        .HPROT_S1      (  ),
        .HADDR_S2      (  ),
        .HSIZE_S2      (  ),
        .HTRANS_S2     (  ),
        .HWDATA_S2     (  ),
        .HBURST_S2     (  ),
        .HPROT_S2      (  ),
        .HADDR_S3      (  ),
        .HSIZE_S3      (  ),
        .HTRANS_S3     (  ),
        .HWDATA_S3     (  ),
        .HBURST_S3     (  ),
        .HPROT_S3      (  ),
        .HADDR_S4      (  ),
        .HSIZE_S4      (  ),
        .HTRANS_S4     (  ),
        .HWDATA_S4     (  ),
        .HBURST_S4     (  ),
        .HPROT_S4      (  ),
        .HADDR_S5      (  ),
        .HSIZE_S5      (  ),
        .HTRANS_S5     (  ),
        .HWDATA_S5     (  ),
        .HBURST_S5     (  ),
        .HPROT_S5      (  ),
        .HADDR_S6      (  ),
        .HSIZE_S6      (  ),
        .HTRANS_S6     (  ),
        .HWDATA_S6     (  ),
        .HBURST_S6     (  ),
        .HPROT_S6      (  ),
        .HADDR_S7      (  ),
        .HSIZE_S7      (  ),
        .HTRANS_S7     (  ),
        .HWDATA_S7     (  ),
        .HBURST_S7     (  ),
        .HPROT_S7      (  ),
        .HADDR_S8      (  ),
        .HSIZE_S8      (  ),
        .HTRANS_S8     (  ),
        .HWDATA_S8     (  ),
        .HBURST_S8     (  ),
        .HPROT_S8      (  ),
        .HADDR_S9      (  ),
        .HSIZE_S9      (  ),
        .HTRANS_S9     (  ),
        .HWDATA_S9     (  ),
        .HBURST_S9     (  ),
        .HPROT_S9      (  ),
        .HADDR_S10     (  ),
        .HSIZE_S10     (  ),
        .HTRANS_S10    (  ),
        .HWDATA_S10    (  ),
        .HBURST_S10    (  ),
        .HPROT_S10     (  ),
        .HADDR_S11     (  ),
        .HSIZE_S11     (  ),
        .HTRANS_S11    (  ),
        .HWDATA_S11    (  ),
        .HBURST_S11    (  ),
        .HPROT_S11     (  ),
        .HADDR_S12     (  ),
        .HSIZE_S12     (  ),
        .HTRANS_S12    (  ),
        .HWDATA_S12    (  ),
        .HBURST_S12    (  ),
        .HPROT_S12     (  ),
        .HADDR_S13     (  ),
        .HSIZE_S13     (  ),
        .HTRANS_S13    (  ),
        .HWDATA_S13    (  ),
        .HBURST_S13    (  ),
        .HPROT_S13     (  ),
        .HADDR_S14     (  ),
        .HSIZE_S14     (  ),
        .HTRANS_S14    (  ),
        .HWDATA_S14    (  ),
        .HBURST_S14    (  ),
        .HPROT_S14     (  ),
        .HADDR_S15     (  ),
        .HSIZE_S15     (  ),
        .HTRANS_S15    (  ),
        .HWDATA_S15    (  ),
        .HBURST_S15    (  ),
        .HPROT_S15     (  ),
        .HADDR_S16     ( CoreAHBLite_0_AHBmslave16_HADDR ),
        .HSIZE_S16     ( CoreAHBLite_0_AHBmslave16_HSIZE ),
        .HTRANS_S16    ( CoreAHBLite_0_AHBmslave16_HTRANS ),
        .HWDATA_S16    ( CoreAHBLite_0_AHBmslave16_HWDATA ),
        .HBURST_S16    ( CoreAHBLite_0_AHBmslave16_HBURST ),
        .HPROT_S16     ( CoreAHBLite_0_AHBmslave16_HPROT ) 
        );

//--------CoreConfigP   -   Actel:DirectCore:CoreConfigP:7.1.100
CoreConfigP #( 
        .DEVICE_090         ( 0 ),
        .ENABLE_SOFT_RESETS ( 1 ),
        .FDDR_IN_USE        ( 0 ),
        .MDDR_IN_USE        ( 1 ),
        .SDIF0_IN_USE       ( 0 ),
        .SDIF0_PCIE         ( 0 ),
        .SDIF1_IN_USE       ( 0 ),
        .SDIF1_PCIE         ( 0 ),
        .SDIF2_IN_USE       ( 0 ),
        .SDIF2_PCIE         ( 0 ),
        .SDIF3_IN_USE       ( 0 ),
        .SDIF3_PCIE         ( 0 ) )
CORECONFIGP_0(
        // Inputs
        .FIC_2_APB_M_PRESET_N           ( HPMS_0_sb_HPMS_TMP_0_FIC_2_APB_M_PRESET_N ),
        .FIC_2_APB_M_PCLK               ( HPMS_0_sb_HPMS_TMP_0_FIC_2_APB_M_PCLK ),
        .SDIF_RELEASED                  ( GND_net ), // tied to 1'b0 from definition
        .INIT_DONE                      ( INIT_DONE_net_0 ),
        .FIC_2_APB_M_PSEL               ( HPMS_0_sb_HPMS_TMP_0_FIC_2_APB_MASTER_PSELx ),
        .FIC_2_APB_M_PENABLE            ( HPMS_0_sb_HPMS_TMP_0_FIC_2_APB_MASTER_PENABLE ),
        .FIC_2_APB_M_PWRITE             ( HPMS_0_sb_HPMS_TMP_0_FIC_2_APB_MASTER_PWRITE ),
        .MDDR_PREADY                    ( CORECONFIGP_0_MDDR_APBmslave_PREADY ),
        .MDDR_PSLVERR                   ( CORECONFIGP_0_MDDR_APBmslave_PSLVERR ),
        .FDDR_PREADY                    ( VCC_net ), // tied to 1'b1 from definition
        .FDDR_PSLVERR                   ( GND_net ), // tied to 1'b0 from definition
        .SDIF0_PREADY                   ( VCC_net ), // tied to 1'b1 from definition
        .SDIF0_PSLVERR                  ( GND_net ), // tied to 1'b0 from definition
        .SDIF1_PREADY                   ( VCC_net ), // tied to 1'b1 from definition
        .SDIF1_PSLVERR                  ( GND_net ), // tied to 1'b0 from definition
        .SDIF2_PREADY                   ( VCC_net ), // tied to 1'b1 from definition
        .SDIF2_PSLVERR                  ( GND_net ), // tied to 1'b0 from definition
        .SDIF3_PREADY                   ( VCC_net ), // tied to 1'b1 from definition
        .SDIF3_PSLVERR                  ( GND_net ), // tied to 1'b0 from definition
        .FIC_2_APB_M_PADDR              ( HPMS_0_sb_HPMS_TMP_0_FIC_2_APB_MASTER_PADDR_0 ),
        .FIC_2_APB_M_PWDATA             ( HPMS_0_sb_HPMS_TMP_0_FIC_2_APB_MASTER_PWDATA ),
        .MDDR_PRDATA                    ( CORECONFIGP_0_MDDR_APBmslave_PRDATA_0 ),
        .FDDR_PRDATA                    ( FDDR_PRDATA_const_net_0 ), // tied to 32'h00000000 from definition
        .SDIF0_PRDATA                   ( SDIF0_PRDATA_const_net_0 ), // tied to 32'h00000000 from definition
        .SDIF1_PRDATA                   ( SDIF1_PRDATA_const_net_0 ), // tied to 32'h00000000 from definition
        .SDIF2_PRDATA                   ( SDIF2_PRDATA_const_net_0 ), // tied to 32'h00000000 from definition
        .SDIF3_PRDATA                   ( SDIF3_PRDATA_const_net_0 ), // tied to 32'h00000000 from definition
        // Outputs
        .APB_S_PCLK                     ( CORECONFIGP_0_APB_S_PCLK ),
        .APB_S_PRESET_N                 ( CORECONFIGP_0_APB_S_PRESET_N ),
        .CONFIG1_DONE                   ( CORECONFIGP_0_CONFIG1_DONE ),
        .CONFIG2_DONE                   ( CORECONFIGP_0_CONFIG2_DONE ),
        .FIC_2_APB_M_PREADY             ( HPMS_0_sb_HPMS_TMP_0_FIC_2_APB_MASTER_PREADY ),
        .FIC_2_APB_M_PSLVERR            ( HPMS_0_sb_HPMS_TMP_0_FIC_2_APB_MASTER_PSLVERR ),
        .MDDR_PSEL                      ( CORECONFIGP_0_MDDR_APBmslave_PSELx ),
        .MDDR_PENABLE                   ( CORECONFIGP_0_MDDR_APBmslave_PENABLE ),
        .MDDR_PWRITE                    ( CORECONFIGP_0_MDDR_APBmslave_PWRITE ),
        .FDDR_PSEL                      (  ),
        .FDDR_PENABLE                   (  ),
        .FDDR_PWRITE                    (  ),
        .SDIF0_PSEL                     (  ),
        .SDIF0_PENABLE                  (  ),
        .SDIF0_PWRITE                   (  ),
        .SDIF1_PSEL                     (  ),
        .SDIF1_PENABLE                  (  ),
        .SDIF1_PWRITE                   (  ),
        .SDIF2_PSEL                     (  ),
        .SDIF2_PENABLE                  (  ),
        .SDIF2_PWRITE                   (  ),
        .SDIF3_PSEL                     (  ),
        .SDIF3_PENABLE                  (  ),
        .SDIF3_PWRITE                   (  ),
        .SOFT_EXT_RESET_OUT             ( CORECONFIGP_0_SOFT_EXT_RESET_OUT ),
        .SOFT_RESET_F2M                 ( CORECONFIGP_0_SOFT_RESET_F2M ),
        .SOFT_M3_RESET                  ( CORECONFIGP_0_SOFT_M3_RESET ),
        .SOFT_MDDR_DDR_AXI_S_CORE_RESET ( CORECONFIGP_0_SOFT_MDDR_DDR_AXI_S_CORE_RESET ),
        .SOFT_FDDR_CORE_RESET           (  ),
        .SOFT_SDIF0_PHY_RESET           (  ),
        .SOFT_SDIF0_CORE_RESET          (  ),
        .SOFT_SDIF0_0_CORE_RESET        (  ),
        .SOFT_SDIF0_1_CORE_RESET        (  ),
        .SOFT_SDIF1_PHY_RESET           (  ),
        .SOFT_SDIF1_CORE_RESET          (  ),
        .SOFT_SDIF2_PHY_RESET           (  ),
        .SOFT_SDIF2_CORE_RESET          (  ),
        .SOFT_SDIF3_PHY_RESET           (  ),
        .SOFT_SDIF3_CORE_RESET          (  ),
        .R_SDIF0_PSEL                   (  ),
        .R_SDIF0_PWRITE                 (  ),
        .R_SDIF1_PSEL                   (  ),
        .R_SDIF1_PWRITE                 (  ),
        .R_SDIF2_PSEL                   (  ),
        .R_SDIF2_PWRITE                 (  ),
        .R_SDIF3_PSEL                   (  ),
        .R_SDIF3_PWRITE                 (  ),
        .FIC_2_APB_M_PRDATA             ( HPMS_0_sb_HPMS_TMP_0_FIC_2_APB_MASTER_PRDATA ),
        .MDDR_PADDR                     ( CORECONFIGP_0_MDDR_APBmslave_PADDR ),
        .MDDR_PWDATA                    ( CORECONFIGP_0_MDDR_APBmslave_PWDATA ),
        .FDDR_PADDR                     (  ),
        .FDDR_PWDATA                    (  ),
        .SDIF0_PADDR                    (  ),
        .SDIF0_PWDATA                   (  ),
        .SDIF1_PADDR                    (  ),
        .SDIF1_PWDATA                   (  ),
        .SDIF2_PADDR                    (  ),
        .SDIF2_PWDATA                   (  ),
        .SDIF3_PADDR                    (  ),
        .SDIF3_PWDATA                   (  ),
        .R_SDIF0_PRDATA                 (  ),
        .R_SDIF1_PRDATA                 (  ),
        .R_SDIF2_PRDATA                 (  ),
        .R_SDIF3_PRDATA                 (  ) 
        );

//--------CoreResetP   -   Actel:DirectCore:CoreResetP:7.1.100
CoreResetP #( 
        .DDR_WAIT            ( 200 ),
        .DEVICE_090          ( 0 ),
        .DEVICE_VOLTAGE      ( 2 ),
        .ENABLE_SOFT_RESETS  ( 1 ),
        .EXT_RESET_CFG       ( 0 ),
        .FDDR_IN_USE         ( 0 ),
        .MDDR_IN_USE         ( 1 ),
        .SDIF0_IN_USE        ( 0 ),
        .SDIF0_PCIE          ( 0 ),
        .SDIF0_PCIE_HOTRESET ( 1 ),
        .SDIF0_PCIE_L2P2     ( 1 ),
        .SDIF1_IN_USE        ( 0 ),
        .SDIF1_PCIE          ( 0 ),
        .SDIF1_PCIE_HOTRESET ( 1 ),
        .SDIF1_PCIE_L2P2     ( 1 ),
        .SDIF2_IN_USE        ( 0 ),
        .SDIF2_PCIE          ( 0 ),
        .SDIF2_PCIE_HOTRESET ( 1 ),
        .SDIF2_PCIE_L2P2     ( 1 ),
        .SDIF3_IN_USE        ( 0 ),
        .SDIF3_PCIE          ( 0 ),
        .SDIF3_PCIE_HOTRESET ( 1 ),
        .SDIF3_PCIE_L2P2     ( 1 ) )
CORERESETP_0(
        // Inputs
        .RESET_N_M2F                    ( HPMS_0_sb_HPMS_TMP_0_MSS_RESET_N_M2F ),
        .FIC_2_APB_M_PRESET_N           ( HPMS_0_sb_HPMS_TMP_0_FIC_2_APB_M_PRESET_N ),
        .POWER_ON_RESET_N               ( POWER_ON_RESET_N_net_0 ),
        .FAB_RESET_N                    ( FAB_RESET_N ),
        .RCOSC_25_50MHZ                 ( FABOSC_0_RCOSC_25_50MHZ_O2F ),
        .CLK_BASE                       ( FIC_0_CLK_net_0 ),
        .CLK_LTSSM                      ( GND_net ), // tied to 1'b0 from definition
        .FPLL_LOCK                      ( VCC_net ), // tied to 1'b1 from definition
        .SDIF0_SPLL_LOCK                ( VCC_net ), // tied to 1'b1 from definition
        .SDIF1_SPLL_LOCK                ( VCC_net ), // tied to 1'b1 from definition
        .SDIF2_SPLL_LOCK                ( VCC_net ), // tied to 1'b1 from definition
        .SDIF3_SPLL_LOCK                ( VCC_net ), // tied to 1'b1 from definition
        .CONFIG1_DONE                   ( CORECONFIGP_0_CONFIG1_DONE ),
        .CONFIG2_DONE                   ( CORECONFIGP_0_CONFIG2_DONE ),
        .SDIF0_PERST_N                  ( VCC_net ), // tied to 1'b1 from definition
        .SDIF1_PERST_N                  ( VCC_net ), // tied to 1'b1 from definition
        .SDIF2_PERST_N                  ( VCC_net ), // tied to 1'b1 from definition
        .SDIF3_PERST_N                  ( VCC_net ), // tied to 1'b1 from definition
        .SDIF0_PSEL                     ( GND_net ), // tied to 1'b0 from definition
        .SDIF0_PWRITE                   ( VCC_net ), // tied to 1'b1 from definition
        .SDIF1_PSEL                     ( GND_net ), // tied to 1'b0 from definition
        .SDIF1_PWRITE                   ( VCC_net ), // tied to 1'b1 from definition
        .SDIF2_PSEL                     ( GND_net ), // tied to 1'b0 from definition
        .SDIF2_PWRITE                   ( VCC_net ), // tied to 1'b1 from definition
        .SDIF3_PSEL                     ( GND_net ), // tied to 1'b0 from definition
        .SDIF3_PWRITE                   ( VCC_net ), // tied to 1'b1 from definition
        .SOFT_EXT_RESET_OUT             ( CORECONFIGP_0_SOFT_EXT_RESET_OUT ),
        .SOFT_RESET_F2M                 ( CORECONFIGP_0_SOFT_RESET_F2M ),
        .SOFT_M3_RESET                  ( CORECONFIGP_0_SOFT_M3_RESET ),
        .SOFT_MDDR_DDR_AXI_S_CORE_RESET ( CORECONFIGP_0_SOFT_MDDR_DDR_AXI_S_CORE_RESET ),
        .SOFT_FDDR_CORE_RESET           ( GND_net ), // tied to 1'b0 from definition
        .SOFT_SDIF0_PHY_RESET           ( GND_net ), // tied to 1'b0 from definition
        .SOFT_SDIF0_CORE_RESET          ( GND_net ), // tied to 1'b0 from definition
        .SOFT_SDIF0_0_CORE_RESET        ( GND_net ), // tied to 1'b0 from definition
        .SOFT_SDIF0_1_CORE_RESET        ( GND_net ), // tied to 1'b0 from definition
        .SOFT_SDIF1_PHY_RESET           ( GND_net ), // tied to 1'b0 from definition
        .SOFT_SDIF1_CORE_RESET          ( GND_net ), // tied to 1'b0 from definition
        .SOFT_SDIF2_PHY_RESET           ( GND_net ), // tied to 1'b0 from definition
        .SOFT_SDIF2_CORE_RESET          ( GND_net ), // tied to 1'b0 from definition
        .SOFT_SDIF3_PHY_RESET           ( GND_net ), // tied to 1'b0 from definition
        .SOFT_SDIF3_CORE_RESET          ( GND_net ), // tied to 1'b0 from definition
        .SDIF0_PRDATA                   ( SDIF0_PRDATA_const_net_1 ), // tied to 32'h00000000 from definition
        .SDIF1_PRDATA                   ( SDIF1_PRDATA_const_net_1 ), // tied to 32'h00000000 from definition
        .SDIF2_PRDATA                   ( SDIF2_PRDATA_const_net_1 ), // tied to 32'h00000000 from definition
        .SDIF3_PRDATA                   ( SDIF3_PRDATA_const_net_1 ), // tied to 32'h00000000 from definition
        // Outputs
        .MSS_HPMS_READY                 ( HPMS_READY_net_0 ),
        .DDR_READY                      ( DDR_READY_net_0 ),
        .SDIF_READY                     (  ),
        .RESET_N_F2M                    ( CORERESETP_0_RESET_N_F2M ),
        .M3_RESET_N                     (  ),
        .EXT_RESET_OUT                  (  ),
        .MDDR_DDR_AXI_S_CORE_RESET_N    ( CORERESETP_0_MDDR_DDR_AXI_S_CORE_RESET_N ),
        .FDDR_CORE_RESET_N              (  ),
        .SDIF0_CORE_RESET_N             (  ),
        .SDIF0_0_CORE_RESET_N           (  ),
        .SDIF0_1_CORE_RESET_N           (  ),
        .SDIF0_PHY_RESET_N              (  ),
        .SDIF1_CORE_RESET_N             (  ),
        .SDIF1_PHY_RESET_N              (  ),
        .SDIF2_CORE_RESET_N             (  ),
        .SDIF2_PHY_RESET_N              (  ),
        .SDIF3_CORE_RESET_N             (  ),
        .SDIF3_PHY_RESET_N              (  ),
        .SDIF_RELEASED                  (  ),
        .INIT_DONE                      ( INIT_DONE_net_0 ) 
        );

//--------HPMS_0_sb_FABOSC_0_OSC   -   Actel:SgCore:OSC:2.0.101
HPMS_0_sb_FABOSC_0_OSC FABOSC_0(
        // Inputs
        .XTL                ( GND_net ), // tied to 1'b0 from definition
        // Outputs
        .RCOSC_25_50MHZ_CCC (  ),
        .RCOSC_25_50MHZ_O2F ( FABOSC_0_RCOSC_25_50MHZ_O2F ),
        .RCOSC_1MHZ_CCC     (  ),
        .RCOSC_1MHZ_O2F     (  ),
        .XTLOSC_CCC         (  ),
        .XTLOSC_O2F         (  ) 
        );

//--------HPMS_0_sb_HPMS
HPMS_0_sb_HPMS HPMS_0_sb_HPMS_0(
        // Inputs
        .MCCC_CLK_BASE             ( FIC_0_CLK_net_0 ),
        .MCCC_CLK_BASE_PLL_LOCK    ( HPMS_DDR_FIC_SUBSYSTEM_LOCK_net_0 ),
        .MSS_RESET_N_F2M           ( CORERESETP_0_RESET_N_F2M ),
        .M3_RESET_N                ( GND_net ),
        .FIC_0_AHB_S_HREADY        ( CoreAHBLite_0_AHBmslave16_HREADY ),
        .FIC_0_AHB_S_HWRITE        ( CoreAHBLite_0_AHBmslave16_HWRITE ),
        .FIC_0_AHB_S_HMASTLOCK     ( CoreAHBLite_0_AHBmslave16_HMASTLOCK ),
        .FIC_0_AHB_S_HSEL          ( CoreAHBLite_0_AHBmslave16_HSELx ),
        .MDDR_APB_S_PRESET_N       ( CORECONFIGP_0_APB_S_PRESET_N ),
        .MDDR_APB_S_PCLK           ( CORECONFIGP_0_APB_S_PCLK ),
        .FIC_2_APB_M_PREADY        ( HPMS_0_sb_HPMS_TMP_0_FIC_2_APB_MASTER_PREADY ),
        .FIC_2_APB_M_PSLVERR       ( HPMS_0_sb_HPMS_TMP_0_FIC_2_APB_MASTER_PSLVERR ),
        .MDDR_APB_S_PWRITE         ( CORECONFIGP_0_MDDR_APBmslave_PWRITE ),
        .MDDR_APB_S_PENABLE        ( CORECONFIGP_0_MDDR_APBmslave_PENABLE ),
        .MDDR_APB_S_PSEL           ( CORECONFIGP_0_MDDR_APBmslave_PSELx ),
        .FIC_0_AHB_S_HADDR         ( CoreAHBLite_0_AHBmslave16_HADDR ),
        .FIC_0_AHB_S_HWDATA        ( CoreAHBLite_0_AHBmslave16_HWDATA ),
        .FIC_0_AHB_S_HSIZE         ( CoreAHBLite_0_AHBmslave16_HSIZE_0 ),
        .FIC_0_AHB_S_HTRANS        ( CoreAHBLite_0_AHBmslave16_HTRANS ),
        .FIC_2_APB_M_PRDATA        ( HPMS_0_sb_HPMS_TMP_0_FIC_2_APB_MASTER_PRDATA ),
        .MDDR_APB_S_PWDATA         ( CORECONFIGP_0_MDDR_APBmslave_PWDATA_0 ),
        .MDDR_APB_S_PADDR          ( CORECONFIGP_0_MDDR_APBmslave_PADDR_0 ),
        .MSS_INT_F2M               ( MSS_INT_F2M_const_net_0 ),
        .MDDR_DQS_TMATCH_0_IN      ( MDDR_DQS_TMATCH_0_IN ),
        .MDDR_DDR_CORE_RESET_N     ( CORERESETP_0_MDDR_DDR_AXI_S_CORE_RESET_N ),
        .MDDR_DDR_AHB0_S_HSEL      ( MDDR_DDR_AHB0_S_HSEL ),
        .MDDR_DDR_AHB0_S_HADDR     ( MDDR_DDR_AHB0_S_HADDR ),
        .MDDR_DDR_AHB0_S_HBURST    ( MDDR_DDR_AHB0_S_HBURST ),
        .MDDR_DDR_AHB0_S_HSIZE     ( MDDR_DDR_AHB0_S_HSIZE ),
        .MDDR_DDR_AHB0_S_HTRANS    ( MDDR_DDR_AHB0_S_HTRANS ),
        .MDDR_DDR_AHB0_S_HMASTLOCK ( MDDR_DDR_AHB0_S_HMASTLOCK ),
        .MDDR_DDR_AHB0_S_HWRITE    ( MDDR_DDR_AHB0_S_HWRITE ),
        .MDDR_DDR_AHB0_S_HREADY    ( MDDR_DDR_AHB0_S_HREADY ),
        .MDDR_DDR_AHB0_S_HWDATA    ( MDDR_DDR_AHB0_S_HWDATA ),
        // Outputs
        .MSS_RESET_N_M2F           ( HPMS_0_sb_HPMS_TMP_0_MSS_RESET_N_M2F ),
        .FIC_0_AHB_S_HRESP         ( CoreAHBLite_0_AHBmslave16_HRESP ),
        .FIC_0_AHB_S_HREADYOUT     ( CoreAHBLite_0_AHBmslave16_HREADYOUT ),
        .FIC_2_APB_M_PRESET_N      ( HPMS_0_sb_HPMS_TMP_0_FIC_2_APB_M_PRESET_N ),
        .FIC_2_APB_M_PCLK          ( HPMS_0_sb_HPMS_TMP_0_FIC_2_APB_M_PCLK ),
        .FIC_2_APB_M_PWRITE        ( HPMS_0_sb_HPMS_TMP_0_FIC_2_APB_MASTER_PWRITE ),
        .FIC_2_APB_M_PENABLE       ( HPMS_0_sb_HPMS_TMP_0_FIC_2_APB_MASTER_PENABLE ),
        .FIC_2_APB_M_PSEL          ( HPMS_0_sb_HPMS_TMP_0_FIC_2_APB_MASTER_PSELx ),
        .MDDR_APB_S_PREADY         ( CORECONFIGP_0_MDDR_APBmslave_PREADY ),
        .MDDR_APB_S_PSLVERR        ( CORECONFIGP_0_MDDR_APBmslave_PSLVERR ),
        .M3_NMI                    (  ),
        .COMM_BLK_INT              ( COMM_BLK_INT_net_0 ),
        .FIC_0_AHB_S_HRDATA        ( CoreAHBLite_0_AHBmslave16_HRDATA ),
        .FIC_2_APB_M_PADDR         ( HPMS_0_sb_HPMS_TMP_0_FIC_2_APB_MASTER_PADDR ),
        .FIC_2_APB_M_PWDATA        ( HPMS_0_sb_HPMS_TMP_0_FIC_2_APB_MASTER_PWDATA ),
        .MDDR_APB_S_PRDATA         ( CORECONFIGP_0_MDDR_APBmslave_PRDATA ),
        .MSS_INT_M2F               ( HPMS_INT_M2F_net_0 ),
        .MDDR_DQS_TMATCH_0_OUT     ( MDDR_DQS_TMATCH_0_OUT_0 ),
        .MDDR_CAS_N                ( MDDR_CAS_N_0 ),
        .MDDR_CLK                  ( MDDR_CLK_0 ),
        .MDDR_CLK_N                ( MDDR_CLK_N_0 ),
        .MDDR_CKE                  ( MDDR_CKE_0 ),
        .MDDR_CS_N                 ( MDDR_CS_N_0 ),
        .MDDR_ODT                  ( MDDR_ODT_0 ),
        .MDDR_RAS_N                ( MDDR_RAS_N_0 ),
        .MDDR_RESET_N              ( MDDR_RESET_N_0 ),
        .MDDR_WE_N                 ( MDDR_WE_N_0 ),
        .MDDR_ADDR                 ( MDDR_ADDR_0 ),
        .MDDR_BA                   ( MDDR_BA_0 ),
        .MDDR_DDR_AHB0_S_HREADYOUT ( MDDR_DDR_AHB0_SLAVE_HREADYOUT ),
        .MDDR_DDR_AHB0_S_HRESP     ( MDDR_DDR_AHB0_SLAVE_HRESP ),
        .MDDR_DDR_AHB0_S_HRDATA    ( MDDR_DDR_AHB0_SLAVE_HRDATA ),
        // Inouts
        .MDDR_DM_RDQS              ( MDDR_DM_RDQS ),
        .MDDR_DQ                   ( MDDR_DQ ),
        .MDDR_DQS                  ( MDDR_DQS ),
        .MDDR_DQS_N                ( MDDR_DQS_N ) 
        );

//--------SYSRESET
SYSRESET SYSRESET_POR(
        // Inputs
        .DEVRST_N         ( DEVRST_N ),
        // Outputs
        .POWER_ON_RESET_N ( POWER_ON_RESET_N_net_0 ) 
        );


endmodule
