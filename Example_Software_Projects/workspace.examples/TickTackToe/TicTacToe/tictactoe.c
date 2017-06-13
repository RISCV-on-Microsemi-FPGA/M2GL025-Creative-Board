#include "TicTacToe/tictactoe.h"
#include "drivers/CoreSPI/core_spi.h"
#include "drivers/CoreGPIO/core_gpio.h"
#include "MicrosemiTFTDriver/Microsemi_Adafruit_ILI9341.h"
#include "MicrosemiTSDriver/Microsemi_Adafruit_STMPE610.h"


void
draw_board
(
	spi_instance_t * this_spi,
	gpio_instance_t * this_gpio
)
{
	 // fill screen white
	for(uint8_t x=0; x< TFT_WIDTH; x++)
	{
		TFT_fastVLine(this_spi, x, 0, 320, ILI9341_WHITE, this_gpio);
	}
	// draw board fast (?)
	TFT_fastVLine(this_spi, 80, 0, 240, ILI9341_BLACK, this_gpio);
	TFT_fastVLine(this_spi, 160, 0, 240, ILI9341_BLACK, this_gpio);
	TFT_fastHLine(this_spi,0, 80, 240, ILI9341_BLACK, this_gpio);
	TFT_fastHLine(this_spi,0, 160, 240, ILI9341_BLACK, this_gpio);
}

void
singlePlayerMode
(
	spi_instance_t * this_spi,
	gpio_instance_t * this_gpio
)
{
	draw_board(this_spi,this_gpio);
	uint8_t player = 1;
	uint8_t winner = 0;
	uint32_t counter = 0;
	char board[9] = {' ',' ',' ',' ',' ',' ',' ',' ',' ' };

	while( counter < 9 && winner == 0)
	{
		player = counter%2+1;
		if (player == 1)
		{
			board[singlePlayerX(this_spi,this_gpio, board, player)] = 'X';
			winner = check_winner(this_spi,board,player, this_gpio);
			counter ++;
		}
		else
		{
			for(volatile uint32_t x=0; x < 0xF; x++);
			board[singlePlayerAI(this_spi, this_gpio, board, player)] = 'O';
			winner = check_winner(this_spi,board,player, this_gpio);
			counter ++;
		}

		if (winner == 0 && counter >=9)
		{
			drawGame(this_spi, this_gpio);
		}
	}
}

