; int ft_list_size(t_list *begin_list);



extern malloc
%include "s_list.s"

global ft_list_size

section .text

ft_list_size:

    xor rax, rax

.loop:
    test rdi, rdi
    jz .return

    mov rdi, QWORD [rdi + s_list.next]
    inc rax
    jmp .loop

.return:
    ret