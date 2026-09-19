;int		ft_toupper(int c)
section .text
	global ft_toupper

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