uint8_t
singlePlayerX
(
	spi_instance_t * this_spi,
	gpio_instance_t * this_gpio,
	char board[9],
	uint8_t player
)
{
	uint16_t x,y;
	uint8_t z;
	uint16_t  x_pos0, y_pos0,x_pos1, y_pos1;//, sq_centre_x,sq_centre_y ;
	uint16_t  x_pos2, y_pos2,x_pos3, y_pos3;//, x_count, o_count;
	uint8_t choice = 0;

	while(choice == 0 && player == 1)
	{

	   if ( ((TS_readRegister8(this_spi, this_gpio,STMPE_TSC_CTRL) ) & 0x80))
	   {
		//  player = counter%2+1;
		   TS_readData( this_spi, this_gpio, &x, &y, &z);
		  x = map( x, TS_MINX, TS_MAXX, 0, TFT_WIDTH);
		  y = map( y, TS_MINY, TS_MAXY, 0, TFT_HEIGHT);

		  if ((x < 80 && y < 80) && board[0]==' ')// 0
		  {
			  x_pos0 = 20;  y_pos0=20;
			  x_pos1 =60 ;  y_pos1 =60;
			  x_pos2 = 60;  y_pos2=20;
			  x_pos3 =20 ;  y_pos3 =60;
			  TFT_drawLine(this_spi,x_pos0, y_pos0,  x_pos1, y_pos1 ,ILI9341_RED,this_gpio);
			  TFT_drawLine(this_spi,x_pos2, y_pos2,  x_pos3, y_pos3 ,ILI9341_RED,this_gpio);
			  choice = 1;
			  return 0;
		  }
		  else if(((x < 160 && x >80)&& y<80) && board[1]==' ')//&& pos1==0)// 1
		  {
			  x_pos0 = 100; y_pos0=20;
			  x_pos1 =140 ; y_pos1 =60;
			  x_pos2 = 140; y_pos2=20;
			  x_pos3 =100 ; y_pos3 =60;
		  	  TFT_drawLine(this_spi,x_pos0, y_pos0,  x_pos1, y_pos1 ,ILI9341_RED,this_gpio);
			  TFT_drawLine(this_spi,x_pos2, y_pos2,  x_pos3, y_pos3 ,ILI9341_RED,this_gpio);
			  choice = 1;
			  return 1;
		  }
		  else if(((x < 240 && x >160)&& y<80)&& board[2]==' ' )//&& pos2==0)// 2
		  {
			  x_pos0 = 180;  y_pos0=20;
			  x_pos1 =220 ;  y_pos1 =60;
			  x_pos2 = 220;  y_pos2=20;
			  x_pos3 =180 ;  y_pos3 =60;
			  TFT_drawLine(this_spi,x_pos0, y_pos0,  x_pos1, y_pos1 ,ILI9341_RED,this_gpio);
			  TFT_drawLine(this_spi,x_pos2, y_pos2,  x_pos3, y_pos3 ,ILI9341_RED,this_gpio);
			  choice = 1;
			  return 2;
		  }
		  else if(x < 80 && (y>80 && y <160)&& board[3]==' ')// && pos3==0)// 3
		  {
			  x_pos0 = 20;  y_pos0=100;
			  x_pos1 =60 ;  y_pos1 =140;
			  x_pos2 = 60;  y_pos2=100;
			  x_pos3 =20 ;  y_pos3 =140;
			  TFT_drawLine(this_spi,x_pos0, y_pos0,  x_pos1, y_pos1 ,ILI9341_RED,this_gpio);
			  TFT_drawLine(this_spi,x_pos2, y_pos2,  x_pos3, y_pos3 ,ILI9341_RED,this_gpio);
			  choice = 1;
			  return 3;
		  }
		  else if((x < 160 && x >80)&& (y < 160 && y >80)&& board[4]==' ' )//&& pos4==0)// 4
		  {
			  x_pos0 = 100;  y_pos0=100;
			  x_pos1 =140 ;  y_pos1 =140;
			  x_pos2 = 140;  y_pos2=100;
			  x_pos3 =100 ;  y_pos3 =140;
			  TFT_drawLine(this_spi,x_pos0, y_pos0,  x_pos1, y_pos1 ,ILI9341_RED,this_gpio);
			  TFT_drawLine(this_spi,x_pos2, y_pos2,  x_pos3, y_pos3 ,ILI9341_RED,this_gpio);
			  choice = 1;
			  return 4;
		 }
		  else if((x < 240 && x >160)&& (y>80 && y<160 ) && board[5]==' ')//&& pos5==0)// 5
		  {
			  x_pos0 = 180;  y_pos0= 100;
			  x_pos1 =220 ;  y_pos1 =140;
			  x_pos2 = 220;  y_pos2=100;
			  x_pos3 =180 ;  y_pos3 =140;
			  TFT_drawLine(this_spi,x_pos0, y_pos0,  x_pos1, y_pos1 ,ILI9341_RED,this_gpio);
			  TFT_drawLine(this_spi,x_pos2, y_pos2,  x_pos3, y_pos3 ,ILI9341_RED,this_gpio);
			  choice = 1;
			  return 5;
		  }
		  else if( x < 80 && (y<240 && y > 160)&& board[6]==' ' )//&& pos6==0)//6
		  {
			  x_pos0 = 20;  y_pos0=180;
			  x_pos1 =60 ;  y_pos1 =220;
			  x_pos2 = 60;  y_pos2=180;
			  x_pos3 =20 ;  y_pos3 =220;
			  TFT_drawLine(this_spi,x_pos0, y_pos0,  x_pos1, y_pos1 ,ILI9341_RED,this_gpio);
			  TFT_drawLine(this_spi,x_pos2, y_pos2,  x_pos3, y_pos3 ,ILI9341_RED,this_gpio);
			  choice = 1;
			  return 6;
		  }
		  else if((x < 160 && x >80)&&( y <240 && y>160)&& board[7]==' ')// && pos7==0) // 7
		  {
			  x_pos0 = 100;	  y_pos0=180;
			  x_pos1 =140 ;	  y_pos1 =220;
			  x_pos2 = 140;  y_pos2=180;
			  x_pos3 =100 ;	  y_pos3 =220;
			  TFT_drawLine(this_spi,x_pos0, y_pos0,  x_pos1, y_pos1 ,ILI9341_RED,this_gpio);
			  TFT_drawLine(this_spi,x_pos2, y_pos2,  x_pos3, y_pos3 ,ILI9341_RED,this_gpio);
			  choice = 1;
			  return 7;
		  }
		  else if((x < 240 && x >160)&&(y>160 && y<240) && board[8]==' ')//&& pos8==0)// 8
		  {
			  x_pos0 = 180;  y_pos0=180;
			  x_pos1 =220 ;  y_pos1 =220;
			  x_pos2 = 220;  y_pos2=180;
			  x_pos3 =180 ;  y_pos3 =220;
			  TFT_drawLine(this_spi,x_pos0, y_pos0,  x_pos1, y_pos1 ,ILI9341_RED,this_gpio);
			  TFT_drawLine(this_spi,x_pos2, y_pos2,  x_pos3, y_pos3 ,ILI9341_RED,this_gpio);
			  choice = 1;
			  return 8;
		  }
	   }
	  }
   choice = 0;
   return -1;

}

