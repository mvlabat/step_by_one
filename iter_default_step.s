# step_by_one::iter_default_step:
 push    rbp
 mov     rbp, rsp
 mov     rax, rdi
 mov     rcx, qword, ptr, [rsi, +, 16]
 mov     qword, ptr, [rdi, +, 16], rcx
 mov     rcx, qword, ptr, [rsi]
 mov     rdx, qword, ptr, [rsi, +, 8]
 mov     qword, ptr, [rdi, +, 8], rdx
 mov     qword, ptr, [rdi], rcx
 pop     rbp
 ret
