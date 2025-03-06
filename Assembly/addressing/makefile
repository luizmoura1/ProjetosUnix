NOME = addressing

all: $(NOME).o
	ld -s $(NOME).o -o $(NOME)
	rm -rf *.o;
	
%.o: %.asm
	nasm -f elf64 $< 
