/*******************************************************************************
 * (c) Copyright 2016 Microsemi SoC Products Group. All rights reserved.
 *
 *	Tick Tack Toe program
 *	This project is targeted at the RISC-V design running on the M2S025
 *	development board and Adafruit Arduino TFT screen linked in  the read me.
 *
 * SVN $Revision: $
 * SVN $Date: $
 */
//#include <unistd.h>

#include "hw_platform.h"
#include "drivers/CoreGPIO/core_gpio.h"
#include "drivers/CoreUARTapb/core_uart_apb.h"
#include "drivers/CoreSPI/core_spi.h"
#include "drivers/CoreTimer/core_timer.h"
#include "riscv_hal/riscv_CoreplexE31.h"
#include "MicrosemiTFTDriver/Microsemi_Adafruit_ILI9341.h"
#include "MicrosemiTSDriver/Microsemi_Adafruit_STMPE610.h"
#include "TicTacToe/tictactoe.h"


/*
 * CoreGPIO instance data.
 */
gpio_instance_t g_gpio;

volatile uint32_t g_10ms_count;
volatile uint32_t g_state;




/******************************************************************************
 * PLIC instance data.
 *****************************************************************************/
//plic_instance_t g_plic;



/******************************************************************************
 * GPIO instance data.
 *****************************************************************************/
gpio_instance_t g_gpio;

/******************************************************************************
 * Timer 0 instance data.
 *****************************************************************************/
//timer_instance_t g_timer0;
//timer_instance_t g_timer1;

/******************************************************************************
 * CoreSPI 0 instance data.
 *****************************************************************************/
spi_instance_t g_core_spi0;

/*-------------------------------------------------------------------------*//**
 * main() function.
 */
int main()
{
    g_10ms_count = 0;


    /**************************************************************************
     * Initialize the CoreGPIO driver with the base address of the CoreGPIO
     * instance to use and the initial state of the outputs.
     *************************************************************************/
    GPIO_init( &g_gpio, COREGPIO_OUT_BASE_ADDR, GPIO_APB_32_BITS_BUS );
    GPIO_set_outputs(&g_gpio, 0);
   
    /**************************************************************************
     * Configure the GPIOs.
     ************************************3*************************************/
	GPIO_set_output( &g_gpio, GPIO_0, 0x00 );
	GPIO_set_output( &g_gpio, GPIO_1, 0x00 );
    GPIO_config( &g_gpio, GPIO_4, GPIO_OUTPUT_MODE); // Data Command Signal
	GPIO_set_output( &g_gpio, GPIO_4, 1 ); // Data Command Signal
	GPIO_config( &g_gpio, GPIO_6, GPIO_OUTPUT_MODE); // reset Signal
	GPIO_set_output( &g_gpio, GPIO_6, 1 ); // reset Signal
	GPIO_config( &g_gpio, GPIO_5, GPIO_OUTPUT_MODE); // Chip Select Signal TS
	GPIO_set_output( &g_gpio, GPIO_5, 1 ); // Chip Select Signal TS

    /**************************************************************************
      * Initialize CoreSPI0  in master mode.
      *************************************************************************/
	SPI_init(&g_core_spi0, CORE_SPI0_BASE_ADDRESS,8);
	SPI_configure_master_mode(&g_core_spi0);

	/**************************************************************************
      * Initialize TFT Screen.
      *************************************************************************/
	TFT_begin( &g_core_spi0, &g_gpio); // initialize the TFT Screen
	for(volatile uint16_t delay0 = 0; delay0 < 0xFF; delay0++); // Delay

	/**************************************************************************
      * Initialize Touch Screen (TS).
      *************************************************************************/
	TS_begin(&g_core_spi0, &g_gpio); // initialize the touch screen
	for(volatile uint16_t delay1 = 0; delay1 < 0xFF; delay1++); // Delay

	/**************************************************************************
      * Player Modes
      * Single Player 	->  	singlePlayerMode(&g_core_spi0, &g_gpio)
      * Two Player 		->		twoPlayerMode(&g_core_spi0, &g_gpio);
      *************************************************************************/
	//twoPlayerMode(&g_core_spi0, &g_gpio); // Two Player Mode
	singlePlayerMode(&g_core_spi0, &g_gpio); // Single Player Mode

	while(1);
	return 0;
}

/*------------------------------------------------------------------------------
 * Count the number of elapsed milliseconds (SysTick_Handler is called every
 * 10mS so the resolution will be 10ms). Rolls over every 49 days or so...
 *
 * Should be safe to read g_10ms_count from elsewhere.
 */
void SysTick_Handler( void )
{
    uint32_t gpio_pattern;
    static uint8_t count;
    /*
     * Toggle GPIO output pattern by doing an exclusive OR of all
     * pattern bits with ones.
     */
    if(count++>=50)
    {
        gpio_pattern = GPIO_get_outputs( &g_gpio );
        gpio_pattern ^= 0x00000002;
        GPIO_set_outputs( &g_gpio, gpio_pattern );
        count=0;
    }

    g_10ms_count += 10;

     /*
      * For neatness, if we roll over, reset cleanly back to 0 so the count
      * always goes up in proper 10s.
      */
    if(g_10ms_count < 10)
        g_10ms_count = 0;
}



