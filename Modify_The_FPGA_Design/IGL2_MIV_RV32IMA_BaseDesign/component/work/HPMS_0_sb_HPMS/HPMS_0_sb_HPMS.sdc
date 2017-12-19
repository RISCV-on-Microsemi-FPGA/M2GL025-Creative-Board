set_component HPMS_0_sb_HPMS
# Microsemi Corp.
# Date: 2017-Dec-10 15:57:35
#

create_clock -period 60.6061 [ get_pins { MSS_ADLIB_INST/CLK_CONFIG_APB } ]
set_false_path -ignore_errors -through [ get_pins { MSS_ADLIB_INST/CONFIG_PRESET_N } ]
