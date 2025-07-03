global ft_read

extern __errno_location

section .text

ft_read:
    push    rbp
    mov     rbp, rsp

    mov rax, 0
    syscall
    cmp rax, 0
    jl .errno

    jmp .return

.errno:
    neg rax
    mov rdi, rax
    call __errno_location wrt ..plt
    mov DWORD [rax], edi
    mov rax, -1

.return:
    pop rbp
    ret

section .note.GNU-stack noalloc noexec nowrite progbits
