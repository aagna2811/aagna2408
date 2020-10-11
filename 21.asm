.model small

.data
    number db 21

.code   
    mov dx, data
    mov ds, dx
        
    mov al, number      ; Set number
    
    cmp al, 2           ; If number = 2
    je PRIME
    
    cmp al, 1           ; If number = 1
    je NPNC
    
    mov bl, 2           ; Divisor
    div bl    
    
    mov cl, al          ; Count     
    
    CHECK:                          
        mov ax, 0
        mov al, number  ; Set number
        div bl
        cmp ah, 0       ; Check Remainder  
        je  NOT_PRIME
        inc bl
    loop CHECK
    
    jmp PRIME
    
PRIME:
    mov dx, "1"
    mov ah, 2
    int 33  
hlt    

NOT_PRIME:
    mov dx, "0"
    mov ah, 2
    int 33
hlt   

NPNC:
    mov dx, "2"
    mov ah, 2
    int 33
hlt   
