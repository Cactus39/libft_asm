;int		ft_strncmp(const char *s1, const char *s2, size_t n)
section .text
	global ft_strncmp

ft_strncmp:
	xor     rax, rax
	xor     r8, r8
	xor     r9, r9

.loop:
		cmp     r8, rdx
		je      .fin
		movzx   eax, byte [rdi + r8]
		movzx   r9d, byte [rsi + r8]
		inc     r8
		sub     eax, r9d
		test    r9d, r9d
		jz      .fin
		test    eax, eax
		jz      .loop

.fin:
	ret

section .note.GNU-stack
