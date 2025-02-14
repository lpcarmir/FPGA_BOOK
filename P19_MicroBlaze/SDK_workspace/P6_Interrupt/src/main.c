/*
 * main.c
 *
 *  Created on: Nov 22, 2024
 *      Author: lpcarm
 */


#include <stdint.h>

#include <xbasic_types.h>
#include "xil_printf.h"
#include "xparameters.h"
#include "xintc.h"
#include "xil_exception.h"

#define PORTA (*(uint32_t *)0x81400000)
#define DDRA (*(uint32_t *)0x81400004)

#define LED1(x) (x==1? (PORTA|=1<<0):(PORTA&=~(1<<0)))

#define RXREG   (*((int *)0x84000000))
#define TXREG   (*((int *)0x84000004))
#define STATUS  (*((int *)0x84000008))
#define CONTROL (*((int *)0x8400000C))

void delay(uint32_t x);
void interrupt(void *CallbackRef);

uint8_t x,flagLed;
XIntc InterruptController;
int Status;

int main()
{
	//microblaze_register_handler((XInterruptHandler)interrupt,(void *)0);
	//microblaze_enable_interrupts();
	DDRA=0x0000F0;

	Status = XIntc_Initialize(&InterruptController, XPAR_INTC_0_DEVICE_ID);
	// Connect the interrupt handler to the ISR
	Status = XIntc_Connect(&InterruptController, XPAR_INTC_0_UARTLITE_1_VEC_ID,
	(XInterruptHandler)interrupt, 0);
	// Start the interrupt controller
	Status = XIntc_Start(&InterruptController, XIN_REAL_MODE);
	// Enable interrupts in the MicroBlaze processor
	XIntc_Enable(&InterruptController, XPAR_INTC_0_UARTLITE_1_VEC_ID);
	Xil_ExceptionInit();
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
	(Xil_ExceptionHandler)XIntc_InterruptHandler,
	&InterruptController);

	Xil_ExceptionEnable();
	print("Waiting for interrupt\n\r");

	CONTROL|=0x10;

	while(1)
	{

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

void interrupt(void *CallbackRef)
{
	if(flagLed)
		flagLed=0;
	else
		flagLed=1;
	LED1(flagLed);
	delay(200);

	if((STATUS & (1<<0))==1)
	{
		x=RXREG;
		TXREG=x;
		//print("interrupt!\n\r");
	}
}
