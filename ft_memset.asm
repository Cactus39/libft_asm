global ft_memset

section .text
ft_memset:
	xor rcx, rcx
	mov rax, rdi
	cmp rdi, 0
	je .fin
.loop:
	cmp rcx, rdx
	je .fin
	mov [rdi + rcx], sil
	inc rcx
	jmp .loop
.fin:
	ret

section .note.GNU-stack
