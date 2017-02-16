Thank you for your interest in Microsemi's RISC-V Solution  



Software and design files for running RISC-V on the Creative Board include: 

- SoftConsole IDE release notes and Linux installation file 
- Programming release notes and Linux installation file 
- M2GL025 Creative Board sample RISC-V Libero Project 
- RISC-V Hardware Abstraction Layer (HAL) 
- RISC-V Boot Loader 

To run the tick-tack-toe design on the Future Creative board, you need the Creative board and a LCD touch screen.
The Creative board is available at www.FutureElectronics.com/CreativeDevelopmentBoard
The LCD touch screen is available at https://www.adafruit.com/products/1651
Find the programming *.stp file on the Github site under the Creative Board directory or you can generate the *.stp by 
downloading Libero SOC software and running the Libero project to access the programming file.  
Use the Microsemi flashpro tool to download the *.stp file to the Creative board
Plug in the display to the Arduino connectors and reset the board.  Import the TickTackToe example workspace into SoftConsole, build and run a debug session. The TickTackToe example should run.


SoftConsole v5.0 IDE is supported on Linux only at this time. 
 


For the latest versions of these files, and further instructions on how to run the examples please refer to these locations

http://www.microsemi.com/products/fpga-soc/soc-processors/risc-v 

https://github.com/RISCV-on-Microsemi-FPGA

Libero SoC can be downloaded at http://www.microsemi.com/products/fpga-soc/design-resources/design-software/libero-soc 


Further details on the Future Creative board www.FutureElectronics.com/CreativeDevelopmentBoard 

NOTE: If UserCore is missing from the projects, they can be found at the link below in the IP-Packages folder.

https://github.com/RISCV-on-Microsemi-FPGA/riscv-junk-drawer
