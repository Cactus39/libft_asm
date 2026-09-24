;void	*ft_memcpy(void *dest, const void *src, size_t n)
section .text
	global ft_memcpy

ft_memcpy:
	mov     rax, rdi
	test    rdi, rdi
	jz      .exit
	test    rsi, rsi
	jz      .exit
	mov     rax, rdi
.loop:
		test    rdx, rdx
		jz      .exit
		dec     rdx
		mov     cl, byte [rsi]
		mov     byte [rdi], cl
		inc     rsi
		inc     rdi
		jmp     .loop

.exit:
	ret

section .note.GNU-stack
