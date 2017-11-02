# Future Electronics Creative Development Board
This folder contains the design and software factory programmed onto the yellow Creative board.


### Modifying the Libero projects
Some of the Libero projects use IP packages not directly available from the Microsemi IP Catalog. These IP packages were created to speed up design creation by wrapping simple logic into reusable user IP packages.
These user IP packages are available [here](https://github.com/RISCV-on-Microsemi-FPGA/riscv-junk-drawer/tree/master/IP-packages).

Please note that you may need to uncomment "`define USE_REGISTERS" in file coreriscv_axi4_defines.v in order to reduce RAM blocks usage. You will need to do this anytime you regenerate the top level SmartDesign in Libero.


