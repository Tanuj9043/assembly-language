SYS_EXIT equ 1
SYS_READ equ 3
SYS_WRITE equ 4
STDIN equ 0
STDOUT equ 1

section .data
    msg1 db 'Enter number : '
    len1 equ $-msg1
    msg2 db 'Found at index : '
    len2 equ $-msg2
    msg3 db 'Not found'
    len3 equ $-msg3
    x db '12', '10', '22', '13', '19', '14', '11', '29', '10', '16'

section .bss
    num resb 2
    index resb 4

section .text
    global _start ;must be declared for linker (ld)
    _start: ;tell linker entry point

        mov eax,4 ;system call number (sys_write)
        mov ebx,1 ;file descriptor (stdout)
        mov ecx,[x] ;message to write
        mov edx,2 ;byte
        int 0x80 ;call kernel

        mov eax,4 ;system call number (sys_write)
        mov ebx,1 ;file descriptor (stdout)
        mov ecx,msg1 ;message to write
        mov edx,len1 ;message length
        int 0x80 ;call kernel

        mov eax,3 ;system call number (sys_read)
        mov ebx,0 ;file descriptor (stdin)
        mov ecx,num ;number
        mov edx,2 ;bytes
        int 0x80 ;call kernel4

        mov eax,10
        mov ebx,[num]
        mov ecx,x

        lp :
            dec eax
            cmp ebx,'11'
            je found
            add ecx,2
            dec eax
            jnz lp

        mov eax,4 ;system call number (sys_write)
        mov ebx,1 ;file descriptor (stdout)
        mov ecx,msg3 ;message to write
        mov edx,len3 ;message length
        int 0x80 ;call kernel
        mov eax,1 ;system call number (sys_exit)
        int 0x80 ;call kernel

        found :
            mov [index],eax
            mov eax,4 ;system call number (sys_write)
            mov ebx,1 ;file descriptor (stdout)
            mov ecx,msg2 ;message to write
            mov edx,len2 ;message length
            int 0x80 ;call kernel

            mov eax,4 ;system call number (sys_write)
            mov ebx,1 ;file descriptor (stdout)
            mov ecx,index ;message to write
            mov edx,4 ;byte
            int 0x80 ;call kernel
            mov eax,1 ;system call number (sys_exit)
            int 0x80 ;call kernel
