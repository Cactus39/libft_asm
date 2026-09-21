;char	*ft_strtrim(char const *s1, char const *set)
section .text
	global ft_strtrim
	extern malloc
	extern ft_strlen
	extern ft_strchr
	extern ft_strdup

ft_strtrim:
	test    rdi, rdi
	jz      .err
	test    rsi, rsi
	jz      .err
	push    rbp
	mov     rbp, rsp                        ;--------------------;
											;----STACK BASE------;
	push    r12                             ;---------r12--------; <- src
	push    r13                             ;---------r13--------; <- start
	push    r14                             ;---------r14--------; <- len
	push    r15                             ;---------r15--------; <- set
	mov     r12, rdi                        ;--------------------;
	mov     r15, rsi
	xor     r13, r13
	call    ft_strlen
	mov     r14, rax
	dec     r14

.check_start:
		movzx   esi, byte [r12 + r13]
		cmp     esi, 0
		je      .exit
		mov     rdi, r15
		call    ft_strchr
		test    rax, rax
		jz      .check_end
		inc     r13                         ; start counter
		jmp     .check_start

.check_end:
		movzx   esi, byte [r12 + r14]
		mov     rdi, r15
		call    ft_strchr
		test    rax, rax
		jz      .exit
		dec     r14                         ; end counter
		jmp     .check_end

.exit:
	inc     r14
	sub     r14, r13
	mov     rdi, r14
	inc     rdi                             ; malloc size

	call    malloc wrt ..plt
	test    rax, rax
	jz      .fin
	xor     rcx, rcx

.copy:
		cmp     rcx, r14
		je      .null_char
		mov     r8b, byte [r12 + r13]
		mov     [rax + rcx], r8b
		inc     rcx
		inc     r13
		jmp     .copy

.null_char:
	mov     byte [rax + rcx], 0

.fin:
	pop     r15
	pop     r14
	pop     r13
	pop     r12
	mov     rsp, rbp
	pop     rbp
	ret

.err:
	xor     rax, rax
	ret

section .note.GNU-stack noalloc noexec
