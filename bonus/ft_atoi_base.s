; int  ft_atoi_base(char *str, char *base);

extern ft_strlen
global ft_atoi_base

section .text

; 1.char, 2.tmp_reg, 3.jump
%macro is_whitespace 3
    lea %2d, [%1 - 9]
    cmp %2b, 4
    jbe %3
    cmp %1b, ' '
    je %3
%endmacro

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

skip_whitespace:
    movzx r8d, byte [r11]
    test r8b, r8b
    jz .exit
    is_whitespace  r8, r9, .next

.exit:
    ret

.next:
    inc r11
    jmp skip_white

get_sign:
    mov r8b, byte [r11]
    cmp r8b, '+'
    je .increment
    cmp r8b, '-'
    jne .return
    neg r14

.increment:
    inc r11
    jmp get_sign

.return:
    ret


verif_base:
    cmp r13, 1
    jle .error
    mov rcx, r12
    lea r10, [rcx + 1]

.outer_loop:
    movzx r8d, byte [rcx]
    is_whitespace  r8, r9, .error
    cmp r8b, '+'
    je .error
    cmp r8b, '-'
    je .error
    mov dl, byte [r10]
    test dl, dl
    jz .return

    .iner_loop:
        cmp r8b, byte [r10]
        je .error
        inc r10
        cmp [r10], byte 0
        jne .iner_loop

.outer_loop_end:
    inc rcx
    lea r10, [rcx + 1]
    jmp .outer_loop

.error:
    mov rax, 1
.return:
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

    call verif_base
    test rax, rax
    jnz .return_error

    call skip_white
    call get_sign

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