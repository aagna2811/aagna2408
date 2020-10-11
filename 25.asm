                                                           
.model small

.data
    num dw 5

.code   
    mov dx, data
    mov ds, dx  
    mov di, 3000h
    
    mov [di], 0
    inc di
    
    mov [di], 1
    inc di
    
    mov cx, num
    CALL_FIB:
        call FIB      
        inc di
    loop CALL_FIB
    hlt
    
    FIB proc     
        mov al, [di-1]
        mov bl, [di-2]
        
        add al, bl
        mov [di], al
        ret       
    FIB endp