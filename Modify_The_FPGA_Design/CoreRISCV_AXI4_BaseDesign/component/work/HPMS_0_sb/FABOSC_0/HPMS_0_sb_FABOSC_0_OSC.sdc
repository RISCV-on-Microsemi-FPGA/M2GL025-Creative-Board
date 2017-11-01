set_component HPMS_0_sb_FABOSC_0_OSC
# Microsemi Corp.
# Date: 2017-Nov-01 09:25:51
#

create_clock -ignore_errors -period 20 [ get_pins { I_RCOSC_25_50MHZ/CLKOUT } ]