uint8_t
singlePlayerAI
(
	spi_instance_t * this_spi,
	gpio_instance_t * this_gpio,
	char board[9],
	uint8_t player
)
{
	char AIboard[9];
	uint16_t sq_centre_x,sq_centre_y;
	// Can AI win in one move
	for(uint8_t i =0; i < 9; i ++)
	{
		for (int boardcp = 0; boardcp < 9; boardcp++)
		{
			AIboard[boardcp] = board[boardcp];
		}
		if (AIboard[i] == ' ')
		{
			AIboard[i] = 'O';
		}
		if (AIcheck_winner(AIboard,player) == 1)
		{
			if ( i == 0)
			{
				sq_centre_x = 40;  sq_centre_y = 40;
				TFT_drawCircle(this_spi ,sq_centre_x,sq_centre_y, 30, ILI9341_BLUE, this_gpio);
			}
			else if (i == 1)
			{
				sq_centre_x = 120;
				sq_centre_y = 40;
				TFT_drawCircle(this_spi ,sq_centre_x,sq_centre_y, 30, ILI9341_BLUE, this_gpio);
			}
			if ( i == 2)
			{
				sq_centre_x = 200;
				sq_centre_y = 40;
				TFT_drawCircle(this_spi ,sq_centre_x,sq_centre_y, 30, ILI9341_BLUE, this_gpio);
			}
			else if (i == 3)
			{
				sq_centre_x = 40;
				sq_centre_y = 120;
				TFT_drawCircle(this_spi ,sq_centre_x,sq_centre_y, 30, ILI9341_BLUE, this_gpio);
			}
			if ( i == 4)
			{
				sq_centre_x = 120;
				sq_centre_y = 120;
				TFT_drawCircle(this_spi ,sq_centre_x,sq_centre_y, 30, ILI9341_BLUE, this_gpio);
			}
			else if (i == 5)
			{
				sq_centre_x = 200;
				sq_centre_y = 120;
				TFT_drawCircle(this_spi ,sq_centre_x,sq_centre_y, 30, ILI9341_BLUE, this_gpio);
			}
			if ( i == 6)
			{
				sq_centre_x = 40;
				sq_centre_y = 200;
				TFT_drawCircle(this_spi ,sq_centre_x,sq_centre_y, 30, ILI9341_BLUE, this_gpio);
			}
			else if (i == 7)
			{
				sq_centre_x = 120;
				sq_centre_y = 200;
                TFT_drawCircle(this_spi ,sq_centre_x,sq_centre_y, 30, ILI9341_BLUE, this_gpio);
			}
			if ( i == 8)
			{
				sq_centre_x = 200;
				sq_centre_y = 200;
				TFT_drawCircle(this_spi ,sq_centre_x,sq_centre_y, 30, ILI9341_BLUE, this_gpio);
			}

			return i;
		}
	}

	// Can human win in one move
	for(uint8_t i =0; i < 9; i ++)
	{
		for (uint8_t brdcp = 0; brdcp < 9; brdcp++)
		{
			AIboard[brdcp] = board[brdcp];
		}
		if (AIboard[i] == ' ')
		{
			AIboard[i] = 'X';
		}
		if (AIcheck_winner(AIboard,player) == 1)
		{
			if ( i == 0)
			{
				sq_centre_x = 40;  sq_centre_y = 40;
				TFT_drawCircle(this_spi ,sq_centre_x,sq_centre_y, 30, ILI9341_BLUE, this_gpio);
			}
			else if (i == 1)
			{
				sq_centre_x = 120;
				sq_centre_y = 40;
				TFT_drawCircle(this_spi ,sq_centre_x,sq_centre_y, 30, ILI9341_BLUE, this_gpio);
			}
			if ( i == 2)
			{
				sq_centre_x = 200;
				sq_centre_y = 40;
				TFT_drawCircle(this_spi ,sq_centre_x,sq_centre_y, 30, ILI9341_BLUE, this_gpio);
			}
			else if (i == 3)
			{
				sq_centre_x = 40;
				sq_centre_y = 120;
				TFT_drawCircle(this_spi ,sq_centre_x,sq_centre_y, 30, ILI9341_BLUE, this_gpio);
			}
			if ( i == 4)
			{
				sq_centre_x = 120;
				sq_centre_y = 120;
				TFT_drawCircle(this_spi ,sq_centre_x,sq_centre_y, 30, ILI9341_BLUE, this_gpio);
			}
			else if (i == 5)
			{
				sq_centre_x = 200;
				sq_centre_y = 120;
				TFT_drawCircle(this_spi ,sq_centre_x,sq_centre_y, 30, ILI9341_BLUE, this_gpio);
			}
			if ( i == 6)
			{
				sq_centre_x = 40;
				sq_centre_y = 200;
				TFT_drawCircle(this_spi ,sq_centre_x,sq_centre_y, 30, ILI9341_BLUE, this_gpio);
			}
			else if (i == 7)
			{
				sq_centre_x = 120;
				sq_centre_y = 200;
                TFT_drawCircle(this_spi ,sq_centre_x,sq_centre_y, 30, ILI9341_BLUE, this_gpio);
			}
			if ( i == 8)
			{
				sq_centre_x = 200;
				sq_centre_y = 200;
				TFT_drawCircle(this_spi ,sq_centre_x,sq_centre_y, 30, ILI9341_BLUE, this_gpio);
			}
			return i;
		}
	}

	// attempt to take the corners if there free
	if (board[0] == ' ')
	{
		board[0] = 'O';
		sq_centre_x = 40;  sq_centre_y = 40;
		TFT_drawCircle(this_spi ,sq_centre_x,sq_centre_y, 30, ILI9341_BLUE, this_gpio);
		return 0;
		// may have to return the number that  we want to place the O
		// here
	}
	else if (board[2] == ' ')
	{
		board[2] = 'O';
		sq_centre_x = 200;
		sq_centre_y = 40;
		TFT_drawCircle(this_spi ,sq_centre_x,sq_centre_y, 30, ILI9341_BLUE, this_gpio);
		return 2;
	}
	else if (board[6] == ' ')
	{
		board[6] = 'O';
		sq_centre_x = 40;
		sq_centre_y = 200;
		TFT_drawCircle(this_spi ,sq_centre_x,sq_centre_y, 30, ILI9341_BLUE, this_gpio);
		return 6;
	}
	else if (board[8] == ' ')
	{
		board[8] = 'O';
		sq_centre_x = 200;
		sq_centre_y = 200;
		TFT_drawCircle(this_spi ,sq_centre_x,sq_centre_y, 30, ILI9341_BLUE, this_gpio);
		return 8;
	}

	// try to take the centre square
	if (board[4] == ' ')
	{
		board[4] = 'O';
		sq_centre_x = 120;
		sq_centre_y = 120;
		TFT_drawCircle(this_spi ,sq_centre_x,sq_centre_y, 30, ILI9341_BLUE, this_gpio);
		return 4;
	}
	// sides
	if (board[1] == ' ')
	{
		board[1] = 'O';
		sq_centre_x = 120;
		sq_centre_y = 40;
		TFT_drawCircle(this_spi ,sq_centre_x,sq_centre_y, 30, ILI9341_BLUE, this_gpio);
		return 1;
	}
	else if (board[3] == ' ')
	{
		board[3] = 'O';
		sq_centre_x = 40;
		sq_centre_y = 120;
		TFT_drawCircle(this_spi ,sq_centre_x,sq_centre_y, 30, ILI9341_BLUE, this_gpio);
		return 3;
	}
	else if (board[5] == ' ')
	{
		board[5] = 'O';
		sq_centre_x = 200;
		sq_centre_y = 120;
		TFT_drawCircle(this_spi ,sq_centre_x,sq_centre_y, 30, ILI9341_BLUE, this_gpio);
		return 5;
	}
	else if (board[7] == ' ')
	{
		board[7] = 'O';
		sq_centre_x = 120;
		sq_centre_y = 200;
        TFT_drawCircle(this_spi ,sq_centre_x,sq_centre_y, 30, ILI9341_BLUE, this_gpio);

	}
return -1;

}


