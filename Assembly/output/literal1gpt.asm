section .data
    hello	db	"Olá, mundo!", 10, 0
    salve	db	"Oi, pessoal.", 10, 0
    prefix	db	 "Ei, ", 0
    pergunta	db	". Como vai?", 10, 0
    desculpa	db	"Oops, desculpe-me por ter escrito seu nome com inicial minúscula.", 10, 0

section .bss
    user	resb 64

section .text
    global _start
    extern getenv
    extern printf

_start:
    mov		rdi, hello
    call	print_string

    mov		rdi, salve
    call	print_string

    mov		rdi, prefix
    call	print_string
    
    mov		rdi, getenv_user
    call	print_string
    
    mov		rdi, pergunta
    call	print_string

    mov		rdi, desculpa
    call	print_string

    mov		rdi, prefix
    call	print_string
    
    mov		rdi, getenv_user
    call	print_string
    
    mov		rdi, pergunta
    call	print_string

    mov		rax, 60
    xor		rdi, rdi
    syscall

getenv_user:
    mov 	rdi, user
    call 	getenv
    ret

print_string:
    mov 	rax, 0x02000004
    mov 	rdi, 1
    mov 	rsi, rdi
    mov 	rdx, 64
    syscall
    ret

;para variar, sugestão do ChatGPT não funciona!
