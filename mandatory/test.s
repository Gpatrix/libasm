section .data
    msg db      "hello, world!", 10

section .text
    global __hello

__hello:
    mov     rax, 1
    mov     rdi, 1
    lea     rsi, [rel msg]
    mov     rdx, 14
    syscall

section .note.GNU-stack noalloc noexec nowrite progbits
