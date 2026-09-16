global ft_tolower

section .text
ft_tolower:
	cmp rdi, 65
	jl .fin
	cmp rdi, 90
	jg .fin
	add rdi, 32
.fin:
	mov rax, rdi
	ret

section .note.GNU-stack
