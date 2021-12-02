global Input: function
global Output: function
global area: function
global PrintColor: function

extern fprintf                                          ; near
extern __isoc99_fscanf                                  ; near


SECTION .text                                           ; section number 1, code


Input:  
        endbr64                                         
        push    rbp                                     
        mov     rbp, rsp                                
        sub     rsp, 16                                 
        mov     qword [rbp-8H], rdi                     
        mov     qword [rbp-10H], rsi                    
        mov     rax, qword [rbp-8H]                     
        mov     eax, dword [rax]                        
        cmp     eax, 2                                  
        jz      intria
        cmp     eax, 2                                  
        ja      inerr
        test    eax, eax                                
        jz      incirc
        cmp     eax, 1                                  
        jz      inrect
        jmp     inerr

incirc:  mov     rax, qword [rbp-8H]
        lea     rdx, [rax+8H]                           
        mov     rax, qword [rbp-10H]                    
        mov     rsi, rax                                
        mov     rdi, rdx                                
        call    inputCircle                             
        jmp     inout

inrect:  mov     rax, qword [rbp-8H]
        lea     rdx, [rax+8H]                           
        mov     rax, qword [rbp-10H]                    
        mov     rsi, rax                                
        mov     rdi, rdx                                
        call    inputRectangle                          
        jmp     inout

intria:  mov     rax, qword [rbp-8H]
        lea     rdx, [rax+8H]                           
        mov     rax, qword [rbp-10H]                    
        mov     rsi, rax                                
        mov     rdi, rdx                                
        call    inputTriangle                           
        jmp     inout

inerr:  lea     rdi, [rel figerr]
        call    puts                                    
        nop                                             
inout:  leave
        ret                                             

Output: 
        endbr64                                         
        push    rbp                                     
        mov     rbp, rsp                                
        sub     rsp, 16                                 
        mov     qword [rbp-8H], rdi                     
        mov     qword [rbp-10H], rsi                    
        mov     rax, qword [rbp-8H]                     
        mov     eax, dword [rax]                        
        cmp     eax, 2                                  
        je      outtria
        cmp     eax, 2                                  
        ja      outerr
        test    eax, eax                                
        jz      outcirc
        cmp     eax, 1                                  
        jz      outrect
        jmp     outerr

outcirc:  mov     rax, qword [rbp-10H]
        mov     rcx, rax                                
        mov     edx, 24                                 
        mov     esi, 1                                  
        lea     rdi, [rel figout1]
        call    fwrite                                  
        mov     rax, qword [rbp-8H]                     
        lea     rdx, [rax+4H]                           
        mov     rax, qword [rbp-10H]                    
        mov     rsi, rax                                
        mov     rdi, rdx                                
        call    PrintColor                              
        mov     rax, qword [rbp-8H]                     
        lea     rdx, [rax+8H]                           
        mov     rax, qword [rbp-10H]                    
        mov     rsi, rax                                
        mov     rdi, rdx                                
        call    printCircle                             
        jmp     outret

outrect:  mov     rax, qword [rbp-10H]
        mov     rcx, rax                                
        mov     edx, 24                                 
        mov     esi, 1                                  
        lea     rdi, [rel figout2]
        call    fwrite                                  
        mov     rax, qword [rbp-8H]                     
        lea     rdx, [rax+4H]                           
        mov     rax, qword [rbp-10H]                    
        mov     rsi, rax                                
        mov     rdi, rdx                                
        call    PrintColor                              
        mov     rax, qword [rbp-8H]                     
        lea     rdx, [rax+8H]                           
        mov     rax, qword [rbp-10H]                    
        mov     rsi, rax                                
        mov     rdi, rdx                                
        call    printRectangle                          
        jmp     outret

