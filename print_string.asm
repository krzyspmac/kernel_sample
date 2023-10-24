; use BX as string parameter
print_string:
    pusha
    mov bx, 0007h            ; BH is DisplayPage, BL is GraphicsColor

start:
    mov al, [si]            ; <<<<<<<
    cmp al, 0               ; if 0 then end
    je done
    mov ah, 0x0e            ; int=10/ah=0x0e -> BIOS teletype
    int 0x10                ; AL already contains the character

    inc si                  ; >>>>>>>
    jmp start

done:
    popa
    ret
