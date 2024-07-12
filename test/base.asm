section .text
	global print
	global strlen

;; --------------------------------

strlen:
	;; rsi = pointer to string (char*)
	;; returns length of string in rax

	push rbp		; save base pointer
	mov rbp, rsp	; set base pointer

	xor rax, rax	; init length as 0

.loop:
	cmp byte [rsi + rax], 0		; check if string terminated
	je .end						; if null, end loop
	add rax, 1					; increment length
	jmp .loop

.end:
	pop rbp
	ret

;; --------------------------------

print:
	;; rsi = pointer to string (char*)

	push rbp		; save base pointer
	mov rbp, rsp	; set base pointer

	call strlen					; get length of string
	
	mov rdx, rax				; set string length for syscall
	mov rdi, 1					; file descriptor 1 (stdout)
	mov rax, 1					; syscall write
	syscall

	pop rbp
	ret