open_project -project {D:\Work\Libero\IGL2_RISCV_Systick_Blinky\designer\PROC_SUBSYSTEM\PROC_SUBSYSTEM_fp\PROC_SUBSYSTEM.pro}
set_programming_file -name {M2GL025} -file {D:\Work\Libero\IGL2_RISCV_Systick_Blinky\designer\PROC_SUBSYSTEM\PROC_SUBSYSTEM.ipd}
enable_device -name {M2GL025} -enable 1
set_programming_action -action {PROGRAM} -name {M2GL025} 
run_selected_actions
set_programming_file -name {M2GL025} -no_file
save_project
close_project
