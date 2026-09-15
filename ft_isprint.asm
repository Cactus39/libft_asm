global ft_isprint

section .text
ft_isprint:
	cmp edi, 126
	jg .false
	cmp edi, 32
	jge .true
.false:
	xor eax, eax
	ret
.true:
	mov eax, 1
	ret
section .note.GNU-stack
