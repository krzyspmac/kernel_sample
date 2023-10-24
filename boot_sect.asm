;
;   A simple boot sector program that starts and loops
;

loop:                               ; Label for loop, used to allow infite
                                    ; looping; the idea is so that we never
    jmp loop                        ; end the program once started

times 510-($-$$) db 0               ; Add padding to 512 bytes

dw 0xaa55                           ; Last two bytes (1 word) is the magic
                                    ; number that informs BIOS that is is
                                    ; indeed the boot sector
