newline macro    
    mov dl,13  
    mov ah,2
    int 21h
                      
    mov dl,10  
    mov ah,2
    int 21h      
    newline endm
                                                                                             
print macro str
    lea dx,str
    mov ah,9
    int 21h
    print endm  

.model small
.stack 100h
.data 
  ast db '<----------------------------------------------------->$'
  PRO db '           SIMPLE CALCULATOR$'
  ABOUT DB '           PROJECT MADE BY:$'
  T DB '           MUHAMMAD TAHA JAMAL-2112244$'
  
  msg db 'Select operator + - / * or ESC key to exit: $'
  msg1 db 'FIRST 2 NUMBER MUST BE GREATER THAN LAST 2 NUMBERS.$'
  num1 db 'Enter first 2 digits:$'
  num2 db 'Enter last 2 digits:$'
  result db 'Result:$'
  quo db 'Quotient:$'
  rem db 'Remainder:$'
  again db 'Press Y to run again or ESC to terminate: $'
  INV DB 'ERROR:INVALID INPUT$'
.code

main proc

      mov ax,@data
      mov ds,ax 
      
      PRINT AST 
      NEWLINE
      PRINT PRO
      NEWLINE 
      NEWLINE
      PRINT ABOUT
      NEWLINE
      PRINT T
      NEWLINE
      PRINT S
      NEWLINE 
      PRINT H
      NEWLINE 
      PRINT AST
      NEWLINE
      

start:
      newline      
      print msg
      
      mov ah,1
      int 21h
      
      cmp al,'+'
      je adde           ;jl=jb-->Jump if less than
      cmp al,'-'
      je subbe          ;jle-->Jump Less than equal to  
      cmp al,'*'
      je mule
      cmp al,'/'
      je dive
      cmp al,27
      je exit
      
      jmp start
      
      
adde:
      newline
      
        print num1 
       
        mov ah,1
     int 21h
     
     CMP AL,'0'
        JL INVALID  ; IF LESS THAN 0 (ZERO)
        CMP AL,'9'
        JG  INVALID        ; IF GREATER THAN 0 (ZERO)
        
     sub al,48  
     
      mov ch,al
      
      
        mov ah,1
     int 21h
     
     CMP AL,'0'
        JL INVALID  ; IF LESS THAN 0 (ZERO)
        CMP AL,'9'
        JG  INVALID        ; IF GREATER THAN 0 (ZERO)
        
     sub al,48  
     
      mov cl,al
         
         MOV AX,CX
      AAD 
      MOV CX,00H
      MOV CX,AX
         
         NEWLINE
         PRINT NUM2
       
        mov ah,1
     int 21h
     
     CMP AL,'0'
        JL INVALID  ; IF LESS THAN 0 (ZERO)
        CMP AL,'9'
        JG  INVALID        ; IF GREATER THAN 0 (ZERO)
        
     sub al,48  
     
      mov bh,al
       
       
        mov ah,1
     int 21h
     
     CMP AL,'0'
        JL INVALID  ; IF LESS THAN 0 (ZERO)
        CMP AL,'9'
        JG  INVALID        ; IF GREATER THAN 0 (ZERO)
        
     sub al,48  
     
      mov bl,al  
      MOV AX,BX
        AAD    
        MOV BX,AX
        
        newline
       print result
      mov ax,cx
     
      
     ADD AX,BX  
     
     AAM
     
     MOV BX,00H
     MOV CX,00H
     MOV CL,AH
     MOV AH,00H
     AAM
     MOV BX,AX
     MOV AL,CL
     AAM
     MOV CX,AX
     
     
     MOV DL,CH
     ADD DL,'0'
     MOV AH,2
     INT 21H
     MOV DL,00H 
     
     
     MOV DL,CL
     ADD DL,'0'
     MOV AH,2
     INT 21H 
     
     MOV DL,BL
     ADD DL,'0'
     MOV AH,2
     INT 21H
         newline
      jmp end1  
      
subbe:
       NEWLINE
       PRINT MSG1
      newline
       print num1 
         
        mov ah,1
     int 21h
     
     CMP AL,'0'
        JL INVALID  ; IF LESS THAN 0 (ZERO)
        CMP AL,'9'
        JG  INVALID        ; IF GREATER THAN 0 (ZERO)
        
     sub al,48  
     
      mov ch,al
      
      
        mov ah,1
     int 21h
     
     CMP AL,'0'
        JL INVALID  ; IF LESS THAN 0 (ZERO)
        CMP AL,'9'
        JG  INVALID        ; IF GREATER THAN 0 (ZERO)
        
     sub al,48  
     
      mov cl,al
         
         MOV AX,CX
      AAD 
      MOV CX,00H
      MOV CX,AX
         
          newline 
       print num2
       
        mov ah,1
     int 21h
     
     CMP AL,'0'
        JL INVALID  ; IF LESS THAN 0 (ZERO)
        CMP AL,'9'
        JG  INVALID        ; IF GREATER THAN 0 (ZERO)
        
     sub al,48  
     
      mov bh,al
       
       
        mov ah,1
     int 21h
     
     CMP AL,'0'
        JL INVALID  ; IF LESS THAN 0 (ZERO)
        CMP AL,'9'
        JG  INVALID        ; IF GREATER THAN 0 (ZERO)
        
     sub al,48  
     
      mov bl,al  
      MOV AX,BX
        AAD    
        MOV BX,AX
        
      mov ax,cx
     
      
     SUB AX,BX
     AAM
     
     MOV BX,00H
     MOV BX,AX
       
        newline
       print result
       
     MOV DL,BH
     ADD DL,'0'
     MOV AH,2
     INT 21H
     MOV DL,00H 
     
     
     MOV DL,BL
     ADD DL,'0'
     MOV AH,2
     INT 21H
      jmp end1
      
