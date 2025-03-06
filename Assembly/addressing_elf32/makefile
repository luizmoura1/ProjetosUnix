NOME = leitura

all: $(NOME).o
	ld -s -m elf_i386 $(NOME).o -o $(NOME)
	rm -rf *.o;
	
%.o: %.asm
	nasm -f elf $< 
