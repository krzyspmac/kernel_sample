;
; Boot sector program that prints a starting sting
;

[org 0x7c00]                        ; Tell where this code starts in memory

    mov si, HELLO_MSG               ; Use SI as function parameter
    call print_string

    jmp $

%include "print_string.asm"

; Data
HELLO_MSG:
    db `Hello, World!`, 0           ; null-terminated string

; Padding and magic number
    times 510-($-$$) db 0
    dw 0xaa55
