global ft_isalnum

section .text
ft_isalnum:
	cmp rdi, 48
	jl .false
	cmp rdi, 57
	jle .true
	cmp rdi, 65
	jl .false
	cmp rdi, 90
	jle .true
	cmp rdi, 97
	jl .false
	cmp rdi, 122
	jle .true

.false:
	xor rax, rax
	ret
.true:
	mov rax, 1
	ret

section .note.GNU-stack
