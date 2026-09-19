;int		ft_isdigit(int c)
section .text
	global ft_isdigit

ft_isdigit:
	cmp     edi, 48
	jl      .false
	cmp     edi, 57
	jle     .true

.false:
	xor     eax, eax
	ret
.true:
	mov     eax, 1
	ret

section .note.GNU-stack
