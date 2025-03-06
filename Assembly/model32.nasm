		section	.text
		global  _start                  
_start: 

    	mov 	eax, SYS_EXIT
    	xor 	ebx, ebx
    	int	SYS_CALL
    		
		segment	.data
LF		equ	0x0a
;eax
SYS_EXIT    	equ	0x01
SYS_READ	equ	0x03
SYS_WRITE	equ	0x04
SYS_CALL	equ	0x80
;ebx
STDIN		equ	0x00
STDOUT		equ	0x01
RET_EXIT	equ	0x00

		section	.data

		section	.bss

