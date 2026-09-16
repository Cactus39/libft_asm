global ft_strrchr

section .text
ft_strrchr:
	xor rcx, rcx
.loop:
	cmp byte [rdi], 0
	je .back_loop
	inc rdi
	inc rcx
	jmp .loop

.back_loop:
	cmp byte [rdi], sil
	je .fin
	cmp rcx, 0
	je .exit
	dec rdi
	dec rcx
	jmp .back_loop
.exit:
	xor rdi, rdi
.fin:
	mov rax, rdi
	ret
section .note.GNU-stack
