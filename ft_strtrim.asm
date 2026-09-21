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
	mov     rbp, rsp                        ;------------------;
											;-STACK BASE-------;
	push    rdi                             ;-RSP-----src------;
	push    rsi                             ;---------set------;
	call    ft_strlen
	test    rax, rax
	jz      .empty_line
	push    rax                             ;---------len(src)-;
	push    r12                             ;---------r12------;
	push    r13                             ;---------r13------;
	push    r14                             ;---------r14------;
	xor     r13, r13                        ; start counter
	mov     r12, [rbp - 8]                  ; src
	mov     r14, rax

.check_start:
		movzx   esi, byte [r12 + r13]
		cmp     esi, 0
		je      .exit
		mov     rdi, [rbp - 16]                 ; set
		call    ft_strchr
		test    rax, rax
		jz      .next
		inc     r13                         ; start counter
		jmp     .check_start

.next:
	mov     r14, [rbp - 24]                 ; len(src)
	dec     r14

.check_end:
		movzx   esi, byte [r12 + r14]
;		cmp     r14, 0
;		je      .exit
		mov     rdi, [rbp - 16]
		call    ft_strchr
		test    rax, rax
		jz      .exit
		dec     r14                         ; end counter
		jmp     .check_end

.exit:
	inc     r14
	mov     rdi, [rbp - 24]
	sub     rdi, r14
	mov     r14, rdi
	mov     rdi, [rbp - 24]
	sub     rdi, r14
	sub     rdi, r13
	mov     r14, rdi
	inc     rdi                             ; malloc size
;	inc     r14

	call malloc wrt ..plt
	test    rax, rax
	jz      .restore_regs
	xor     rcx, rcx

.copy:
		movzx   r8, byte [r12 + r13]
		cmp     r8, 0
		je      .null_char
		cmp     rcx, r14
		je      .null_char
		mov     [rax + rcx], r8
		inc     rcx
		inc     r13
		jmp     .copy

.null_char:
	mov     byte [rax + rcx], 0
.restore_regs:
	pop     r14
	pop     r13
	pop     r12
	pop     rcx
	pop     rcx
	pop     rcx

.fin:
	mov     rsp, rbp
	pop     rbp
	ret

.err:
	xor     rax, rax
	ret

.empty_line:
	pop     rsi
	pop     rdi
	call    ft_strdup
	jmp     .fin


section .note.GNU-stack noalloc noexec
