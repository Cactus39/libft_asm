;size_t	ft_strlcpy(char *dest, const char *src, size_t size)
section .text
	global ft_strlcpy
	extern ft_strlen

ft_strlcpy:
	xor     rax, rax
	cmp     rdx, 0
	je      .fin
	dec     rdx

.loop:
		cmp     rax, rdx
		jae     .zero_byte
		cmp     byte [rsi + rax], 0
		je      .zero_byte
		mov     cl, byte [rsi + rax]
		mov     byte [rdi + rax], cl
		inc     rax
		jmp     .loop

.zero_byte:
	mov     byte [rdi + rax], 0

.fin:
	mov     rdi, rsi
	jmp     ft_strlen

section .note.GNU-stack
