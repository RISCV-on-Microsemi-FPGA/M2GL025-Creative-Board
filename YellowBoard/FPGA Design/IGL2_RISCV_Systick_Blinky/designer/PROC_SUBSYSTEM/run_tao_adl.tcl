set_family {IGLOO2}
read_adl {D:\Work\Libero\IGL2_RISCV_Systick_Blinky\designer\PROC_SUBSYSTEM\PROC_SUBSYSTEM.adl}
map_netlist
read_sdc {D:\Work\Libero\IGL2_RISCV_Systick_Blinky\constraint\PROC_SUBSYSTEM_derived_constraints.sdc}
read_sdc {D:\Work\Libero\IGL2_RISCV_Systick_Blinky\constraint\user.sdc}
check_constraints {D:\Work\Libero\IGL2_RISCV_Systick_Blinky\constraint\placer_sdc_errors.log}
write_sdc -strict {D:\Work\Libero\IGL2_RISCV_Systick_Blinky\designer\PROC_SUBSYSTEM\place_route.sdc}
