;char	*ft_strdup(const char *str)
section .text
	global ft_strdup
	extern ft_strlen
	extern ft_calloc

ft_strdup:
	test    rdi, rdi
	jz      .err
	push    rdi
	call    ft_strlen

	inc     rax
	mov     rdi, rax
	mov     rsi, 1
	call    ft_calloc
	pop     rdi
	xor     rcx, rcx
	test    rax, rax
	jz      .err

.copy:
		cmp     byte [rdi + rcx], 0
		je      .exit
		mov     r8b, byte [rdi + rcx]
		mov     byte [rax + rcx], r8b
		inc     rcx
		jmp     .copy

.err:
	xor     rax, rax
	ret
.exit:
	mov     byte [rax + rcx], 0
	ret

section .note.GNU-stack noalloc noexec