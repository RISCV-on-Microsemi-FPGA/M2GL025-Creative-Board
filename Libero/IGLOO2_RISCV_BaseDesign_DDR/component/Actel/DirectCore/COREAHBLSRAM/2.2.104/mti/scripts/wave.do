onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {TB TOP}
add wave -noupdate /testbench/COREAHBLSRAM_0/HCLK
add wave -noupdate /testbench/COREAHBLSRAM_0/HRESETN
add wave -noupdate /testbench/COREAHBLSRAM_0/HSEL
add wave -noupdate /testbench/COREAHBLSRAM_0/HTRANS
add wave -noupdate /testbench/COREAHBLSRAM_0/HBURST
add wave -noupdate /testbench/COREAHBLSRAM_0/HSIZE
add wave -noupdate /testbench/COREAHBLSRAM_0/HWDATA
add wave -noupdate /testbench/COREAHBLSRAM_0/HADDR
add wave -noupdate /testbench/COREAHBLSRAM_0/HWRITE
add wave -noupdate /testbench/COREAHBLSRAM_0/HRDATA
add wave -noupdate /testbench/COREAHBLSRAM_0/HRESP
add wave -noupdate /testbench/COREAHBLSRAM_0/HREADYIN
add wave -noupdate /testbench/COREAHBLSRAM_0/HREADYOUT
add wave -noupdate /testbench/COREAHBLSRAM_0/HADDR_cal
add wave -noupdate /testbench/COREAHBLSRAM_0/ahbsram_size
add wave -noupdate /testbench/COREAHBLSRAM_0/ahbsram_addr
add wave -noupdate /testbench/COREAHBLSRAM_0/ahbsram_wdata
add wave -noupdate /testbench/COREAHBLSRAM_0/ahbsram_write
add wave -noupdate /testbench/COREAHBLSRAM_0/sramahb_ack
add wave -noupdate /testbench/COREAHBLSRAM_0/ahbsram_req
add wave -noupdate -divider {AHBL IF}
add wave -noupdate -color Violet /testbench/COREAHBLSRAM_0/U_AHBLSramIf/HCLK
add wave -noupdate -color Violet /testbench/COREAHBLSRAM_0/U_AHBLSramIf/HRESETN
add wave -noupdate -color Violet /testbench/COREAHBLSRAM_0/U_AHBLSramIf/HSEL
add wave -noupdate -color Violet /testbench/COREAHBLSRAM_0/U_AHBLSramIf/HTRANS
add wave -noupdate -color Violet /testbench/COREAHBLSRAM_0/U_AHBLSramIf/HBURST
add wave -noupdate -color Violet /testbench/COREAHBLSRAM_0/U_AHBLSramIf/HSIZE
add wave -noupdate -color Violet /testbench/COREAHBLSRAM_0/U_AHBLSramIf/HADDR
add wave -noupdate -color Violet /testbench/COREAHBLSRAM_0/U_AHBLSramIf/HWDATA
add wave -noupdate -color Violet /testbench/COREAHBLSRAM_0/U_AHBLSramIf/HWRITE
add wave -noupdate -color Violet /testbench/COREAHBLSRAM_0/U_AHBLSramIf/sramahb_ack
add wave -noupdate -color Violet /testbench/COREAHBLSRAM_0/U_AHBLSramIf/HREADYIN
add wave -noupdate -color Violet /testbench/COREAHBLSRAM_0/U_AHBLSramIf/HREADYOUT
add wave -noupdate -color Violet /testbench/COREAHBLSRAM_0/U_AHBLSramIf/HRESP
add wave -noupdate /testbench/COREAHBLSRAM_0/U_AHBLSramIf/HRDATA
add wave -noupdate /testbench/COREAHBLSRAM_0/U_AHBLSramIf/sramahb_rdata
add wave -noupdate -color Violet /testbench/COREAHBLSRAM_0/U_AHBLSramIf/ahbsram_req
add wave -noupdate /testbench/COREAHBLSRAM_0/U_AHBLSramIf/ahbsram_req_int
add wave -noupdate -color Violet /testbench/COREAHBLSRAM_0/U_AHBLSramIf/ahbsram_write
add wave -noupdate -color Violet /testbench/COREAHBLSRAM_0/U_AHBLSramIf/ahbsram_wdata
add wave -noupdate -color Violet /testbench/COREAHBLSRAM_0/U_AHBLSramIf/ahbsram_size
add wave -noupdate -color Violet /testbench/COREAHBLSRAM_0/U_AHBLSramIf/ahbsram_addr
add wave -noupdate -color Violet /testbench/COREAHBLSRAM_0/U_AHBLSramIf/ahbcurr_state
add wave -noupdate -color Violet /testbench/COREAHBLSRAM_0/U_AHBLSramIf/ahbnext_state
add wave -noupdate -color Violet /testbench/COREAHBLSRAM_0/U_AHBLSramIf/latchahbcmd
add wave -noupdate -color Violet /testbench/COREAHBLSRAM_0/U_AHBLSramIf/HWDATA_cal
add wave -noupdate -color Violet /testbench/COREAHBLSRAM_0/U_AHBLSramIf/validahbcmd
add wave -noupdate /testbench/COREAHBLSRAM_0/U_AHBLSramIf/HTRANS_d
add wave -noupdate /testbench/COREAHBLSRAM_0/U_AHBLSramIf/HBURST_d
add wave -noupdate /testbench/COREAHBLSRAM_0/U_AHBLSramIf/HSIZE_d
add wave -noupdate /testbench/COREAHBLSRAM_0/U_AHBLSramIf/HADDR_d
add wave -noupdate /testbench/COREAHBLSRAM_0/U_AHBLSramIf/HWDATA_d
add wave -noupdate /testbench/COREAHBLSRAM_0/U_AHBLSramIf/HWRITE_d
add wave -noupdate /testbench/COREAHBLSRAM_0/U_AHBLSramIf/HSEL_d
add wave -noupdate /testbench/COREAHBLSRAM_0/U_AHBLSramIf/HREADYIN_d
add wave -noupdate -divider {SRAM IF}
add wave -noupdate /testbench/COREAHBLSRAM_0/U_SramCtrlIf/ahbsram_req
add wave -noupdate /testbench/COREAHBLSRAM_0/U_SramCtrlIf/ahbsram_write
add wave -noupdate /testbench/COREAHBLSRAM_0/U_SramCtrlIf/ahbsram_size
add wave -noupdate /testbench/COREAHBLSRAM_0/U_SramCtrlIf/ahbsram_addr
add wave -noupdate /testbench/COREAHBLSRAM_0/U_SramCtrlIf/ahbsram_wdata
add wave -noupdate /testbench/COREAHBLSRAM_0/U_SramCtrlIf/sramahb_ack
add wave -noupdate /testbench/COREAHBLSRAM_0/U_SramCtrlIf/sramcurr_state
add wave -noupdate /testbench/COREAHBLSRAM_0/U_SramCtrlIf/sramnext_state
add wave -noupdate /testbench/COREAHBLSRAM_0/U_SramCtrlIf/sram_wen
add wave -noupdate /testbench/COREAHBLSRAM_0/U_SramCtrlIf/sram_ren
add wave -noupdate /testbench/COREAHBLSRAM_0/U_SramCtrlIf/sramahb_ack_int
add wave -noupdate /testbench/COREAHBLSRAM_0/U_SramCtrlIf/sram_done
add wave -noupdate /testbench/COREAHBLSRAM_0/U_SramCtrlIf/ram_rdata
add wave -noupdate /testbench/COREAHBLSRAM_0/U_SramCtrlIf/sramahb_rdata
add wave -noupdate -divider {Block 0}
add wave -noupdate -color {Cornflower Blue} /testbench/COREAHBLSRAM_0/U_SramCtrlIf/sram_block0/writeData
add wave -noupdate -color {Cornflower Blue} /testbench/COREAHBLSRAM_0/U_SramCtrlIf/sram_block0/wen
add wave -noupdate -color {Cornflower Blue} /testbench/COREAHBLSRAM_0/U_SramCtrlIf/sram_block0/ren
add wave -noupdate -color {Cornflower Blue} -subitemconfig {{/testbench/COREAHBLSRAM_0/U_SramCtrlIf/sram_block0/writeAddr[17]} {-color #63639696efef -height 16} {/testbench/COREAHBLSRAM_0/U_SramCtrlIf/sram_block0/writeAddr[16]} {-color #63639696efef -height 16} {/testbench/COREAHBLSRAM_0/U_SramCtrlIf/sram_block0/writeAddr[15]} {-color #63639696efef -height 16} {/testbench/COREAHBLSRAM_0/U_SramCtrlIf/sram_block0/writeAddr[14]} {-color #63639696efef -height 16} {/testbench/COREAHBLSRAM_0/U_SramCtrlIf/sram_block0/writeAddr[13]} {-color #63639696efef -height 16} {/testbench/COREAHBLSRAM_0/U_SramCtrlIf/sram_block0/writeAddr[12]} {-color #63639696efef -height 16} {/testbench/COREAHBLSRAM_0/U_SramCtrlIf/sram_block0/writeAddr[11]} {-color #63639696efef -height 16} {/testbench/COREAHBLSRAM_0/U_SramCtrlIf/sram_block0/writeAddr[10]} {-color #63639696efef -height 16} {/testbench/COREAHBLSRAM_0/U_SramCtrlIf/sram_block0/writeAddr[9]} {-color #63639696efef -height 16} {/testbench/COREAHBLSRAM_0/U_SramCtrlIf/sram_block0/writeAddr[8]} {-color #63639696efef -height 16} {/testbench/COREAHBLSRAM_0/U_SramCtrlIf/sram_block0/writeAddr[7]} {-color #63639696efef -height 16} {/testbench/COREAHBLSRAM_0/U_SramCtrlIf/sram_block0/writeAddr[6]} {-color #63639696efef -height 16} {/testbench/COREAHBLSRAM_0/U_SramCtrlIf/sram_block0/writeAddr[5]} {-color #63639696efef -height 16} {/testbench/COREAHBLSRAM_0/U_SramCtrlIf/sram_block0/writeAddr[4]} {-color #63639696efef -height 16} {/testbench/COREAHBLSRAM_0/U_SramCtrlIf/sram_block0/writeAddr[3]} {-color #63639696efef -height 16} {/testbench/COREAHBLSRAM_0/U_SramCtrlIf/sram_block0/writeAddr[2]} {-color #63639696efef -height 16} {/testbench/COREAHBLSRAM_0/U_SramCtrlIf/sram_block0/writeAddr[1]} {-color #63639696efef -height 16} {/testbench/COREAHBLSRAM_0/U_SramCtrlIf/sram_block0/writeAddr[0]} {-color #63639696efef -height 16}} /testbench/COREAHBLSRAM_0/U_SramCtrlIf/sram_block0/writeAddr
add wave -noupdate -color {Cornflower Blue} /testbench/COREAHBLSRAM_0/U_SramCtrlIf/sram_block0/readAddr
add wave -noupdate -color {Cornflower Blue} /testbench/COREAHBLSRAM_0/U_SramCtrlIf/sram_block0/readData
add wave -noupdate -color {Cornflower Blue} /testbench/COREAHBLSRAM_0/U_SramCtrlIf/sram_block0/writeData0
add wave -noupdate -color {Cornflower Blue} /testbench/COREAHBLSRAM_0/U_SramCtrlIf/sram_block0/writeData1
add wave -noupdate /testbench/COREAHBLSRAM_0/NUM_LOCATIONS_DWIDTH32
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {544352 ps} 0}
configure wave -namecolwidth 504
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {254697 ps}
