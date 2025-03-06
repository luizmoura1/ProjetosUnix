; nasm -f elf64 font.asm	Poderia ser elf ou elf32, mas evita |-m elf_i386| no linkeditor
; ld |-s| obj.o -o exe 
; ./exe
; [label]	opcode	[operand,]		[;comment]
 
		segment	.data
LF		equ	0x0a
;eax
SYS_EXIT    	equ	0x01          		;código da syscall sys_exit
SYS_WRITE	equ	0x04			;código da syscall sys_write
SYS_CALL	equ	0x80
;ebx
STDOUT		equ	0x01			;descritor de arquivo (fd)

		section	.data
msg		db	"Oi, mundo!", LF	;string e quebra de linha
tmn		equ 	$ - msg         	;tamanho da string  
 
		section	.text
		global  _start				;ponto de entrada                   

_start: 
    		mov 	eax, SYS_WRITE		;função escrever 
    		mov 	ebx, STDOUT		;argumento 1
    		mov 	ecx, msg    		;argumento 2
    		mov 	edx, tmn		;argumento 3
    		int	SYS_CALL  	      	;chama kernel a executar a syscall em eax
 
    		mov 	eax, SYS_EXIT   	;função sair
    		xor 	ebx, ebx      		;argumento zerado (execução bem sucedida)
    		int	SYS_CALL	       	;chama kernel a executar a syscall em eax
