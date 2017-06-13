#ifndef __TIC_TAC_TOE_
#define __TIC_TAC_TOE_

#define TS_MINX 150
#define TS_MINY 130
#define TS_MAXX 3800
#define TS_MAXY 4000

#include "drivers/CoreSPI/core_spi.h"
#include "drivers/CoreGPIO/core_gpio.h"

void
draw_board
(
	spi_instance_t * this_spi,
	gpio_instance_t * this_gpio
);

long
map
(
	uint16_t coord,
	uint16_t in_min,
	uint16_t in_max,
	uint16_t out_min,
	uint16_t out_max
);



uint8_t
check_winner
(
	spi_instance_t * this_spi,
	char board[],
	uint8_t player,
	gpio_instance_t * this_gpio
);

uint8_t
AIcheck_winner
(
	char board[],
	uint8_t player
);

void
drawGame
(
	spi_instance_t *this_spi,
	gpio_instance_t * this_gpio
);

void
twoPlayerMode
(
	spi_instance_t * this_spi,
	gpio_instance_t * this_gpio
);

void
singlePlayerMode
(
	spi_instance_t * this_spi,
	gpio_instance_t * this_gpio
);

uint8_t
singlePlayerAI
(
	spi_instance_t * this_spi,
	gpio_instance_t * this_gpio,
	char board[9],
	uint8_t player
);

uint8_t
singlePlayerX
(
	spi_instance_t * this_spi,
	gpio_instance_t * this_gpio,
	char board[9],
	uint8_t player
);

void
gameMenu
(
	spi_instance_t * this_spi,
	gpio_instance_t * this_gpio
);

#endif
