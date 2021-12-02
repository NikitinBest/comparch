global areaOfTriangle: function
global inputTriangle: function
global printTriangle: function

extern fprintf                                          ; near
extern __isoc99_fscanf                                  ; near


SECTION .text                                           ; section number 1, code


areaOfTriangle:
        endbr64                                         
        push    rbp                                     
        mov     rbp, rsp                                
        mov     qword [rbp-8H], rdi                     
        mov     rax, qword [rbp-8H]                     
        mov     edx, dword [rax]                        
        mov     rax, qword [rbp-8H]                     
        mov     eax, dword [rax+10H]                    
        sub     edx, eax                                
        mov     ecx, edx                                
        mov     rax, qword [rbp-8H]                     
        mov     edx, dword [rax+0CH]                    
        mov     rax, qword [rbp-8H]                     
        mov     eax, dword [rax+14H]                    
        sub     edx, eax                                
        mov     eax, edx                                
        imul    ecx, eax                                
        mov     edx, ecx                                
        mov     rax, qword [rbp-8H]                     
        mov     ecx, dword [rax+4H]                     
        mov     rax, qword [rbp-8H]                     
        mov     eax, dword [rax+14H]                    
        mov     esi, ecx                                
        sub     esi, eax                                
        mov     rax, qword [rbp-8H]                     
        mov     ecx, dword [rax+8H]                     
        mov     rax, qword [rbp-8H]                     
        mov     eax, dword [rax+10H]                    
        sub     ecx, eax                                
        mov     eax, ecx                                
        imul    eax, esi                                
        sub     edx, eax                                
        mov     eax, edx                                
        cvtsi2sd xmm1, eax                              
        movsd   xmm0, qword [rel half]
        mulsd   xmm0, xmm1                              
        movq    xmm1, qword [rel fabs]
        andpd   xmm0, xmm1                              
        pop     rbp                                     
        ret                                             


inputTriangle:
        endbr64                                         
        push    rbp                                     
        mov     rbp, rsp                                
        sub     rsp, 16                                 
        mov     qword [rbp-8H], rdi                     
        mov     qword [rbp-10H], rsi                    
        mov     rax, qword [rbp-8H]                     
        lea     rdi, [rax+14H]                          
        mov     rax, qword [rbp-8H]                     
        lea     rsi, [rax+10H]                          
        mov     rax, qword [rbp-8H]                     
        lea     r9, [rax+0CH]                           
        mov     rax, qword [rbp-8H]                     
        lea     r8, [rax+8H]                            
        mov     rax, qword [rbp-8H]                     
        lea     rcx, [rax+4H]                           
        mov     rdx, qword [rbp-8H]                     
        mov     rax, qword [rbp-10H]                    
        push    rdi                                     
        push    rsi                                     
        lea     rsi, [rel rectformat]
        mov     rdi, rax                                
        mov     eax, 0                                  
        call    __isoc99_fscanf                         
        add     rsp, 16                                 
        nop                                             
        leave                                           
        ret                                             


printTriangle:
        endbr64                                         
        push    rbp                                     
        mov     rbp, rsp                                
        sub     rsp, 16                                 
        mov     qword [rbp-8H], rdi                     
        mov     qword [rbp-10H], rsi                    
        mov     rax, qword [rbp-8H]                     
        mov     rdi, rax                                
        call    areaOfTriangle                          
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
        lea     rdx, [rel tout]
        lea     rsi, [rel fout4]                        
        mov     rdi, rax                                
        mov     eax, 0                                  
        call    fprintf                                 
        mov     rax, qword [rbp-8H]                     
        mov     ecx, dword [rax+0CH]                    
        mov     rax, qword [rbp-8H]                     
        mov     edx, dword [rax+8H]                     
        mov     rax, qword [rbp-10H]                    
        mov     r8d, ecx                                
        mov     ecx, edx                                
        lea     rdx, [rel tout1]
        lea     rsi, [rel fout4]                        
        mov     rdi, rax                                
        mov     eax, 0                                  
        call    fprintf                                 
        mov     rax, qword [rbp-8H]                     
        mov     ecx, dword [rax+14H]                    
        mov     rax, qword [rbp-8H]                     
        mov     edx, dword [rax+10H]                    
        mov     rax, qword [rbp-10H]                    
        lea     r9, [rel fout5]                         
        mov     r8d, ecx                                
        mov     ecx, edx                                
        lea     rdx, [rel tout2]
        lea     rsi, [rel cformat2]
        mov     rdi, rax                                
        mov     eax, 0                                  
        call    fprintf                                 
        nop                                             
        leave                                           
        ret                                             


SECTION .rodata                                         ; section number 4, const


rectformat:
        db 25H, 69H, 20H, 25H, 69H, 20H, 25H, 69H       ; %i %i %i %i %i %i
        db 20H, 25H, 69H, 20H, 25H, 69H, 20H, 25H       
        db 69H, 00H                                     

tout:
        db 3BH, 20H, 43H, 6FH, 6FH, 72H, 64H, 69H       ; ; Coordinates of first point:
        db 6EH, 61H, 74H, 65H, 73H, 20H, 6FH, 66H       
        db 20H, 66H, 69H, 72H, 73H, 74H, 20H, 70H       
        db 6FH, 69H, 6EH, 74H, 3AH, 00H, 00H            

tout1:
        db 3BH, 20H, 43H, 6FH, 6FH, 72H, 64H, 69H       ; ; Coordinates of second point:
        db 6EH, 61H, 74H, 65H, 73H, 20H, 6FH, 66H       
        db 20H, 73H, 65H, 63H, 6FH, 6EH, 64H, 20H       
        db 70H, 6FH, 69H, 6EH, 74H, 3AH, 00H            

tout2:
        db 3BH, 20H, 43H, 6FH, 6FH, 72H, 64H, 69H       ; ; Coordinates of third point:
        db 6EH, 61H, 74H, 65H, 73H, 20H, 6FH, 66H       
        db 20H, 74H, 68H, 69H, 72H, 64H, 20H, 70H       
        db 6FH, 69H, 6EH, 74H, 3AH, 00H                 

half:  dq 3FE0000000000000H                            ; 0.5
        dq 0000000000000000H                            

fabs:  dq 7FFFFFFFFFFFFFFFH                            ; fabs
        dq 0000000000000000H                            


