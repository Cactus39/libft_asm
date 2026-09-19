;void	*ft_memset(void *s, int c, size_t n)
section .text
	global ft_memset

ft_memset:
	xor rcx, rcx
	mov rax, rdi
	cmp rdi, 0
	je .fin
.loop:
	cmp rcx, rdx
	je .fin
	mov [rdi + rcx], sil
	inc rcx
	jmp .loop
.fin:
	ret

section .note.GNU-stack
