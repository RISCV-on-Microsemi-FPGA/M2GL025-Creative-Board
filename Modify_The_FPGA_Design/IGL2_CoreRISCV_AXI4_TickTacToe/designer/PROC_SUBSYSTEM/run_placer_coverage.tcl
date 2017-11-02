set_family {IGLOO2}
read_adl {C:\Users\ciaran.lappin\Downloads\CreativeRes\M2GL025-Creative-Board-master\Modify_The_FPGA_Design\IGL2_CoreRISCV_AXI4_TickTacToe\designer\PROC_SUBSYSTEM\PROC_SUBSYSTEM.adl}
map_netlist
read_sdc {C:\Users\ciaran.lappin\Downloads\CreativeRes\M2GL025-Creative-Board-master\Modify_The_FPGA_Design\IGL2_CoreRISCV_AXI4_TickTacToe\constraint\PROC_SUBSYSTEM_derived_constraints.sdc}
read_sdc {C:\Users\ciaran.lappin\Downloads\CreativeRes\M2GL025-Creative-Board-master\Modify_The_FPGA_Design\IGL2_CoreRISCV_AXI4_TickTacToe\constraint\user.sdc}
check_constraints {C:\Users\ciaran.lappin\Downloads\CreativeRes\M2GL025-Creative-Board-master\Modify_The_FPGA_Design\IGL2_CoreRISCV_AXI4_TickTacToe\designer\PROC_SUBSYSTEM\placer_coverage.log}
write_sdc -strict {C:\Users\ciaran.lappin\Downloads\CreativeRes\M2GL025-Creative-Board-master\Modify_The_FPGA_Design\IGL2_CoreRISCV_AXI4_TickTacToe\designer\PROC_SUBSYSTEM\place_route.sdc}
