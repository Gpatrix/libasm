; void ft_list_push_front(t_list **begin_list, void *data);



extern malloc
%include "s_list.s"

global ft_list_push_front

section .text

%macro alloc_struct 0
    mov rdi, s_list_size
    call malloc wrt ..plt
    test rax, rax
    jz ft_list_push_front.return

    mov rcx, QWORD [rbp-16]
    mov QWORD [rax + s_list.data], rcx
%endmacro

ft_list_push_front:
    push rbp
    mov rbp, rsp
    sub rsp, 16

    test rdi, rdi
    jz .return

    mov QWORD [rbp-8], rdi
    mov QWORD [rbp-16], rsi

    mov rax, QWORD [rdi]
    test rax, rax
    jz .new_list

    jmp .add_font

.new_list:
    alloc_struct

    mov QWORD [rax + s_list.next], 0

    mov rdx, QWORD [rbp-8]
    mov QWORD [rdx], rax

    jmp .return

.add_font:
    alloc_struct

    mov rdx, QWORD [rbp-8]
    mov rdi, QWORD [rdx]
    mov QWORD [rax + s_list.next], rdi

    mov QWORD [rdx], rax

    jmp .return

.return:
    add rsp, 16
    pop rbp
    ret