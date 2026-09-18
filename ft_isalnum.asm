global ft_isalnum
;int		ft_isalnum(int c)
section .text
ft_isalnum:
	cmp edi, 48
	jl .false
	cmp edi, 57
	jle .true
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
