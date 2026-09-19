;char	*ft_strchr(const char *s, int c)
section .text
	global ft_strchr

ft_strchr:
.loop:
	cmp byte [rdi], sil
	je .fin
	cmp byte [rdi], 0
	je .exit
	inc rdi
	jmp .loop
.exit:
	xor rdi, rdi
	jmp .fin
.fin:
	mov rax, rdi
	ret

section .note.GNU-stack
