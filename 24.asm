.model small

.data
    arr db 1, 7, 2, 5, 4  
    temp db 1 dup(?)
    len db 5

.code   
    mov dx, data
    mov ds, dx
    
    call SORT
    hlt
    
    SORT proc     
        mov cl, len
        mov di, 0 
        OUTER_LOOP:
            mov dl, cl              ; dl counter for outer loop
            mov cl, len             ; cl counter for inner loop
            dec cl                  ; Point to last index
            mov di, 0               ; Set pointer to 0
            INNER_LOOP:    
                mov al, arr[di]
                sub al, arr[di+1]
                jc SWAP             ; jc DESC, jnc ASC
                SKIPSWAP::
                    inc di
            loopnz INNER_LOOP 
            mov cl, dl              ; Here cl=0. Do cl=dl or else it will exit loop             
        loopnz OUTER_LOOP           ; cl=cl-1     
        ret     
    SORT endp  
         
    SWAP:
        mov al, arr[di]
        mov bl, arr[di+1]
            
        mov temp, al
        mov al, bl
        mov bl, temp     
            
        mov arr[di], al
        mov arr[di+1], bl
        jmp SKIPSWAP
