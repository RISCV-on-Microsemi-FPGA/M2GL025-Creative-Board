#include "Microsemi_Adafruit_ILI9341.h"
#include "drivers/CoreSPI/core_spi.h"
#include "drivers/CoreGPIO/core_gpio.h"

void
TFT_spiwrite
(
	spi_instance_t * this_spi,
	uint8_t  data_bits
)
{
   /*
    * Selects SPI slave 0
    * transfers data passed in to spi device
    * deselets SPI slave 0
    */
    SPI_set_slave_select(this_spi, SPI_SLAVE_0);
    SPI_transfer_frame(this_spi, data_bits);
    SPI_clear_slave_select(this_spi, SPI_SLAVE_0);
}

void
TFT_begin
(
	spi_instance_t * this_spi,
	gpio_instance_t * this_gpio
)
{
    GPIO_set_output( this_gpio, GPIO_6, 0 ); // ARD RESET
    for( volatile uint16_t x=0; x<0xfff; x++ ){} /// delay
    GPIO_set_output( this_gpio, GPIO_6, 1 ); // ARD RESET
    for( volatile uint16_t y=0; y<0xfff; y++ );
    TFT_writecommand( this_spi, 0xEF, this_gpio );
    TFT_writedata( this_spi, 0x03, this_gpio  );
    TFT_writedata( this_spi, 0x80 , this_gpio );
    TFT_writedata( this_spi, 0x02, this_gpio  );

    TFT_writecommand( this_spi, 0xCF, this_gpio );
    TFT_writedata( this_spi, 0x00 , this_gpio );
    TFT_writedata( this_spi, 0xC1 , this_gpio );
    TFT_writedata( this_spi, 0x30 , this_gpio );

    TFT_writecommand( this_spi, 0xED, this_gpio );
    TFT_writedata( this_spi, 0x64 , this_gpio );
    TFT_writedata( this_spi, 0x03 , this_gpio );
    TFT_writedata( this_spi, 0x12 , this_gpio );
    TFT_writedata( this_spi, 0x81 , this_gpio );

    TFT_writecommand( this_spi, 0xE8, this_gpio );
    TFT_writedata( this_spi, 0x85 , this_gpio );
    TFT_writedata( this_spi, 0x00 , this_gpio );
    TFT_writedata( this_spi, 0x78 , this_gpio );

    TFT_writecommand( this_spi, 0xCB, this_gpio );
    TFT_writedata( this_spi, 0x39 , this_gpio );
    TFT_writedata( this_spi, 0x2C , this_gpio );
    TFT_writedata( this_spi, 0x00 , this_gpio );
    TFT_writedata( this_spi, 0x34 , this_gpio );
    TFT_writedata( this_spi, 0x02 , this_gpio );

    TFT_writecommand( this_spi, 0xF7, this_gpio);
    TFT_writedata( this_spi, 0x20 , this_gpio );

    TFT_writecommand( this_spi, 0xEA, this_gpio );
    TFT_writedata( this_spi, 0x00 , this_gpio );
    TFT_writedata( this_spi, 0x00 , this_gpio );

    TFT_writecommand( this_spi, ILI9341_PWCTR1, this_gpio );    //Power control
    TFT_writedata( this_spi, 0x23 , this_gpio );   //VRH[5:0]

    TFT_writecommand( this_spi, ILI9341_PWCTR2, this_gpio );    //Power control
    TFT_writedata( this_spi, 0x10, this_gpio  );   //SAP[2:0];BT[3:0]

    TFT_writecommand( this_spi, ILI9341_VMCTR1, this_gpio );    //VCM control
    TFT_writedata( this_spi, 0x3e, this_gpio  ); //¶Ô±È¶Èµ÷œÚ
    TFT_writedata( this_spi, 0x28 , this_gpio );

    TFT_writecommand( this_spi, ILI9341_VMCTR2, this_gpio );    //VCM control2
    TFT_writedata( this_spi, 0x86, this_gpio  );  //--

    TFT_writecommand( this_spi, ILI9341_MADCTL, this_gpio ); // Mem Access Ctrl
    TFT_writedata( this_spi, 0x48 , this_gpio );

    TFT_writecommand( this_spi, ILI9341_PIXFMT, this_gpio );
    TFT_writedata( this_spi, 0x55 , this_gpio );

    TFT_writecommand( this_spi, ILI9341_FRMCTR1, this_gpio );
    TFT_writedata( this_spi, 0x00 , this_gpio );
    TFT_writedata( this_spi, 0x18 , this_gpio );

    TFT_writecommand( this_spi, ILI9341_DFUNCTR, this_gpio ); // Disp Fn Ctrl
    TFT_writedata( this_spi, 0x08 , this_gpio );
    TFT_writedata( this_spi, 0x82 , this_gpio );
    TFT_writedata( this_spi, 0x27 , this_gpio );

    TFT_writecommand( this_spi, 0xF2, this_gpio );// 3Gamma Function Disable
    TFT_writedata( this_spi, 0x00 , this_gpio );

    TFT_writecommand( this_spi, ILI9341_GAMMASET, this_gpio );//Gamma curve sel
    TFT_writedata( this_spi, 0x01, this_gpio );

    TFT_writecommand( this_spi, ILI9341_GMCTRP1, this_gpio );    //Set Gamma
    TFT_writedata( this_spi, 0x0F , this_gpio );
    TFT_writedata( this_spi, 0x31 , this_gpio );
    TFT_writedata( this_spi, 0x2B , this_gpio );
    TFT_writedata( this_spi, 0x0C , this_gpio );
    TFT_writedata( this_spi, 0x0E , this_gpio );
    TFT_writedata( this_spi, 0x08 , this_gpio );
    TFT_writedata( this_spi, 0x4E, this_gpio  );
    TFT_writedata( this_spi, 0xF1 , this_gpio );
    TFT_writedata( this_spi, 0x37 , this_gpio );
    TFT_writedata( this_spi, 0x07 , this_gpio );
    TFT_writedata( this_spi, 0x10 , this_gpio );
    TFT_writedata( this_spi, 0x03 , this_gpio );
    TFT_writedata( this_spi, 0x0E , this_gpio );
    TFT_writedata( this_spi, 0x09 , this_gpio );
    TFT_writedata( this_spi, 0x00 , this_gpio );

    TFT_writecommand( this_spi, ILI9341_GMCTRN1, this_gpio );    //Set Gamma
    TFT_writedata( this_spi, 0x00, this_gpio  );
    TFT_writedata( this_spi, 0x0E, this_gpio );
    TFT_writedata( this_spi, 0x14 , this_gpio );
    TFT_writedata( this_spi, 0x03, this_gpio  );
    TFT_writedata( this_spi, 0x11 , this_gpio );
    TFT_writedata( this_spi, 0x07 , this_gpio );
    TFT_writedata( this_spi, 0x31 , this_gpio );
    TFT_writedata( this_spi, 0xC1 , this_gpio );
    TFT_writedata( this_spi, 0x48, this_gpio  );
    TFT_writedata( this_spi, 0x08, this_gpio  );
    TFT_writedata( this_spi, 0x0F, this_gpio  );
    TFT_writedata( this_spi, 0x0C , this_gpio );
    TFT_writedata( this_spi, 0x31 , this_gpio );
    TFT_writedata( this_spi, 0x36 , this_gpio );
    TFT_writedata( this_spi, 0x0F , this_gpio );

    TFT_writecommand( this_spi, ILI9341_SLPOUT, this_gpio );
    for(volatile uint16_t x=0; x<0xfff; x++){} /// delay
    TFT_writecommand( this_spi, ILI9341_DISPON, this_gpio );
    for(volatile uint16_t x=0; x<0xfff; x++){} /// delay
}

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
)
{
    if (xpt >= TFT_WIDTH) width = TFT_WIDTH - xpt;
    if (xpt >= TFT_HEIGHT) height = TFT_HEIGHT - ypt;

    TFT_setAddrWindow(this_spi, xpt, ypt, xpt+width-1, ypt+height-1, this_gpio);
    int8_t colour_msb = colour >> 8;
    int8_t colour_lsb = colour;

    GPIO_set_output( this_gpio, GPIO_4, 1 ); // Data Command Signal

    for(ypt = height; ypt >0; ypt--)
    {
        for( xpt = width; xpt > 0; xpt--)
        {
            TFT_spiwrite( this_spi, colour_msb );
            TFT_spiwrite( this_spi, colour_lsb );
        }
    }
    GPIO_set_output( this_gpio, GPIO_5, 1 ); // Chip Select Signal
}

