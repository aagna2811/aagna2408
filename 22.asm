                                                               
.model small

.data
    number dw 7

.code   
    mov dx, data
    mov ds, dx
        
    mov cx, number      ; Set number
    mov ax, 1           ; Stores n!
    mov bx, 1           ; Stores n
    mov di, 0           ; Stores sum
    
    SF:
        mul bx
        add di, ax
        inc bx
    loop SF     
    
    mov cx, 4
    mov bx, 16
    mov ax, di
    GET_NUM:            ; Divide result by 16(base) and push in stack
        div bx
        push dx 
    loop GET_NUM
    
    mov cx, 4
    PRINT_NUM:          ; pop from stack and print
        pop ax
        mov dx, "0"
        add dx, ax
        mov ah, 2  
        int 33    
    loop PRINT_NUM
hlt  
