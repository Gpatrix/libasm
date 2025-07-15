; void ft_list_sort(t_list **begin_list, int (*cmp)(void*, void*));

%include "s_list.s"

global ft_list_sort

section .text

ft_list_sort:
    push rbp
    mov rbp, rsp
    push r11 ; ptr to fonction
    push r13 ; 1nd s_list
    push r14 ; 2nd s_list


    mov r11, rsi
    mov r13, [rdi]
    test r13, r13
    jz .return
    mov r14, QWORD [r13 + s_list.next]
    test r14, r14
    jz .return

; .outer_loop:

    .iner_loop:
        test r14, r14
        jz .end_outer_loop

        mov rdi, QWORD [r13]
        mov rsi, QWORD [r14]
        call r11

        cmp rax, 0
        jg .swap

    .end_iner_loop:
        mov r14, QWORD [r14 + s_list.next]
        jmp .iner_loop

.end_outer_loop:
    mov r13, QWORD [r13 + s_list.next]
    test r13, r13
    jz  .return

    mov r14, QWORD [r13 + s_list.next]
    jmp .iner_loop

.swap:
    mov rax, [r13]
    mov rdi, [r14]
    mov [r13], rdi
    mov [r14], rax

    jmp .end_iner_loop

.return:
    pop r14
    pop r13
    pop r11
    pop rbp
    ret

section .note.GNU-stack noalloc noexec nowrite progbits