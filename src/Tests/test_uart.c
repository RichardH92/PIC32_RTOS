#define _SUPPRESS_PLIB_WARNING
#define _DISABLE_OPENADC10_CONFIGPORT_WARNING

#include <plib.h>

#pragma config FPLLMUL = MUL_24, FPLLIDIV = DIV_2, FPLLODIV = DIV_2, FWDTEN = OFF
#pragma config POSCMOD = HS, FNOSC = PRIPLL, FPBDIV = DIV_2
#define SYSCLK (72000000)
#define PBCLK (SYSCLK/2)
#define DESIRED_BAUDRATE (9600)
#define BAUD_VALUE ((PBCLK/16/DESIRED_BAUDRATE)-1)

int main(void) {
    SYSTEMConfigPerformance(SYSCLK);
    OpenUART1(UART_EN, UART_RX_ENABLE | UART_TX_ENABLE, BAUD_VALUE);
    mPORTAClearBits(BIT_7);
    mPORTASetPinsDigitalOut(BIT_7);

    putsUART1("Testing UART.\r\n");
 	putsUART1("Test Finished.\r\n");
    
    return 0;
}