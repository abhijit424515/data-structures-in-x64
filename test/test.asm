section .data
	format db "The square of %d is %d\n", 0

section .text
    extern printf
    extern func
    global _start

_start:
	; call the function
	mov rdi, 5
	call func

	; check if result is correct
	cmp rax, 25
	jne exit_1

    ; exit
    mov     rax, 60
    xor     rdi, rdi
    syscall   
	jmp eof

exit_1:
	; exit code 1
	mov rax, 60
	mov rdi, 1
	syscall
	jmp eof      

eof:
