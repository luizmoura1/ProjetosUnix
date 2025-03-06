; Montagem: nasm -f elf64 hello.asm |-o hello.o|
; É desnecessário |-o hello.o| porque ld não prescinde de -o seguido pelo nome do executável
; Linkedição: ld |-s| hello.o -o hello        ; Alternativa: ld |-s| -o hello hello.o 
; Execução: ./hello
; O parâmetro -s é opcional e reduz o tamanho do executável, removendo símbolos de depuração.

	section .data
msg db "Olá, mundo!", 0x0A  		; string e quebra de linha
len equ $ - msg             		; tamanho da string

	section .text
	global _start

_start:
		mov 	rax, 1		; Código da syscall sys_write
    		mov 	rdi, 1       	; File descriptor 1 (stdout)
    		mov 	rsi, msg     	; Ponteiro para a mensagem
    		mov 	rdx, len     	; Tamanho da mensagem
    		syscall          	; Chama o kernel

		mov 	rax, 60      	; Código da syscall sys_exit
    		xor 	rdi, rdi     	; Código de saída 0
    		syscall          	; Chama o kernel

; Obs.: Sugestão do ChatGPT não funciona! 	
