set_component HPMS_0_sb_CCC_0_FCCC
# Microsemi Corp.
# Date: 2017-Dec-10 16:01:54
#

create_clock -period 20 [ get_pins { CCC_INST/CLK0_PAD } ]
create_generated_clock -multiply_by 2 -divide_by 2 -source [ get_pins { CCC_INST/CLK0_PAD } ] -phase 0 [ get_pins { CCC_INST/GL0 } ]
