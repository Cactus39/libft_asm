global ft_calloc
section .text
;void	*ft_calloc(size_t nmemb, size_t size)
extern malloc
extern ft_bzero
ft_calloc:
	mov rax, rdi
	mul rsi
	jo .exit
	mov rdi, rax
	mov rcx, rax

	push rcx
	call malloc wrt ..plt
	pop rcx

	test rax, rax
	jz .exit
	mov rdi, rax
	mov rsi, rcx

	push rax
	call ft_bzero
	pop rax
	ret

.exit:
	xor rax, rax
	ret

section .note.GNU-stack noalloc noexec
