quietly set ACTELLIBNAME IGLOO2
quietly set PROJECT_DIR "C:/MiV_Example_Designs/Igloo2/IGL2_MiV_RV32IMA_TIckTackToe"
source "${PROJECT_DIR}/simulation/bfmtovec_compile.tcl";

if {[file exists presynth/_info]} {
   echo "INFO: Simulation library presynth already exists"
} else {
   file delete -force presynth 
   vlib presynth
}
vmap presynth presynth
vmap IGLOO2 "C:/Microsemi/Libero_SoC_v11.8/Designer/lib/modelsim/precompiled/vlog/smartfusion2"
vmap SmartFusion2 "C:/Microsemi/Libero_SoC_v11.8/Designer/lib/modelsim/precompiled/vlog/smartfusion2"
vmap COREAHBLITE_LIB "../component/Actel/DirectCore/CoreAHBLite/5.2.100/mti/user_vlog/COREAHBLITE_LIB"
vcom -work COREAHBLITE_LIB -force_refresh
vlog -work COREAHBLITE_LIB -force_refresh
if {[file exists COREAHBTOAPB3_LIB/_info]} {
   echo "INFO: Simulation library COREAHBTOAPB3_LIB already exists"
} else {
   file delete -force COREAHBTOAPB3_LIB 
   vlib COREAHBTOAPB3_LIB
}
vmap COREAHBTOAPB3_LIB "COREAHBTOAPB3_LIB"
if {[file exists COREAPB3_LIB/_info]} {
   echo "INFO: Simulation library COREAPB3_LIB already exists"
} else {
   file delete -force COREAPB3_LIB 
   vlib COREAPB3_LIB
}
vmap COREAPB3_LIB "COREAPB3_LIB"
if {[file exists COREAXITOAHBL/_info]} {
   echo "INFO: Simulation library COREAXITOAHBL already exists"
} else {
   file delete -force COREAXITOAHBL 
   vlib COREAXITOAHBL
}
vmap COREAXITOAHBL "COREAXITOAHBL"
if {[file exists COREJTAGDEBUG_LIB/_info]} {
   echo "INFO: Simulation library COREJTAGDEBUG_LIB already exists"
} else {
   file delete -force COREJTAGDEBUG_LIB 
   vlib COREJTAGDEBUG_LIB
}
vmap COREJTAGDEBUG_LIB "COREJTAGDEBUG_LIB"
if {[file exists CORETIMER_LIB/_info]} {
   echo "INFO: Simulation library CORETIMER_LIB already exists"
} else {
   file delete -force CORETIMER_LIB 
   vlib CORETIMER_LIB
}
vmap CORETIMER_LIB "CORETIMER_LIB"
if {[file exists COREAHBLSRAM_LIB/_info]} {
   echo "INFO: Simulation library COREAHBLSRAM_LIB already exists"
} else {
   file delete -force COREAHBLSRAM_LIB 
   vlib COREAHBLSRAM_LIB
}
vmap COREAHBLSRAM_LIB "COREAHBLSRAM_LIB"
if {[file exists CORESPI_LIB/_info]} {
   echo "INFO: Simulation library CORESPI_LIB already exists"
} else {
   file delete -force CORESPI_LIB 
   vlib CORESPI_LIB
}
vmap CORESPI_LIB "CORESPI_LIB"
if {[file exists MIRSLV2MIRMSTRBRIDGE_AHB_LIB/_info]} {
   echo "INFO: Simulation library MIRSLV2MIRMSTRBRIDGE_AHB_LIB already exists"
} else {
   file delete -force MIRSLV2MIRMSTRBRIDGE_AHB_LIB 
   vlib MIRSLV2MIRMSTRBRIDGE_AHB_LIB
}
vmap MIRSLV2MIRMSTRBRIDGE_AHB_LIB "MIRSLV2MIRMSTRBRIDGE_AHB_LIB"
if {[file exists CORERISCV_AXI4_LIB/_info]} {
   echo "INFO: Simulation library CORERISCV_AXI4_LIB already exists"
} else {
   file delete -force CORERISCV_AXI4_LIB 
   vlib CORERISCV_AXI4_LIB
}
vmap CORERISCV_AXI4_LIB "CORERISCV_AXI4_LIB"
if {[file exists CORERISCVRV32IMA_LIB/_info]} {
   echo "INFO: Simulation library CORERISCVRV32IMA_LIB already exists"
} else {
   file delete -force CORERISCVRV32IMA_LIB 
   vlib CORERISCVRV32IMA_LIB
}
vmap CORERISCVRV32IMA_LIB "CORERISCVRV32IMA_LIB"

vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work presynth "${PROJECT_DIR}/component/Actel/DirectCore/CoreGPIO/3.1.101/rtl/vlog/core/coregpio.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work presynth "${PROJECT_DIR}/component/Actel/DirectCore/CoreConfigMaster/2.1.102/rtl/vlog/core/coreconfigmaster.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work presynth "${PROJECT_DIR}/component/Actel/DirectCore/CoreConfigP/7.1.100/rtl/vlog/core/coreconfigp.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work presynth "${PROJECT_DIR}/component/Actel/DirectCore/CoreResetP/7.1.100/rtl/vlog/core/coreresetp_pcie_hotreset.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work presynth "${PROJECT_DIR}/component/Actel/DirectCore/CoreResetP/7.1.100/rtl/vlog/core/coreresetp.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work presynth "${PROJECT_DIR}/component/work/HPMS_0_sb/CCC_0/HPMS_0_sb_CCC_0_FCCC.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work presynth "${PROJECT_DIR}/component/work/HPMS_0_sb/FABOSC_0/HPMS_0_sb_FABOSC_0_OSC.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work presynth "${PROJECT_DIR}/component/work/HPMS_0_sb_HPMS/HPMS_0_sb_HPMS.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work COREAHBLITE_LIB "${PROJECT_DIR}/component/Actel/DirectCore/CoreAHBLite/5.2.100/rtl/vlog/core/coreahblite_addrdec.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work COREAHBLITE_LIB "${PROJECT_DIR}/component/Actel/DirectCore/CoreAHBLite/5.2.100/rtl/vlog/core/coreahblite_defaultslavesm.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work COREAHBLITE_LIB "${PROJECT_DIR}/component/Actel/DirectCore/CoreAHBLite/5.2.100/rtl/vlog/core/coreahblite_masterstage.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work COREAHBLITE_LIB "${PROJECT_DIR}/component/Actel/DirectCore/CoreAHBLite/5.2.100/rtl/vlog/core/coreahblite_slavearbiter.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work COREAHBLITE_LIB "${PROJECT_DIR}/component/Actel/DirectCore/CoreAHBLite/5.2.100/rtl/vlog/core/coreahblite_slavestage.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work COREAHBLITE_LIB "${PROJECT_DIR}/component/Actel/DirectCore/CoreAHBLite/5.2.100/rtl/vlog/core/coreahblite_matrix4x16.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work COREAHBLITE_LIB "${PROJECT_DIR}/component/Actel/DirectCore/CoreAHBLite/5.2.100/rtl/vlog/core/coreahblite.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work presynth "${PROJECT_DIR}/component/work/HPMS_0_sb/HPMS_0_sb.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work presynth "${PROJECT_DIR}/component/work/PROC_SUBSYSTEM/CoreUARTapb_0/rtl/vlog/core/Clock_gen.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work presynth "${PROJECT_DIR}/component/work/PROC_SUBSYSTEM/CoreUARTapb_0/rtl/vlog/core/Rx_async.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work presynth "${PROJECT_DIR}/component/work/PROC_SUBSYSTEM/CoreUARTapb_0/rtl/vlog/core/Tx_async.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work presynth "${PROJECT_DIR}/component/work/PROC_SUBSYSTEM/CoreUARTapb_0/rtl/vlog/core/fifo_256x8_g4.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work presynth "${PROJECT_DIR}/component/work/PROC_SUBSYSTEM/CoreUARTapb_0/rtl/vlog/core/CoreUART.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work presynth "${PROJECT_DIR}/component/work/PROC_SUBSYSTEM/CoreUARTapb_0/rtl/vlog/core/CoreUARTapb.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work COREAHBTOAPB3_LIB "${PROJECT_DIR}/component/Actel/DirectCore/COREAHBTOAPB3/3.1.100/rtl/vlog/core/coreahbtoapb3_ahbtoapbsm.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work COREAHBTOAPB3_LIB "${PROJECT_DIR}/component/Actel/DirectCore/COREAHBTOAPB3/3.1.100/rtl/vlog/core/coreahbtoapb3_apbaddrdata.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work COREAHBTOAPB3_LIB "${PROJECT_DIR}/component/Actel/DirectCore/COREAHBTOAPB3/3.1.100/rtl/vlog/core/coreahbtoapb3_penablescheduler.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work COREAHBTOAPB3_LIB "${PROJECT_DIR}/component/Actel/DirectCore/COREAHBTOAPB3/3.1.100/rtl/vlog/core/coreahbtoapb3.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work COREAPB3_LIB "${PROJECT_DIR}/component/Actel/DirectCore/CoreAPB3/4.1.100/rtl/vlog/core/coreapb3_muxptob3.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work COREAPB3_LIB "${PROJECT_DIR}/component/Actel/DirectCore/CoreAPB3/4.1.100/rtl/vlog/core/coreapb3_iaddr_reg.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work COREAPB3_LIB "${PROJECT_DIR}/component/Actel/DirectCore/CoreAPB3/4.1.100/rtl/vlog/core/coreapb3.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work COREJTAGDEBUG_LIB "${PROJECT_DIR}/component/Actel/DirectCore/COREJTAGDEBUG/2.0.100/rtl/vlog/core/corejtagdebug_uj_jtag.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work COREJTAGDEBUG_LIB "${PROJECT_DIR}/component/Actel/DirectCore/COREJTAGDEBUG/2.0.100/rtl/vlog/core/corejtagdebug.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORESPI_LIB "${PROJECT_DIR}/component/Actel/DirectCore/CORESPI/5.1.104/rtl/vlog/core/spi_clockmux.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORESPI_LIB "${PROJECT_DIR}/component/Actel/DirectCore/CORESPI/5.1.104/rtl/vlog/core/spi_chanctrl.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORESPI_LIB "${PROJECT_DIR}/component/Actel/DirectCore/CORESPI/5.1.104/rtl/vlog/core/spi_control.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORESPI_LIB "${PROJECT_DIR}/component/Actel/DirectCore/CORESPI/5.1.104/rtl/vlog/core/spi_fifo.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORESPI_LIB "${PROJECT_DIR}/component/Actel/DirectCore/CORESPI/5.1.104/rtl/vlog/core/spi_rf.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORESPI_LIB "${PROJECT_DIR}/component/Actel/DirectCore/CORESPI/5.1.104/rtl/vlog/core/spi.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORESPI_LIB "${PROJECT_DIR}/component/Actel/DirectCore/CORESPI/5.1.104/rtl/vlog/core/corespi.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORETIMER_LIB "${PROJECT_DIR}/component/Actel/DirectCore/CoreTimer/2.0.103/rtl/vlog/core/coretimer.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work MIRSLV2MIRMSTRBRIDGE_AHB_LIB "${PROJECT_DIR}/component/USER/UserCore/MIRSLV2MIRMSTRBRIDGE_AHB/1.0.3/rtl/core/mirslv2mirmstrbridge_ahb.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_coreplex_local_interrupter_clint.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_capture_chain.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_capture_update_chain.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_capture_update_chain_1.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_jtag_bypass_chain.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_capture_update_chain_2.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_async_reset_reg.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_async_reset_reg_vec_90.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_jtag_state_machine.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_negative_edge_latch.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_negative_edge_latch_2.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_jtag_tap_controller.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_debug_transport_module_jtag.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_int_xbar.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_int_xbar_1.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_int_xbar_2.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_int_xing.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_async_reset_reg_vec_89.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_reset_catch_and_sync.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_int_xbar_int_xbar.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_int_xing_xing.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_amoalu.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_arbiter.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_arbiter_1.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_d_cache_data_array.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_pmp_checker.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_tlb.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_d_cache_dcache.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_i_cache_icache.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_shift_queue.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_tlb_1.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_frontend_frontend.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_hella_cache_arbiter.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_rr_arbiter.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_ptw.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_alu.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_breakpoint_unit.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_csr_file.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_rvc_expander.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_i_buf.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_mul_div.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_rocket.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_tl_xbar_tile_bus.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_rocket_tile_rocket.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_sync_rocket_tile_tile.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_tlfifo_fixer_system_bus.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_level_gateway.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_queue_13.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_tlplic_plic.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_tl_atomic_automata.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_queue.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_queue_1.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_queue_4.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_queue_5.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_queue_6.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_queue_7.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_queue_8.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_tl_buffer_1.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_queue_10.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_queue_9.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_tl_buffer_2.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_tl_buffer_3.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_tl_buffer_4.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_queue_23.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_queue_24.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_queue_25.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_queue_26.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_queue_27.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_tl_buffer_error.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_queue_14.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_queue_15.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_queue_16.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_queue_17.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_queue_18.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_tl_buffer_system_bus.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_tl_cache_cork.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_async_reset_reg_vec_1.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_async_valid_sync_3.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_async_valid_sync_4.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_async_valid_sync_5.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_async_queue_sink_2.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_async_queue_sink_1.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_async_valid_sync.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_async_valid_sync_1.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_async_valid_sync_2.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_async_queue_source_2.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_tl_async_crossing_sink.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_tl_debug_module_inner_dm_inner.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_tl_debug_module_inner_async_dm_inner.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_async_queue_source_1.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_dmi_to_tl_dmi2tl.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_async_queue_sink.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_async_queue_source.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_tl_async_crossing_source_dm_inner.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_async_reset_reg_vec.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_tl_debug_module_outer_dm_outer.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_tl_xbar_dmi_xbar.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_tl_debug_module_outer_async_dm_outer.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_tl_debug_module_debug.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_queue_21.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_queue_22.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_tl_error_error.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_tl_filter.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_repeater.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_repeater_2.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_tl_fragmenter_1.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_tl_splitter_system_bus.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_queue_20.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_tl_to_ahb.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_queue_19.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_tl_to_ahb_converter.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_tl_width_widget.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_tl_width_widget_3.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_tl_xbar_memory_bus.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_tl_xbar_periphery_bus.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_tl_xbar_system_bus.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb_core_risc_vahb_top.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work CORERISCVRV32IMA_LIB "${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core/miv_rv32ima_l1_ahb.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" -vlog01compat -work presynth "${PROJECT_DIR}/component/work/PROC_SUBSYSTEM/PROC_SUBSYSTEM.v"
vlog "+incdir+${PROJECT_DIR}/component/Microsemi/MiV/MIV_RV32IMA_L1_AHB/0.5.1/rtl/vlog/core" "+incdir+${PROJECT_DIR}/stimulus" -vlog01compat -work presynth "${PROJECT_DIR}/stimulus/tesgsrg.v"

vsim -L IGLOO2 -L presynth -L COREAHBLITE_LIB -L COREAHBTOAPB3_LIB -L COREAPB3_LIB -L COREAXITOAHBL -L COREJTAGDEBUG_LIB -L CORETIMER_LIB -L COREAHBLSRAM_LIB -L CORESPI_LIB -L MIRSLV2MIRMSTRBRIDGE_AHB_LIB -L CORERISCV_AXI4_LIB -L CORERISCVRV32IMA_LIB  -t 1fs presynth.tesgsrg
add wave /tesgsrg/*
run 1000ns
