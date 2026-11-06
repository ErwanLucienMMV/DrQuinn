default rel
global main
extern printf
extern fflush

; The format string contains the complete source, including itself.
section .rodata
source db "default rel%1$cglobal main%1$cextern printf%1$cextern fflush%1$c%1$c; The format string contains the complete source, including itself.%1$csection .rodata%1$csource db %3$c%4$s%3$c, 0%1$c%1$csection .text%1$cmain:%1$c    ; Keep the System V stack aligned before calling the helper.%1$c    push rbp%1$c    mov rbp, rsp%1$c    call ft_colleen%1$c    pop rbp%1$c    ret%1$c%1$cft_colleen:%1$c    push rbp%1$c    mov rbp, rsp%1$c    lea rdi, [rel source]%1$c    mov esi, 10%1$c    mov edx, 9%1$c    mov ecx, 34%1$c    lea r8, [rel source]%1$c    xor eax, eax%1$c    call printf wrt ..plt%1$c    test eax, eax%1$c    js .error%1$c    xor edi, edi%1$c    call fflush wrt ..plt%1$c    test eax, eax%1$c    jnz .error%1$c    xor eax, eax%1$c    pop rbp%1$c    ret%1$c.error:%1$c    mov eax, 1%1$c    pop rbp%1$c    ret%1$c%1$csection .note.GNU-stack noalloc noexec nowrite progbits%1$c", 0

section .text
main:
    ; Keep the System V stack aligned before calling the helper.
    push rbp
    mov rbp, rsp
    call ft_colleen
    pop rbp
    ret

ft_colleen:
    push rbp
    mov rbp, rsp
    lea rdi, [rel source]
    mov esi, 10
    mov edx, 9
    mov ecx, 34
    lea r8, [rel source]
    xor eax, eax
    call printf wrt ..plt
    test eax, eax
    js .error
    xor edi, edi
    call fflush wrt ..plt
    test eax, eax
    jnz .error
    xor eax, eax
    pop rbp
    ret
.error:
    mov eax, 1
    pop rbp
    ret

section .note.GNU-stack noalloc noexec nowrite progbits
