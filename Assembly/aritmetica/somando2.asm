%include 'library.inc'

section .text
global _start
_start:
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg1
    mov edx, tmn1
    int SYS_CALL

    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, num1
    mov edx, 0x02
    int SYS_CALL

    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg2
    mov edx, tmn2
    int SYS_CALL

    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, num2
    mov edx, 0x02
    int SYS_CALL

    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg3
    mov edx, tmn3
    int SYS_CALL

    mov al, [num1]          ;move primeiro byte de num1 ao al, ignora LF
    sub al, '0'             ;converte ascii a número
    mov ah, 0x00            ;limpa o registrador

    mov bl, [num2]          ;move primeiro byte de num2 ao bl, ignora LF
    sub bl, '0'             ;converte ascii a número
    mov bh, 0x00            ;limpa o registrador

    add ax, bx              ;soma os números
    cmp ax, 0x0a            ;compara a soma com 10
    jl print_one_digit

    mov dl, 0x0a            ;separa dezenas e unidades
    div dl                  ;ah = unidade (resto), al = dezena (quociente)

    add al, '0'             ;converte dezena a ascii
    mov [soma], al          ;armazena no buffer

    add ah, '0'             ;converte unidade a ascii
    mov [soma+1], ah        ;armazena no buffer
    mov byte [soma+2], 0x0a ;adiciona LF ao final

    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, soma
    mov edx, 0x03
    int SYS_CALL
    jmp exit

    print_one_digit:
    add al, '0'             ;converte dígito único a ASCII
    mov [soma], al          ;armazena no buffer
    mov byte [soma+1], 0x0A ;adiciona LF no final

    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, soma
    mov edx, 0x02
    int SYS_CALL

exit:
    mov eax, SYS_EXIT
    int SYS_CALL

section .data
msg1    db "Digite um número: ", LF
tmn1    equ $ - msg1
msg2    db "Digite outro número: ", LF
tmn2    equ $ - msg2
msg3    db "Soma: ", LF
tmn3    equ $ - msg3

section .bss
num1    resb    0x02
num2    resb    0x02
soma    resb    0x03        ;suporta 2 dígitos + LF
