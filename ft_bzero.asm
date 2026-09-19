global ft_bzero
;void	ft_bzero(void *s, size_t nn)
section .text
ft_bzero:
	cmp rdi, 0
	je .exit
	xor rcx, rcx
.loop:
	cmp rcx, rsi
	je .exit
	mov byte [rdi], 0
	inc rcx
	inc rdi
	jmp .loop


.exit:
	ret


section .note.GNU-stack
