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

    sub rsp, 0x8
    call malloc wrt ..plt
    add rsp, 0x8

    mov rdi, rax
    pop rsi
    call ft_strcpy

.return:
    pop rbp
    ret

section .note.GNU-stack noalloc noexec nowrite progbits
