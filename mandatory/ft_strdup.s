global ft_strdup

section .text
    extern malloc
    extern ft_strlen
    extern ft_strcpy

ft_strdup:
    push    rbp
    mov     rbp, rsp

    push rdi;
    call ft_strlen

    inc rax
    mov rdi, rax
    ; call malloc ; no PLT
    call malloc wrt ..plt

    mov rdi, rax
    pop rsi
    call ft_strcpy

.return:
    pop rbp
    ret

section .note.GNU-stack noalloc noexec nowrite progbits
