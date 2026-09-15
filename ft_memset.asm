global ft_memset

section .text
ft_memset:
	xor rcx, rcx
	mov rax, rdi
.loop:
	cmp rcx, rdx
	je .fin
	mov [rdi + rcx], sil
	inc rcx
	jmp .loop
.fin:
	ret

section .note.GNU-stack
