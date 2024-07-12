ASM_FILES := $(wildcard *.asm)
OBJ_FILES := $(ASM_FILES:.asm=.o)
TARGET := runme

.DEFAULT_GOAL := $(TARGET)

$(TARGET): $(OBJ_FILES)
	ld $(OBJ_FILES) -o $(TARGET)

%.o: %.asm
	nasm -f elf64 $< -o $@

clean:
	rm -f $(OBJ_FILES) $(TARGET)