void
twoPlayerMode
(
	spi_instance_t * this_spi,
	gpio_instance_t * this_gpio
)
{
	uint16_t x,y;
	uint8_t z;
	uint16_t  x_pos0, y_pos0,x_pos1, y_pos1, sq_centre_x,sq_centre_y ;
	uint16_t  x_pos2, y_pos2,x_pos3, y_pos3;//, x_count, o_count;
	uint8_t player = 1;
	uint8_t winner = 0;
	uint8_t pos0 = 0;
	uint8_t pos1 = 0;
	uint8_t pos2 = 0;
	uint8_t pos3 = 0;
	uint8_t pos4 = 0;
	uint8_t pos5 = 0;
	uint8_t pos6 = 0;
	uint8_t pos7 = 0;
	uint8_t pos8 = 0;
	//uint8_t pos9 = 0;
	uint32_t counter = 0;
	char board[9] = {'1','2','3','4','5','6','7','8','9' };

	draw_board(this_spi,this_gpio);
	while( counter < 9 && winner == 0)
	{
		if ( ((TS_readRegister8(this_spi, this_gpio,STMPE_TSC_CTRL) ) & 0x80))
		{
			player = counter%2+1;
			TS_readData( this_spi, this_gpio, &x, &y, &z);
			x = map( x, TS_MINX, TS_MAXX, 0, TFT_WIDTH);
			y = map( y, TS_MINY, TS_MAXY, 0, TFT_HEIGHT);

			if ((x < 80 && y < 80) && pos0==0)// 0
			{
				x_pos0 = 20;  y_pos0=20;
				x_pos1 =60 ;  y_pos1 =60;
				x_pos2 = 60;  y_pos2=20;
				x_pos3 =20 ;  y_pos3 =60;
				sq_centre_x = 40;  sq_centre_y = 40;
				if (player == 1) // player X
				{
					TFT_drawLine(this_spi,x_pos0, y_pos0,  x_pos1, y_pos1 ,ILI9341_RED,this_gpio);
					TFT_drawLine(this_spi,x_pos2, y_pos2,  x_pos3, y_pos3 ,ILI9341_RED,this_gpio);
					counter ++;
					pos0 = 1;
					board[0] = 'X';
					winner = check_winner(this_spi,board,player,this_gpio);
				}
				else // player O
				{
					TFT_drawCircle(this_spi ,sq_centre_x,sq_centre_y, 30, ILI9341_BLUE, this_gpio);
					counter ++;
					pos0 = 1;
					board[0] = 'O';
					winner =  check_winner(this_spi,board,player,this_gpio);
				}
			}
			else if(((x < 160 && x >80)&& y<80) && pos1==0)// 1
			{
				x_pos0 = 100;
				y_pos0=20;
				x_pos1 =140 ;
				y_pos1 =60;
				x_pos2 = 140;
				y_pos2=20;
				x_pos3 =100 ;
				y_pos3 =60;
				sq_centre_x = 120;
				sq_centre_y = 40;
				if (player == 1) // player X
				{
					TFT_drawLine(this_spi,x_pos0, y_pos0,  x_pos1, y_pos1 ,ILI9341_RED,this_gpio);
					TFT_drawLine(this_spi,x_pos2, y_pos2,  x_pos3, y_pos3 ,ILI9341_RED,this_gpio);
					counter ++;
					pos1 = 1;
					board[1] = 'X';
					winner =  check_winner(this_spi,board,player,this_gpio);
				}
				else
				{
					TFT_drawCircle(this_spi ,sq_centre_x,sq_centre_y, 30, ILI9341_BLUE, this_gpio);
					counter ++;
					pos1 = 1;
					board[1] = 'O';
					winner = check_winner(this_spi,board,player,this_gpio);
				}
			}
			else if(((x < 240 && x >160)&& y<80) && pos2==0)// 2
			{
				x_pos0 = 180;
				y_pos0=20;
				x_pos1 =220 ;
				y_pos1 =60;
				x_pos2 = 220;
				y_pos2=20;
				x_pos3 =180 ;
				y_pos3 =60;
				sq_centre_x = 200;
				sq_centre_y = 40;
				if(player == 1)
				{
					TFT_drawLine(this_spi,x_pos0, y_pos0,  x_pos1, y_pos1 ,ILI9341_RED,this_gpio);
					TFT_drawLine(this_spi,x_pos2, y_pos2,  x_pos3, y_pos3 ,ILI9341_RED,this_gpio);
					counter ++;
					pos2 = 1;
					board[2] = 'X';
					winner =  check_winner(this_spi,board,player,this_gpio);
				}
				else
				{
					TFT_drawCircle(this_spi ,sq_centre_x,sq_centre_y, 30, ILI9341_BLUE, this_gpio);
					counter ++;
					pos2 = 1;
					board[2] = 'O';
					winner =  check_winner(this_spi,board,player,this_gpio);
				}
			}
			else if(x < 80 && (y>80 && y <160) && pos3==0)// 3
			{
				x_pos0 = 20;
				y_pos0=100;
				x_pos1 =60 ;
				y_pos1 =140;
				x_pos2 = 60;
				y_pos2=100;
				x_pos3 =20 ;
				y_pos3 =140;
				sq_centre_x = 40;
				sq_centre_y = 120;
				if (player == 1 )
				{
					TFT_drawLine(this_spi,x_pos0, y_pos0,  x_pos1, y_pos1 ,ILI9341_RED,this_gpio);
					TFT_drawLine(this_spi,x_pos2, y_pos2,  x_pos3, y_pos3 ,ILI9341_RED,this_gpio);
					counter ++;
					pos3 = 1;
					board[3] = 'X';
					winner = check_winner(this_spi,board,player,this_gpio);
				}
				else
				{
					TFT_drawCircle(this_spi ,sq_centre_x,sq_centre_y, 30, ILI9341_BLUE, this_gpio);
					counter ++;
					pos3 = 1;
					board[3] = 'O';
					winner = check_winner(this_spi,board,player,this_gpio);
				}
			}
			else if((x < 160 && x >80)&& (y < 160 && y >80) && pos4==0)// 4
			{
				x_pos0 = 100;
				y_pos0=100;
				x_pos1 =140 ;
				y_pos1 =140;
				x_pos2 = 140;
				y_pos2=100;
				x_pos3 =100 ;
				y_pos3 =140;
				sq_centre_x = 120;
				sq_centre_y = 120;
				if (player == 1 )
				{
					TFT_drawLine(this_spi,x_pos0, y_pos0,  x_pos1, y_pos1 ,ILI9341_RED,this_gpio);
					TFT_drawLine(this_spi,x_pos2, y_pos2,  x_pos3, y_pos3 ,ILI9341_RED,this_gpio);
					counter ++;
					pos4 = 1;
					board[4] = 'X';
					winner =   check_winner(this_spi,board,player,this_gpio);
				}
				else
				{
					TFT_drawCircle(this_spi ,sq_centre_x,sq_centre_y, 30, ILI9341_BLUE, this_gpio);
					counter ++;
					pos4 = 1;
					board[4] = 'O';
					winner =  check_winner(this_spi,board,player,this_gpio);
				}
			}
			else if((x < 240 && x >160)&& (y>80 && y<160 ) && pos5==0)// 5
			{
				x_pos0 = 180;
				y_pos0= 100;
				x_pos1 =220 ;
				y_pos1 =140;
				x_pos2 = 220;
				y_pos2=100;
				x_pos3 =180 ;
				y_pos3 =140;
				sq_centre_x = 200;
				sq_centre_y = 120;
				if (player == 1 )
				{
					TFT_drawLine(this_spi,x_pos0, y_pos0,  x_pos1, y_pos1 ,ILI9341_RED,this_gpio);
					TFT_drawLine(this_spi,x_pos2, y_pos2,  x_pos3, y_pos3 ,ILI9341_RED,this_gpio);
					counter ++;
					pos5 = 1;
					board[5] = 'X';
					winner =  check_winner(this_spi,board,player,this_gpio);
				}
				else
				{
					TFT_drawCircle(this_spi ,sq_centre_x,sq_centre_y, 30, ILI9341_BLUE, this_gpio);
					counter ++;
					pos5 = 1;
					board[5] =    'O';
					winner =  check_winner(this_spi,board,player,this_gpio);
				}
			}
			else if( x < 80 && (y<240 && y > 160) && pos6==0)//6
			{
				x_pos0 = 20;
				y_pos0=180;
				x_pos1 =60 ;
				y_pos1 =220;
				x_pos2 = 60;
				y_pos2=180;
				x_pos3 =20 ;
				y_pos3 =220;
				sq_centre_x = 40;
				sq_centre_y = 200;
				if (player == 1 )
				{
					TFT_drawLine(this_spi,x_pos0, y_pos0,  x_pos1, y_pos1 ,ILI9341_RED,this_gpio);
					TFT_drawLine(this_spi,x_pos2, y_pos2,  x_pos3, y_pos3 ,ILI9341_RED,this_gpio);
					counter ++;
					pos6 = 1;
					board[6] =   'X';
					winner =  check_winner(this_spi,board,player,this_gpio);
				}
				else
				{
					TFT_drawCircle(this_spi ,sq_centre_x,sq_centre_y, 30, ILI9341_BLUE, this_gpio);
					counter ++;
					pos6 = 1;
					board[6] = 'O';
					winner =  check_winner(this_spi,board,player,this_gpio);
				}
			}
			else if((x < 160 && x >80)&&( y <240 && y>160) && pos7==0) // 7
			{
				x_pos0 = 100;
				y_pos0=180;
				x_pos1 =140 ;
				y_pos1 =220;
				x_pos2 = 140;
				y_pos2=180;
				x_pos3 =100 ;
				y_pos3 =220;
				sq_centre_x = 120;
				sq_centre_y = 200;
				if (player == 1 )
				{
					TFT_drawLine(this_spi,x_pos0, y_pos0,  x_pos1, y_pos1 ,ILI9341_RED,this_gpio);
					TFT_drawLine(this_spi,x_pos2, y_pos2,  x_pos3, y_pos3 ,ILI9341_RED,this_gpio);
					counter ++;
					pos7 = 1;
					board[7] = 'X';
					winner =  check_winner(this_spi,board,player,this_gpio);
				}
				else
				{
					TFT_drawCircle(this_spi ,sq_centre_x,sq_centre_y, 30, ILI9341_BLUE, this_gpio);
					counter ++;
					pos7 = 1;
					board[7] = 'O';
					winner =  check_winner(this_spi,board,player,this_gpio);
				}
			}
			else if((x < 240 && x >160)&&(y>160 && y<240) && pos8==0)// 8
			{
				x_pos0 = 180;
				y_pos0=180;
				x_pos1 =220 ;
				y_pos1 =220;
				x_pos2 = 220;
				y_pos2=180;
				x_pos3 =180 ;
				y_pos3 =220;
				sq_centre_x = 200;
				sq_centre_y = 200;
				if (player == 1 )
				{
					TFT_drawLine(this_spi,x_pos0, y_pos0,  x_pos1, y_pos1 ,ILI9341_RED,this_gpio);
					TFT_drawLine(this_spi,x_pos2, y_pos2,  x_pos3, y_pos3 ,ILI9341_RED,this_gpio);
					counter ++;
					pos8 = 1;
					board[8] = 'X';
					winner =  check_winner(this_spi,board,player,this_gpio);
				}
				else
				{
					board[8] = 'O';
					TFT_drawCircle(this_spi ,sq_centre_x,sq_centre_y, 30, ILI9341_BLUE, this_gpio);
					counter ++;
					pos8 = 1;
					winner = check_winner(this_spi,board,player,this_gpio);
				}
			}
			}
		}

	if (winner == 0 && counter >=9)
	{
		drawGame(this_spi,this_gpio);
	}
}

