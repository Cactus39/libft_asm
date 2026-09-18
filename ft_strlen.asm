global ft_strlen
;size_t	ft_strlen(char *s)
section .text
ft_strlen:
	mov rax, -1
.loop:
	inc rax
	cmp byte [rdi + rax], 0
	jne .loop
	ret

section .note.GNU-stack
