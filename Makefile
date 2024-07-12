FNAME=test
TARGET=runme

.DEFAULT_GOAL := start

start : $(FNAME).o
	ld $(FNAME).o -o $(TARGET)

$(FNAME).o : $(FNAME).asm
	nasm -f elf64 $(FNAME).asm -o $(FNAME).o

clean :
	rm -f *.o $(TARGET)