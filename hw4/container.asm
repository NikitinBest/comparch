global Init: function
global Clear: function
global sort: function
global fill: function
global print: function
global fillRandomly: function

extern fprintf                                          ; near
extern __isoc99_fscanf                                  ; near


SECTION .text                                           ; section number 1, code

Init:   
        endbr64                                         
        push    rbp                                     
        mov     rbp, rsp                                
        mov     qword [rbp-8H], rdi                     
        mov     rax, qword [rbp-8H]                     
        mov     dword [rax+4E200H], 0                   
        nop                                             
        pop     rbp                                     
        ret                                             


Clear:  
        endbr64                                         
        push    rbp                                     
        mov     rbp, rsp                                
        mov     qword [rbp-8H], rdi                     
        mov     rax, qword [rbp-8H]                     
        mov     dword [rax+4E200H], 0                   
        nop                                             
        pop     rbp                                     
        ret                                             


sort:   
        endbr64                                         
        push    rbp                                     
        mov     rbp, rsp                                
        sub     rsp, 64                                 
        mov     qword [rbp-38H], rdi                    
        mov     rax, qword [rbp-38H]                    
        mov     eax, dword [rax+4E200H]                 
        mov     edx, eax                                
        shr     edx, 31                                 
        add     eax, edx                                
        sar     eax, 1                                  
        mov     dword [rbp-4H], eax                     
        jmp     beforecycle1

cycle1:  mov     eax, dword [rbp-4H]
        mov     dword [rbp-8H], eax                     
        jmp     cycle1check

cycle2:  mov     rax, qword [rbp-38H]
        mov     edx, dword [rbp-8H]                     
        movsxd  rdx, edx                                
        shl     rdx, 5                                  
        lea     rcx, [rax+rdx]                          
        mov     rax, qword [rcx]                        
        mov     rdx, qword [rcx+8H]                     
        mov     qword [rbp-30H], rax                    
        mov     qword [rbp-28H], rdx                    
        mov     rax, qword [rcx+10H]                    
        mov     rdx, qword [rcx+18H]                    
        mov     qword [rbp-20H], rax                    
        mov     qword [rbp-18H], rdx                    
        mov     eax, dword [rbp-8H]                     
        mov     dword [rbp-0CH], eax                    
        jmp     cycle3check

cycle3:  mov     eax, dword [rbp-0CH]
        sub     eax, dword [rbp-4H]                     
        mov     edx, eax                                
        mov     rax, qword [rbp-38H]                    
        mov     ecx, dword [rbp-0CH]                    
        movsxd  rcx, ecx                                
        shl     rcx, 5                                  
        add     rcx, rax                                
        mov     rax, qword [rbp-38H]                    
        movsxd  rdx, edx                                
        shl     rdx, 5                                  
        lea     rsi, [rax+rdx]                          
        mov     rax, qword [rsi]                        
        mov     rdx, qword [rsi+8H]                     
        mov     qword [rcx], rax                        
        mov     qword [rcx+8H], rdx                     
        mov     rax, qword [rsi+10H]                    
        mov     rdx, qword [rsi+18H]                    
        mov     qword [rcx+10H], rax                    
        mov     qword [rcx+18H], rdx                    
        mov     eax, dword [rbp-4H]                     
        sub     dword [rbp-0CH], eax                    
cycle3check:  mov     eax, dword [rbp-0CH]
        cmp     eax, dword [rbp-4H]                     
        jl      cycle2check
        mov     eax, dword [rbp-0CH]                    
        sub     eax, dword [rbp-4H]                     
        cdqe                                            
        shl     rax, 5                                  
        mov     rdx, rax                                
        mov     rax, qword [rbp-38H]                    
        add     rax, rdx                                
        mov     rdi, rax                                
        call    area                                    
        movsd   qword [rbp-40H], xmm0                   
        lea     rax, [rbp-30H]                          
        mov     rdi, rax                                
        call    area                                    
        movsd   xmm1, qword [rbp-40H]                   
        comisd  xmm1, xmm0                              
        ja      cycle3
