global ft_strdup

%include "ft_strlen.s"
%include "ft_strcpy.s"
extern malloc

section .text
ft_strdup:
    push    rbp
    mov     rbp, rsp

    push rdi;
    call ft_strlen

    add rax, 1
    mov rdi, rax
    call malloc ; PLT

    mov rdi, rax
    pop rsi
    call ft_strcpy

.return:
    pop rbp
    ret

section .note.GNU-stack noalloc noexec nowrite progbits
