/*
 * main.c
 *
 *  Created on: Nov 23, 2024
 *      Author: lpcarm
 */

#include "lcd.h"
#include "my_stdio.h"

#define LED1(x) (x==1? (PORTA|=1<<7):(PORTA&=~(1<<7)))

char buff[20],cnt;

int main()
{
	DDRA=0x00;
	lcd_init();
	//lcd_putchar('A');
	lcd_gotoxy(0,0);
	lcd_puts("MicroBlaze Test");
	delay_ms(1000);
	while(1)
	{
		sprintf(buff,"cnt=%u  ",cnt++);
		if(cnt==100)
			cnt=0;

		lcd_gotoxy(0,1);
		lcd_puts(buff);

		LED1(1);
		delay_ms(500);
		LED1(0);
		delay_ms(500);
	}
	return 0;
}




