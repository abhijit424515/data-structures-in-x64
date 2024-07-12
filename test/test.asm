section .data
    greeting db "Hello World!", 10, 0

section .text
    extern square
	extern print
	extern malloc
	extern free
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

	; call the malloc function
	mov rsi, 16
	call malloc

	; check if malloc returned NULL
	cmp rax, 0
	je exit_1

	; store 2 integers in the allocated memory
	mov qword [rax], 123
	mov qword [rax + 8], 456

	; check if the integers were stored correctly
	cmp qword [rax], 123
	jne exit_1
	cmp qword [rax + 8], 456
	jne exit_1

	; free the allocated memory
	mov rsi, rax
	mov rdi, 16
	call free

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
