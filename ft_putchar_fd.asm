;void	ft_putchar_fd(char c, int fd)
section .text
	global ft_putchar_fd

ft_putchar_fd:
	push    rdi

	mov     rax, 1
	mov     rdi, rsi
	mov     rsi, rsp
	mov     rdx, 1
	syscall
	add     rsp, 8
	ret

section .note.GNU-stack noalloc noexec
