new_project \
         -name {PROC_SUBSYSTEM} \
         -location {D:\Work\Libero\IGL2 Ref Design\CoreRISCV_AXI4_BaseDesign\designer\PROC_SUBSYSTEM\PROC_SUBSYSTEM_fp} \
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
