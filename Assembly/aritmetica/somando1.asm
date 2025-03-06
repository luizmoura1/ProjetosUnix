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

    mov eax, [num1]         ;move num1 ao eax
    sub eax, '0'            ;converte ascii a número

    mov ebx, [num2]         ;move num2 ao ebx
    sub ebx, '0'            ;converte ascii a número

    add eax, ebx            ;soma os números
    add eax, '0'            ;converte número a ascii

    mov [soma], eax         ;armazena a soma no buffer
    mov byte [soma+1], 0x0a ;adiciona LF

    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, soma
    mov edx, 0x02           ;2 bytes: resultado + LF
    int SYS_CALL

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
soma    resb    0x02        ;2 bytes: resultado + LF
