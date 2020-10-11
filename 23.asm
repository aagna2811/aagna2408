
.model small

.data
    num dw 5

.code   
    mov dx, data
    mov ds, dx
    
    mov ax, num
    call C     
    hlt
    
    S proc     
        mov bx, num
        mul bx
        ret     
    S endp
    
    C proc     
        call S
        mul bx
        ret     
    C endp  
