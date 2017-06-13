create_clock -name { TCK } \
-period 166.67 \
-waveform { 0 83.33 } \
[ get_ports { TCK } ]

set_false_path -from [ get_clocks { TCK } ] \
-to [ get_clocks { HPMS_0_sb_0/CCC_0/GL0}]
set_false_path -from [  get_clocks { HPMS_0_sb_0/CCC_0/GL0} ]\
-to [ get_clocks { TCK } ]