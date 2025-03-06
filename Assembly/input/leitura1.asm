		segment	.data
LF		equ	0x0a
;eax
SYS_EXIT    	equ	0x01
SYS_READ	equ	0x03
SYS_WRITE	equ	0x04
SYS_CALL	equ	0x80
;ebx
STDIN		equ	0x00
STDOUT		equ	0x01
RET_EXIT	equ	0x00

		section	.data
msg		db	"Informe seu nome: ", LF
tmn		equ 	$ - msg

		section	.bss
nome		resb	0x01  
 
		section	.text
		global  _start				;ponto de entrada                   

_start: 
    		mov 	eax, SYS_WRITE		;função escrever 
    		mov 	ebx, STDOUT		;argumento 1
    		mov 	ecx, msg    		;argumento 2
    		mov 	edx, tmn		;argumento 3
    		int	SYS_CALL  	      	;chama kernel a executar a syscall em eax
 
    		mov 	eax, SYS_READ		;função ler 
    		mov 	ebx, STDIN		;argumento 1
    		mov 	ecx, nome    		;argumento 2
    		mov 	edx, 0x20		;argumento 3 - reservados 32 caracteres!
    		int	SYS_CALL  	      	;chama kernel a executar a syscall em eax

    		mov 	eax, SYS_EXIT   	;função sair
    		;xor 	ebx, ebx      		;argumento zerado (execução bem sucedida)
    		int	SYS_CALL	       	;chama kernel a executar a syscall em eax
