;void	ft_putendl_fd(char *s, int fd)
section .rodata
	new_line db 0x0a

section .text
	global ft_putendl_fd

ft_putendl_fd:
	xor     rdx, rdx

.L_strlen:
	cmp     byte [rdi + rdx], 0
	je      .L_print
	inc     rdx
	jmp     .L_strlen

.L_print:
	sub     rsp, 32
	mov     qword [rsp], rdi
	mov     qword [rsp + 8], rdx
	lea     r8, [rel new_line]
	mov     qword [rsp + 16], r8
	mov     qword [rsp + 24], 1
	mov     rax, 20
	mov     rdi, rsi
	mov     rsi, rsp
	mov     rdx, 2
	syscall
	add     rsp, 32
	ret

section .note.GNU-stack noalloc noexec