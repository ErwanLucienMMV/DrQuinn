default rel

%macro DATA 0
section .rodata
source db "default rel%1$c%1$c%%macro DATA 0%1$csection .rodata%1$csource db %3$c%4$s%3$c, 0%1$cfilename db %3$cGrace_kid.s%3$c, 0%1$cmode db %3$cw%3$c, 0%1$c%%endmacro%1$c%1$c%%macro CODE 0%1$cglobal main%1$cextern fopen%1$cextern fprintf%1$cextern fclose%1$csection .text%1$cmain:%1$c    push rbp%1$c    mov rbp, rsp%1$c    sub rsp, 16%1$c    lea rdi, [rel filename]%1$c    lea rsi, [rel mode]%1$c    call fopen wrt ..plt%1$c    test rax, rax%1$c    jz .error%1$c    mov [rbp - 8], rax%1$c    mov rdi, rax%1$c    lea rsi, [rel source]%1$c    mov edx, 10%1$c    mov ecx, 9%1$c    mov r8d, 34%1$c    lea r9, [rel source]%1$c    xor eax, eax%1$c    call fprintf wrt ..plt%1$c    mov [rbp - 12], eax%1$c    mov rdi, [rbp - 8]%1$c    call fclose wrt ..plt%1$c    test eax, eax%1$c    jnz .error%1$c    cmp dword [rbp - 12], 0%1$c    jl .error%1$c    xor eax, eax%1$c    leave%1$c    ret%1$c.error:%1$c    mov eax, 1%1$c    leave%1$c    ret%1$c%%endmacro%1$c%1$c%%macro RUN 0%1$cDATA%1$cCODE%1$csection .note.GNU-stack noalloc noexec nowrite progbits%1$c%%endmacro%1$c%1$c; Exactly three macros generate the data and the sole entry point.%1$cRUN%1$c", 0
filename db "Grace_kid.s", 0
mode db "w", 0
%endmacro

%macro CODE 0
global main
extern fopen
extern fprintf
extern fclose
section .text
main:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    lea rdi, [rel filename]
    lea rsi, [rel mode]
    call fopen wrt ..plt
    test rax, rax
    jz .error
    mov [rbp - 8], rax
    mov rdi, rax
    lea rsi, [rel source]
    mov edx, 10
    mov ecx, 9
    mov r8d, 34
    lea r9, [rel source]
    xor eax, eax
    call fprintf wrt ..plt
    mov [rbp - 12], eax
    mov rdi, [rbp - 8]
    call fclose wrt ..plt
    test eax, eax
    jnz .error
    cmp dword [rbp - 12], 0
    jl .error
    xor eax, eax
    leave
    ret
.error:
    mov eax, 1
    leave
    ret
%endmacro

%macro RUN 0
DATA
CODE
section .note.GNU-stack noalloc noexec nowrite progbits
%endmacro

; Exactly three macros generate the data and the sole entry point.
RUN
