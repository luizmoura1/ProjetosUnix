		segment	.data
LF		equ	0x0a
;eax
SYS_EXIT    	equ	0x01          		;código da syscall sys_exit
SYS_WRITE	equ	0x04			;código da syscall sys_write
SYS_CALL	equ	0x80
;ebx
STDOUT		equ	0x01			;descritor de arquivo (fd)

		section	.data
msg1		db	"Oi, programadores!", LF	;string e quebra de linha
tmn1		equ 	$ - msg1         	;tamanho da string  
msg2		db	"Bem-vindo ao mundo da ", LF	;string e quebra de linha
tmn2		equ 	$ - msg2         	;tamanho da string  
msg3		db	"programação em assembly do Linux!", LF	;string e quebra de linha
tmn3		equ 	$ - msg3         	;tamanho da string  
 
		section	.text
		global  _start				;ponto de entrada                   

_start: 
    		mov 	eax, SYS_WRITE		;função escrever 
    		mov 	ebx, STDOUT		;argumento 1
    		mov 	ecx, msg1    		;argumento 2
    		mov 	edx, tmn1		;argumento 3
    		int	SYS_CALL  	      	;chama kernel a executar a syscall em eax
 
    		mov 	eax, SYS_WRITE		;função escrever 
    		mov 	ebx, STDOUT		;argumento 1
    		mov 	ecx, msg2    		;argumento 2
    		mov 	edx, tmn2		;argumento 3
    		int	SYS_CALL  	      	;chama kernel a executar a syscall em eax

    		mov 	eax, SYS_WRITE		;função escrever 
    		mov 	ebx, STDOUT		;argumento 1
    		mov 	ecx, msg3    		;argumento 2
    		mov 	edx, tmn3		;argumento 3
    		int	SYS_CALL  	      	;chama kernel a executar a syscall em eax

    		mov 	eax, SYS_EXIT   	;função sair
    		xor 	ebx, ebx      		;argumento zerado (execução bem sucedida)
    		int	SYS_CALL	       	;chama kernel a executar a syscall em eax