void
TFT_fillScreen
(
	spi_instance_t * this_spi,
	gpio_instance_t * this_gpio,
	uint16_t colour
)
{
	TFT_fillrect(this_spi, 0,0, TFT_WIDTH, TFT_HEIGHT,this_gpio,colour);
}

void
TFT_writecommand
(
	spi_instance_t * this_spi,
	uint8_t data_bits,
	gpio_instance_t * this_gpio
)
{
    GPIO_set_output( this_gpio, GPIO_4, 0 ); // Data Command Signal
    TFT_spiwrite( this_spi, data_bits );
    GPIO_set_output( this_gpio, GPIO_4, 1 ); // Data Command Signal
}

void
TFT_writedata
(
	spi_instance_t * this_spi,
	uint8_t c,
	gpio_instance_t * this_gpio
)
{

    GPIO_set_output( this_gpio, GPIO_4, 1 ); // Data Command Signal
    TFT_spiwrite( this_spi, c );
}

void
TFT_setAddrWindow
(
	spi_instance_t * this_spi,
	uint16_t x_zero,
	uint16_t y_zero,
    uint16_t x_one,
	uint16_t y_one,
	gpio_instance_t * this_gpio
)
{
    TFT_writecommand( this_spi,  ILI9341_CASET, this_gpio );
    TFT_writedata( this_spi, (x_zero >> 8), this_gpio );
    TFT_writedata( this_spi, (x_zero & 0xFF), this_gpio );
    TFT_writedata( this_spi, (x_one >> 8), this_gpio );
    TFT_writedata( this_spi, (x_one & 0xFF), this_gpio );

    TFT_writecommand( this_spi,  ILI9341_PASET, this_gpio );
    TFT_writedata( this_spi, (y_zero >> 8), this_gpio );
    TFT_writedata( this_spi, (y_zero & 0xFF), this_gpio );
    TFT_writedata( this_spi, (y_one >> 8), this_gpio );
    TFT_writedata( this_spi, (y_one & 0xFF), this_gpio );

    TFT_writecommand( this_spi,  ILI9341_RAMWR, this_gpio );
}

