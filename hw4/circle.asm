global areaOfCircle: function
global inputCircle: function
global printCircle: function

extern fprintf                                          ; near
extern __isoc99_fscanf                                  ; near


SECTION .text                                           ; section number 1, code

areaOfCircle:
        endbr64                                         
        push    rbp                                     
        mov     rbp, rsp                                
        mov     qword [rbp-8H], rdi                     
        mov     rax, qword [rbp-8H]                     
        mov     eax, dword [rax+8H]                     
        cvtsi2sd xmm1, eax                              
        movsd   xmm0, qword [rel PI]
        mulsd   xmm1, xmm0                              
        mov     rax, qword [rbp-8H]                     
        mov     eax, dword [rax+8H]                     
        cvtsi2sd xmm0, eax                              
        mulsd   xmm0, xmm1                              
        pop     rbp                                     
        ret                                             


inputCircle:
        endbr64                                         
        push    rbp                                     
        mov     rbp, rsp                                
        sub     rsp, 16                                 
        mov     qword [rbp-8H], rdi                     
        mov     qword [rbp-10H], rsi                    
        mov     rax, qword [rbp-8H]                     
        lea     rsi, [rax+8H]                           
        mov     rax, qword [rbp-8H]                     
        lea     rcx, [rax+4H]                           
        mov     rdx, qword [rbp-8H]                     
        mov     rax, qword [rbp-10H]                    
        mov     r8, rsi                                 
        lea     rsi, [rel cformat]
        mov     rdi, rax
        mov     eax, 0
        call    __isoc99_fscanf
        nop
        leave
        ret


printCircle:
        endbr64
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     qword [rbp-8H], rdi
        mov     qword [rbp-10H], rsi
        mov     rax, qword [rbp-8H]
        mov     rdi, rax
        call    areaOfCircle
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
        lea     rdx, [rel cout1]
        lea     rsi, [rel fout4]
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        mov     rax, qword [rbp-8H]
        mov     edx, dword [rax+8H]
        mov     rax, qword [rbp-10H]
        lea     r8, [rel fout5]
        mov     ecx, edx
        lea     rdx, [rel cout2]
        lea     rsi, [rel cformat1]
        mov     rdi, rax
        mov     eax, 0
        call    fprintf
        nop
        leave
        ret


SECTION .rodata

cformat:                                                  ; %i %i %i
        db 25H, 69H, 20H, 25H, 69H, 20H, 25H, 69H
        db 00H


cout1:                                                  ; ; Coordinates of center:
        db 3BH, 20H, 43H, 6FH, 6FH, 72H, 64H, 69H
        db 6EH, 61H, 74H, 65H, 73H, 20H, 6FH, 66H
        db 20H, 63H, 65H, 6EH, 74H, 65H, 72H, 3AH
        db 00H

cout2:                                                  ; Radius
        db 3BH, 20H, 52H, 61H, 64H, 69H, 75H, 73H
        db 3AH, 00H

cformat1:                                                  ; %s %i %s
        db 25H, 73H, 20H, 25H, 69H, 25H, 73H, 00H

PI:  dq 400921FB53C8D4F1H                              ; PI

