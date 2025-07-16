; int  ft_atoi_base(char *str, char *base);

global ft_atoi_base

section .text

%macro verif_base 0

%endmacro

ft_atoi_base:
    push rbp
    mov rbp, rsp

.return:
    pop rbp
    ret


section .note.GNU-stack noalloc noexec nowrite progbits