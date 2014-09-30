CC	= arm-linux-gnueabihf-gcc
CFLAGS	= -O0 -Wall -g
LDFLAGS = -fno-stack-protector

objects	= fibseq.o fib.o

default: fibseq

.PHONY: default clean qemu

fibseq: $(objects)
	$(CC) $(LDFLAGS) -o $@ $^

fib.o: fib.s
fibseq.o: fibseq.c

%.o: %.c
	$(CC) -c $(CFLAGS) -o $@ $<

%.o: %.s
	$(CC) -c $(CFLAGS) -o $@ $<

clean:
	rm -f $(objects) fibseq

QEMU_CMD = qemu-arm -g 1234 -L /usr/arm-linux-gnueabihf ./fibseq &
CMD = yes 9 | $(call QEMU_CMD) && sleep 1
qemu: fibseq
	
	@yes 7 | $(call QEMU_CMD)
	#@sleep 1
	#@yes 1 | $(call QEMU_CMD)
	#@sleep 1
	#@yes 2 | $(call QEMU_CMD)
	#@sleep 1
	#@yes 3 | $(call QEMU_CMD)
	#@sleep 1
	#@yes 4 | $(call QEMU_CMD)
	#@sleep 1
	#@yes 5 | $(call QEMU_CMD)
	#@sleep 1
	#@yes 6 | $(call QEMU_CMD)
	#@sleep 1
	#@yes 7 | $(call QEMU_CMD)
	#@sleep 1
	#@yes 8 | $(call QEMU_CMD)
	#@sleep 1
	#@yes 9 | $(call QEMU_CMD)
	#@sleep 1
	#@yes 10 | $(call QEMU_CMD)
	#@sleep 1
	#@yes 11 | $(call QEMU_CMD)
	#@sleep 1
	#@yes 12 | $(call QEMU_CMD)
	#@sleep 1
	#@yes 13 | $(call QEMU_CMD)
	#@sleep 1
	#@yes 14 | $(call QEMU_CMD)
	#@sleep 1
	#@yes 15 | $(call QEMU_CMD)
	#@sleep 1
	#@yes 16 | $(call QEMU_CMD)
	#@sleep 1
	#@yes 17 | $(call QEMU_CMD)
	#@sleep 1
	#@yes 18 | $(call QEMU_CMD)
	#@sleep 1
	#@yes 19 | $(call QEMU_CMD)
	#@sleep 1
	#@yes 20 | $(call QEMU_CMD)
	#@sleep 1
	#@yes 21 | $(call QEMU_CMD)
	#@sleep 1
	#@yes 22 | $(call QEMU_CMD)
	#@sleep 1
	#@yes 23 | $(call QEMU_CMD)
	#@sleep 1
	#@yes 24 | $(call QEMU_CMD)
	#@sleep 1
	arm-none-eabi-gdb -x gdbscript fibseq
	