global ft_memcmp
;int	ft_memcmp(const void *s1, const void *s2, size_t n)
section .text
ft_memcmp:
	xor rax, rax
	xor r8, r8
.loop:
	cmp rdx, 0
	je .fin
	dec rdx
	movzx eax, byte [rdi]
	movzx r8d, byte [rsi]
	sub eax, r8d
	jnz .fin
	inc rdi
	inc rsi
	jmp .loop

.fin:
	ret

section .note.GNU-stack
