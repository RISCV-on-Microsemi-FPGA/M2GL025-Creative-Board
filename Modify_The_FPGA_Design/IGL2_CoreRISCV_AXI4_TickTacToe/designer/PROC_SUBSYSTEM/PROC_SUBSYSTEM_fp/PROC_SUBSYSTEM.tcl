open_project -project {C:\Users\ciaran.lappin\Downloads\CreativeRes\M2GL025-Creative-Board-master\Modify_The_FPGA_Design\IGL2_CoreRISCV_AXI4_TickTacToe\designer\PROC_SUBSYSTEM\PROC_SUBSYSTEM_fp\PROC_SUBSYSTEM.pro}\
         -connect_programmers {FALSE}
if { [catch {load_programming_data \
    -name {M2GL025} \
    -fpga {C:\Users\ciaran.lappin\Downloads\CreativeRes\M2GL025-Creative-Board-master\Modify_The_FPGA_Design\IGL2_CoreRISCV_AXI4_TickTacToe\designer\PROC_SUBSYSTEM\PROC_SUBSYSTEM.map} \
    -header {C:\Users\ciaran.lappin\Downloads\CreativeRes\M2GL025-Creative-Board-master\Modify_The_FPGA_Design\IGL2_CoreRISCV_AXI4_TickTacToe\designer\PROC_SUBSYSTEM\PROC_SUBSYSTEM.hdr} \
    -envm {C:\Users\ciaran.lappin\Downloads\CreativeRes\M2GL025-Creative-Board-master\Modify_The_FPGA_Design\IGL2_CoreRISCV_AXI4_TickTacToe\designer\PROC_SUBSYSTEM\PROC_SUBSYSTEM.efc}  \
    -spm {C:\Users\ciaran.lappin\Downloads\CreativeRes\M2GL025-Creative-Board-master\Modify_The_FPGA_Design\IGL2_CoreRISCV_AXI4_TickTacToe\designer\PROC_SUBSYSTEM\PROC_SUBSYSTEM.spm} \
    -dca {C:\Users\ciaran.lappin\Downloads\CreativeRes\M2GL025-Creative-Board-master\Modify_The_FPGA_Design\IGL2_CoreRISCV_AXI4_TickTacToe\designer\PROC_SUBSYSTEM\PROC_SUBSYSTEM.dca} } return_val] } {
save_project
close_project
exit }
export_single_stapl \
    -name {M2GL025} \
    -file {C:\Users\ciaran.lappin\Downloads\CreativeRes\M2GL025-Creative-Board-master\Modify_The_FPGA_Design\IGL2_CoreRISCV_AXI4_TickTacToe\designer\PROC_SUBSYSTEM\export\PROC_SUBSYSTEM_TickTackToe_M2GL025.stp} \
    -secured
set_programming_file -name {M2GL025} -no_file
save_project
close_project
