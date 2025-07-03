; void ft_list_sort(t_list **begin_list, int (*cmp)(void*, void*));

extern malloc
%include "s_list.s"

global ft_list_sort

section .text

ft_list_sort:
    push rbp
    mov rbp, rsp
    push r11;
    push r12;
    mov r11, rdi
    mov r12, rsi

    mov rsi, QWORD [rdi]
    mov rdi, QWORD [rdi + s_list.next]
    call r12

; .main_loop:

;     .second_loop:
;         ; if > 0 swap


.return:
    pop r12;
    pop r11;
    pop rbp
    ret