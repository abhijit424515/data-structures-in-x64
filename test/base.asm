section .text
	global print
	global strlen
	global malloc
	global free

;; --------------------------------

strlen:
	;; rsi = pointer to string (char*)
	;; returns length of string in rax

	xor rax, rax				; init length as 0

.loop:
	cmp byte [rsi + rax], 0		; check if string terminated
	je .end						; if null, end loop
	add rax, 1					; increment length
	jmp .loop

.end:
	ret

;; --------------------------------

print:
	;; rsi = pointer to string (char*)

	push rdx		; save rdx
	push rdi		; save rdi
	push rax		; save rax

	call strlen		; get length of string
	
	mov rdx, rax	; set string length for syscall
	mov rdi, 1		; file descriptor 1 (stdout)
	mov rax, 1		; syscall write
	syscall

	pop rax			; restore rax
	pop rdi			; restore rdi
	pop rdx			; restore rdx

	ret

;; --------------------------------

malloc:
	;; rsi = bytes of memory to allocate
	;; returns pointer to allocated memory in rax

	push rdi		; save rdi
	push rdx		; save rdx
	push r10		; save r10
	push r8			; save r8
	push r9			; save r9

	xor rdi, rdi	; address = 0
	mov rdx, 0x3	; flags = PROT_READ | PROT_WRITE
	mov r10, 0x22	; flags = MAP_PRIVATE | MAP_ANONYMOUS
	mov r8, -1		; file descriptor = -1
	mov r9, 0		; offset = 0
	mov rax, 9		; syscall mmap
	syscall

	pop r9			; restore r9
	pop r8			; restore r8
	pop r10			; restore r10
	pop rdx			; restore rdx
	pop rdi			; restore rdi

	ret

free:
	;; rdi = pointer to memory to free
	;; rsi = bytes of memory to free

	push rax		; save rax

	mov rax, 11		; syscall munmap
	syscall

	pop rax			; restore rax
	ret