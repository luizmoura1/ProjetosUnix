%include 'library1.inc'

section .text
global _start
_start:
    lea esi, [BUFFER]
    add esi, 0x09
    mov byte [esi], 0x0a

    dec esi
    mov byte [esi], 'z'

    dec esi
    mov byte [esi], 'i'

    dec esi
    mov byte [esi], 'u'

    dec esi
    mov byte [esi], 'L'

    call write_output

    mov eax, SYS_EXIT
    int SYS_CALL