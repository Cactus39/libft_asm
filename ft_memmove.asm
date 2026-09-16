global ft_memmove

extern ft_memcpy
section .text
ft_memmove:
	xor rax, rax
	cmp rdi, 0
	je .fin
	cmp rsi, 0
	je .fin
	cmp rdi, rsi
	jl ft_memcpy
	mov rax, rdi
	add rdi, rdx
	add rsi, rdx
.loop:
	cmp rdx, 0
	je .fin
	dec rdx
	dec rsi
	dec rdi
	mov cl, byte [rsi]
	mov byte [rdi], cl
	jmp .loop

.fin:
	ret

section .note.GNU-stack
