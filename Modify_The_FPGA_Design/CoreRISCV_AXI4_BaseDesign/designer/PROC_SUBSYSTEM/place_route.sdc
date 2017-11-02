# Microsemi Corp.
# Date: 2017-Nov-02 12:18:16
# This file was generated based on the following SDC source files:
#   C:/Users/ciaran.lappin/Downloads/CreativeRes/M2GL025-Creative-Board-master/Modify_The_FPGA_Design/CoreRISCV_AXI4_BaseDesign/constraint/PROC_SUBSYSTEM_derived_constraints.sdc
#   C:/Users/ciaran.lappin/Downloads/CreativeRes/M2GL025-Creative-Board-master/Modify_The_FPGA_Design/CoreRISCV_AXI4_BaseDesign/constraint/user.sdc
#

create_clock -name {CLK0_PAD} -period 20 [ get_ports { CLK0_PAD } ]
create_clock -name {HPMS_0_sb_0/FABOSC_0/I_RCOSC_25_50MHZ/CLKOUT} -period 20 [ get_pins { HPMS_0_sb_0/FABOSC_0/I_RCOSC_25_50MHZ/CLKOUT } ]
create_clock -name {HPMS_0_sb_0/HPMS_0_sb_HPMS_0/CLK_CONFIG_APB} -period 60.6061 [ get_pins { HPMS_0_sb_0/HPMS_0_sb_HPMS_0/MSS_ADLIB_INST/CLK_CONFIG_APB } ]
create_clock -name {TCK} -period 166.67 -waveform {0 83.33 } [ get_ports { TCK } ]
create_generated_clock -name {HPMS_0_sb_0/CCC_0/GL0} -multiply_by 66 -divide_by 50 -source [ get_pins { HPMS_0_sb_0/CCC_0/CCC_INST/CLK0_PAD } ] -phase 0 [ get_pins { HPMS_0_sb_0/CCC_0/CCC_INST/GL0 } ]
set_false_path -through [ get_nets { HPMS_0_sb_0/CORECONFIGP_0/INIT_DONE HPMS_0_sb_0/CORECONFIGP_0/SDIF_RELEASED } ]
set_false_path -through [ get_nets { HPMS_0_sb_0/CORERESETP_0/ddr_settled HPMS_0_sb_0/CORERESETP_0/count_ddr_enable HPMS_0_sb_0/CORERESETP_0/release_sdif*_core HPMS_0_sb_0/CORERESETP_0/count_sdif*_enable } ]
set_false_path -from [ get_cells { HPMS_0_sb_0/CORERESETP_0/MSS_HPMS_READY_int } ] -to [ get_cells { HPMS_0_sb_0/CORERESETP_0/sm0_areset_n_rcosc_q1 } ]
set_false_path -from [ get_cells { HPMS_0_sb_0/CORERESETP_0/MSS_HPMS_READY_int HPMS_0_sb_0/CORERESETP_0/SDIF*_PERST_N_re } ] -to [ get_cells { HPMS_0_sb_0/CORERESETP_0/sdif*_areset_n_rcosc* } ]
set_false_path -through [ get_nets { HPMS_0_sb_0/CORERESETP_0/CONFIG1_DONE HPMS_0_sb_0/CORERESETP_0/CONFIG2_DONE HPMS_0_sb_0/CORERESETP_0/SDIF*_PERST_N HPMS_0_sb_0/CORERESETP_0/SDIF*_PSEL HPMS_0_sb_0/CORERESETP_0/SDIF*_PWRITE HPMS_0_sb_0/CORERESETP_0/SDIF*_PRDATA[*] HPMS_0_sb_0/CORERESETP_0/SOFT_EXT_RESET_OUT HPMS_0_sb_0/CORERESETP_0/SOFT_RESET_F2M HPMS_0_sb_0/CORERESETP_0/SOFT_M3_RESET HPMS_0_sb_0/CORERESETP_0/SOFT_MDDR_DDR_AXI_S_CORE_RESET HPMS_0_sb_0/CORERESETP_0/SOFT_FDDR_CORE_RESET HPMS_0_sb_0/CORERESETP_0/SOFT_SDIF*_PHY_RESET HPMS_0_sb_0/CORERESETP_0/SOFT_SDIF*_CORE_RESET HPMS_0_sb_0/CORERESETP_0/SOFT_SDIF0_0_CORE_RESET HPMS_0_sb_0/CORERESETP_0/SOFT_SDIF0_1_CORE_RESET } ]
set_false_path -from [ get_clocks { TCK } ] -to [ get_clocks { HPMS_0_sb_0/CCC_0/GL0 } ]
set_false_path -from [ get_clocks { HPMS_0_sb_0/CCC_0/GL0 } ] -to [ get_clocks { TCK } ]
set_max_delay 0 -through [ get_nets { HPMS_0_sb_0/CORECONFIGP_0/FIC_2_APB_M_PSEL HPMS_0_sb_0/CORECONFIGP_0/FIC_2_APB_M_PENABLE } ] -to [ get_cells { HPMS_0_sb_0/CORECONFIGP_0/FIC_2_APB_M_PREADY* HPMS_0_sb_0/CORECONFIGP_0/state[0] } ]
set_min_delay -24 -through [ get_nets { HPMS_0_sb_0/CORECONFIGP_0/FIC_2_APB_M_PWRITE HPMS_0_sb_0/CORECONFIGP_0/FIC_2_APB_M_PADDR[*] HPMS_0_sb_0/CORECONFIGP_0/FIC_2_APB_M_PWDATA[*] HPMS_0_sb_0/CORECONFIGP_0/FIC_2_APB_M_PSEL HPMS_0_sb_0/CORECONFIGP_0/FIC_2_APB_M_PENABLE } ]
