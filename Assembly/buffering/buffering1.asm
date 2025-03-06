%include 'library1.inc'

section .text
global _start
_start:
    lea esi, [BUFFER]
    add esi, 0x09
    mov byte [esi], 0x0a

    dec esi
    mov dl, 0x4a
    add dl, '0'     ;decimal 74 0x4a + 0x30 = 0x7a  'z'
    mov [esi], dl

    dec esi
    mov dl, 0x39
    add dl, '0'     ;decimal 57 0x39 + 0x69 = 0x69  'i'
    mov [esi], dl

    dec esi
    mov dl, 0x45
    add dl, '0'     ;decimal 69 0x45 + 0x30 = 0x75  'u'
    mov [esi], dl

    dec esi
    mov dl, 0x1c    ;decimal 28 0x1c + 0x30 = 0x4c  'L'
    add dl, '0'
    mov [esi], dl

    call write_output

    mov eax, SYS_EXIT
    int SYS_CALL