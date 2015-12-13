CC	= arm-linux-gnueabihf-gcc
CFLAGS	= -O1 -Wall -pthread -static -g

objects = atomic.o mutex.o

default: atomic

.PHONY: default clean

atomic: $(objects)
	$(CC) $(CFLAGS) -o$@ $^	

atomic.o: atomic.c
mutex.o: mutex.s

%.o: %.c
	$(CC) -c $(CFLAGS) -o $@ $<

%.o: %.s
	$(CC) -c $(CFLAGS) -o $@ $<
 
clean:
	rm -f $(objects) atomic

qemu: atomic
	qemu-arm ./atomic
	#arm-none-eabi-gdb -x gdbscript atomic
