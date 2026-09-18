global ft_toupper
;int		ft_toupper(int c)
section .text
ft_toupper:
	cmp edi, 97
	jl .fin
	cmp edi, 122
	jg .fin
	sub edi, 32
.fin:
	mov eax, edi
	ret

section .note.GNU-stack
