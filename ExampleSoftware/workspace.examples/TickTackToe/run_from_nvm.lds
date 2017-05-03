OUTPUT_ARCH( "riscv" )
ENTRY(_start)

MEMORY
{
  nvm (rx)   : ORIGIN = 0x60000000, LENGTH = 256k
  ram (rwx)  : ORIGIN = 0x80000000, LENGTH = 256m
}


SECTIONS
{
  .text : 
  {
    ./riscv_hal/entry.o(.text.entry)
    *(.text.entry)
    *(.text)
  } >nvm

  .sdata : {
    __sdata_load = LOADADDR(.sdata);
    __sdata_start = .; 
    _gp = . + 0x800;
    *(.srodata.cst16) *(.srodata.cst8) *(.srodata.cst4) *(.srodata.cst2)
    *(.srodata*)
    *(.sdata .sdata.* .gnu.linkonce.s.*)
    __sdata_end = .;
  } >ram AT>nvm

  .data : ALIGN(0x10)
  {
    __data_load = LOADADDR(.data);
    __data_start = .; 
    *(.data)
    __data_end = .;
  } >ram AT>nvm

  /* bss segment */
  .sbss : {
    *(.sbss .sbss.* .gnu.linkonce.sb.*)
    *(.scommon)
  } >ram
  
  .bss :
  { 
    *(.bss)
  } >ram

  /* End of uninitalized data segement */
  _end = .;
  _heap_end = .;
}

