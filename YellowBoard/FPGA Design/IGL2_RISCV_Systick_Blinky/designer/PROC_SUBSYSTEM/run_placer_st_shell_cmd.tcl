read_sdc -scenario "place_and_route" -netlist "user" -pin_separator "/" -ignore_errors {D:/Work/Libero/IGL2_RISCV_Systick_Blinky/designer/PROC_SUBSYSTEM/place_route.sdc}
set_options -tdpr_scenario "place_and_route" 
save
set_options -analysis_scenario "place_and_route"
report -type combinational_loops -format xml {D:\Work\Libero\IGL2_RISCV_Systick_Blinky\designer\PROC_SUBSYSTEM\PROC_SUBSYSTEM_layout_combinational_loops.xml}
report -type slack {D:\Work\Libero\IGL2_RISCV_Systick_Blinky\designer\PROC_SUBSYSTEM\pinslacks.txt}
