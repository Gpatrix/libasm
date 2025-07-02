global ft_strdup

section .text
    extern malloc
    extern ft_strlen
    extern ft_strcpy

ft_strdup:
    push    rbp
    mov     rbp, rsp

    push rdi
    call ft_strlen

    inc rax
    mov rdi, rax

    ; stack is currently 0x*08, needs to be 0x*10
    sub rsp, 0x8 
    ; mallocs crashes here:  => 0x7ffff7e1f4c0 <_int_malloc+2832>:   movaps %xmm1,0x10(%rsp)
    ; https://www.gladir.com/LEXIQUE/ASM/movaps.htm
    call malloc wrt ..plt
    add rsp, 0x8 ; restore

    mov rdi, rax
    pop rsi
    call ft_strcpy

.return:
    pop rbp
    ret

section .note.GNU-stack noalloc noexec nowrite progbits