dive: 
      NEWLINE
      PRINT MSG1
      newline 
      print num1
      
       mov ah,1
       int 21h
       CMP AL,'0'
        JL INVALID  ; IF LESS THAN 0 (ZERO)
        CMP AL,'9'
        JG  INVALID        ; IF GREATER THAN 0 (ZERO)
        
     sub al,48  
     
      mov ch,al
      
      
        mov ah,1
     int 21h
     
     CMP AL,'0'
        JL INVALID  ; IF LESS THAN 0 (ZERO)
        CMP AL,'9'
        JG  INVALID        ; IF GREATER THAN 0 (ZERO)
        
     sub al,48  
     
      mov cl,al
           
         MOV AX,CX
      AAD 
      MOV CX,00H
      MOV CX,AX
      
      newline
      print num2
      
       
        mov ah,1
     int 21h 
     
     CMP AL,'0'
        JL INVALID  ; IF LESS THAN 0 (ZERO)
        CMP AL,'9'
        JG  INVALID        ; IF GREATER THAN 0 (ZERO)
        
     sub al,48  
     
      mov bh,al
       
       
        mov ah,1
     int 21h 
     
     CMP AL,'0'
        JL INVALID  ; IF LESS THAN 0 (ZERO)
        CMP AL,'9'
        JG  INVALID        ; IF GREATER THAN 0 (ZERO)
        
     sub al,48  
     
      mov bl,al  
      MOV AX,BX
        AAD    
        MOV BX,AX
        
      mov ax,cx
     
      
     div bl
     
     
       mov bx,ax
     
      newline
      print rem
     
     ;code yahan se shrur hai
                                       ;16 division by 16 bit (successfull)
                                     ;al - quoti
         mov ax,00h
         mov ax,bx
         
         MOV CX,00H 
         mov dl,ah
         MOV BX,DX  ; SO REM IS IN BX 
         AAM  
         MOV CX,AX ; SO QUO IS IN CX 
          MOV AX,BX
          AAM
         
           ;NOW BX HAS REM
      
     
         MOV BX,AX
         
     mov dl,Bh
     add dl,48
     mov ah,2
     int 21h  
     
        mov dl,00
         
     mov dl,BL
          add dl,48   
            mov ah,2
            int 21h 
            
            
           newline
           print quo
             
          mov dl,Ch
          add dl,48
          mov ah,2 
          int 21h
         
           mov dl,Cl
          add dl,48
          mov ah,2 
          int 21h
      jmp end1
       
mule:
      
      newline 
      print num1
     
     mov ah,1
     int 21h
     
     CMP AL,'0'
        JL INVALID  ; IF LESS THAN 0 (ZERO)
        CMP AL,'9'
        JG  INVALID        ; IF GREATER THAN 0 (ZERO)
        
     sub al,48  
     
      mov ch,al
      
      
        mov ah,1
     int 21h 
     
     CMP AL,'0'
        JL INVALID  ; IF LESS THAN 0 (ZERO)
        CMP AL,'9'
        JG  INVALID        ; IF GREATER THAN 0 (ZERO)
        
     sub al,48  
     
      mov cl,al
         
         MOV AX,CX
      AAD 
      MOV CX,00H
      MOV CX,AX 
      
       newline
      print num2
       
        mov ah,1
     int 21h 
     
     CMP AL,'0'
        JL INVALID  ; IF LESS THAN 0 (ZERO)
        CMP AL,'9'
        JG  INVALID        ; IF GREATER THAN 0 (ZERO)
        
     sub al,48  
     
      mov bh,al
       
       
        mov ah,1
     int 21h 
     
     CMP AL,'0'
        JL INVALID  ; IF LESS THAN 0 (ZERO)
        CMP AL,'9'
        JG  INVALID        ; IF GREATER THAN 0 (ZERO)
        
     sub al,48  
     
      mov bl,al  
      MOV AX,BX
        AAD    
        MOV BX,AX
        
        newline
      print result
        
      mov ax,cx
     
      
     mul bx
       
      
     

call print_number
  main endp
; print_number function:
; input: value stored in AX
; output: value printed to the screen
print_number proc
    ; Convert the value in AX to its ASCII representation
    mov cx, 10  ; set up a loop counter
    mov bx, 0   ; clear the BX register
   
      jmp print_loop
print_loop:
    mov dx,00h  ; clear the DX register
    div cx      ; divide AX by CX and store the quotient in AL and the remainder in AH
    add dl, '0' ; convert the remainder to its ASCII representation
    push dx     ; push the ASCII character onto the stack
    inc bx      ; increment the loop counter
    cmp ax, 0   ; check if the quotient is zero
    jne print_loop  ; if not, repeat the loop
     jmp counter
; Print the ASCII characters
counter: 
mov cx,bx
print_chars:
    pop dx      ; pop the next ASCII character from the stack
    mov ah, 2   ; function 2: output character
    int 21h     
    loop print_chars  ; repeat until 4 digits or ans is out 
                  ; F repersents end   
print_number endp
      jmp end1
      
end1:       
      newline
      print again
      mov ah,1
      int 21h
      
      cmp al,'y'
      je start
      cmp al,'Y'
      je start
      cmp al,27
      je exit
      jmp end1   
      
      INVALID: 
       
       NEWLINE
       PRINT INV
      
      
exit:       
      mov ah,4ch
      int 21h
    

end main      
