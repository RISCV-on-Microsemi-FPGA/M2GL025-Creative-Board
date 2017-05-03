OUTPUT_ARCH( "riscv" )
ENTRY(_start)

SECTIONS
{
  . = 0x80000000;
  .text : 
  {
    ./riscv_hal/entry.o(.text.entry)
    *(.text)
  }

  /* data segment */
  .data :
  { 
    __data_load = LOADADDR(.data);
    __data_start = .; 
    *(.data)
    __data_end = .;
  }

  .sdata : {
    __sdata_load = LOADADDR(.sdata);
    __sdata_start = .; 
    _gp = . + 0x800;
    *(.srodata.cst16) *(.srodata.cst8) *(.srodata.cst4) *(.srodata.cst2)
    *(.srodata*)
    *(.sdata .sdata.* .gnu.linkonce.s.*)
    __sdata_end = .;
  }

  /* bss segment */
  .sbss : {
    *(.sbss .sbss.* .gnu.linkonce.sb.*)
    *(.scommon)
  }
  .bss : { *(.bss) }

  /* End of uninitalized data segement */
  _end = .;
  _heap_end = .;
}