long
map
(
	uint16_t coord,
	uint16_t in_min,
	uint16_t in_max,
	uint16_t out_min,
	uint16_t out_max
)
{
	return (coord - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
}

void
drawGame
(
	spi_instance_t *this_spi,
	gpio_instance_t *this_gpio
)
{
    TFT_drawLine(this_spi, 50, 50,  190, 190 ,ILI9341_GREEN,this_gpio);
    TFT_drawLine(this_spi, 190, 50,  50, 190 ,ILI9341_GREEN,this_gpio);
    TFT_drawCircle(this_spi ,120,120, 100, ILI9341_GREEN, this_gpio);
}

uint8_t
check_winner
(
	spi_instance_t * this_spi,
	char board[],
	uint8_t player,
	gpio_instance_t * this_gpio
)
{
	if (board[0] == 'X' && board[3] == 'X' && board[6] == 'X')
	{
		TFT_drawLine(this_spi,0, 0,  240, 240 ,ILI9341_RED,this_gpio);
		TFT_drawLine(this_spi,240, 0,  0, 240 ,ILI9341_RED,this_gpio);
		return 1;
	}
	else if (board[1] == 'X' && board[4] == 'X' && board[7] == 'X')
	{
		TFT_drawLine(this_spi,0, 0,  240, 240 ,ILI9341_RED,this_gpio);
		TFT_drawLine(this_spi,240, 0,  0, 240 ,ILI9341_RED,this_gpio);
		return 1;
	}
	else if (board[2] == 'X' && board[5] == 'X' && board[8] == 'X')
	{
		TFT_drawLine(this_spi,0, 0,  240, 240 ,ILI9341_RED,this_gpio);
		TFT_drawLine(this_spi,240, 0,  0, 240 ,ILI9341_RED,this_gpio);
		return 1;
	}
	else if (board[0] == 'X' && board[1] == 'X' && board[2] == 'X')
	{
		TFT_drawLine(this_spi,0, 0,  240, 240 ,ILI9341_RED,this_gpio);
		TFT_drawLine(this_spi,240, 0,  0, 240 ,ILI9341_RED,this_gpio);
		return 1;
	}
	else if (board[3] == 'X' && board[4] == 'X' && board[5] == 'X')
	{
		TFT_drawLine(this_spi,0, 0,  240, 240 ,ILI9341_RED,this_gpio);
		TFT_drawLine(this_spi,240, 0,  0, 240 ,ILI9341_RED,this_gpio);
		return 1;
	}
	else if (board[6] == 'X' && board[7] == 'X' && board[8] == 'X')
	{
		TFT_drawLine(this_spi,0, 0,  240, 240 ,ILI9341_RED,this_gpio);
		TFT_drawLine(this_spi,240, 0,  0, 240 ,ILI9341_RED,this_gpio);
		return 1;
	}
	else if (board[0] == 'X' && board[4] == 'X' && board[8] == 'X')
	{
		TFT_drawLine(this_spi,0, 0,  240, 240 ,ILI9341_RED,this_gpio);
		TFT_drawLine(this_spi,240, 0,  0, 240 ,ILI9341_RED,this_gpio);
		return 1;
	}
	else if (board[2] == 'X' && board[4] == 'X' && board[6] == 'X')
	{
		TFT_drawLine(this_spi,0, 0,  240, 240 ,ILI9341_RED,this_gpio);
		TFT_drawLine(this_spi,240, 0,  0, 240 ,ILI9341_RED,this_gpio);
		return 1;
	}
	else if (board[0] == 'O' && board[3] == 'O' && board[6] == 'O')
	{
		TFT_drawCircle(this_spi ,120,120, 100, ILI9341_BLUE, this_gpio);
		return 1;
	}
	else if (board[1] == 'O' && board[4] == 'O' && board[7] == 'O')
	{
		TFT_drawCircle(this_spi ,120,120, 100, ILI9341_BLUE, this_gpio);
		return 1;
	}
	else if (board[2] == 'O' && board[5] == 'O' && board[8] == 'O')
	{
		TFT_drawCircle(this_spi ,120,120, 100, ILI9341_BLUE, this_gpio);
		return 1;
	}
	else if (board[0] == 'O' && board[1] == 'O' && board[2] == 'O')
	{
		TFT_drawCircle(this_spi ,120,120, 100, ILI9341_BLUE, this_gpio);
		return 1;
	}
	else if (board[3] == 'O' && board[4] == 'O' && board[5] == 'O')
	{
		TFT_drawCircle(this_spi ,120,120, 100, ILI9341_BLUE, this_gpio);
		return 1;
	}
	else if (board[6] == 'O' && board[7] == 'O' && board[8] == 'O')
	{
		TFT_drawCircle(this_spi ,120,120, 100, ILI9341_BLUE, this_gpio);
		return 1;
	}
	else if (board[0] == 'O' && board[4] == 'O' && board[8] == 'O')
	{
		TFT_drawCircle(this_spi ,120,120, 100, ILI9341_BLUE, this_gpio);
		return 1;
	}
	else if (board[2] == 'O' && board[4] == 'O' && board[6] == 'O')
	{
		TFT_drawCircle(this_spi ,120,120, 100, ILI9341_BLUE, this_gpio);
		return 1;
	}

	return 0;
}


uint8_t AIcheck_winner(char board[], uint8_t player)
{
	if (board[0] == 'X' && board[3] == 'X' && board[6] == 'X')
	{
    	return 1;
	}
	else if (board[1] == 'X' && board[4] == 'X' && board[7] == 'X')
	{
	    return 1;
	}
	else if (board[2] == 'X' && board[5] == 'X' && board[8] == 'X')
	{
    	return 1;
	}
	else if (board[0] == 'X' && board[1] == 'X' && board[2] == 'X')
	{
	    return 1;
	}
	else if (board[3] == 'X' && board[4] == 'X' && board[5] == 'X')
	{
	    return 1;
	}
	else if (board[6] == 'X' && board[7] == 'X' && board[8] == 'X')
	{
		return 1;
	}
	else if (board[0] == 'X' && board[4] == 'X' && board[8] == 'X')
	{
		return 1;
	}
	else if (board[2] == 'X' && board[4] == 'X' && board[6] == 'X')
	{
		return 1;
	}
	else if (board[0] == 'O' && board[3] == 'O' && board[6] == 'O')
	{
		return 1;
	}
	else if (board[1] == 'O' && board[4] == 'O' && board[7] == 'O')
	{
		return 1;
	}
	else if (board[2] == 'O' && board[5] == 'O' && board[8] == 'O')
	{
		return 1;
	}
	else if (board[0] == 'O' && board[1] == 'O' && board[2] == 'O')
	{
		return 1;
	}
	else if (board[3] == 'O' && board[4] == 'O' && board[5] == 'O')
	{
		return 1;
	}
	else if (board[6] == 'O' && board[7] == 'O' && board[8] == 'O')
	{
		return 1;
	}
	else if (board[0] == 'O' && board[4] == 'O' && board[8] == 'O')
	{
		return 1;
	}
	else if (board[2] == 'O' && board[4] == 'O' && board[6] == 'O')
	{
		return 1;
	}

return 0;
}


// -----------------------------------------------------------------------------

void
gameMenu
(
	spi_instance_t * this_spi,
	gpio_instance_t * this_gpio
)
{
	TFT_fillScreen(this_spi, this_gpio, ILI9341_WHITE);
	for (volatile uint16_t t=0x00;t <0xFF; t ++ );
	TFT_fastVLine(this_spi, 120, 0, 320, ILI9341_BLACK, this_gpio);
	TFT_fillrect(this_spi, 160,140, 40, 40,this_gpio,ILI9341_RED);
	TFT_fillrect(this_spi, 60,110, 40, 40,this_gpio,ILI9341_RED);
	TFT_fillrect(this_spi, 60,170, 40, 40,this_gpio,ILI9341_RED);
	uint16_t x, y;
	uint8_t z;
	uint8_t game = 0;
	while(game == 0)
	{
		if ( ((TS_readRegister8(this_spi, this_gpio,STMPE_TSC_CTRL) ) & 0x80))
		{
			TS_readData( this_spi, this_gpio, &x, &y, &z);
			x = map( x, TS_MINX, TS_MAXX, 0, TFT_WIDTH);
			y = map( y, TS_MINY, TS_MAXY, 0, TFT_HEIGHT);

			if (x <120)
			{
				game = 1;
				twoPlayerMode(this_spi, this_gpio);
			}
			else if (x > 120)
			{
				game = 1;
				singlePlayerMode(this_spi, this_gpio);
			}
		}
	}
}
