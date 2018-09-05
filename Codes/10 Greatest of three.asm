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
    msg3 db 'Enter 3rd number : '
    len3 equ $-msg3

    msg4 db '1st is greatest',10
    len4 equ $-msg4
    msg5 db '2nd is greatest',10
    len5 equ $-msg5
    msg6 db '3rd is greatest',10
    len6 equ $-msg6

section .bss
    num1 resb 4
    num2 resb 4
    num3 resb 4

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
        mov edx,4 ;bytes
        int 0x80 ;call kernel

        mov eax,4 ;system call number (sys_write)
        mov ebx,1 ;file descriptor (stdout)
        mov ecx,msg2 ;message to write
        mov edx,len2 ;message length
        int 0x80 ;call kernel

        mov eax,3 ;system call number (sys_read)
        mov ebx,0 ;file descriptor (stdin)
        mov ecx,num2 ;number
        mov edx,4 ;bytes
        int 0x80 ;call kernel

        mov eax,4 ;system call number (sys_write)
        mov ebx,1 ;file descriptor (stdout)
        mov ecx,msg3 ;message to write
        mov edx,len3 ;message length
        int 0x80 ;call kernel

        mov eax,3 ;system call number (sys_read)
        mov ebx,0 ;file descriptor (stdin)
        mov ecx,num3 ;number
        mov edx,4 ;bytes
        int 0x80 ;call kernel

        mov ax,[num1]
        mov bx,[num2]
        mov cx,[num3]
        cmp ax,bx
        jg equal12
        cmp bx,cx
        jge greatest2

        mov eax,4 ;system call number (sys_write)
        mov ebx,1 ;file descriptor (stdout)
        mov ecx,msg6 ;message to write
        mov edx,len6 ;message length
        int 0x80 ;call kernel
        mov eax,1 ;system call number (sys_exit)
        int 0x80 ;call kernel

        equal12 :
            cmp ax,cx
            jge greatest1
            mov eax,4 ;system call number (sys_write)
            mov ebx,1 ;file descriptor (stdout)
            mov ecx,msg6 ;message to write
            mov edx,len6 ;message length
            int 0x80 ;call kernel
            mov eax,1 ;system call number (sys_exit)
            int 0x80 ;call kernel

        greatest1 :
            mov eax,4 ;system call number (sys_write)
            mov ebx,1 ;file descriptor (stdout)
            mov ecx,msg4 ;message to write
            mov edx,len4 ;message length
            int 0x80 ;call kernel
            mov eax,1 ;system call number (sys_exit)
            int 0x80 ;call kernel

        greatest2 :
            mov eax,4 ;system call number (sys_write)
            mov ebx,1 ;file descriptor (stdout)
            mov ecx,msg5 ;message to write
            mov edx,len5 ;message length
            int 0x80 ;call kernel
            mov eax,1 ;system call number (sys_exit)
            int 0x80 ;call kernel
