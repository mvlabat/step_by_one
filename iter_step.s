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
 mov     r8, rdx
 mov     rax, rdi
 mov     rbx, qword, ptr, [r15]
 mov     rcx, qword, ptr, [r15, +, 16]
 lea     rsi, [rbx, +, 4*rcx]
 lea     rdi, [rdx, -, 1]
 xor     ecx, ecx
 test    cl, 1
 jne     LBB2_7
 jmp     LBB2_5
LBB2_10:
 mov     ecx, dword, ptr, [rbx]
 lea     ecx, [rcx, +, 2*rcx]
 mov     dword, ptr, [rbx], ecx
 mov     cl, 1
 mov     rbx, rdx
 test    cl, 1
 je      LBB2_5
LBB2_7:
 mov     rcx, rsi
 sub     rcx, rbx
 shr     rcx, 2
 cmp     rcx, rdi
 jbe     LBB2_12
 lea     rdx, [rbx, +, 4*r8]
 lea     rbx, [rbx, +, 4*rdi]
 test    rbx, rbx
 jne     LBB2_10
 jmp     LBB2_12
LBB2_5:
 cmp     rsi, rbx
 je      LBB2_12
 mov     rdx, rbx
 add     rdx, 4
 test    rbx, rbx
 jne     LBB2_10
LBB2_12:
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
