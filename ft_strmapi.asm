;char	*ft_strmapi(char const *s, char (*f)(unsigned int, char))
section .text
	global ft_strmapi
	extern malloc
	extern ft_strlen

ft_strmapi:
	test    rdi, rdi
	jz      .return_null
	test    rsi, rsi
	jz      .return_null
	push    rbp
	mov     rbp, rsp
	push    r12
	push    r13
	push    r14
	push    r15

	mov     r12, rdi                            ; <- src
	mov     r13, rsi                            ; <- func
	xor     r14, r14                            ; <- counter
	call    ft_strlen
	inc     rax
	mov     rdi, rax
	call    malloc wrt ..plt
	test    rax, rax
	mov     r15, rax                            ; <- result
	jz      .fin

.copy:
	mov     sil, byte [r12 + r14]
	cmp     sil, 0
	je      .exit
	mov     edi, r14d
	call    r13
	mov     byte [r15 + r14], al
	inc     r14
	jmp     .copy

.exit:
	mov     byte [r15 + r14], 0
	mov     rax, r15
.fin:
	pop     r15
	pop     r14
	pop     r13
	pop     r12
	mov     rsp, rbp
	pop     rbp
	ret
.return_null:
	xor rax, rax
	ret

section .note.GNU-stack noalloc noexec
