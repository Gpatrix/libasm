global ft_strlen

section .text
ft_strlen:
    push rbp
    mov rbp, rsp

    xor rax, rax

.loop:
    cmp [rdi], byte 0
    je .return

    inc rax
    inc rdi
    jmp .loop

.return:
    pop rbp
    ret

section .note.GNU-stack noalloc noexec nowrite progbits