cycle2check:  mov     rax, qword [rbp-38H]
        mov     edx, dword [rbp-0CH]                    
        movsxd  rdx, edx                                
        shl     rdx, 5                                  
        lea     rcx, [rax+rdx]                          
        mov     rax, qword [rbp-30H]                    
        mov     rdx, qword [rbp-28H]                    
        mov     qword [rcx], rax                        
        mov     qword [rcx+8H], rdx                     
        mov     rax, qword [rbp-20H]                    
        mov     rdx, qword [rbp-18H]                    
        mov     qword [rcx+10H], rax                    
        mov     qword [rcx+18H], rdx                    
        add     dword [rbp-8H], 1                       
cycle1check:  mov     rax, qword [rbp-38H]
        mov     eax, dword [rax+4E200H]                 
        cmp     dword [rbp-8H], eax                     
        jl      cycle2
        mov     eax, dword [rbp-4H]                     
        mov     edx, eax                                
        shr     edx, 31                                 
        add     eax, edx                                
        sar     eax, 1                                  
        mov     dword [rbp-4H], eax                     
beforecycle1:  cmp     dword [rbp-4H], 0
        jg      cycle1
        nop                                             
        nop                                             
        leave                                           
        ret                                             


fill:   
        endbr64                                         
        push    rbp                                     
        mov     rbp, rsp                                
        sub     rsp, 32                                 
        mov     qword [rbp-18H], rdi                    
        mov     qword [rbp-20H], rsi                    
        mov     rax, qword [rbp-18H]                    
        mov     dword [rax+4E200H], 0                   
        jmp     fillcheck

fillcycle:  mov     rax, qword [rbp-18H]
        mov     eax, dword [rax+4E200H]                 
        cdqe                                            
        shl     rax, 5                                  
        mov     rdx, rax                                
        mov     rax, qword [rbp-18H]                    
        add     rax, rdx                                
        lea     rdx, [rax+4H]                           
        mov     rax, qword [rbp-20H]                    
        lea     rsi, [rel fillformat1]
        mov     rdi, rax                                
        mov     eax, 0                                  
        call    __isoc99_fscanf                         
        mov     eax, dword [rbp-4H]                     
        cmp     eax, 2                                  
        je      filltria
        cmp     eax, 2                                  
        jg      fillerr
        test    eax, eax                                
        jz      fillcirc
        cmp     eax, 1                                  
        jz      fillrect
        jmp     fillerr

fillcirc:  mov     rax, qword [rbp-18H]
        mov     edx, dword [rax+4E200H]                 
        mov     rax, qword [rbp-18H]                    
        movsxd  rdx, edx                                
        shl     rdx, 5                                  
        add     rax, rdx                                
        mov     dword [rax], 0                          
        mov     rax, qword [rbp-18H]                    
        mov     eax, dword [rax+4E200H]                 
        cdqe                                            
        shl     rax, 5                                  
        mov     rdx, rax                                
        mov     rax, qword [rbp-18H]                    
        add     rdx, rax                                
        mov     rax, qword [rbp-20H]                    
        mov     rsi, rax                                
        mov     rdi, rdx                                
        call    Input                                   
        jmp     fillnext

fillrect:  mov     rax, qword [rbp-18H]
        mov     edx, dword [rax+4E200H]                 
        mov     rax, qword [rbp-18H]                    
        movsxd  rdx, edx                                
        shl     rdx, 5                                  
        add     rax, rdx                                
        mov     dword [rax], 1                          
        mov     rax, qword [rbp-18H]                    
        mov     eax, dword [rax+4E200H]                 
        cdqe                                            
        shl     rax, 5                                  
        mov     rdx, rax                                
        mov     rax, qword [rbp-18H]                    
        add     rdx, rax                                
        mov     rax, qword [rbp-20H]                    
        mov     rsi, rax                                
        mov     rdi, rdx                                
        call    Input                                   
        jmp     fillnext

