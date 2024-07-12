section .text
	global func

func:
	mov rax, rdi
	imul rax, rdi
	ret