void
TFT_fastVLine
(
	spi_instance_t * this_spi,
	int16_t pos_x,
	int16_t pos_y,
	int16_t height,
	int16_t colour,
	gpio_instance_t * this_gpio
)
{
    if((pos_x >= TFT_WIDTH) || (pos_y >= TFT_HEIGHT)) return;

    if((pos_y+height-1) >= TFT_HEIGHT)
        height = TFT_HEIGHT -pos_y;

    TFT_setAddrWindow(this_spi, pos_x, pos_y, pos_x, pos_y+height-1, this_gpio);
    uint8_t colour_msb = colour >> 8;
    uint8_t colour_lsb = colour;

    GPIO_set_output( this_gpio, GPIO_4, 1 ); // Data Command Signal

    while(height --)
    {
        TFT_spiwrite( this_spi,colour_msb );
        TFT_spiwrite( this_spi, colour_lsb);
    }

}

void
TFT_fastHLine
(
	spi_instance_t * this_spi,
	int16_t pos_x,
	int16_t pos_y,
	int16_t width,
	int16_t colour,
	gpio_instance_t * this_gpio
)
{
    if((pos_x >= TFT_WIDTH) || (pos_y >= TFT_HEIGHT)) return;

    if((pos_x+width-1) >= TFT_WIDTH)
        width = TFT_WIDTH -pos_x;

    TFT_setAddrWindow( this_spi,pos_x, pos_y, pos_x+width-1, pos_y,  this_gpio);
    uint8_t colour_msb = colour >> 8;
    uint8_t colour_lsb = colour;

    GPIO_set_output( this_gpio, GPIO_4, 1 ); // Data Command Signal

    while(width --)
    {
        TFT_spiwrite( this_spi,colour_msb);
        TFT_spiwrite(this_spi, colour_lsb );
    }
}

/* Read TFT Display status
 *
 */

