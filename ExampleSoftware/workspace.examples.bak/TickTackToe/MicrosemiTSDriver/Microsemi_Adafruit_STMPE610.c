#include "Microsemi_Adafruit_STMPE610.h"
#include "drivers/CoreSPI/core_spi.h"
#include "drivers/CoreGPIO/core_gpio.h"


void
TS_begin
(
	spi_instance_t *  this_spi,
	gpio_instance_t * this_gpio
)
{
	TS_writeRegister8( this_spi, this_gpio , STMPE_SYS_CTRL1, STMPE_SYS_CTRL1_RESET);
	for(volatile uint32_t delay =0; delay < 0xFFF; delay++);
	//uint8_t readData = 0;
	for(uint8_t loop =0; loop <65; loop++)
	{
		TS_readRegister8(  this_spi,  this_gpio ,  loop);
	}
	TS_writeRegister8(this_spi, this_gpio ,STMPE_SYS_CTRL2, 0x0); // turn on clocks!
	TS_writeRegister8(this_spi, this_gpio ,STMPE_TSC_CTRL, (STMPE_TSC_CTRL_XYZ | STMPE_TSC_CTRL_EN)); // XYZ and enable!
	  //Serial.println(readRegister8(STMPE_TSC_CTRL), HEX);
	TS_readRegister8(this_spi, this_gpio, STMPE_TSC_CTRL);
	TS_writeRegister8(this_spi, this_gpio ,STMPE_INT_EN, STMPE_INT_EN_TOUCHDET);
	TS_writeRegister8(this_spi, this_gpio ,STMPE_ADC_CTRL1, (STMPE_ADC_CTRL1_10BIT | (0x6 << 4))); // 96 clocks per conversion
	TS_writeRegister8(this_spi, this_gpio ,STMPE_ADC_CTRL2, STMPE_ADC_CTRL2_6_5MHZ);
	TS_writeRegister8(this_spi, this_gpio ,STMPE_TSC_CFG, (STMPE_TSC_CFG_4SAMPLE | STMPE_TSC_CFG_DELAY_1MS | STMPE_TSC_CFG_SETTLE_5MS));
	TS_writeRegister8(this_spi, this_gpio ,STMPE_TSC_FRACTION_Z, 0x6);
	TS_writeRegister8(this_spi, this_gpio ,STMPE_FIFO_TH, 1);
	TS_writeRegister8(this_spi, this_gpio ,STMPE_FIFO_STA, STMPE_FIFO_STA_RESET);
	TS_writeRegister8(this_spi, this_gpio ,STMPE_FIFO_STA, 0);    // unreset
	TS_writeRegister8(this_spi, this_gpio ,STMPE_TSC_I_DRIVE, STMPE_TSC_I_DRIVE_20MA);
	TS_writeRegister8(this_spi, this_gpio ,STMPE_INT_STA, 0xFF); // reset all ints
	TS_writeRegister8(this_spi, this_gpio ,STMPE_INT_CTRL, STMPE_INT_CTRL_POL_HIGH | STMPE_INT_CTRL_ENABLE);
}

void
TS_write
(
	spi_instance_t * this_spi,
	uint8_t data_bits,
	gpio_instance_t * this_gpio
)
{
	/*
	* Selects SPI slave 0
	* transfers data passed in to spi device
	* deselets SPI slave 0
	*/
	//GPIO_set_output( this_gpio, GPIO_5, 0 ); // Chip Select Signal TS
	SPI_set_slave_select(this_spi, SPI_SLAVE_1); // check this is the TS
	SPI_transfer_frame(this_spi, data_bits);
	SPI_clear_slave_select(this_spi, SPI_SLAVE_1);// check this is the TS
	//GPIO_set_output( this_gpio, GPIO_5, 1 ); // Chip Select Signal TS
}

uint8_t
TS_readRegister8
(
	spi_instance_t * this_spi,
	gpio_instance_t * this_gpio,
	uint8_t addr
)
{
    uint8_t master_rx  =0x00;
   // uint8_t txdata = 0x00;
    //uint8_t rw_bit = 1;
    //txdata = (rw_bit << 7)|addr;
    GPIO_set_output( this_gpio, GPIO_5, 0 ); // Chip Select Signal TS
    SPI_set_slave_select(this_spi, SPI_SLAVE_1);  // check this is the TS
    master_rx = SPI_transfer_frame( this_spi,(0x80 | addr));// txdata );
    master_rx = SPI_transfer_frame( this_spi, 0x0 );
    SPI_clear_slave_select( this_spi, SPI_SLAVE_1 ); // check this is the TS
    GPIO_set_output( this_gpio, GPIO_5, 1 ); // Chip Select Signal TS
    return master_rx;
}

void
TS_writeRegister8
(
	spi_instance_t * this_spi,
	gpio_instance_t * this_gpio,
	uint8_t addr,
	uint8_t data_bits
)
{
	GPIO_set_output( this_gpio, GPIO_5, 0 ); // Chip Select Signal TS
	TS_write( this_spi, addr, this_gpio );
	TS_write( this_spi, data_bits, this_gpio );
    GPIO_set_output( this_gpio, GPIO_5, 1 ); // Chip Select Signal TS
}

uint16_t
TS_getVersion
(
	spi_instance_t * this_spi,
	gpio_instance_t * this_gpio
)
{
	uint16_t versionNumber;
    versionNumber = TS_readRegister8( this_spi, this_gpio , 0);
	versionNumber <<= 8;
	versionNumber |= TS_readRegister8( this_spi, this_gpio , 1);
	return versionNumber;
}

void
TS_readData
(
	spi_instance_t * this_spi,
	gpio_instance_t * this_gpio,
	uint16_t *x,
	uint16_t *y,
	uint8_t *z
)
{
	uint8_t data[4];
	for (uint8_t loop=0;loop<4;loop++)
	{
		data[loop]= TS_readRegister8 (this_spi, this_gpio, 0xD7);
	}
	*x= data[0];
	*x <<= 4;
	*x |= (data[1] >> 4);
	*y = data[1] & 0x0F;
	*y <<= 8;
	*y |= data[2];
	*z = data[3];
	if( TS_readRegister8(this_spi, this_gpio,STMPE_FIFO_STA)& STMPE_FIFO_STA_EMPTY) // buffer empty?
	{
		TS_writeRegister8(this_spi, this_gpio,STMPE_INT_STA, 0xFF);
	}
}

bool
TS_touched
(
	spi_instance_t * this_spi,
	gpio_instance_t * this_gpio
)
{
	return ((TS_readRegister8(this_spi, this_gpio,STMPE_TSC_CTRL) ) & 0x80);
}

