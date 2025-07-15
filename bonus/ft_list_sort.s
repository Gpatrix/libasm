; void ft_list_sort(t_list **begin_list, int (*cmp)(void*, void*));

%include "s_list.s"

global ft_list_sort

section .text

ft_list_sort:
    push rbp
    mov rbp, rsp
    push r11 ; ptr to fonction
    push r12 ; original double pointer
    push r13 ; 1nd s_list
    push r14 ; 2nd s_list
    push r15 ; 2nd s_list prev

    mov r11, rsi
    mov r12, rdi
    mov r13, [r12]
    mov r14, QWORD [r13 + s_list.next]
    mov r15, r14

.base_sort:

    test r14, r14
    jz .loop

    mov rdi, QWORD [r13] ; data pointer
    mov rsi, QWORD [r14] ; data pointer
    call r11

    cmp rax, 0
    jg .base_swap

.end_base_loop:
    mov r15, r14
    mov r14, QWORD [r14 + s_list.next]
    jmp .base_sort


.base_swap:
    mov rdi, QWORD [r13 + s_list.next]
    mov rsi, QWORD [r14 + s_list.next]
    mov QWORD [r14 + s_list.next], rdi
    mov QWORD [r13 + s_list.next], rsi
    mov QWORD [r15 + s_list.next], r13

    mov QWORD [r12], r14

    mov rax, r13
    mov r13, r14
    mov r14, rax
    jmp .end_base_loop

.loop:
;     .iner_loop:

;         mov r13, [r12 + s_list.next] ; TODO conditional move
;     mov r12, [r12 + s_list.next]
;     mov r13, [r12 + s_list.next]

.return:
    pop r15
    pop r14
    pop r13
    pop r12
    pop r11
    pop rbp
    ret

section .note.GNU-stack noalloc noexec nowrite progbits