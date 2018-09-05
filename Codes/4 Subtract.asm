SYS_EXIT equ 1
SYS_READ equ 3
SYS_WRITE equ 4
STDIN equ 0
STDOUT equ 1

section .data
    msg1 db 'Enter 1st number : '
    len1 equ $-msg1
    msg2 db 'Enter 2nd number : '
    len2 equ $-msg2
    msg3 db 'Difference : '
    len3 equ $-msg3

section .bss
    num1 resb 2
    num2 resb 2
    dif resb 2

section .text
    global _start ;must be declared for linker (ld)
    _start: ;tell linker entry point

        mov eax,4 ;system call number (sys_write)
        mov ebx,1 ;file descriptor (stdout)
        mov ecx,msg1 ;message to write
        mov edx,len1 ;message length
        int 0x80 ;call kernel

        mov eax,3 ;system call number (sys_read)
        mov ebx,0 ;file descriptor (stdin)
        mov ecx,num1 ;number
        mov edx,2 ;bytes
        int 0x80 ;call kernel

        mov eax,4 ;system call number (sys_write)
        mov ebx,1 ;file descriptor (stdout)
        mov ecx,msg2 ;message to write
        mov edx,len2 ;message length
        int 0x80 ;call kernel

        mov eax,3 ;system call number (sys_read)
        mov ebx,0 ;file descriptor (stdin)
        mov ecx,num2 ;number
        mov edx,2 ;bytes
        int 0x80 ;call kernel

        mov eax,4 ;system call number (sys_write)
        mov ebx,1 ;file descriptor (stdout)
        mov ecx,msg3 ;message to write
        mov edx,len3 ;message length
        int 0x80 ;call kernel

        mov eax,[num1]
        mov ebx,[num2]
        sub eax,ebx
        add eax,'0'
        mov [dif],eax

        mov eax,4 ;system call number (sys_write)
        mov ebx,1 ;file descriptor (stdout)
        mov ecx,dif ;message to write
        mov edx,1 ;byte
        int 0x80 ;call kernel

        mov eax,1 ;system call number (sys_exit)
        int 0x80 ;call kernel
