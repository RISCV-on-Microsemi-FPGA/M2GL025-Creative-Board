# Written by Synplify Pro version map201609actrcp1, Build 005R. Synopsys Run ID: sid1504644023 
# Top Level Design Parameters 

# Clocks 
create_clock -period 20.000 -waveform {0.000 10.000} -name {CLK0_PAD} [get_ports {CLK0_PAD}] 
create_clock -period 166.670 -waveform {0.000 83.330} -name {TCK} [get_ports {TCK}] 
create_clock -period 20.000 -waveform {0.000 10.000} -name {HPMS_0_sb_0/FABOSC_0/I_RCOSC_25_50MHZ/CLKOUT} [get_pins {HPMS_0_sb_0/FABOSC_0/I_RCOSC_25_50MHZ:CLKOUT}] 
create_clock -period 60.606 -waveform {0.000 30.303} -name {HPMS_0_sb_0/HPMS_0_sb_HPMS_0/CLK_CONFIG_APB} [get_pins {HPMS_0_sb_0/HPMS_0_sb_HPMS_0/MSS_ADLIB_INST:CLK_CONFIG_APB}] 
create_clock -period 10.000 -waveform {0.000 5.000} -name {uj_jtag_85|un1_duttck_inferred_clock} [get_pins {COREJTAGDEBUG_0/genblk1.UJ_JTAG_0/un1_duttck:Y}] 
create_clock -period 10.000 -waveform {0.000 5.000} -name {COREJTAGDEBUG_85_1s|iUDRCK_inferred_clock} [get_pins {COREJTAGDEBUG_0/genblk1.UJTAG_0:UDRCK}] 

# Virtual Clocks 

# Generated Clocks 
create_generated_clock -name {HPMS_0_sb_0/CCC_0/GL0} -multiply_by {66} -divide_by {50} -source [get_pins {HPMS_0_sb_0/CCC_0/CLK0_PAD_INST:Y}]  [get_pins {HPMS_0_sb_0/CCC_0/CCC_INST:GL0}] 

# Paths Between Clocks 

# Multicycle Constraints 

# Point-to-point Delay Constraints 

# False Path Constraints 
set_false_path -through [get_pins {HPMS_0_sb_0/CORERESETP_0/INIT_DONE_int_RNIKRPF:Y}] 
set_false_path -through [get_pins {HPMS_0_sb_0/CORECONFIGP_0/soft_reset_reg[1]:Q HPMS_0_sb_0/CORECONFIGP_0/control_reg_1[0]:Q HPMS_0_sb_0/CORECONFIGP_0/control_reg_1[1]:Q HPMS_0_sb_0/CORECONFIGP_0/soft_reset_reg[3]:Q}] 
set_false_path -through [get_pins {HPMS_0_sb_0/CORERESETP_0/release_sdif0_core:Q HPMS_0_sb_0/CORERESETP_0/release_sdif0_core:Q HPMS_0_sb_0/CORERESETP_0/count_ddr_enable:Q HPMS_0_sb_0/CORERESETP_0/ddr_settled:Q HPMS_0_sb_0/CORERESETP_0/release_sdif0_core:Q HPMS_0_sb_0/CORERESETP_0/release_sdif0_core:Q}] 

# Output Load Constraints 

# Driving Cell Constraints 

# Input Delay Constraints 

# Output Delay Constraints 

# Wire Loads 

# Other Constraints 

# syn_hier Attributes 

# set_case Attributes 

# Clock Delay Constraints 
set_clock_groups -asynchronous -group [get_clocks {uj_jtag_85|un1_duttck_inferred_clock}]
set_clock_groups -asynchronous -group [get_clocks {COREJTAGDEBUG_85_1s|iUDRCK_inferred_clock}]

# syn_mode Attributes 

# Cells 

# Port DRC Rules 

# Input Transition Constraints 

# Unused constraints (intentionally commented out) 
# set_false_path -from [get_cells { HPMS_0_sb_0.CORERESETP_0.MSS_HPMS_READY_int }] -to [get_cells { HPMS_0_sb_0.CORERESETP_0.sm0_areset_n_rcosc_q1 }]
# set_false_path -from [get_cells { HPMS_0_sb_0.CORERESETP_0.MSS_HPMS_READY_int HPMS_0_sb_0.CORERESETP_0.SDIF*_PERST_N_re }] -to [get_cells { HPMS_0_sb_0.CORERESETP_0.sdif*_areset_n_rcosc* }]
# set_false_path -from [get_clocks { TCK }] -to [get_clocks { HPMS_0_sb_0.CCC_0.GL0 }]
# set_false_path -from [get_clocks { HPMS_0_sb_0.CCC_0.GL0 }] -to [get_clocks { TCK }]
# set_max_delay 0 -through [get_nets { HPMS_0_sb_0.CORECONFIGP_0.FIC_2_APB_M_PSEL HPMS_0_sb_0.CORECONFIGP_0.FIC_2_APB_M_PENABLE }] -to [get_cells { HPMS_0_sb_0.CORECONFIGP_0.FIC_2_APB_M_PREADY* HPMS_0_sb_0.CORECONFIGP_0.state[0] }]
# set_min_delay -24 -through [get_nets { HPMS_0_sb_0.CORECONFIGP_0.FIC_2_APB_M_PWRITE HPMS_0_sb_0.CORECONFIGP_0.FIC_2_APB_M_PADDR[*] HPMS_0_sb_0.CORECONFIGP_0.FIC_2_APB_M_PWDATA[*] HPMS_0_sb_0.CORECONFIGP_0.FIC_2_APB_M_PSEL HPMS_0_sb_0.CORECONFIGP_0.FIC_2_APB_M_PENABLE }]

# Non-forward-annotatable constraints (intentionally commented out) 

# Block Path constraints 

