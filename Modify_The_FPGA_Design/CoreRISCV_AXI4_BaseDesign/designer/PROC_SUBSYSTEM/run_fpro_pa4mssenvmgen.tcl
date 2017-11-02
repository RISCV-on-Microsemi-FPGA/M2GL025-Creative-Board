set_device \
    -fam IGLOO2 \
    -die PA4MGL2500_N \
    -pkg vf256
set_mddr_reg \
	-path {C:/Users/ciaran.lappin/Downloads/CreativeRes/M2GL025-Creative-Board-master/Modify_The_FPGA_Design/CoreRISCV_AXI4_BaseDesign/component/work/HPMS_0_sb_HPMS/MDDR_init.reg}
set_input_cfg \
	-path {C:/Users/ciaran.lappin/Downloads/CreativeRes/M2GL025-Creative-Board-master/Modify_The_FPGA_Design/CoreRISCV_AXI4_BaseDesign/component/work/HPMS_0_sb_HPMS/ENVM.cfg}
set_output_efc \
    -path {C:\Users\ciaran.lappin\Downloads\CreativeRes\M2GL025-Creative-Board-master\Modify_The_FPGA_Design\CoreRISCV_AXI4_BaseDesign\designer\PROC_SUBSYSTEM\PROC_SUBSYSTEM.efc}
set_proj_dir \
    -path {C:\Users\ciaran.lappin\Downloads\CreativeRes\M2GL025-Creative-Board-master\Modify_The_FPGA_Design\CoreRISCV_AXI4_BaseDesign}
gen_prg -use_init true
