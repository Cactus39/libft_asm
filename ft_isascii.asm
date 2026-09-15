global ft_isascii

section .text
ft_isascii:
	cmp edi, 127
	jg .false
	cmp edi, 0
	jge .true
.false:
	xor eax, eax
	ret
.true:
	mov eax, 1
	ret

section .note.GNU-stack
