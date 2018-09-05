SYS_EXIT equ 1
SYS_READ equ 3
SYS_WRITE equ 4
STDIN equ 0
STDOUT equ 1

section .data
    msg1 db 'Enter a number : '
    len1 equ $-msg1
    msg2 db 'Equal to 10',10
    len2 equ $-msg2
    msg3 db 'Not equal to 10',10
    len3 equ $-msg3

section .bss
    num resb 4

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
        mov ecx,num ;number
        mov edx,4 ;bytes
        int 0x80 ;call kernel

        mov ax,[num]
        mov bx,'10'
        cmp ax,bx
        je equal

        mov eax,4 ;system call number (sys_write)
        mov ebx,1 ;file descriptor (stdout)
        mov ecx,msg3 ;message to write
        mov edx,len3 ;message length
        int 0x80 ;call kernel
        mov eax,1 ;system call number (sys_exit)
        int 0x80 ;call kernel

        equal :
            mov eax,4 ;system call number (sys_write)
            mov ebx,1 ;file descriptor (stdout)
            mov ecx,msg2 ;message to write
            mov edx,len2 ;message length
            int 0x80 ;call kernel
            mov eax,1 ;system call number (sys_exit)
            int 0x80 ;call kernel
