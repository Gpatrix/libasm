global ft_strcmp
; TODO to test with school strcmp
section .text
ft_strcmp:

.loop:

    mov r8b, [rdi]
    mov r9b, [rsi]

    cmp r8b, r9b
    jne .return_diff

    test r8b, r8b
    je .return_same

    inc rdi
    inc rsi
    jmp .loop

.return_diff:
    sub r8b, r9b
    movsx eax, r8b
    ret

.return_same:
    xor eax, eax
    ret

section .note.GNU-stack noalloc noexec nowrite progbits
