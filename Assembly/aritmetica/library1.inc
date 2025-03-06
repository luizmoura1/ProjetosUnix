; library1.inc - Biblioteca com funções de escrita e leitura

		segment	.data
LF			equ	0x0a
SYS_EXIT    equ	0x01
SYS_READ	equ	0x03
SYS_WRITE	equ	0x04
SYS_CALL	equ	0x80
STDIN		equ	0x00
STDOUT		equ	0x01
RET_EXIT	equ	0x00

TMN_BUFFER	equ	0x0a

		segment	.bss
BUFFER		resb	0x02		; Definindo um buffer de 2 bytes (ex: para entrada)
								; Buffer para entrada/saída (2 bytes: 1 caractere + LF)

		segment	.text
global write_output, read_input, exit_program

; Função para escrever uma mensagem (msg) com tamanho especificado
write_output:
		mov	eax, SYS_WRITE
		mov	ebx, STDOUT
		;mov	ecx, BUFFER			; Mensagem armazenada em BUFFER
		;mov	edx, TMN_BUFFER		; Tamanho da mensagem
		int	SYS_CALL
		ret

; Função para ler uma entrada do usuário e armazenar no buffer
read_input:
		mov	eax, SYS_READ
		mov	ebx, STDIN
		mov	ecx, BUFFER			; Buffer de entrada
		mov	edx, 1				; Tamanho do buffer  (TMN_BUFFER)
		int	SYS_CALL
		ret

exit_program:
    mov eax, SYS_EXIT
    mov ebx, RET_EXIT
    int SYS_CALL



