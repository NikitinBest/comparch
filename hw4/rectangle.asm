global areaOfRectangle: function
global inputRectangle: function
global printRectangle: function

extern fprintf                                          ; near
extern __isoc99_fscanf                                  ; near


SECTION .text                                           ; section number 1, code

areaOfRectangle:
        endbr64                                         
        push    rbp                                     
        mov     rbp, rsp                                
        mov     qword [rbp-8H], rdi                     
        mov     rax, qword [rbp-8H]                     
        mov     edx, dword [rax+8H]                     
        mov     rax, qword [rbp-8H]                     
        mov     eax, dword [rax]                        
        mov     ecx, edx                                
        sub     ecx, eax                                
        mov     rax, qword [rbp-8H]                     
        mov     edx, dword [rax+4H]                     
        mov     rax, qword [rbp-8H]                     
        mov     eax, dword [rax+0CH]                    
        sub     edx, eax                                
        mov     eax, edx                                
        imul    eax, ecx                                
        cdq                                             
        xor     eax, edx                                
        sub     eax, edx                                
        cvtsi2sd xmm0, eax                              
        pop     rbp                                     
        ret                                             


inputRectangle:
        endbr64                                         
        push    rbp                                     
        mov     rbp, rsp                                
        sub     rsp, 32                                 
        mov     qword [rbp-18H], rdi                    
        mov     qword [rbp-20H], rsi                    
        mov     rax, qword [rbp-18H]                    
        lea     rdi, [rax+0CH]                          
        mov     rax, qword [rbp-18H]                    
        lea     rsi, [rax+8H]                           
        mov     rax, qword [rbp-18H]                    
        lea     rcx, [rax+4H]                           
        mov     rdx, qword [rbp-18H]                    
        mov     rax, qword [rbp-20H]                    
        mov     r9, rdi                                 
        mov     r8, rsi                                 
        lea     rsi, [rel cformat3]
        mov     rdi, rax                                
        mov     eax, 0                                  
        call    __isoc99_fscanf                         
        mov     rax, qword [rbp-18H]                    
        mov     edx, dword [rax]                        
        mov     rax, qword [rbp-18H]                    
        mov     eax, dword [rax+8H]                     
        cmp     edx, eax                                
        jle     changeX                                   
        mov     rax, qword [rbp-18H]                    
        mov     eax, dword [rax]                        
        mov     dword [rbp-4H], eax                     
        mov     rax, qword [rbp-18H]                    
        mov     edx, dword [rax+8H]                     
        mov     rax, qword [rbp-18H]                    
        mov     dword [rax], edx                        
        mov     rax, qword [rbp-18H]                    
        mov     edx, dword [rbp-4H]                     
        mov     dword [rax+8H], edx                     
changeX:  mov     rax, qword [rbp-18H]                    
        mov     edx, dword [rax+4H]                     
        mov     rax, qword [rbp-18H]                    
        mov     eax, dword [rax+0CH]                    
        cmp     edx, eax                                
        jge     changeY                                   
        mov     rax, qword [rbp-18H]                    
        mov     eax, dword [rax+4H]                     
        mov     dword [rbp-8H], eax                     
        mov     rax, qword [rbp-18H]                    
        mov     edx, dword [rax+0CH]                    
        mov     rax, qword [rbp-18H]                    
        mov     dword [rax+4H], edx                     
        mov     rax, qword [rbp-18H]                    
        mov     edx, dword [rbp-8H]                     
        mov     dword [rax+0CH], edx                    
changeY:  nop                                             
        leave                                           
        ret                                             


printRectangle:
        endbr64                                         
        push    rbp                                     
        mov     rbp, rsp                                
        sub     rsp, 16                                 
        mov     qword [rbp-8H], rdi                     
        mov     qword [rbp-10H], rsi                    
        mov     rax, qword [rbp-8H]                     
        mov     rdi, rax                                
        call    areaOfRectangle                         
        mov     rax, qword [rbp-10H]                    
        lea     rdx, [rel fout1]
        lea     rsi, [rel fout2]
        mov     rdi, rax                                
        mov     eax, 1                                  
        call    fprintf                                 
        mov     rax, qword [rbp-8H]                     
        mov     ecx, dword [rax+4H]                     
        mov     rax, qword [rbp-8H]                     
        mov     edx, dword [rax]                        
        mov     rax, qword [rbp-10H]                    
        mov     r8d, ecx                                
        mov     ecx, edx                                
        lea     rdx, [rel rout1]
        lea     rsi, [rel fout4]
        mov     rdi, rax                                
        mov     eax, 0                                  
        call    fprintf                                 
        mov     rax, qword [rbp-8H]                     
        mov     ecx, dword [rax+0CH]                    
        mov     rax, qword [rbp-8H]                     
        mov     edx, dword [rax+8H]                     
        mov     rax, qword [rbp-10H]                    
        lea     r9, [rel fout5]
        mov     r8d, ecx                                
        mov     ecx, edx                                
        lea     rdx, [rel rout2]
        lea     rsi, [rel cformat2]
        mov     rdi, rax                                
        mov     eax, 0                                  
        call    fprintf                                 
        nop                                             
        leave                                           
        ret                                             


SECTION .rodata                                            ; section number 4, const


cformat2:                                                  ; %s %i %i%s
        db 25H, 73H, 20H, 25H, 69H, 20H, 25H, 69H       
        db 25H, 73H, 00H                                

cformat3:                                                  ; %i %i %i %i
        db 25H, 69H, 20H, 25H, 69H, 20H, 25H, 69H       
        db 20H, 25H, 69H, 00H, 00H, 00H, 00H, 00H       

rout1:                                                  ; ; Coordinates of left-top point:
        db 3BH, 20H, 43H, 6FH, 6FH, 72H, 64H, 69H       
        db 6EH, 61H, 74H, 65H, 73H, 20H, 6FH, 66H       
        db 20H, 6CH, 65H, 66H, 74H, 2DH, 74H, 6FH       
        db 70H, 20H, 70H, 6FH, 69H, 6EH, 74H, 3AH       
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       

rout2:                                                  ; ; Coordinates of right-bottom point:
        db 3BH, 20H, 43H, 6FH, 6FH, 72H, 64H, 69H       
        db 6EH, 61H, 74H, 65H, 73H, 20H, 6FH, 66H       
        db 20H, 72H, 69H, 67H, 68H, 74H, 2DH, 62H       
        db 6FH, 74H, 74H, 6FH, 6DH, 20H, 70H, 6FH       
        db 69H, 6EH, 74H, 3AH, 00H, 00H, 00H, 00H       

