;int		ft_isprint(int c)
section .text
	global ft_isprint

ft_isprint:
	cmp     edi, 126
	jg      .false
	cmp     edi, 32
	jge     .true

.false:
	xor     eax, eax
	ret
.true:
	mov     eax, 1
	ret

section .note.GNU-stack
