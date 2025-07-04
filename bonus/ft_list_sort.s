; void ft_list_sort(t_list **begin_list, int (*cmp)(void*, void*));

extern malloc
%include "s_list.s"

global ft_list_sort

section .text

ft_list_sort:
    push rbp
    mov rbp, rsp
    push r11 ; ptr to fonction
    push r12 ; original pointer
    push r13 ; 1nd s_list
    push r14 ; 1nd s_list

    mov r12, rdi
    mov r13, [rdi]
    mov r11, rsi

.base_sort:

    mov rdi, [r13] ; data
    mov r14, [r13 + s_list.next]
    test r14, r14
    jz .loop
    mov rdi, [r14] ; data
    call r11

    cmp rax, 0
    jg .base_swap
    jmp .base_sort

.base_swap:
    mov rcx, QWORD [r14 + s_list.next]
    mov QWORD [r13 + s_list.next], rcx

    mov QWORD [r14 + s_list.next], r13

    mov QWORD [r12], r14


.loop:
;     .iner_loop:

;         mov r13, [r12 + s_list.next] ; TODO conditional move
;     mov r12, [r12 + s_list.next]
;     mov r13, [r12 + s_list.next]

.return:
    pop r14
    pop r13
    pop r12
    pop r11
    pop rbp
    ret