; void ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(void*, void*), void (*free_fct)(void *));

extern free
%include "s_list.s"

global ft_list_remove_if

section .text

ft_list_remove_if:
    push rbp
    mov rbp, rsp
    push rbx ; cmp
    push r12 ; data_ref
    push r13 ; free_fct
    push r14 ; current s_list
    push r15 ; original pointer / prev s_list

    mov rbx, rdx
    mov r12, rsi
    mov r13, rcx
    mov r15, rdi
    mov r14, [r15]

.cmp_first_elem:

    test r14, r14
    jz .return

    mov rdi, [r14]
    mov rsi, r12
    call rbx ; cmp
    test rax, rax
    jz .free_first_elem
    jmp .pre_std_cmp


.free_first_elem:
    mov rdi, [r14]
    call r13 ; free_fct

    mov rax, [r14 + s_list.next]
    mov [r15], rax

    mov rdi, r14
    call free wrt ..plt

    mov r14, [r15]
    jmp .cmp_first_elem

.pre_std_cmp:
    mov r15, [r15]
    mov r14, [r14 + s_list.next]

.std_cmp:

    test r14, r14
    jz .return

    mov rdi, [r14]
    mov rsi, r12
    call rbx ; cmp
    test rax, rax
    jz .free_std_elem
    jmp .next_elem

.next_elem:
    mov r15, r14
    mov r14, [r14 + s_list.next]
    jmp .std_cmp

.free_std_elem:
    mov rdi, [r14]
    call r13 ; free_fct

    mov rdi, r14
    mov r14, [r14 + s_list.next]
    mov [r15 + s_list.next], r14
    call free wrt ..plt

    jmp .std_cmp


.return:
    pop r15
    pop r14
    pop r13
    pop r12
    pop rbx
    pop rbp
    ret

section .note.GNU-stack noalloc noexec nowrite progbits