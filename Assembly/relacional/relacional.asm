		section	.text
		global  _start                  
_start:
	mov	eax, [x]
	mov	ebx, [y]
	cmp	eax, ebx
	jg	maior
	mov	ecx, msg2
	mov	edx, tmn2
	jmp	final
	
maior:
	mov	ecx, msg1
	mov	edx, tmn1

final:
	mov	eax, SYS_WRITE
    mov	ebx, STDOUT
    int	SYS_CALL
    	
	mov	eax, SYS_EXIT
    int	SYS_CALL
    		
		segment	.data
LF			equ	0x0a
;eax
SYS_EXIT    equ	0x01
SYS_WRITE	equ	0x04
SYS_CALL	equ	0x80
;ebx
STDOUT		equ	0x01

		section	.data
x		dd	255
y		dd	15	
msg1	db	'X maior que Y', LF
tmn1	equ	$ - msg1
msg2	db	'Y maior que X', LF
tmn2	equ	$ - msg2


