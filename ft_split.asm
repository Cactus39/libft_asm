;char	**ft_split(char const *p, char c)
section .text
	global ft_split
	extern malloc

ft_split:
	test    rdi, rdi
	jz      .ret_null
	push    rbp
	mov     rbp, rsp
	push    r12
	push    r13
	push    r14
	push    r15
	mov     r12, rdi                        ; <- src
	mov     r13, rsp                        ; <- rsp
	xor     r14, r14                        ; <- word counter & result
	movzx   r15, sil                        ; <- char
	xor     rcx, rcx                        ; <- counter
	xor     r8, r8

.big_loop_1:
	cmp     byte [r12 + rcx], 0
	je      .exit_big_loop_1

.char_loop:
		cmp     byte [r12 + rcx], r15b
		jne     .word_loop
		inc     rcx
		jmp     .big_loop_1

.word_loop:
		cmp     byte [r12 + rcx], 0
		je      .exit_word_loop
		inc     r8
		cmp     byte [r12 + rcx], r15b
		je      .exit_word_loop
		inc     rcx
		jmp     .word_loop

.exit_word_loop:
		push    r8
		push    r8
		xor     r8, r8
		inc     r14
		jmp     .big_loop_1

.exit_big_loop_1:
	test    r14, r14
	jz      .exit

	inc     r14
	imul    r14, 8
	mov     rdi, r14
	call    malloc wrt ..plt
	test    rax, rax
	jz      .restore_stack
	xor     rbx, rbx
	mov     r14, rax
	mov     rdx, rax

.big_loop_2:
	cmp     byte [r12 + rbx], 0
	je      .exit_big_loop_2
.char_loop_2:
		cmp     byte [r12 + rbx], r15b
		jne     .copy
		inc     rbx
		jmp     .big_loop_2
.copy:
		cmp     r13, rsp
		je      .exit
		xor     r8, r8
		sub     r13, 16
		mov     rdi, [r13]
		call    malloc wrt ..plt
		test    rax, rax
		jz      .free_heap
.copy_word:
		mov     r11b, byte [r12 + rbx]
		cmp     r11b, r15b
		je      .word_end
		cmp     r11b, 0
		je      .word_end
		mov     byte [rax + r8], r11b
		inc     rbx
		inc     r8
		jmp     .copy_word

.word_end:
		mov     byte [rax + r8], 0
		mov     [r14], rax
		add     r14, 8
		jmp     .big_loop_2
.exit_big_loop_2:
		mov     qword [r14], 0
		sub     r14, 48
		mov     rax, r14
;		jmp     .exit

.restore_stack
	mov     rsp, r13
.exit:
	pop     r15
	pop     r14
	pop     r13
	pop     r12
	mov     rsp, rbp
	pop     rbp
	ret

.ret_null:
	xor     rax, rax
	ret
.free_heap:
	xor     rax, rax
	ret
section .note.GNU-stack noalloc noexec
