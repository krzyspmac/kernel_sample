;
;   A simple boot sector program that starts and loops
;

;
; Print a message to screen
;

    mov ah, 0x0e                    ; int 10/ah = 0eh -> scrolling teletype

    mov al, 'H'
    int 0x10
    mov al, 'e'
    int 0x10
    mov al, 'l'
    int 0x10
    mov al, 'l'
    int 0x10
    mov al, 'o'
    int 0x10
    mov al, '!'
    int 0x10

loop:                               ; Label for loop, used to allow infite
    jmp loop                         ; looping; the idea is so that we never
                                    ; end the program once started

    times 510-($-$$) db 0           ; Add padding to 512 bytes

dw 0xaa55                           ; Last two bytes (1 word) is the magic
                                    ; number that informs BIOS that is is
                                    ; indeed the boot sector
