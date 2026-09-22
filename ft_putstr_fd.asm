;void	ft_putstr_fd(char *s, int fd)
section .text
	global ft_putstr_fd

ft_putstr_fd:
	push    rdi
	xor     rdx, rdx

.L_strlen:
	cmp     byte [rdi + rdx], 0
	je      .L_print
	inc     rdx
	jmp     .L_strlen

.L_print:

	mov     rax, 1
	mov     rdi, rsi
	mov     rsi, [rsp]
	syscall
	add     rsp, 8
	ret



section .note.GNU-stack noalloc noexec