filltria:  mov     rax, qword [rbp-18H]
        mov     edx, dword [rax+4E200H]                 
        mov     rax, qword [rbp-18H]                    
        movsxd  rdx, edx                                
        shl     rdx, 5                                  
        add     rax, rdx                                
        mov     dword [rax], 2                          
        mov     rax, qword [rbp-18H]                    
        mov     eax, dword [rax+4E200H]                 
        cdqe                                            
        shl     rax, 5                                  
        mov     rdx, rax                                
        mov     rax, qword [rbp-18H]                    
        add     rdx, rax                                
        mov     rax, qword [rbp-20H]                    
        mov     rsi, rax                                
        mov     rdi, rdx                                
        call    Input                                   
        jmp     fillnext

fillerr:  lea     rdi, [rel figerr]
        call    puts                                    
        jmp     fillret

fillnext:  mov     rax, qword [rbp-18H]
        mov     eax, dword [rax+4E200H]                 
        lea     edx, [rax+1H]                           
        mov     rax, qword [rbp-18H]                    
        mov     dword [rax+4E200H], edx                 
fillcheck:  mov     rax, qword [rbp-18H]
        mov     eax, dword [rax+4E200H]                 
        cmp     eax, 9999                               
        jg      fillret
        lea     rdx, [rbp-4H]                           
        mov     rax, qword [rbp-20H]                    
        lea     rsi, [rel fillformat1]
        mov     rdi, rax                                
        mov     eax, 0                                  
        call    __isoc99_fscanf                         
        cmp     eax, -1                                 
        jne     fillcycle
fillret:  leave
        ret                                             


print:  
        endbr64                                         
        push    rbp                                     
        mov     rbp, rsp                                
        sub     rsp, 32                                 
        mov     qword [rbp-18H], rdi                    
        mov     qword [rbp-20H], rsi                    
        mov     rax, qword [rbp-20H]                    
        mov     rcx, rax                                
        mov     edx, 19                                 
        mov     esi, 1                                  
        lea     rdi, [rel contout1]
        call    fwrite                                  
        mov     rax, qword [rbp-18H]                    
        mov     edx, dword [rax+4E200H]                 
        mov     rax, qword [rbp-20H]                    
        lea     rcx, [rel contout2]
        lea     rsi, [rel contformat1]
        mov     rdi, rax                                
        mov     eax, 0                                  
        call    fprintf                                 
        mov     dword [rbp-4H], 0                       
        jmp     printfor

printforinner:  mov     eax, dword [rbp-4H]
        cdqe                                            
        shl     rax, 5                                  
        mov     rdx, rax                                
        mov     rax, qword [rbp-18H]                    
        add     rdx, rax                                
        mov     rax, qword [rbp-20H]                    
        mov     rsi, rax                                
        mov     rdi, rdx                                
        call    Output                                  
        add     dword [rbp-4H], 1                       
printfor:  mov     rax, qword [rbp-18H]
        mov     eax, dword [rax+4E200H]                 
        cmp     dword [rbp-4H], eax                     
        jl      printforinner
        nop                                             
        nop                                             
        leave                                           
        ret                                             


fillRandomly:
        endbr64                                         
        push    rbp                                     
        mov     rbp, rsp                                
        push    r15                                     
        push    r14                                     
        push    r13                                     
        push    r12                                     
        push    rbx                                     
        sub     rsp, 56                                 
        mov     qword [rbp-58H], rdi                    
        mov     qword [rbp-60H], rsi                    
        mov     rax, qword [rbp-58H]                    
        lea     rdx, [rax+4E200H]                       
        mov     rax, qword [rbp-60H]                    
        lea     rsi, [rel fillformat1]
        mov     rdi, rax                                
        mov     eax, 0                                  
        call    __isoc99_fscanf                         
        lea     rsi, [rel contformat4]
        lea     rdi, [rel contrandfileout]
        call    fopen                                   
        mov     qword [rbp-40H], rax                    
        mov     dword [rbp-34H], 0                      
        jmp     randinfor

