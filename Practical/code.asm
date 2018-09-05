SYS_EXIT equ 1
SYS_READ equ 3
SYS_WRITE equ 4
STDIN equ 0
STDOUT equ 1

section	.data
global x
x db '1','4','2','5','0','3','9','8','7','6'
section	.text
global _start
_start:
    mov  ecx,10

    outer:
         mov  edx, x
         mov  ebx,0
    inner:
         inc ebx
         mov al,[edx]
         inc edx
         cmp al,[edx]
         jb skip
         xchg al,[edx]
         dec edx
         mov [edx],al
         inc edx
    skip:
         cmp ebx,ecx
         jl inner
         loop outer

     mov eax,4
     mov ebx,1
     mov ecx,x
     mov edx,1
     int 0x80
     mov eax,4
     mov ebx,1
     mov ecx,x+1
     mov edx,1
     int 0x80
     mov eax,4
     mov ebx,1
     mov ecx,x+2
     mov edx,1
     int 0x80
     mov eax,4
     mov ebx,1
     mov ecx,x+3
     mov edx,1
     int 0x80
     mov eax,4
     mov ebx,1
     mov ecx,x+4
     mov edx,1
     int 0x80
     mov eax,4
     mov ebx,1
     mov ecx,x+5
     mov edx,1
     int 0x80
     mov eax,4
     mov ebx,1
     mov ecx,x+6
     mov edx,1
     int 0x80
     mov eax,4
     mov ebx,1
     mov ecx,x+7
     mov edx,1
     int 0x80
     mov eax,4
     mov ebx,1
     mov ecx,x+8
     mov edx,1
     int 0x80
     mov eax,4
     mov ebx,1
     mov ecx,x+9
     mov edx,1
     int 0x80
    mov eax,1
    int 0x80
