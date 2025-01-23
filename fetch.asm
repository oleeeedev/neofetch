DEFAULT REL

section .rodata
; Ascii

section .text
    global _start
    global asm_fetch_print
    global asm_fetch_strlen
    extern malloc
    extern free

; by NikOverflow
asm_fetch_strlen:
    xor rax, rax
.find_length:
    cmp byte [rdi + rax], 0
    je .found_length
    inc rax
    jmp .find_length
.found_length:
    ret

; by NikOverflow
asm_fetch_print:
    call asm_fetch_strlen
    mov rdx, rax
    mov rax, 1
    mov rsi, rdi
    mov rdi, 1
    syscall
    ret

_start:
    mov rdi, 69
    call malloc

    mov byte [rax], 65
    mov byte [rax + 1], 66
    lea rdi, [rax]
    call asm_fetch_print

    mov rax, 60
    mov rdi, 0
    syscall