randforinner:  call    rand
        mov     edx, eax                                
        movsxd  rax, edx                                
        imul    rax, rax, 1431655766                    
        shr     rax, 32                                 
        mov     rcx, rax                                
        mov     eax, edx                                
        sar     eax, 31                                 
        mov     ebx, ecx                                
        sub     ebx, eax                                
        mov     eax, ebx                                
        mov     dword [rbp-4CH], eax                    
        mov     ecx, dword [rbp-4CH]                    
        mov     eax, ecx                                
        add     eax, eax                                
        add     eax, ecx                                
        sub     edx, eax                                
        mov     eax, edx                                
        mov     dword [rbp-4CH], eax                    
        call    rand                                    
        movsxd  rdx, eax                                
        imul    rdx, rdx, -1840700269                   
        shr     rdx, 32                                 
        add     edx, eax                                
        mov     ecx, edx                                
        sar     ecx, 2                                  
        cdq                                             
        sub     ecx, edx                                
        mov     edx, ecx                                
        mov     dword [rbp-50H], edx                    
        mov     ecx, dword [rbp-50H]                    
        mov     edx, ecx                                
        shl     edx, 3                                  
        sub     edx, ecx                                
        sub     eax, edx                                
        mov     dword [rbp-50H], eax                    
        mov     ecx, dword [rbp-50H]                    
        mov     edx, dword [rbp-4CH]                    
        mov     rax, qword [rbp-40H]                    
        lea     rsi, [rel contformat2]
        mov     rdi, rax                                
        mov     eax, 0                                  
        call    fprintf                                 
        cmp     dword [rbp-4CH], 2                      
        je      randtria
        cmp     dword [rbp-4CH], 2                      
        jg      randnotswitch
        cmp     dword [rbp-4CH], 0                      
        jz      randcirc
        cmp     dword [rbp-4CH], 1                      
        je      randrect
        jmp     randnotswitch

randcirc:  call    rand
        movsxd  rdx, eax                                
        imul    rdx, rdx, 1759218605                    
        shr     rdx, 32                                 
        mov     ecx, edx                                
        sar     ecx, 12                                 
        cdq                                             
        mov     ebx, ecx                                
        sub     ebx, edx                                
        imul    edx, ebx, 10000                         
        sub     eax, edx                                
        mov     ebx, eax                                
        call    rand                                    
        movsxd  rdx, eax                                
        imul    rdx, rdx, 1759218605                    
        shr     rdx, 32                                 
        mov     ecx, edx                                
        sar     ecx, 13                                 
        cdq                                             
        sub     ecx, edx                                
        mov     edx, ecx                                
        imul    edx, edx, 20000                         
        sub     eax, edx                                
        mov     edx, eax                                
        lea     r12d, [rdx-2710H]                       
        call    rand                                    
        movsxd  rdx, eax                                
        imul    rdx, rdx, 1759218605                    
        shr     rdx, 32                                 
        mov     ecx, edx                                
        sar     ecx, 13                                 
        cdq                                             
        sub     ecx, edx                                
        mov     edx, ecx                                
        imul    edx, edx, 20000                         
        sub     eax, edx                                
        mov     edx, eax                                
        sub     edx, 10000                              
        mov     rax, qword [rbp-40H]                    
        mov     r8d, ebx                                
        mov     ecx, r12d                               
        lea     rsi, [rel cformat]
        mov     rdi, rax                                
        mov     eax, 0                                  
        call    fprintf                                 
        jmp     randnotswitch

