new_project \
         -name {HPMS_0} \
         -location {C:\Users\ciaran.lappin\Documents\Boards\M2GL025_Future\Projects\MASTER\test_1_RISCV_2017_0209_0926\IGLOO2_CoreRISCV_AXI4_TickTacToe\designer\HPMS_0\HPMS_0_fp} \
         -mode {chain} \
         -connect_programmers {FALSE}
add_actel_device \
         -device {M2GL025} \
         -name {M2GL025}
enable_device \
         -name {M2GL025} \
         -enable {TRUE}
save_project
close_project
