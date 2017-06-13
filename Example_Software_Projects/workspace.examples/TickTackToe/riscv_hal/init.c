#include <stdlib.h>
#include <stddef.h>
#include <stdint.h>
#include <unistd.h>

#include "encoding.h"

#include "hw_platform.h"
#include "core_uart_apb.h"

extern UART_instance_t g_uart;

extern uint32_t __sdata_load;
extern uint32_t __sdata_start;
extern uint32_t __sdata_end;

extern uint32_t __data_load;
extern uint32_t __data_start;
extern uint32_t __data_end;

static void copy_section(uint32_t * p_load, uint32_t * p_vma, uint32_t * p_vma_end)
{
    while(p_vma <= p_vma_end)
    {
        *p_vma = *p_load;
        ++p_load;
        ++p_vma;
    }
}

void _init(void)
{
    copy_section(&__sdata_load, &__sdata_start, &__sdata_end);
    copy_section(&__data_load, &__data_start, &__data_end);
    
    UART_init( &g_uart, COREUARTAPB0_BASE_ADDR, BAUD_VALUE_115200, (DATA_8_BITS | NO_PARITY) );

    extern int main(int, char**);
    const char *argv0 = "hello";
    char *argv[] = {(char *)argv0, NULL, NULL};

    exit(main(1, argv));
}