randrect:  call    rand
        movsxd  rdx, eax                                
        imul    rdx, rdx, 1759218605                    
        shr     rdx, 32                                 
        mov     ecx, edx                                
        sar     ecx, 13                                 
        cdq                                             
        sub     ecx, edx                                
        mov     edx, ecx                                
        imul    edx, edx, 20000                         
        sub     eax, edx                                
        mov     edx, eax                                
        lea     r13d, [rdx-2710H]                       
        call    rand                                    
        movsxd  rdx, eax                                
        imul    rdx, rdx, 1759218605                    
        shr     rdx, 32                                 
        mov     ecx, edx                                
        sar     ecx, 13                                 
        cdq                                             
        sub     ecx, edx                                
        mov     edx, ecx                                
        imul    edx, edx, 20000                         
        sub     eax, edx                                
        mov     edx, eax                                
        lea     r12d, [rdx-2710H]                       
        call    rand                                    
        movsxd  rdx, eax                                
        imul    rdx, rdx, 1759218605                    
        shr     rdx, 32                                 
        mov     ecx, edx                                
        sar     ecx, 13                                 
        cdq                                             
        sub     ecx, edx                                
        mov     edx, ecx                                
        imul    edx, edx, 20000                         
        sub     eax, edx                                
        mov     edx, eax                                
        lea     ebx, [rdx-2710H]                        
        call    rand                                    
        movsxd  rdx, eax                                
        imul    rdx, rdx, 1759218605                    
        shr     rdx, 32                                 
        mov     ecx, edx                                
        sar     ecx, 13                                 
        cdq                                             
        sub     ecx, edx                                
        mov     edx, ecx                                
        imul    edx, edx, 20000                         
        sub     eax, edx                                
        mov     edx, eax                                
        sub     edx, 10000                              
        mov     rax, qword [rbp-40H]                    
        mov     r9d, r13d                               
        mov     r8d, r12d                               
        mov     ecx, ebx                                
        lea     rsi, [rel cformat3]
        mov     rdi, rax                                
        mov     eax, 0                                  
        call    fprintf                                 
        jmp     randnotswitch

randtria:  call    rand
        movsxd  rdx, eax                                
        imul    rdx, rdx, 1759218605                    
        shr     rdx, 32                                 
        mov     ecx, edx                                
        sar     ecx, 13                                 
        cdq                                             
        sub     ecx, edx                                
        mov     edx, ecx                                
        imul    edx, edx, 20000                         
        sub     eax, edx                                
        mov     edx, eax                                
        lea     r13d, [rdx-2710H]                       
        call    rand                                    
        movsxd  rdx, eax                                
        imul    rdx, rdx, 1759218605                    
        shr     rdx, 32                                 
        mov     ecx, edx                                
        sar     ecx, 13                                 
        cdq                                             
        sub     ecx, edx                                
        mov     edx, ecx                                
        imul    edx, edx, 20000                         
        sub     eax, edx                                
        mov     edx, eax                                
        lea     r12d, [rdx-2710H]                       
        call    rand                                    
        movsxd  rdx, eax                                
        imul    rdx, rdx, 1759218605                    
        shr     rdx, 32                                 
        mov     ecx, edx                                
        sar     ecx, 13                                 
        cdq                                             
        sub     ecx, edx                                
        mov     edx, ecx                                
        imul    edx, edx, 20000                         
        sub     eax, edx                                
        mov     edx, eax                                
        lea     r15d, [rdx-2710H]                       
        call    rand                                    
        movsxd  rdx, eax                                
        imul    rdx, rdx, 1759218605                    
        shr     rdx, 32                                 
        mov     ecx, edx                                
        sar     ecx, 13                                 
        cdq                                             
        sub     ecx, edx                                
        mov     edx, ecx                                
        imul    edx, edx, 20000                         
        sub     eax, edx                                
        mov     edx, eax                                
        lea     r14d, [rdx-2710H]                       
        call    rand                                    
        movsxd  rdx, eax                                
        imul    rdx, rdx, 1759218605                    
        shr     rdx, 32                                 
        mov     ecx, edx                                
        sar     ecx, 13                                 
        cdq                                             
        sub     ecx, edx                                
        mov     edx, ecx                                
        imul    edx, edx, 20000                         
        sub     eax, edx                                
        mov     edx, eax                                
        lea     ebx, [rdx-2710H]                        
        call    rand                                    
        movsxd  rdx, eax                                
        imul    rdx, rdx, 1759218605                    
        shr     rdx, 32                                 
        mov     ecx, edx                                
        sar     ecx, 13                                 
        cdq                                             
        sub     ecx, edx                                
        mov     edx, ecx                                
        imul    edx, edx, 20000                         
        sub     eax, edx                                
        mov     edx, eax                                
        sub     edx, 10000                              
        mov     rax, qword [rbp-40H]                    
        push    r13                                     
        push    r12                                     
        mov     r9d, r15d                               
        mov     r8d, r14d                               
        mov     ecx, ebx                                
        lea     rsi, [rel rectformat]
        mov     rdi, rax                                
        mov     eax, 0                                  
        call    fprintf                                 
        add     rsp, 16                                 
        nop                                             
