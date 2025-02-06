/*
 * main.c
 *
 *  Created on: Nov 22, 2024
 *      Author: lpcarm
 */


#include <stdint.h>
#define PORTA (*(uint32_t *)0x81400000)
#define DDRA (*(uint32_t *)0x81400004)

void delay(uint32_t x);
void set_7seg_data(uint8_t data);
void set_7seg_select(uint8_t select);

const uint8_t ss_code[]=
{
	0xFC,0x60,0xDA,0xF2,0x66,0xB6,0xBE,0xE0,
	0xFE,0xF6,0xEE,0x3E,0x9C,0x7A,0x9E,0x8E
};
uint8_t cnt;

int main()
{
	DDRA=0x0000F0;
	set_7seg_select(0x1F);
	while(1)
	{
		set_7seg_data(~ss_code[cnt]);
		cnt++;
		if(cnt>15)
			cnt=0;
		delay(4000);
	}
	return 0;
}

void set_7seg_data(uint8_t data)
{
	PORTA&=0x3FFF;
	PORTA|=data<<14;
}

void set_7seg_select(uint8_t select)
{
	PORTA&=0x3FC0FF;
	PORTA|=select<<8;
}

void delay(uint32_t x)
{
	uint32_t i,j;
	for(j=0;j<x;j++)
	{
		for(i=0;i<1000;i++);
	}
}
