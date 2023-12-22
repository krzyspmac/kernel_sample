; use SI as string parameter
print_string:
    pusha
    mov bx, 0007h            ; BH is DisplayPage, BL is GraphicsColor

print_string_loop:
    mov al, [si]            ; <<<<<<<
    cmp al, 0               ; if 0 then end
    je print_string_done
    mov ah, 0x0e            ; int=10/ah=0x0e -> BIOS teletype
    int 0x10                ; AL already contains the character

    inc si                  ; >>>>>>>
    jmp print_string_loop

print_string_done:
    popa
    ret
