		section	.text
		global  _start				;ponto de entrada                   

_start: 
    		mov 	eax, SYS_WRITE		;função escrever 
    		mov 	ebx, STDOUT		;argumento 1
    		mov 	ecx, msg1    		;argumento 2
    		mov 	edx, tmn1		;argumento 3
    		int	SYS_CALL  	      	;chama kernel a executar a syscall em eax
 
    		mov 	eax, SYS_READ		;função ler 
    		mov 	ebx, STDIN		;argumento 1
    		mov 	ecx, num    		;argumento 2
    		mov 	edx, 0x05		;argumento 3 - reservados 0x05 caracteres!
    		int	SYS_CALL  	      	;chama kernel a executar a syscall em eax

    		mov 	eax, SYS_WRITE		;função escrever 
    		mov 	ebx, STDOUT		;argumento 1
    		mov 	ecx, msg2    		;argumento 2
    		mov 	edx, tmn2		;argumento 3
    		int	SYS_CALL  	      	;chama kernel a executar a syscall em eax

    		mov 	eax, SYS_WRITE		;função escrever 
    		mov 	ebx, STDOUT		;argumento 1
    		mov 	ecx, num    		;argumento 2
    		mov 	edx, 0x05		;argumento 3
    		int	SYS_CALL  	      	;chama kernel a executar a syscall em eax

    		mov 	eax, SYS_EXIT   	;função sair
    		;xor 	ebx, ebx      		;argumento zerado (execução bem sucedida)
    		int	SYS_CALL	       	;chama kernel a executar a syscall em eax
    		
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
msg1		db	"Digite um número: ", LF
tmn1		equ 	$ - msg1
msg2		db	"Número digitado: ", LF
tmn2		equ 	$ - msg2

		section	.bss
num		resb	0x05  
 

