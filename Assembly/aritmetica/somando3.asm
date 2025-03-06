%include 'library.inc'

section .text
global _start

_start:
    ; Exibe a mensagem e lê o primeiro número
    mov ecx, msg1
    mov edx, tmn1
    call write_output
    mov ecx, num1
    mov edx, 0x02
    call read_input
    
    ; Exibe a mensagem e lê o segundo número
    mov ecx, msg2
    mov edx, tmn2
    call write_output
    mov ecx, num2
    mov edx, 0x02
    call read_input
    
    ; Chama a função para somar os números
    call soma
    
    ; Exibe o resultado
    mov ecx, msg3
    mov edx, tmn3
    call write_output
    mov ecx, resultado   ; Usa 'resultado' em vez de 'soma'
    mov edx, 0x02        ; 2 bytes: resultado + LF
    call write_output
    
    ; Finaliza o programa
    mov eax, SYS_EXIT
    int SYS_CALL

; Função para escrever uma mensagem
write_output:
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    int SYS_CALL
    ret

; Função para ler a entrada do usuário
read_input:
    mov eax, SYS_READ
    mov ebx, STDIN
    int SYS_CALL
    ret

; Função para somar os números
soma:
    mov eax, [num1]         ; move num1 ao eax
    sub eax, '0'            ; converte ascii a número

    mov ebx, [num2]         ; move num2 ao ebx
    sub ebx, '0'            ; converte ascii a número

    add eax, ebx            ; soma os números
    add eax, '0'            ; converte número a ascii

    mov [resultado], eax    ; armazena a soma no buffer 'resultado'
    mov byte [resultado+1], 0x0a ; adiciona LF
    ret

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
resultado    resb    0x02        ; 2 bytes: resultado + LF
