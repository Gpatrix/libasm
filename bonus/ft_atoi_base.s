; int  ft_atoi_base(char *str, char *base);

extern ft_strlen
global ft_atoi_base

section .text

get_char_place:

    mov rdx, r12
    mov rcx, rdx
    movzx rdi, byte [r11]

.loop:
    movzx r8, byte [rdx]

    test r8, r8
    jz .not_found

    cmp rdi, r8
    je .get_place

    inc rdx
    jmp .loop

.not_found:
    mov rcx, -1
    ret

.get_place:
    sub rdx, rcx
    mov rcx, rdx
    ret

skip_white:
    movzx r8d, byte [r11]
    test r8b, r8b
    jz .exit
    lea r9d, [r8-9]
    cmp r9b, 4
    jbe .next
    cmp r8b, 32
    jne .exit

.next:
    inc r11
    jmp skip_white

.exit:
    ret

ft_atoi_base:
    push rbp
    mov rbp, rsp
    push r11 ; str ptr
    push r12 ; base ptr
    push r13 ; str_len
    push r14 ; sign

    mov r11, rdi
    mov r12, rsi
    mov rdi, rsi
    mov r14, 1

    call ft_strlen
    mov r13, rax
    xor rax, rax

    call skip_white

.loop:
    cmp [r11], byte 0
    je .return

    call get_char_place

    cmp rcx, -1
    je .return

.add_value:
    imul rax, r13
    add rax, rcx

    inc r11
    jmp .loop

.return_error:
    xor rax, rax

.return:
    imul rax, r14
    pop r14
    pop r13
    pop r12
    pop r11
    pop rbp
    ret


section .note.GNU-stack noalloc noexec nowrite progbits