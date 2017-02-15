/*******************************************************************************
 * (c) Copyright 2016 Microsemi SoC Products Group. All rights reserved.
 * 
 * Hardware Abstraction Layer for RISC-V. This is mainly targeted at RV32IM but
 * should be usable with other variants.
 * 
 */
#include <stdlib.h>
#include <stddef.h>
#include <stdint.h>
#include <unistd.h>

#include "riscv_hal.h"
#include "hw_platform.h"

/*------------------------------------------------------------------------------
 * defines
 */
#define MTIMECMP_BASE_ADDR     0x44004000UL
#define MTIME_ADDR             0x4400BFF8UL

#define RTC_PRESCALER 100

#define SUCCESS 0
#define ERROR   1

/*------------------------------------------------------------------------------
 * 
 */
extern void handle_m_ext_interrupt();
extern void handle_m_timer_interrupt();

/*------------------------------------------------------------------------------
 * System core clock frequency
 */
uint32_t SystemCoreClock = SYS_CLK_FREQ;

/*------------------------------------------------------------------------------
 * Increment value for the mtimecmp register in order to achieve a system tick
 * interrupt as specified through the SysTick_Config() function.
 */
static uint64_t g_systick_increment = 0;

/*------------------------------------------------------------------------------
 * Disable all interrupts.
 */
void __disable_irq(void) {
    clear_csr(mie, MIP_MEIP);
    clear_csr(mstatus, MSTATUS_MIE);
}

/*------------------------------------------------------------------------------
 * Enabler all interrupts.
 */
void __enable_irq(void) {
    set_csr(mie, MIP_MEIP);
    set_csr(mstatus, MSTATUS_MIE);
}

/*------------------------------------------------------------------------------
 * Configure the machine timer to generate an interrupt.
 */
uint32_t SysTick_Config(uint32_t ticks) {
    
    uint32_t ret_val = ERROR;
    
    g_systick_increment = ticks / RTC_PRESCALER;

    if (g_systick_increment > 0) {
        uint32_t mhartid = read_csr(mhartid);
        PRCI->MTIMECMP[mhartid] = PRCI->MTIME + g_systick_increment;
        set_csr(mie, MIP_MTIP);
        __enable_irq();
        ret_val = SUCCESS;
    }
    
    return ret_val;
}

/*------------------------------------------------------------------------------
 * RISC-V interrupt handler for machine timer interrupts.
 */
void handle_m_timer_interrupt(){
    uint32_t mhartid = read_csr(mhartid);
    clear_csr(mie, MIP_MTIP);
    PRCI->MTIMECMP[mhartid] = PRCI->MTIME + g_systick_increment;
    SysTick_Handler();
    set_csr(mie, MIP_MTIP);
}

/*------------------------------------------------------------------------------
 * Trap/Interrupt handler
 */
uintptr_t handle_trap(uintptr_t mcause, uintptr_t epc)
{
    if (0) {
    // External Machine-Level Interrupt from PLIC
    } else if ((mcause & MCAUSE_INT) && ((mcause & MCAUSE_CAUSE)  == IRQ_M_EXT)) {
        handle_m_ext_interrupt();
    } else if ((mcause & MCAUSE_INT) && ((mcause & MCAUSE_CAUSE)  == IRQ_M_TIMER)) {
        handle_m_timer_interrupt();
    }    
    else {
        write(1, "trap\n", 5);
        _exit(1 + mcause);
    }
    return epc;
}

