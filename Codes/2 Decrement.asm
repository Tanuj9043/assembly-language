SYS_EXIT equ 1
SYS_READ equ 3
SYS_WRITE equ 4
STDIN equ 0
STDOUT equ 1

section .data
    ask db 'Enter a number : '
    len1 equ $-ask
    tell db 'Decremented number : '
    len2 equ $-tell

section .bss
    num resb 2

section .text
    global _start ;must be declared for linker (ld)
    _start: ;tell linker entry point

        mov eax,4 ;system call number (sys_write)
        mov ebx,1 ;file descriptor (stdout)
        mov ecx,ask ;message to write
        mov edx,len1 ;message length
        int 0x80 ;call kernel

        mov eax,3 ;system call number (sys_read)
        mov ebx,0 ;file descriptor (stdin)
        mov ecx,num ;number
        mov edx,2 ;bytes
        int 0x80 ;call kernel

        mov eax,[num]
        sub eax,5
        mov [num],eax

        mov eax,4 ;system call number (sys_write)
        mov ebx,1 ;file descriptor (stdout)
        mov ecx,tell ;message to write
        mov edx,len2 ;message length
        int 0x80 ;call kernel

        mov eax,4 ;system call number (sys_write)
        mov ebx,1 ;file descriptor (stdout)
        mov ecx,num ;message to write
        mov edx,2 ;byte
        int 0x80 ;call kernel

        mov eax,1 ;system call number (sys_exit)
        int 0x80 ;call kernel
