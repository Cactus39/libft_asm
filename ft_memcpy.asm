global ft_memcpy

section .text
ft_memcpy:
	xor rax, rax
	cmp rdi, 0
	je .exit
	cmp rsi, 0
	je .exit
	mov rax, rdi
.loop:
	cmp rdx, 0
	je .exit
	dec rdx
	mov cl, byte [rsi]
	mov byte [rdi], cl
	inc rsi
	inc rdi
	jmp .loop
.exit:
	ret

section .note.GNU-stack
