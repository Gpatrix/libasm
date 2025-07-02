global ft_strcmp

section .text
ft_strcmp:

.loop:

    mov cl, [rdi]
    mov dl, [rsi]

    cmp cl, dl
    jne .return_diff

    test cl, cl
    je .return_same

    inc rdi
    inc rsi
    jmp .loop

.return_diff:
    sub cl, dl
    movsx eax, cl
    ret

.return_same:
    xor eax, eax
    ret

section .note.GNU-stack noalloc noexec nowrite progbits
