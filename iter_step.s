# step_by_one::iter_step:
 push    rbp
 mov     rbp, rsp
 push    r15
 push    r14
 push    rbx
 push    rax
 mov     r15, rsi
 test    rdx, rdx
 je      LBB2_1
 mov     rax, rdi
 mov     rcx, qword, ptr, [r15]
 mov     rsi, qword, ptr, [r15, +, 16]
 lea     rsi, [rcx, +, 4*rsi]
 lea     r8, [rdx, -, 1]
 xor     edi, edi
LBB2_4:
 test    dil, 1
 je      LBB2_5
 mov     rdi, rsi
 sub     rdi, rcx
 shr     rdi, 2
 cmp     rdi, r8
 jbe     LBB2_10
 lea     rbx, [rcx, +, 4*r8]
 lea     rcx, [rcx, +, 4*rdx]
 mov     dil, 1
 test    rbx, rbx
 jne     LBB2_4
 jmp     LBB2_10
LBB2_5:
 cmp     rsi, rcx
 je      LBB2_10
 mov     rbx, rcx
 add     rcx, 4
 mov     dil, 1
 test    rbx, rbx
 jne     LBB2_4
LBB2_10:
 mov     rcx, qword, ptr, [r15, +, 16]
 mov     qword, ptr, [rax, +, 16], rcx
 mov     rcx, qword, ptr, [r15]
 mov     rdx, qword, ptr, [r15, +, 8]
 mov     qword, ptr, [rax, +, 8], rdx
 mov     qword, ptr, [rax], rcx
 add     rsp, 8
 pop     rbx
 pop     r14
 pop     r15
 pop     rbp
 ret
LBB2_1:
 lea     rdi, [rip, +, l_anon.143b0cc3f063c21495306b13c3ddb912.2]
 call    core::panicking::panic
 ud2
LBB2_11:
 mov     r14, rax
 mov     rdi, r15
 call    core::ptr::real_drop_in_place
 mov     rdi, r14
 call    __Unwind_Resume
 ud2
