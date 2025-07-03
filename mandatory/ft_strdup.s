global ft_strdup

extern malloc
extern ft_strlen
extern ft_strcpy
extern __errno_location

section .text

ft_strdup:
    push    rbp
    mov     rbp, rsp

    sub rsp, 16
    mov QWORD [rsp+8], rdi
    call ft_strlen

    inc rax
    mov rdi, rax
    call malloc wrt ..plt
    test rax, rax
    jz .ENOMEM

    mov rdi, rax
    mov rsi, QWORD [rsp+8]
    call ft_strcpy
    jmp .return

.ENOMEM:
    call __errno_location wrt ..plt
    mov DWORD [rax], 12
    mov rax, 0

.return:
    add rsp, 16
    pop rbp
    ret

section .note.GNU-stack noalloc noexec nowrite progbits
