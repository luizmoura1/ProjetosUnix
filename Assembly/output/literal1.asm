; nasm -f elf64 font.asm			'Script gerando erro - VERIFICAR MELHOR
; ld |-s| obj.o -o exe 
; ./exe
; [label]	opcode	[operand,]		[;comment]
 
	section .data
	SYS_WRITE	equ	0x01			
	SYS_EXIT    	equ	0x3c          		
	STDOUT		equ	0x01			
	hello		db	"Oi, mundo!", 0x0a, 0x00	
	salve		db	"Oi, pessoal.", 0x0a, 0x00
	hi		db	"Ei, ", 0x00
	pergunta	db	". Como vai?", 0x0a, 0x00
	desculpa	db	"Oops, desculpe-me por ter escrito seu nome com inicial minúscula.", 0x0a, 0x00
	tmn		equ 	$ - hello         	 
 
	section .bss
	user	resb	0x40
		 
	section .text
	global  _start
	extern getenv
	extern printf                   

_start: 
		mov	rdi, hello
		call	print_string
		
		mov	rdi, salve
		call	print_string

		mov	rdi, hi
		call	print_string

		mov	rdi, getenv_user
		call	print_string

		mov	rdi, pergunta
		call	print_string

		mov	rdi, desculpa
		call	print_string

    		mov 	rax, SYS_EXIT
    		xor 	rdi, rdi      		
    		syscall
    		
getenv_user:
		mov	rdi, user
		call	getenv
		ret
		
print_string:
    		mov 	rax, SYS_WRITE 
    		mov 	rdi, STDOUT
    		mov 	rsi, rdi
    		mov 	rdx, tmn
    		syscall
    		ret
		

    		 	       		
