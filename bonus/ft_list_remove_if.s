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

    mov  rax, rdx
    and  rax, rsi
    and  rax, rcx
    and  rax, rdi
    test rax, rax
    jz .return
    mov rbx, rdx
    mov r12, rsi
    mov r13, rcx
    mov r15, rdi
    mov r14, [r15]

.check_head:

    test r14, r14
    jz .return

    mov rdi, [r14]
    mov rsi, r12
    call rbx ; cmp
    test eax, eax
    jz .free_head
    jmp .pre_check_next


.free_head:
    mov rdi, [r14]
    call r13 ; free_fct

    mov rax, [r14 + s_list.next]
    mov [r15], rax

    mov rdi, r14
    call free wrt ..plt

    mov r14, [r15]
    jmp .check_head

.pre_check_next:
    mov r15, [r15]
    mov r14, [r14 + s_list.next]

.check_next:

    test r14, r14
    jz .return

    mov rdi, [r14]
    mov rsi, r12
    call rbx ; cmp
    test eax, eax
    jz .free_curr

.next_elem:
    mov r15, r14
    mov r14, [r14 + s_list.next]
    jmp .check_next

.free_curr:
    mov rdi, [r14]
    call r13 ; free_fct

    mov rdi, r14
    mov r14, [r14 + s_list.next]
    mov [r15 + s_list.next], r14
    call free wrt ..plt

    jmp .check_next


.return:
    pop r15
    pop r14
    pop r13
    pop r12
    pop rbx
    pop rbp
    ret

section .note.GNU-stack noalloc noexec nowrite progbits