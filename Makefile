MCU = atmega32
CC = avr-gcc
CFLAGS = -Wall -Os -mmcu=$(MCU)

SRC ?=

all:
	@if [ -z "$(SRC)" ]; then \
		echo "Usage: make SRC=path/to/file.c"; \
	else \
		$(CC) $(CFLAGS) $(SRC) -o build.elf; \
		avr-objcopy -O ihex build.elf build.hex; \
	fi

clean:
	rm -f *.elf *.hex
