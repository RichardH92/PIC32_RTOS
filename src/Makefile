CC = "/opt/microchip/xc32/v1.40/bin/xc32-gcc"
CFLAGS1 = -g -x c -c -mprocessor=32MX795F512L -MMD -MF
CFLAGS2 = -mprocessor=32MX795F512L -o
B2H = "/opt/microchip/xc32/v1.40/bin"/xc32-bin2hex

include Tests/Make.tests

all:
	$(CC) $(CFLAGS1) main.o.d -o main.o main.c
	$(CC) $(CFLAGS2) main.elf main.o
	$(B2H) main.elf

clean:
	rm *.o.d *.o *.elf *.hex Tests/*.o.d Tests/*.o Tests/*.elf Tests/*.result Tests/*.hex
