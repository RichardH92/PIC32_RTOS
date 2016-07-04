#CC = "/opt/microchip/xc32/v1.40/bin/xc32-gcc"
CC = "/Applications/microchip/xc32/v1.40/bin/xc32-gcc"
#CFLAGS1 = -g -x c -c -mprocessor=32MX795F512L -MMD -MF
CFLAGS1 = -g -c -mprocessor=32MX795F512L -MMD -MF
CFLAGS2 = -mprocessor=32MX795F512L -o
B2H = "/opt/microchip/xc32/v1.40/bin"/xc32-bin2hex

all: k_thread

k_thread: context_switch
	$(CC) $(CFLAGS1) k_thread.o.d -o k_thread.o k_thread.c
#	$(CC) $(CFLAGS2) main.elf main.o
#	$(B2H) main.elf

context_switch: 
	$(CC) $(CFLAGS1) context_switch.o.d -o context_switch.o context_switch.S
#clean:
#	rm *.o.d *.o *.elf *.hex Tests/*.o.d Tests/*.o Tests/*.elf Tests/*.result Tests/*.hex
