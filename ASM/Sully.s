default rel
global main
extern strrchr
extern strcmp
extern snprintf
extern fopen
extern fprintf
extern fclose
extern system

section .rodata
counter dd 5
source db "default rel%1$cglobal main%1$cextern strrchr%1$cextern strcmp%1$cextern snprintf%1$cextern fopen%1$cextern fprintf%1$cextern fclose%1$cextern system%1$c%1$csection .rodata%1$ccounter dd %5$d%1$csource db %3$c%4$s%3$c, 0%1$csource_name db __FILE__, 0%1$coriginal_name db %3$cSully.s%3$c, 0%1$cfilename_format db %3$cSully_%%d.s%3$c, 0%1$ccommand_format db %3$cnasm -f elf64 Sully_%%1$d.s -o Sully_%%1$d.o && cc Sully_%%1$d.o -o Sully_%%1$d && ./Sully_%%1$d%3$c, 0%1$cmode db %3$cw%3$c, 0%1$c%1$csection .text%1$cmain:%1$c    push rbp%1$c    mov rbp, rsp%1$c    sub rsp, 352%1$c    mov eax, [rel counter]%1$c    test eax, eax%1$c    js .done%1$c    mov [rbp - 324], eax%1$c    lea rdi, [rel source_name]%1$c    mov esi, 47%1$c    call strrchr wrt ..plt%1$c    test rax, rax%1$c    lea rdi, [rel source_name]%1$c    jz .basename%1$c    lea rdi, [rax + 1]%1$c.basename:%1$c    lea rsi, [rel original_name]%1$c    call strcmp wrt ..plt%1$c    test eax, eax%1$c    jz .write%1$c    sub dword [rbp - 324], 1%1$c    js .done%1$c.write:%1$c    lea rdi, [rbp - 64]%1$c    mov esi, 64%1$c    lea rdx, [rel filename_format]%1$c    mov ecx, [rbp - 324]%1$c    xor eax, eax%1$c    call snprintf wrt ..plt%1$c    test eax, eax%1$c    js .error%1$c    cmp eax, 64%1$c    jae .error%1$c    lea rdi, [rbp - 64]%1$c    lea rsi, [rel mode]%1$c    call fopen wrt ..plt%1$c    test rax, rax%1$c    jz .error%1$c    mov [rbp - 336], rax%1$c    mov rdi, rax%1$c    lea rsi, [rel source]%1$c    mov edx, 10%1$c    mov ecx, 9%1$c    mov r8d, 34%1$c    lea r9, [rel source]%1$c    mov eax, [rbp - 324]%1$c    mov [rsp], rax%1$c    xor eax, eax%1$c    call fprintf wrt ..plt%1$c    mov [rbp - 340], eax%1$c    mov rdi, [rbp - 336]%1$c    call fclose wrt ..plt%1$c    test eax, eax%1$c    jnz .error%1$c    cmp dword [rbp - 340], 0%1$c    jl .error%1$c    lea rdi, [rbp - 320]%1$c    mov esi, 256%1$c    lea rdx, [rel command_format]%1$c    mov ecx, [rbp - 324]%1$c    xor eax, eax%1$c    call snprintf wrt ..plt%1$c    test eax, eax%1$c    js .error%1$c    cmp eax, 256%1$c    jae .error%1$c    lea rdi, [rbp - 320]%1$c    call system wrt ..plt%1$c    test eax, eax%1$c    jnz .error%1$c.done:%1$c    xor eax, eax%1$c    leave%1$c    ret%1$c.error:%1$c    mov eax, 1%1$c    leave%1$c    ret%1$c%1$csection .note.GNU-stack noalloc noexec nowrite progbits%1$c", 0
source_name db __FILE__, 0
original_name db "Sully.s", 0
filename_format db "Sully_%d.s", 0
command_format db "nasm -f elf64 Sully_%1$d.s -o Sully_%1$d.o && cc Sully_%1$d.o -o Sully_%1$d && ./Sully_%1$d", 0
mode db "w", 0

section .text
main:
    push rbp
    mov rbp, rsp
    sub rsp, 352
    mov eax, [rel counter]
    test eax, eax
    js .done
    mov [rbp - 324], eax
    lea rdi, [rel source_name]
    mov esi, 47
    call strrchr wrt ..plt
    test rax, rax
    lea rdi, [rel source_name]
    jz .basename
    lea rdi, [rax + 1]
.basename:
    lea rsi, [rel original_name]
    call strcmp wrt ..plt
    test eax, eax
    jz .write
    sub dword [rbp - 324], 1
    js .done
.write:
    lea rdi, [rbp - 64]
    mov esi, 64
    lea rdx, [rel filename_format]
    mov ecx, [rbp - 324]
    xor eax, eax
    call snprintf wrt ..plt
    test eax, eax
    js .error
    cmp eax, 64
    jae .error
    lea rdi, [rbp - 64]
    lea rsi, [rel mode]
    call fopen wrt ..plt
    test rax, rax
    jz .error
    mov [rbp - 336], rax
    mov rdi, rax
    lea rsi, [rel source]
    mov edx, 10
    mov ecx, 9
    mov r8d, 34
    lea r9, [rel source]
    mov eax, [rbp - 324]
    mov [rsp], rax
    xor eax, eax
    call fprintf wrt ..plt
    mov [rbp - 340], eax
    mov rdi, [rbp - 336]
    call fclose wrt ..plt
    test eax, eax
    jnz .error
    cmp dword [rbp - 340], 0
    jl .error
    lea rdi, [rbp - 320]
    mov esi, 256
    lea rdx, [rel command_format]
    mov ecx, [rbp - 324]
    xor eax, eax
    call snprintf wrt ..plt
    test eax, eax
    js .error
    cmp eax, 256
    jae .error
    lea rdi, [rbp - 320]
    call system wrt ..plt
    test eax, eax
    jnz .error
.done:
    xor eax, eax
    leave
    ret
.error:
    mov eax, 1
    leave
    ret

section .note.GNU-stack noalloc noexec nowrite progbits
