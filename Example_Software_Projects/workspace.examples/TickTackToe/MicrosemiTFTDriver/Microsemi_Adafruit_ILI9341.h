#ifndef __ADAFRUIT_TFT_DISPLAY_
#define __ADAFRUIT_TFT_DISPLAY_

/*
   Header Includes
*/
/*
 *    defines from Adafruit ILI9341
 */
// Color definitions
#define ILI9341_BLACK       0x0000      /*   0,   0,   0 */
#define ILI9341_NAVY        0x000F      /*   0,   0, 128 */
#define ILI9341_DARKGREEN   0x03E0      /*   0, 128,   0 */
#define ILI9341_DARKCYAN    0x03EF      /*   0, 128, 128 */
#define ILI9341_MAROON      0x7800      /* 128,   0,   0 */
#define ILI9341_PURPLE      0x780F      /* 128,   0, 128 */
#define ILI9341_OLIVE       0x7BE0      /* 128, 128,   0 */
#define ILI9341_LIGHTGREY   0xC618      /* 192, 192, 192 */
#define ILI9341_DARKGREY    0x7BEF      /* 128, 128, 128 */
#define ILI9341_BLUE        0x001F      /*   0,   0, 255 */
#define ILI9341_GREEN       0x07E0      /*   0, 255,   0 */
#define ILI9341_CYAN        0x07FF      /*   0, 255, 255 */
#define ILI9341_RED         0xF800      /* 255,   0,   0 */
#define ILI9341_MAGENTA     0xF81F      /* 255,   0, 255 */
#define ILI9341_YELLOW      0xFFE0      /* 255, 255,   0 */
#define ILI9341_WHITE       0xFFFF      /* 255, 255, 255 */
#define ILI9341_ORANGE      0xFD20      /* 255, 165,   0 */
#define ILI9341_GREENYELLOW 0xAFE5      /* 173, 255,  47 */
#define ILI9341_PINK        0xF81F

#define TFT_HEIGHT 320
#define TFT_WIDTH  240

#define ILI9341_NOP     0x00
#define ILI9341_SWRESET 0x01
#define ILI9341_RDDID   0x04
#define ILI9341_RDDST   0x09

#define ILI9341_SLPIN   0x10
#define ILI9341_SLPOUT  0x11
#define ILI9341_PTLON   0x12
#define ILI9341_NORON   0x13

#define ILI9341_RDMODE  0x0A
#define ILI9341_RDMADCTL  0x0B
#define ILI9341_RDPIXFMT  0x0C
#define ILI9341_RDIMGFMT  0x0D
#define ILI9341_RDSELFDIAG  0x0F

#define ILI9341_INVOFF  0x20
#define ILI9341_INVON   0x21
#define ILI9341_GAMMASET 0x26
#define ILI9341_DISPOFF 0x28
#define ILI9341_DISPON  0x29

#define ILI9341_CASET   0x2A
#define ILI9341_PASET   0x2B
#define ILI9341_RAMWR   0x2C
#define ILI9341_RAMRD   0x2E

#define ILI9341_PTLAR   0x30
#define ILI9341_MADCTL  0x36
#define ILI9341_PIXFMT  0x3A

#define ILI9341_FRMCTR1 0xB1
#define ILI9341_FRMCTR2 0xB2
#define ILI9341_FRMCTR3 0xB3
#define ILI9341_INVCTR  0xB4
#define ILI9341_DFUNCTR 0xB6

#define ILI9341_PWCTR1  0xC0
#define ILI9341_PWCTR2  0xC1
#define ILI9341_PWCTR3  0xC2
#define ILI9341_PWCTR4  0xC3
#define ILI9341_PWCTR5  0xC4
#define ILI9341_VMCTR1  0xC5
#define ILI9341_VMCTR2  0xC7

#define ILI9341_RDID1   0xDA
#define ILI9341_RDID2   0xDB
#define ILI9341_RDID3   0xDC
#define ILI9341_RDID4   0xD3

#define ILI9341_GMCTRP1 0xE0
#define ILI9341_GMCTRN1 0xE1
#include "drivers/CoreSPI/core_spi.h"
#include "drivers/CoreGPIO/core_gpio.h"

void
TFT_begin
(
	spi_instance_t * this_spi,
	gpio_instance_t * this_gpio
);

void
TFT_spiread
(
	spi_instance_t * this_spi,
	uint8_t * cmd_buffer,
	uint16_t cmd_byte_size,
	uint8_t * rx_buffer,
	size_t size_in_bytes
);

void
TFT_spiwrite
(
	spi_instance_t *this_spi,
	uint8_t data_bits
);

void
TFT_writecommand
(
	spi_instance_t * this_spi,
	uint8_t data_bits,
	gpio_instance_t * this_gpio
);

void
TFT_writedata
(
	spi_instance_t * this_spi,
	uint8_t data_bits,
	gpio_instance_t * this_gpio
);

void
TFT_setAddrWindow
(
	spi_instance_t * this_spi,
	uint16_t x_zero,
	uint16_t y_zero,
    uint16_t x_one,
	uint16_t y_one,
	gpio_instance_t *this_gpio
);

void
TFT_drawPixel
(
	spi_instance_t * this_spi,
	int16_t xPt,
	int16_t yPt,
	uint16_t colour,
	gpio_instance_t * this_gpio
);

uint32_t
testRead
(
	spi_instance_t *this_spi,
	gpio_instance_t * this_gpio
);

void
TFT_fillrect
(
	spi_instance_t * this_spi,
	int16_t xpt,
	int16_t ypt,
	int16_t width,
	int16_t height,
	gpio_instance_t * this_gpio,
	uint16_t colour
);

void
TFT_fastVLine
(
	spi_instance_t * this_spi,
	int16_t pos_x,
	int16_t pos_y,
	int16_t height,
	int16_t colour,
	gpio_instance_t * this_gpio
);

void
TFT_fastHLine
(
	spi_instance_t * this_spi,
	int16_t pos_x,
	int16_t pos_y,
	int16_t height,
    int16_t colour,
	gpio_instance_t * this_gpio
);

void
TFT_drawCircle
(
	spi_instance_t * this_spi,
	int16_t x0,
	int16_t y0,
	int16_t radius,
	uint16_t color,
	gpio_instance_t * this_gpio
);

void
TFT_fillScreen
(
	spi_instance_t * this_spi,
	gpio_instance_t * this_gpio,
	uint16_t colour
);

void
TFT_drawLine
(
	spi_instance_t * this_spi,
	int16_t x0,
	int16_t y0,
	int16_t x1,
	int16_t y1,
	uint16_t color,
	gpio_instance_t * this_gpio
);

#endif
