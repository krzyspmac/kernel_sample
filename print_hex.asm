; use DX as string parameter
print_hex:
    pusha                   ; save all registers

    mov cx, 4               ; counter; we'll be printing 4 characters
                            ; 4 bits per char, so 16 in total

print_hex_loop:
    dec cx                  ; decrement the coutner

    mov ax, dx              ; copy DX into AX so that we can mask the last bytes
    shr dx, 4               ; shift dx 4 bytes to the right
    and ax, 0xf             ; mask ax to get the last 4 bits

    mov bx, HEX_OUT         ; set bx to the address of our string
    add bx, 2               ; skip '0x'
    add bx, cx              ; add the current counter to the address

    cmp ax, 0xa             ; check if it's a letter or number
    jl print_hex_set_letter ; if it's a number go set a value
    add al, 0x27            ; If it's a letter, add 0x27, and plus 0x30 down below
                            ; ASCII letters start 0x61 for "a" characters after 
                            ; decimal numbers. We need to cover that distance. 
    jl print_hex_set_letter
    

print_hex_set_letter:
    add al, 0x30            ; for and ASCII number, add 0x30
    mov byte [bx], al       ; Add the value of the byte to the char at bx

    cmp cx, 0               ; check the counter and compare with 0
    je print_hex_done       ; finish is 0
    jmp print_hex_loop      ; otherwise loop again

print_hex_done:
    mov si, HEX_OUT         ; print out the string pointed by si
    call print_string

    popa
    ret

; global variables
HEX_OUT: db '0x0000',0      ; null-terminated string to temporarily store hex str

