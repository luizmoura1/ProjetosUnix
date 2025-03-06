; library2.inc - Biblioteca com funções de escrita e leitura

		segment	.data
LF			equ	0x0a
SYS_EXIT    equ	0x01
SYS_READ	equ	0x03
SYS_WRITE	equ	0x04
SYS_CALL	equ	0x80
STDIN		equ	0x00
STDOUT		equ	0x01
RET_EXIT	equ	0x00


%macro write_output 3
    ; Parâmetros: 1=mensagem, 2=tamanho da mensagem, 3=descrição do buffer
    mov eax, SYS_WRITE       ; Chamada do sistema para escrever
    mov ebx, STDOUT          ; Saída padrão
    mov ecx, %1              ; Mensagem
    mov edx, %2              ; Tamanho da mensagem
    int SYS_CALL
%endmacro

%macro read_input 2
    ; Parâmetros: 1=buffer, 2=tamanho do buffer
    mov eax, SYS_READ        ; Chamada do sistema para ler
    mov ebx, STDIN           ; Entrada padrão
    mov ecx, %1              ; Buffer de entrada
    mov edx, %2              ; Tamanho do buffer
    int SYS_CALL
%endmacro
