global ft_isalpha

section .text
ft_isalpha:
	cmp edi, 65
	jl .false
	cmp edi, 90
	jle .true

	cmp edi, 97
	jl .false
	cmp edi, 122
	jle .true
.false:
	xor eax, eax
	ret

.true:
	mov eax, 1
	ret

section .note.GNU-stack
