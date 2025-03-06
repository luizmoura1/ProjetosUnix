%include 'library1.inc'

section .text
global _start
_start:
    lea esi, [BUFFER]
    mov byte [esi], 'L'

    inc esi
    mov byte [esi], 'u'

    inc esi
    mov byte [esi], 'i'

    inc esi
    mov byte [esi], 'z'

    inc esi
    mov byte [esi], 0x0a

    call write_output

    mov eax, SYS_EXIT
    int SYS_CALL