randnotswitch:  mov     eax, dword [rbp-34H]
        lea     edx, [rax+1H]                           
        mov     rax, qword [rbp-58H]                    
        mov     eax, dword [rax+4E200H]                 
        cmp     edx, eax                                
        jge     randinswitch
        mov     rax, qword [rbp-40H]                    
        mov     rsi, rax                                
        mov     edi, 10                                 
        call    fputc                                   
randinswitch:  add     dword [rbp-34H], 1
randinfor:  mov     rax, qword [rbp-58H]
        mov     eax, dword [rax+4E200H]                 
        cmp     dword [rbp-34H], eax                    
        jl      randforinner
        mov     rax, qword [rbp-40H]                    
        mov     rdi, rax                                
        call    fclose                                  
        lea     rsi, [rel contformat3]
        lea     rdi, [rel contrandfileout]
        call    fopen                                   
        mov     qword [rbp-48H], rax                    
        mov     rdx, qword [rbp-48H]                    
        mov     rax, qword [rbp-58H]                    
        mov     rsi, rdx                                
        mov     rdi, rax                                
        call    fill                                    
        mov     rax, qword [rbp-48H]                    
        mov     rdi, rax                                
        call    fclose                                  
        nop                                             
        lea     rsp, [rbp-28H]                          
        pop     rbx                                     
        pop     r12                                     
        pop     r13                                     
        pop     r14                                     
        pop     r15                                     
        pop     rbp                                     
        ret                                             


SECTION .rodata                                               ; section number 4, const


fillformat1:                                                  ; %i
        db 25H, 69H, 00H                                

contout1:                                                  ; Container includes
        db 43H, 6FH, 6EH, 74H, 61H, 69H, 6EH, 65H       
        db 72H, 20H, 69H, 6EH, 63H, 6CH, 75H, 64H       
        db 65H, 73H, 20H, 00H                           

contout2:                                                  ;  objects:
        db 20H, 6FH, 62H, 6AH, 65H, 63H, 74H, 73H       
        db 3AH, 0AH, 00H                                

contformat1:                                                  ; %i %s
        db 25H, 69H, 20H, 25H, 73H, 00H                 

contformat4:                                                  ; w
        db 77H, 00H                                     

contrandfileout:                                                  ; tests/random_tmp.txt
        db 74H, 65H, 73H, 74H, 73H, 2FH, 72H, 61H       
        db 6EH, 64H, 6FH, 6DH, 5FH, 74H, 6DH, 70H       
        db 2EH, 74H, 78H, 74H, 00H                      

contformat2:                                                  ; %i %i
        db 25H, 69H, 20H, 25H, 69H, 20H, 00H            

contformat3:                                                  ; r
        db 72H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       


