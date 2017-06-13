/*******************************************************************************
 * (c) Copyright 2016 Microsemi SoC Products Group. All rights reserved.
 * 
 * Function stubs.
 * The functions below will only be linked with the application code if the user
 * does not provide an implementation for these functions. These functions are
 * defined with weak linking so that they can be overridden by a function with
 * same prototype in the user's application code.
 */
#include <unistd.h>

__attribute__((weak)) void handle_m_ext_interrupt() {
    
    _exit(10);
}

__attribute__((weak)) void SysTick_Handler(void) {
    ;
}


