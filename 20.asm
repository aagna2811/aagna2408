.model small

.data
    str1 db "abcde$"
    str2 db "abcdg$"
    same_str db "Same"
    not_same_str db "Not Same" 
    str1_len dw 5
    str2_len dw 5

.code   
    mov ax, 2h
    cmp ax, 5h ; Set zf=0   
    
    mov dx, data
    mov ds, dx
        
    mov si, offset str1
    mov di, offset str2
    mov cx, str1_len  
    mov bx, str2_len  
    
    cmp cx, bx
    jne NOT_SAME
    
    CHECK:        
        mov ax, [si]
        mov bx, [di]
        cmp ax, bx   
        jne NOT_SAME
        inc si
        inc di
    loop CHECK
    
    jmp SAME
    
SAME:
    mov di, offset same_str
    mov cx, 4
    
    PRINT1:    
        mov dx, [di]
        mov ah, 2
        int 33
        inc di  
    loop PRINT1
hlt    

NOT_SAME:
    mov di, offset not_same_str
    mov cx, 8
    
    PRINT2:    
        mov dx, [di]
        mov ah, 2
        int 33
        inc di  
    loop PRINT2
hlt     