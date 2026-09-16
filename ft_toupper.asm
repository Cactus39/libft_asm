global ft_toupper

section .text
ft_toupper:
	cmp rdi, 97
	jl .fin
	cmp rdi, 122
	jg .fin
	sub rdi, 32
.fin:
	mov rax, rdi
	ret

section .note.GNU-stack
