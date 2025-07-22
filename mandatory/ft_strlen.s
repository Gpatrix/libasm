; size_t  ft_strlen(const char *s);

global ft_strlen

section .text
ft_strlen:
    xor rax, rax

.loop:
    cmp [rdi], byte 0
    je .return

    inc rax
    inc rdi
    jmp .loop

.return:
    ret

section .note.GNU-stack noalloc noexec nowrite progbits