outtria:  mov     rax, qword [rbp-10H]
        mov     rcx, rax                                
        mov     edx, 24                                 
        mov     esi, 1                                  
        lea     rdi, [rel figout3]
        call    fwrite                                  
        mov     rax, qword [rbp-8H]                     
        lea     rdx, [rax+4H]                           
        mov     rax, qword [rbp-10H]                    
        mov     rsi, rax                                
        mov     rdi, rdx                                
        call    PrintColor                              
        mov     rax, qword [rbp-8H]                     
        lea     rdx, [rax+8H]                           
        mov     rax, qword [rbp-10H]                    
        mov     rsi, rax                                
        mov     rdi, rdx                                
        call    printTriangle                           
        jmp     outret

outerr:  lea     rdi, [rel figerr2]
        call    puts                                    
        nop                                             
outret:  leave
        ret                                             


area:   
        endbr64                                         
        push    rbp                                     
        mov     rbp, rsp                                
        sub     rsp, 8                                  
        mov     qword [rbp-8H], rdi                     
        mov     rax, qword [rbp-8H]                     
        mov     eax, dword [rax]                        
        cmp     eax, 2                                  
        jz      triaarea
        cmp     eax, 2                                  
        ja      areaerr
        test    eax, eax                                
        jz      circarea
        cmp     eax, 1                                  
        jz      rectarea
        jmp     areaerr

circarea:  mov     rax, qword [rbp-8H]
        add     rax, 8                                  
        mov     rdi, rax                                
        call    areaOfCircle                            
        jmp     arearet

rectarea:  mov     rax, qword [rbp-8H]
        add     rax, 8                                  
        mov     rdi, rax                                
        call    areaOfRectangle                         
        jmp     arearet

triaarea:  mov     rax, qword [rbp-8H]
        add     rax, 8                                  
        mov     rdi, rax                                
        call    areaOfTriangle                          
        jmp     arearet

areaerr:  pxor    xmm0, xmm0
arearet:  leave
        ret                                             


PrintColor:
        endbr64                                         
        push    rbp                                     
        mov     rbp, rsp                                
        sub     rsp, 16                                 
        mov     qword [rbp-8H], rdi                     
        mov     qword [rbp-10H], rsi                    
        mov     rax, qword [rbp-8H]                     
        mov     eax, dword [rax]                        
        cmp     eax, 6                                  
        je      pcol7
        cmp     eax, 6                                  
        ja      pcout
        cmp     eax, 5                                  
        je      pcol6
        cmp     eax, 5                                  
        ja      pcout
        cmp     eax, 4                                  
        je      pcol5
        cmp     eax, 4                                  
        ja      pcout
        cmp     eax, 3                                  
        je      pcol4
        cmp     eax, 3                                  
        ja      pcout
        cmp     eax, 2                                  
        jz      pcol3
        cmp     eax, 2                                  
        ja      pcout
        test    eax, eax                                
        jz      pcol1
        cmp     eax, 1                                  
        jz      pcol2
        jmp     pcout

pcol1:  mov     rax, qword [rbp-10H]
        mov     rcx, rax                                
        mov     edx, 6                                  
        mov     esi, 1                                  
        lea     rdi, [rel col1]
        call    fwrite                                  
        jmp     pcout

pcol2:  mov     rax, qword [rbp-10H]
        mov     rcx, rax                                
        mov     edx, 6                                  
        mov     esi, 1                                  
        lea     rdi, [rel col2]
        call    fwrite                                  
        jmp     pcout

pcol3:  mov     rax, qword [rbp-10H]
        mov     rcx, rax                                
        mov     edx, 6                                  
        mov     esi, 1                                  
        lea     rdi, [rel col3]
        call    fwrite                                  
        jmp     pcout

pcol4:  mov     rax, qword [rbp-10H]
        mov     rcx, rax                                
        mov     edx, 6                                  
        mov     esi, 1                                  
        lea     rdi, [rel col4]
        call    fwrite                                  
        jmp     pcout

pcol5:  mov     rax, qword [rbp-10H]
        mov     rcx, rax                                
        mov     edx, 6                                  
        mov     esi, 1                                  
        lea     rdi, [rel col5]
        call    fwrite                                  
        jmp     pcout

