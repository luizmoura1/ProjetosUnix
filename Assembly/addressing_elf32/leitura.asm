section .data
    prompt db 'Digite algo: ', 0xA
    prompt_len equ $ - prompt
    buffer db 100              ; Buffer para armazenar a entrada
    buffer_len equ $ - buffer

section .text
    global _start

_start:
    ; Exibir o prompt
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, prompt_len
    int 0x80

    ; Ler a entrada do usuário
    mov eax, 3
    mov ebx, 0
    mov ecx, buffer
    mov edx, buffer_len
    int 0x80

    ; Exibir a entrada do usuário
    mov eax, 4
    mov ebx, 1
    mov ecx, buffer
    mov edx, buffer_len
    int 0x80

    ; Sair do programa
    mov eax, 1
    xor ebx, ebx
    int 0x80