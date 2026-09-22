;void	ft_striteri(char *s, void (*f)(unsigned int, char*))
section .text
	global ft_striteri

ft_striteri:
	test    rdi, rdi
	jz      .ret_null
	test    rsi, rsi
	jz      .ret_null
	push    r12
	push    r13
	push    r14
	mov     r12, rdi                            ; <- src
	mov     r13, rsi                            ; <- func
	xor     r14, r14                            ; <- counter

.loop:
	mov     r8b, byte [r12]
	cmp     r8b, 0
	je      .exit
	mov     rdi, r14
	mov     rsi, r12
	call    r13
	inc     r12
	inc     r14
	jmp     .loop

.exit:
	pop     r14
	pop     r13
	pop     r12

.ret_null:
	xor rax, rax
	ret

section .note.GNU-stack noalloc noexec