uint32_t
testRead
(
	spi_instance_t * this_spi,
	gpio_instance_t * this_gpio
)
{
    uint32_t master_rx ;//= 0x00000000;
    SPI_set_slave_select(this_spi, SPI_SLAVE_0);
    GPIO_set_output( this_gpio, GPIO_4, 0 ); // Data Command Signal
    //GPIO_set_output( this_gpio, GPIO_5, 0 ); // Chip Select Signal
    SPI_transfer_frame( this_spi, ILI9341_RDMODE );
    GPIO_set_output( this_gpio, GPIO_4, 1 ); // Data Command Signal
    master_rx = SPI_transfer_frame( this_spi, 0x00 );// Dont care
    master_rx = SPI_transfer_frame( this_spi, 0x00 );
    master_rx = SPI_transfer_frame( this_spi, 0x00 );
    master_rx = SPI_transfer_frame( this_spi, 0x00 );
    master_rx = SPI_transfer_frame( this_spi, 0x00 );
    master_rx = SPI_transfer_frame( this_spi, 0x00 );
    SPI_clear_slave_select( this_spi, SPI_SLAVE_0 );
    //GPIO_set_output( this_gpio, GPIO_5, 1 ); // Chip Select Signal
    return master_rx;
}

void
TFT_drawPixel
(
	spi_instance_t * this_spi,
	int16_t xPt,
	int16_t yPt,
	uint16_t colour,
	gpio_instance_t * this_gpio
)
{
    if ((xPt < 0)||(xPt >= TFT_WIDTH)||(yPt < 0)||(yPt >= TFT_HEIGHT)) return;
    uint8_t colour_msb = 0;
    colour_msb = colour >> 8;
    uint8_t colour_lsb = 0;
    colour_lsb = colour;
    TFT_setAddrWindow(this_spi, xPt, yPt, xPt+1 ,yPt+1, this_gpio);
    GPIO_set_output( this_gpio, GPIO_4, 1 ); // Data Command Signal
    TFT_spiwrite( this_spi, colour_msb );
    TFT_spiwrite( this_spi, colour_lsb );
}

void
TFT_drawCircle
(
	spi_instance_t * this_spi,
	int16_t x0,
	int16_t y0,
	int16_t radius,
	uint16_t color,
	gpio_instance_t * this_gpio
)
{
  int16_t f = 1 - radius;
  int16_t ddF_x = 1;
  int16_t ddF_y = -2 * radius;
  int16_t x = 0;
  int16_t y = radius;

  TFT_drawPixel(this_spi, x0  , y0+radius, color, this_gpio);
  TFT_drawPixel(this_spi, x0  , y0-radius, color, this_gpio);
  TFT_drawPixel(this_spi,x0+radius, y0  , color, this_gpio);
  TFT_drawPixel(this_spi,x0-radius, y0  , color, this_gpio);

  while (x<y) {
    if (f >= 0) {
      y--;
      ddF_y += 2;
      f += ddF_y;
    }
    x++;
    ddF_x += 2;
    f += ddF_x;

    TFT_drawPixel(this_spi,x0 + x, y0 + y, color, this_gpio);
    TFT_drawPixel(this_spi,x0 - x, y0 + y, color, this_gpio);
    TFT_drawPixel(this_spi,x0 + x, y0 - y, color, this_gpio);
    TFT_drawPixel(this_spi,x0 - x, y0 - y, color, this_gpio);
    TFT_drawPixel(this_spi,x0 + y, y0 + x, color, this_gpio);
    TFT_drawPixel(this_spi,x0 - y, y0 + x, color, this_gpio);
    TFT_drawPixel(this_spi,x0 + y, y0 - x, color, this_gpio);
    TFT_drawPixel(this_spi,x0 - y, y0 - x, color, this_gpio);
  }
}

#ifndef _swap_int16_t
#define _swap_int16_t(a, b) { int16_t t = a; a = b; b = t; }
#endif

// Bresenham's algorithm - thx wikpedia
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
)
{
  int16_t steep = abs(y1 - y0) > abs(x1 - x0);
  if (steep) {
    _swap_int16_t(x0, y0);
    _swap_int16_t(x1, y1);
  }

  if (x0 > x1) {
    _swap_int16_t(x0, x1);
    _swap_int16_t(y0, y1);
  }

  int16_t dx, dy;
  dx = x1 - x0;
  dy = abs(y1 - y0);

  int16_t err = dx / 2;
  int16_t ystep;

  if (y0 < y1) {
    ystep = 1;
  } else {
    ystep = -1;
  }

  for (; x0<=x1; x0++) {
    if (steep) {
    	TFT_drawPixel(this_spi,y0, x0, color, this_gpio);
    } else {
    	TFT_drawPixel(this_spi,x0, y0, color,this_gpio);
    }
    err -= dy;
    if (err < 0) {
      y0 += ystep;
      err += dx;
    }
  }
}