pcol6:  mov     rax, qword [rbp-10H]
        mov     rcx, rax                                
        mov     edx, 6                                  
        mov     esi, 1                                  
        lea     rdi, [rel col6]
        call    fwrite                                  
        jmp     pcout

pcol7:  mov     rax, qword [rbp-10H]
        mov     rcx, rax                                
        mov     edx, 6                                  
        mov     esi, 1                                  
        lea     rdi, [rel col7]
        call    fwrite                                  
        nop                                             
pcout:  nop
        leave                                           
        ret                                             



SECTION .rodata

fout1:                                                  ; Area:
        db 3BH, 20H, 41H, 72H, 65H, 61H, 3AH, 20H
        db 00H

fout2:                                                  ; %s %f
        db 25H, 73H, 20H, 25H, 66H, 00H

fout4:                                                  ; %s %i %i
        db 25H, 73H, 20H, 25H, 69H, 20H, 25H, 69H
        db 00H

fout5:                                                  ; ;/n
        db 3BH, 0AH, 00H

figerr:                                                  ; Figure-type error in input file
        db 46H, 69H, 67H, 75H, 72H, 65H, 2DH, 74H       
        db 79H, 70H, 65H, 20H, 65H, 72H, 72H, 6FH       
        db 72H, 20H, 69H, 6EH, 20H, 69H, 6EH, 70H       
        db 75H, 74H, 20H, 66H, 69H, 6CH, 65H, 00H       

figout1:                                                  ; Type: Circle;    Color:
        db 54H, 79H, 70H, 65H, 3AH, 20H, 43H, 69H       
        db 72H, 63H, 6CH, 65H, 3BH, 20H, 20H, 20H       
        db 20H, 43H, 6FH, 6CH, 6FH, 72H, 3AH, 20H       
        db 00H                                          

figout2:                                                  ; Type: Rectangle; Color:
        db 54H, 79H, 70H, 65H, 3AH, 20H, 52H, 65H       
        db 63H, 74H, 61H, 6EH, 67H, 6CH, 65H, 3BH       
        db 20H, 43H, 6FH, 6CH, 6FH, 72H, 3AH, 20H       
        db 00H                                          

figout3:                                                  ; Type: Triangle;  Color:
        db 54H, 79H, 70H, 65H, 3AH, 20H, 54H, 72H       
        db 69H, 61H, 6EH, 67H, 6CH, 65H, 3BH, 20H       
        db 20H, 43H, 6FH, 6CH, 6FH, 72H, 3AH, 20H       
        db 00H, 00H, 00H, 00H, 00H, 00H                 

figerr2:                                                  ; Figure-type error in output file
        db 46H, 69H, 67H, 75H, 72H, 65H, 2DH, 74H       
        db 79H, 70H, 65H, 20H, 65H, 72H, 72H, 6FH       
        db 72H, 20H, 69H, 6EH, 20H, 6FH, 75H, 74H       
        db 70H, 75H, 74H, 20H, 66H, 69H, 6CH, 65H       
        db 00H                                          

col1:                                                  ; RED
        db 52H, 45H, 44H, 20H, 20H, 20H, 00H            

col2:                                                  ; ORANGE
        db 4FH, 52H, 41H, 4EH, 47H, 45H, 00H            

col3:                                                  ; YELLOW
        db 59H, 45H, 4CH, 4CH, 4FH, 57H, 00H            

col4:                                                  ; GREEN
        db 47H, 52H, 45H, 45H, 4EH, 20H, 00H            

col5:                                                  ; BLUE
        db 42H, 4CH, 55H, 45H, 20H, 20H, 00H            

col6:                                                  ; INDIGO
        db 49H, 4EH, 44H, 49H, 47H, 4FH, 00H            

col7:                                                  ; PURPLE
        db 50H, 55H, 52H, 50H, 4CH, 45H, 00H            

