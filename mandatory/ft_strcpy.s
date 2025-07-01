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
    jmp .return

.return:
    ret

section .note.GNU-stack noalloc noexec nowrite progbits
