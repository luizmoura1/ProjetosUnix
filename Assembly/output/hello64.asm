; nasm -f elf64 font.asm
; ld |-s| obj.o -o exe 
; ./exe
; [label]	opcode	[operand,]		[;comment]
 
	segment .data
LF		equ	0x0a
;eax
SYS_EXIT	equ	0x3c
SYS_WRITE	equ	0x01
;ebx
STDOUT		equ	0x01

	section .data
msg		db	"Oi, mundo!", LF	;string e quebra de linha
tmn		equ 	$ - msg         	;tamanho da string  
 
	section .text
	global  _start				;ponto de entrada                    

_start: 
    		mov 	rax, SYS_WRITE		;função escrever 
    		mov 	rdi, STDOUT		;argumento 1
    		mov 	rsi, msg    		;argumento 2
    		mov 	rdx, tmn		;argumento 3
    		syscall  	      		;chama kernel a executar a syscall em rax
 
    		mov 	rax, SYS_EXIT   	;função sair
    		xor 	rdi, rdi      		;argumento (0 = execução bem sucedida)
    		syscall 	       		;chama kernel a executar a syscall em rax
