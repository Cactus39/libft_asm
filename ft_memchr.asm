global ft_memchr
;void	*ft_memchr(const void *s, int c, size_t n)
section .text
ft_memchr:
	xor rax, rax
	xor r9, r9
.loop:
	cmp rdx, 0
	je .fin
	mov r9b, byte [rdi]
	cmp sil, r9b
	je .result
	dec rdx
	inc rdi
	jmp .loop

.result
	mov rax, rdi
.fin:
	ret

section .note.GNU-stack
