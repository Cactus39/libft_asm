;int		ft_tolower(int c)
section .text
	global ft_tolower

ft_tolower:
	cmp     edi, 65
	jl      .fin
	cmp     edi, 90
	jg      .fin
	add     edi, 32

.fin:
	mov     eax, edi
	ret

section .note.GNU-stack
