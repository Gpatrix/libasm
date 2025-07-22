; ssize_t ft_write(int fd, const void *buf, size_t count);

global ft_write

extern __errno_location

section .text

ft_write:
    push    rbp
    mov     rbp, rsp

    mov rax, 1
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