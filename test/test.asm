section .data
    greeting db "Hello World!", 10, 0

section .text
    extern square
	extern print
    global _start

_start:
	; call square function
	mov rdi, 5
	call square

	; check result
	cmp rax, 25
	jne exit_1

	;; --------------------------------

	; call the print function
	mov rsi, greeting
	call print

	;; --------------------------------

    ; exit
    mov rax, 60
    xor rdi, rdi
    syscall
	jmp eof

exit_1:
	; exit code 1
	mov rax, 60
	mov rdi, 1
	syscall
	jmp eof

eof:
