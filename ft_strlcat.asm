global ft_strlcat
extern ft_strlen

;size_t	ft_strlcat(char *dst, const char *src, size_t size)
section .text
ft_strlcat:
	push rcx
	push r11
	push r12
	push r13
	push r14

	mov r12, rdi ; dest in r12
	mov r14, rsi ; src in r14
	mov rcx, rdx ; size in rcx
	call ft_strlen
	mov r11, rax ; dest len in r11
	mov rdi, r14
	call ft_strlen
	mov r13, rax ; src len in r13
	mov rdx, rcx

	test rdx, rdx
	jz .break
	cmp r11, rdx
	jge .break

	add r12, r11
	sub rdx, r11

.copy:
	cmp byte [r14], 0
	je .exit
	cmp rdx, 1
	jle .exit
	mov cl, byte [r14]
	mov byte [r12], cl
	inc r14
	inc r12
	dec rdx
	jmp .copy

.exit:
	mov byte [r12], 0
	mov rax, r11
	add rax, r13
	jmp .fin

.break: ; return src len + size
	mov rax, r13
	add rax, rdx
.fin:
	pop r14
	pop r13
	pop r12
	pop r11
	pop rcx
	ret



section .note.GNU-stack
