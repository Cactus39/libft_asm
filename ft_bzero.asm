global ft_bzero

section .text
ft_bzero:
	cmp rdi, 0
	je .exit
	xor rbx, rbx
.loop:
	cmp rbx, rsi
	je .exit
	inc rbx
	mov byte [rdi], 0
	inc rdi
	jmp .loop


.exit:
;	xor rax, rax
	ret


section .note.GNU-stack
