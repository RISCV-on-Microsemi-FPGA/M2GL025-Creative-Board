open_project -project {C:\Users\ciaran.lappin\Documents\Boards\M2GL025_Future\Projects\MASTER\test_1_RISCV_2017_0209_0926\IGLOO2_CoreRISCV_AXI4_TickTacToe\designer\HPMS_0\HPMS_0_fp\HPMS_0.pro}
set_programming_file -name {M2GL025} -file {C:\Users\ciaran.lappin\Documents\Boards\M2GL025_Future\Projects\MASTER\test_1_RISCV_2017_0209_0926\IGLOO2_CoreRISCV_AXI4_TickTacToe\designer\HPMS_0\HPMS_0.ipd}
enable_device -name {M2GL025} -enable 1
set_programming_action -action {PROGRAM} -name {M2GL025} 
run_selected_actions
set_programming_file -name {M2GL025} -no_file
save_project
close_project
