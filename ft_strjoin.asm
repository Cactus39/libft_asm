;char	*ft_strjoin(char const *s1, char const *s2)
section .text
	global ft_strjoin
	extern ft_strlen
	extern malloc

ft_strjoin:
	cmp     rdi, 0
	je      .err
	cmp     rsi, 0
	je      .err
	push    rbp
	mov     rbp, rsp
	push    rsi
	push    rdi
										; rsp = s1 rsp + 8 = s2
	mov     rdi, [rsp]
	call    ft_strlen

	mov     r12, rax                    ; len(s1) saved in r12
	mov     rdi, [rsp + 8]

	call    ft_strlen
	add     rax, r12
	mov     rdi, rax
	inc     rdi
	call    malloc wrt ..plt
	test    rax, rax
	jz      .malloc_err
	xor     rcx, rcx
	jmp     .next

.loop:
		mov     r8b, byte [rdx]
		test    r8b, r8b
		jz      .next
		mov     byte [rax + rcx], r8b
		inc     rcx
		inc     rdx
		jmp     .loop

.next:
	cmp     rsp, rbp
	je      .exit
	pop     rdx
	jmp     .loop

.exit:
	mov     byte [rax + rcx], 0
	mov     rsp, rbp
	pop     rbp
	ret

.malloc_err:
	add     rsp, 24
.err:
	xor     rax, rax
	ret

section .note.GNU-stack noalloc noexec