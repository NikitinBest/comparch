
default rel



global errorMessage: function
global main: function
global _start: function
global PI

extern exit                                             
extern strcmp                                           
extern fclose                                           
extern fputc                                            
extern rand                                             
extern fopen                            	                
extern fwrite                                           
extern puts                                             
extern fprintf                                          
extern _GLOBAL_OFFSET_TABLE_                            
extern __isoc99_fscanf                                  


%include "circle.asm"
%include "rectangle.asm"
%include "triangle.asm"
%include "figure.asm"
%include "container.asm"

SECTION .text                           


errorMessage:
        endbr64                                         
        push    rbp                                     
        mov     rbp, rsp                                
        lea     rdi, [rel mainerr]
        call    puts                                    
        nop                                             
        pop     rbp                                     
        ret                                             


main:   
        endbr64                                         
        push    rbp                                     
        mov     rbp, rsp                                
        lea     r11, [rsp-4E000H]                       
checkargs:  sub     rsp, 4096
        or      dword [rsp], 00H                        
        cmp     rsp, r11                                
        jnz     checkargs
        sub     rsp, 560                                
        mov     dword [rbp-4E224H], edi                 
        mov     qword [rbp-4E230H], rsi                 
        cmp     dword [rbp-4E224H], 3                   
        jz      switchtype
        cmp     dword [rbp-4E224H], 4                   
        jz      switchtype
        mov     eax, 0                                  
        call    errorMessage                            
        mov     eax, 0                                  
        jmp     mainreturn

switchtype:  lea     rdi, [rel mainstarted]
        call    puts                                    
        cmp     dword [rbp-4E224H], 4                   
        jnz     switchtyperand
        mov     rax, qword [rbp-4E230H]                 
        add     rax, 8                                  
        mov     rax, qword [rax]                        
        lea     rsi, [rel mainformat]
        mov     rdi, rax                                
        call    strcmp                                  
        test    eax, eax                                
        jnz     switchtyperand
        mov     rax, qword [rbp-4E230H]                 
        add     rax, 16                                 
        mov     rax, qword [rax]                        
        lea     rsi, [rel contformat3]
        mov     rdi, rax                                
        call    fopen                                   
        mov     qword [rbp-8H], rax                     
        mov     rax, qword [rbp-4E230H]                 
        add     rax, 24                                 
        mov     rax, qword [rax]                        
        lea     rsi, [rel contformat4]
        mov     rdi, rax                                
        call    fopen                                   
        mov     qword [rbp-10H], rax                    
        jmp     openinputerr

switchtyperand:  cmp     dword [rbp-4E224H], 3
        jnz     switchtypeerr
        mov     rax, qword [rbp-4E230H]                 
        add     rax, 8                                  
        mov     rax, qword [rax]                        
        lea     rsi, [rel contformat3]
        mov     rdi, rax                                
        call    fopen                                   
        mov     qword [rbp-8H], rax                     
        mov     rax, qword [rbp-4E230H]                 
        add     rax, 16                                 
        mov     rax, qword [rax]                        
        lea     rsi, [rel contformat4]
        mov     rdi, rax                                
        call    fopen                                   
        mov     qword [rbp-10H], rax                    
        jmp     openinputerr

switchtypeerr:  mov     eax, 0
        call    errorMessage                            
        mov     eax, 0                                  
        jmp     mainreturn

openinputerr:  cmp     qword [rbp-8H], 0
        jnz     openoutputerr
        lea     rdi, [rel mainfileerr1]
        call    puts                                    
        mov     eax, 0                                  
        jmp     mainreturn

openoutputerr:  cmp     qword [rbp-10H], 0
        jnz     mainfill
        lea     rdi, [rel mainfileerr2]
        call    puts                                    
        mov     eax, 0                                  
        jmp     mainreturn

mainfill:  cmp     dword [rbp-4E224H], 3
        jnz     mainfillrand
        mov     rdx, qword [rbp-8H]                     
        lea     rax, [rbp-4E220H]                       
        mov     rsi, rdx                                
        mov     rdi, rax                                
        call    fill                                    
        jmp     maincontout

mainfillrand:  mov     rdx, qword [rbp-8H]
        lea     rax, [rbp-4E220H]                       
        mov     rsi, rdx                                
        mov     rdi, rax                                
        call    fillRandomly                            
