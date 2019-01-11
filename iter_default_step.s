# step_by_one::iter_default_step:
 push    rbp
 mov     rbp, rsp
 mov     rax, rdi
 mov     r9, qword, ptr, [rsi, +, 16]
 test    r9, r9
 je      LBB1_4
 mov     rdx, qword, ptr, [rsi]
 lea     r11, [4*r9, -, 4]
 shr     r11, 2
 inc     r11
 mov     rcx, rdx
 cmp     r11, 7
 jbe     LBB1_2
 mov     r8, r11
 and     r8, -8
 lea     rdi, [r8, -, 8]
 mov     rcx, rdi
 shr     rcx, 3
 inc     rcx
 mov     r10d, ecx
 and     r10d, 1
 test    rdi, rdi
 je      LBB1_6
 mov     edi, 1
 sub     rdi, rcx
 lea     rdi, [r10, +, rdi, -, 1]
 xor     ecx, ecx
LBB1_8:
 movdqu  xmm0, xmmword, ptr, [rdx, +, 4*rcx]
 movdqu  xmm1, xmmword, ptr, [rdx, +, 4*rcx, +, 16]
 movdqu  xmm2, xmmword, ptr, [rdx, +, 4*rcx, +, 32]
 movdqu  xmm3, xmmword, ptr, [rdx, +, 4*rcx, +, 48]
 movdqa  xmm4, xmm0
 paddd   xmm4, xmm0
 paddd   xmm4, xmm0
 movdqa  xmm0, xmm1
 paddd   xmm0, xmm1
 paddd   xmm0, xmm1
 movdqu  xmmword, ptr, [rdx, +, 4*rcx], xmm4
 movdqu  xmmword, ptr, [rdx, +, 4*rcx, +, 16], xmm0
 movdqa  xmm0, xmm2
 paddd   xmm0, xmm2
 paddd   xmm0, xmm2
 movdqa  xmm1, xmm3
 paddd   xmm1, xmm3
 paddd   xmm1, xmm3
 movdqu  xmmword, ptr, [rdx, +, 4*rcx, +, 32], xmm0
 movdqu  xmmword, ptr, [rdx, +, 4*rcx, +, 48], xmm1
 add     rcx, 16
 add     rdi, 2
 jne     LBB1_8
 test    r10, r10
 je      LBB1_11
LBB1_10:
 movdqu  xmm0, xmmword, ptr, [rdx, +, 4*rcx]
 movdqu  xmm1, xmmword, ptr, [rdx, +, 4*rcx, +, 16]
 movdqa  xmm2, xmm0
 paddd   xmm2, xmm0
 paddd   xmm2, xmm0
 movdqa  xmm0, xmm1
 paddd   xmm0, xmm1
 paddd   xmm0, xmm1
 movdqu  xmmword, ptr, [rdx, +, 4*rcx], xmm2
 movdqu  xmmword, ptr, [rdx, +, 4*rcx, +, 16], xmm0
LBB1_11:
 cmp     r11, r8
 je      LBB1_4
 lea     rcx, [rdx, +, 4*r8]
LBB1_2:
 lea     rdx, [rdx, +, 4*r9]
LBB1_3:
 mov     edi, dword, ptr, [rcx]
 lea     edi, [rdi, +, 2*rdi]
 mov     dword, ptr, [rcx], edi
 lea     rcx, [rcx, +, 4]
 cmp     rdx, rcx
 jne     LBB1_3
LBB1_4:
 mov     rcx, qword, ptr, [rsi, +, 16]
 mov     qword, ptr, [rax, +, 16], rcx
 mov     rcx, qword, ptr, [rsi]
 mov     rdx, qword, ptr, [rsi, +, 8]
 mov     qword, ptr, [rax, +, 8], rdx
 mov     qword, ptr, [rax], rcx
 pop     rbp
 ret
LBB1_6:
 xor     ecx, ecx
 test    r10, r10
 jne     LBB1_10
 jmp     LBB1_11
