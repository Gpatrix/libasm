; char    *ft_strcpy(char *restrict dst, const char *restrict src);

global ft_strcpy

section .text
ft_strcpy:
    mov rax, rdi
    cld

.loop:
    cmp [rsi], byte 0
    je .terminator

    movsb
    jmp .loop

.terminator:
    mov [rdi], byte 0

.return:
    ret

section .note.GNU-stack noalloc noexec nowrite progbits