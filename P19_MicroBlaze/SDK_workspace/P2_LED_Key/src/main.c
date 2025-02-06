/*
 * main.c
 *
 *  Created on: Nov 22, 2024
 *      Author: lpcarm
 */

#include <stdint.h>
#define PORTA (*(uint32_t *)0x81400000)
#define DDRA (*(uint32_t *)0x81400004)

#define LED1(x) (x==1? (PORTA|=1<<0):(PORTA&=~(1<<0)))
#define LED2(x) (x==1? (PORTA|=1<<1):(PORTA&=~(1<<1)))
#define LED3(x) (x==1? (PORTA|=1<<2):(PORTA&=~(1<<2)))
#define LED4(x) (x==1? (PORTA|=1<<3):(PORTA&=~(1<<3)))

#define KEY1 ((PORTA & (1<<4))>>4)
#define KEY2 ((PORTA & (1<<5))>>5)
#define KEY3 ((PORTA & (1<<6))>>6)
#define KEY4 ((PORTA & (1<<7))>>7)

void delay(uint32_t x);

int main()
{
	DDRA=0x0000F0;
	while(1)
	{
		LED1(!KEY1);
		LED2(!KEY2);
		LED3(!KEY3);
		LED4(!KEY4);
		delay(20);
	}
	return 0;
}

void delay(uint32_t x)
{
	uint32_t i,j;
	for(j=0;j<x;j++)
	{
		for(i=0;i<1000;i++);
	}
}
