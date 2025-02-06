#ifndef __LCD_H__
#define __LCD_H__

#include <stdint.h>

#define PORTA (*(uint32_t *)0x81400000)
#define DDRA (*(uint32_t *)0x81400004)

#define RS(x) (x==1? (PORTA|=1<<4):(PORTA&=~(1<<4)))
#define RW(x) (x==1? (PORTA|=1<<5):(PORTA&=~(1<<5)))
#define EN(x) (x==1? (PORTA|=1<<6):(PORTA&=~(1<<6)))
#define D4(x) (x==1? (PORTA|=1<<0):(PORTA&=~(1<<0)))
#define D5(x) (x==1? (PORTA|=1<<1):(PORTA&=~(1<<1)))
#define D6(x) (x==1? (PORTA|=1<<2):(PORTA&=~(1<<2)))
#define D7(x) (x==1? (PORTA|=1<<3):(PORTA&=~(1<<3)))

#define DRS(x) (x==0 ? (DDRA|=1<<4):(DDRA&=~(1<<4)))
#define DRW(x) (x==0 ? (DDRA|=1<<5):(DDRA&=~(1<<5)))
#define DEN(x) (x==0 ? (DDRA|=1<<6):(DDRA&=~(1<<6)))
#define DD4(x) (x==0 ? (DDRA|=1<<0):(DDRA&=~(1<<0)))
#define DD5(x) (x==0 ? (DDRA|=1<<1):(DDRA&=~(1<<1)))
#define DD6(x) (x==0 ? (DDRA|=1<<2):(DDRA&=~(1<<2)))
#define DD7(x) (x==0 ? (DDRA|=1<<3):(DDRA&=~(1<<3)))

void delay_ms(uint32_t x);
void delay_us(uint32_t x);
void lcd_init(void);
void CGRAM_init(uint8_t x,const uint8_t *p);
void lcd_command(uint8_t cmd);
void lcd_data(uint8_t dat);
void lcd_update_pins(uint8_t x);
void lcd_clear(void);
void lcd_putuint8_t(uint8_t x);
void lcd_putsf(const char *p);
void lcd_puts(char *p);
void lcd_gotoxy(uint8_t col,uint8_t row);


void lcd_putuint8_t(uint8_t x)
{
	lcd_data(x);
}

void lcd_putsf(const char *p)
{
	while(*p!=0)lcd_putuint8_t(*p++);
}

void lcd_puts(char *p)
{
	while(*p!=0)lcd_putuint8_t(*p++);
}

void lcd_gotoxy(uint8_t col,uint8_t row)
{
	if(row==1)//row2
		col|=0x40;
	lcd_command(0x80|col);
}

void lcd_init(void)
{
	DRS(1);
	DRW(1);
	DEN(1);
	DD4(1);
	DD5(1);
	DD6(1);
	DD7(1);
	RS(0);
	RW(0);
	EN(0);
	delay_ms(500);

	lcd_update_pins(0x3);//function set for 8 bit mode
	delay_ms(50);
	lcd_update_pins(0x3);//function set for 8 bit mode
	delay_ms(50);
	lcd_update_pins(0x3);//function set for 8 bit mode
	delay_ms(50);
	lcd_update_pins(0x3);//function set for 8 bit mode
	delay_ms(50);

	lcd_update_pins(0x2);//function set for 4 bit mode
	delay_ms(1);
	lcd_command(0x28);//function set (4bit, dual line)
	lcd_command(0x0C);//0xC display on 0xE cursor on 0xF blink and cursor 0xd bilink
	lcd_clear();
}

void CGRAM_init(uint8_t x,const uint8_t *p)
{
	uint8_t i;
	for(i=0;i<8;i++)
	{
		lcd_command((0x40|(x*8))+i);
		lcd_data(*p);
		p++;
	}
}

void lcd_clear(void)
{
	lcd_command(0x01);//lcd clear
	delay_ms(2);
}

void lcd_command(uint8_t cmd)
{
	RS(0);
	RW(0);
	lcd_update_pins(cmd>>4);
	lcd_update_pins(cmd);
	delay_us(50);
}

void lcd_data(uint8_t dat)
{
	RS(1);
	RW(0);
	lcd_update_pins(dat>>4);
	lcd_update_pins(dat);
	delay_us(50);
}

void lcd_update_pins(uint8_t x)
{
	D4(x%2);
	x=x>>1;//taghsim bar 2
	D5(x%2);
	x=x>>1;//taghsim bar 2
	D6(x%2);
	x=x>>1;//taghsim bar 2
	D7(x%2);
	EN(1);
	EN(0);//at least 450ns
}

void delay_us(uint32_t x)
{
	int i;
	x=x*300;
	for(i=0;i<x;i++);
}

void delay_ms(uint32_t x)
{
	uint32_t i,j;
	for(j=0;j<x;j++)
	{
		for(i=0;i<6000;i++);
	}
}

#endif
