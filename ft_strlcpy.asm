global ft_strlcpy

extern ft_strlen
section .text
ft_strlcpy:
	xor rax, rax
	cmp rdx, 0
	je .fin
	dec rdx
.loop:
	cmp rax, rdx
	jge .zero_byte
	cmp byte [rsi], 0
	je .zero_byte
	mov cl, byte [rsi + rax]
	mov byte [rdi + rax], cl
	inc rax
	jmp .loop
.zero_byte:
	mov byte [rdi + rax], 0
.fin:
	mov rdi, rsi
	jmp ft_strlen

section .note.GNU-stack
