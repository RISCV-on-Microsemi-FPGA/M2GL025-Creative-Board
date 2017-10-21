set_device \
    -fam IGLOO2 \
    -die PA4MGL2500_N \
    -pkg vf256
set_mddr_reg \
	-path {D:/Work/Libero/IGL2_RISCV_Systick_Blinky/component/work/HPMS_0_sb_HPMS/MDDR_init.reg}
set_input_cfg \
	-path {D:/Work/Libero/IGL2_RISCV_Systick_Blinky/component/work/HPMS_0_sb_HPMS/ENVM.cfg}
set_output_efc \
    -path {D:\Work\Libero\IGL2_RISCV_Systick_Blinky\designer\PROC_SUBSYSTEM\PROC_SUBSYSTEM.efc}
set_proj_dir \
    -path {D:\Work\Libero\IGL2_RISCV_Systick_Blinky}
gen_prg -use_init true
