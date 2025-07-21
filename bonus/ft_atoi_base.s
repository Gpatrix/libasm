; int  ft_atoi_base(char *str, char *base);

extern ft_strlen
global ft_atoi_base

section .text

; r11 str_len
ft_atoi_base:
    push rbp
    mov rbp, rsp
    push r11
    push r12
    push r13

    mov r11, rdi ; str ptr
    mov r12, rsi ; base ptr
    mov rdi, rsi

    call ft_strlen
    mov r13, rax ; str_len
    xor rax, rax

.loop:
    cmp [r11], byte 0
    je .return

    imul rax, r13
    mov dil, byte [r11]
    sub dil, '0'
    movzx rdi, dil
    add rax, rdi

    inc r11
    jmp .loop

.return:
    pop r13
    pop r12
    pop r11
    pop rbp
    ret


section .note.GNU-stack noalloc noexec nowrite progbits