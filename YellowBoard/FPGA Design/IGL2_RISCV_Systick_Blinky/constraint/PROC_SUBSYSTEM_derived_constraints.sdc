# Microsemi Corp.
# Date: 2017-Sep-05 16:39:47
# This file was generated based on the following SDC source files:
#   D:/Work/Libero/IGL2_RISCV_Systick_Blinky/component/work/HPMS_0_sb/CCC_0/HPMS_0_sb_CCC_0_FCCC.sdc
#   C:/Microsemi/Libero_SoC_v11.8/Designer/data/aPA4M/cores/constraints/PA4M2500/coreconfigp.sdc
#   C:/Microsemi/Libero_SoC_v11.8/Designer/data/aPA4M/cores/constraints/coreresetp.sdc
#   D:/Work/Libero/IGL2_RISCV_Systick_Blinky/component/work/HPMS_0_sb/FABOSC_0/HPMS_0_sb_FABOSC_0_OSC.sdc
#   D:/Work/Libero/IGL2_RISCV_Systick_Blinky/component/work/HPMS_0_sb_HPMS/HPMS_0_sb_HPMS.sdc
#

create_clock -name {CLK0_PAD} -period 20 [ get_ports { CLK0_PAD } ]
create_clock -name {HPMS_0_sb_0/FABOSC_0/I_RCOSC_25_50MHZ/CLKOUT} -period 20 [ get_pins { HPMS_0_sb_0/FABOSC_0/I_RCOSC_25_50MHZ/CLKOUT } ]
create_clock -name {HPMS_0_sb_0/HPMS_0_sb_HPMS_0/CLK_CONFIG_APB} -period 60.6061 [ get_pins { HPMS_0_sb_0/HPMS_0_sb_HPMS_0/MSS_ADLIB_INST/CLK_CONFIG_APB } ]
create_generated_clock -name {HPMS_0_sb_0/CCC_0/GL0} -multiply_by 66 -divide_by 50 -source [ get_pins { HPMS_0_sb_0/CCC_0/CCC_INST/CLK0_PAD } ] -phase 0 [ get_pins { HPMS_0_sb_0/CCC_0/CCC_INST/GL0 } ]
set_false_path -ignore_errors -through [ get_nets { HPMS_0_sb_0/CORECONFIGP_0/INIT_DONE HPMS_0_sb_0/CORECONFIGP_0/SDIF_RELEASED } ]
set_false_path -ignore_errors -through [ get_nets { HPMS_0_sb_0/CORERESETP_0/ddr_settled HPMS_0_sb_0/CORERESETP_0/count_ddr_enable HPMS_0_sb_0/CORERESETP_0/release_sdif*_core HPMS_0_sb_0/CORERESETP_0/count_sdif*_enable } ]
set_false_path -ignore_errors -from [ get_cells { HPMS_0_sb_0/CORERESETP_0/MSS_HPMS_READY_int } ] -to [ get_cells { HPMS_0_sb_0/CORERESETP_0/sm0_areset_n_rcosc_q1 } ]
set_false_path -ignore_errors -from [ get_cells { HPMS_0_sb_0/CORERESETP_0/MSS_HPMS_READY_int HPMS_0_sb_0/CORERESETP_0/SDIF*_PERST_N_re } ] -to [ get_cells { HPMS_0_sb_0/CORERESETP_0/sdif*_areset_n_rcosc* } ]
set_false_path -ignore_errors -through [ get_nets { HPMS_0_sb_0/CORERESETP_0/CONFIG1_DONE HPMS_0_sb_0/CORERESETP_0/CONFIG2_DONE HPMS_0_sb_0/CORERESETP_0/SDIF*_PERST_N HPMS_0_sb_0/CORERESETP_0/SDIF*_PSEL HPMS_0_sb_0/CORERESETP_0/SDIF*_PWRITE HPMS_0_sb_0/CORERESETP_0/SDIF*_PRDATA[*] HPMS_0_sb_0/CORERESETP_0/SOFT_EXT_RESET_OUT HPMS_0_sb_0/CORERESETP_0/SOFT_RESET_F2M HPMS_0_sb_0/CORERESETP_0/SOFT_M3_RESET HPMS_0_sb_0/CORERESETP_0/SOFT_MDDR_DDR_AXI_S_CORE_RESET HPMS_0_sb_0/CORERESETP_0/SOFT_FDDR_CORE_RESET HPMS_0_sb_0/CORERESETP_0/SOFT_SDIF*_PHY_RESET HPMS_0_sb_0/CORERESETP_0/SOFT_SDIF*_CORE_RESET HPMS_0_sb_0/CORERESETP_0/SOFT_SDIF0_0_CORE_RESET HPMS_0_sb_0/CORERESETP_0/SOFT_SDIF0_1_CORE_RESET } ]
set_max_delay 0 -through [ get_nets { HPMS_0_sb_0/CORECONFIGP_0/FIC_2_APB_M_PSEL HPMS_0_sb_0/CORECONFIGP_0/FIC_2_APB_M_PENABLE } ] -to [ get_cells { HPMS_0_sb_0/CORECONFIGP_0/FIC_2_APB_M_PREADY* HPMS_0_sb_0/CORECONFIGP_0/state[0] } ]
set_min_delay -24 -through [ get_nets { HPMS_0_sb_0/CORECONFIGP_0/FIC_2_APB_M_PWRITE HPMS_0_sb_0/CORECONFIGP_0/FIC_2_APB_M_PADDR[*] HPMS_0_sb_0/CORECONFIGP_0/FIC_2_APB_M_PWDATA[*] HPMS_0_sb_0/CORECONFIGP_0/FIC_2_APB_M_PSEL HPMS_0_sb_0/CORECONFIGP_0/FIC_2_APB_M_PENABLE } ]