maincontout:  mov     rdx, qword [rbp-10H]
        lea     rax, [rbp-4E220H]                       
        mov     rsi, rdx                                
        mov     rdi, rax                                
        call    print                                   
        mov     rax, qword [rbp-10H]                    
        mov     rcx, rax                                
        mov     edx, 44                                 
        mov     esi, 1                                  
        lea     rdi, [rel mainsorted0]
        call    fwrite                                  
        mov     rax, qword [rbp-10H]                    
        mov     rcx, rax                                
        mov     edx, 18                                 
        mov     esi, 1                                  
        lea     rdi, [rel mainsorted1]
        call    fwrite                                  
        mov     rax, qword [rbp-10H]                    
        mov     rcx, rax                                
        mov     edx, 44                                 
        mov     esi, 1                                  
        lea     rdi, [rel mainsorted0]
        call    fwrite                                  
        lea     rax, [rbp-4E220H]                       
        mov     rdi, rax                                
        call    sort                                    
        mov     rdx, qword [rbp-10H]                    
        lea     rax, [rbp-4E220H]                       
        mov     rsi, rdx                                
        mov     rdi, rax                                
        call    print                                   
        mov     rax, qword [rbp-8H]                     
        mov     rdi, rax                                
        call    fclose                                  
        mov     rax, qword [rbp-10H]                    
        mov     rdi, rax                                
        call    fclose                                  
        lea     rdi, [rel mainsorted2]
        call    puts                                    
        mov     eax, 0                                  
mainreturn:  leave
        ret                                             


_start: 
        endbr64                                         
        mov     rdi, qword [rsp]                        
        mov     rsi, rsp                                
        add     rsi, 8                                  
        call    main                                    
        xor     rdi, rdi                                
        call    exit                                    
        nop                                             
        ud2                                             



SECTION .data   align=1 noexecute                       


SECTION .bss    align=1 noexecute                       


SECTION .rodata align=16 noexecute                      
                           


mainerr:                                                  ; Incorrect command line!
        db 49H, 6EH, 63H, 6FH, 72H, 72H, 65H, 63H       ; Correct format:
        db 74H, 20H, 63H, 6FH, 6DH, 6DH, 61H, 6EH       ; command inputFile outputFile
        db 64H, 20H, 6CH, 69H, 6EH, 65H, 21H, 0AH       ; or
        db 43H, 6FH, 72H, 72H, 65H, 63H, 74H, 20H       ; command -r inputFile outputFile
        db 66H, 6FH, 72H, 6DH, 61H, 74H, 3AH, 0AH
        db 63H, 6FH, 6DH, 6DH, 61H, 6EH, 64H, 20H
        db 69H, 6EH, 70H, 75H, 74H, 46H, 69H, 6CH
        db 65H, 20H, 6FH, 75H, 74H, 70H, 75H, 74H
        db 46H, 69H, 6CH, 65H, 0AH, 6FH, 72H, 0AH
        db 63H, 6FH, 6DH, 6DH, 61H, 6EH, 64H, 20H
        db 2DH, 72H, 20H, 69H, 6EH, 70H, 75H, 74H
        db 46H, 69H, 6CH, 65H, 20H, 6FH, 75H, 74H
        db 70H, 75H, 74H, 46H, 69H, 6CH, 65H, 00H

mainstarted:                                                  ; Program started...
        db 50H, 72H, 6FH, 67H, 72H, 61H, 6DH, 20H
        db 73H, 74H, 61H, 72H, 74H, 65H, 64H, 2EH
        db 2EH, 2EH, 20H, 00H

mainformat:                                                  ; -r
        db 2DH, 72H, 00H

mainfileerr1:                                                  ; Cannot open input file
        db 43H, 61H, 6EH, 6EH, 6FH, 74H, 20H, 6FH
        db 70H, 65H, 6EH, 20H, 69H, 6EH, 70H, 75H
        db 74H, 20H, 66H, 69H, 6CH, 65H, 00H

mainfileerr2:                                                  ; Cannot open output file
        db 43H, 61H, 6EH, 6EH, 6FH, 74H, 20H, 6FH
        db 70H, 65H, 6EH, 20H, 6FH, 75H, 74H, 70H
        db 75H, 74H, 20H, 66H, 69H, 6CH, 65H, 00H
        db 00H, 00H

mainsorted0:                                                  ; -------------------------------------------
        db 2DH, 2DH, 2DH, 2DH, 2DH, 2DH, 2DH, 2DH
        db 2DH, 2DH, 2DH, 2DH, 2DH, 2DH, 2DH, 2DH
        db 2DH, 2DH, 2DH, 2DH, 2DH, 2DH, 2DH, 2DH
        db 2DH, 2DH, 2DH, 2DH, 2DH, 2DH, 2DH, 2DH
        db 2DH, 2DH, 2DH, 2DH, 2DH, 2DH, 2DH, 2DH
        db 2DH, 2DH, 2DH, 0AH, 00H

mainsorted1:                                                  ; Container Sorted!
        db 43H, 6FH, 6EH, 74H, 61H, 69H, 6EH, 65H
        db 72H, 20H, 53H, 6FH, 72H, 74H, 65H, 64H
        db 21H, 0AH, 00H

mainsorted2:                                                  ; Program finished!
        db 50H, 72H, 6FH, 67H, 72H, 61H, 6DH, 20H
        db 66H, 69H, 6EH, 69H, 73H, 68H, 65H, 64H
        db 21H, 20H, 00H, 00H, 00H, 00H, 00H, 00H


