; void ft_list_sort(t_list **begin_list, int (*cmp)(void*, void*));

extern malloc
%include "s_list.s"

global ft_list_sort

section .text

ft_list_sort:
    push rbp
    mov rbp, rsp
    push r11
    push r12
    sub rsp, 16

    mov QWORD [rbp-8], rdi
    mov r12, [rdi]
    mov rdx, rdi
    mov r11, rsi

    mov rdi, [rdx]
    mov rsi, [rdx + s_list.next]
    mov rsi, [rsi]
    call r11
    cmp rax, 0
    jg .loop

.first_swap:
    mov rdx, QWORD [rbp-8]
    mov rdi, QWORD [rdx]
    mov rax, [rdi + s_list.next]

    mov rcx, QWORD [rax + s_list.next]
    mov QWORD [rdi + s_list.next], rcx

    mov QWORD [rax + s_list.next], rdi

    mov QWORD [rdx], rax

.loop:
    mov r12, [r12 + s_list.next]
    


.return:
    add rsp, 16
    pop r12
    pop r11
    pop rbp
    ret