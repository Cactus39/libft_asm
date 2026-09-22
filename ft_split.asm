;char	**ft_split(char const *p, char c)
section .text
	global ft_split
	extern malloc
	extern free

ft_split:
	test    rdi, rdi
	jz      .ret_null
	push    rbp
	mov     rbp, rsp
	push    r12
	push    r13
	push    r14
	push    r15
	push    rbx
	sub     rsp, 8
	mov     r12, rdi                        ; <- src
	xor     r14, r14                        ; <- word counter
	xor     r13, r13                        ; <- letter counter
	movzx   r15, sil                        ; <- char
	xor     rbx, rbx                        ; <- word pointer

;-------------------------------------------;
.big_loop_1:
		cmp     byte [r12 + r13], 0
		je      .exit_big_loop_1
.char_loop:
		cmp     byte [r12 + r13], r15b
		jne     .word_counter
		inc     r13
		jmp     .big_loop_1
.word_counter:
	inc     r14
.word_loop:
		cmp     byte [r12 + r13], 0
		je      .exit_big_loop_1
		cmp     byte [r12 + r13], r15b
		je      .big_loop_1
		inc     r13
		jmp     .word_loop
.exit_big_loop_1:
	inc     r14
	imul    r14, 8
	mov     rdi, r14
	call    malloc wrt ..plt
	test    rax, rax
	jz      .exit
	mov     [rsp], rax
	xor     r14, r14
	xor     r13, r13
;-------------------------------------------;

.big_loop_2:
		cmp     byte [r12 + r13], 0
		je      .exit_big_loop_2
.char_loop_2:
		cmp     byte [r12 + r13], r15b
		jne     .start_copy
		inc     r13
		jmp     .big_loop_2
.start_copy:
	mov     r14, r13
	xor     r8, r8
.count_letters:
		cmp     byte [r12 + r14], 0
		je      .allocate
		cmp     byte [r12 + r14], r15b
		je      .allocate
		inc     r14
		inc     r8
		jmp     .count_letters
.allocate:
	inc     r8
	mov     rdi, r8
	call    malloc wrt ..plt
	test    rax, rax
	jz      .free_heap
	xor     r8, r8
.copy_word:
		mov     r11b, byte [r12 + r13]
		cmp     r11b, r15b
		je      .word_end
		cmp     r11b, 0
		je      .word_end
		mov     byte [rax + r8], r11b
		inc     r13
		inc     r8
		jmp     .copy_word
.word_end:
		mov     byte [rax + r8], 0
		mov     r8, [rsp]
		mov     qword [r8 + rbx], rax
		add     rbx, 8
		jmp     .big_loop_2
.exit_big_loop_2:
	mov     r8, [rsp]
	mov     qword [r8 + rbx], 0
	mov     rax, [rsp]
;-------------------------------------------;

.exit:
	add     rsp, 8
	pop     rbx
	pop     r15
	pop     r14
	pop     r13
	pop     r12
	mov     rsp, rbp
	pop     rbp
	ret
;-------------------------------------------;

.ret_null:
	xor     rax, rax
	ret
.free_heap:
	mov     r15, [rsp]
.free_words:
	test    rbx, rbx
	je      .free_result
	sub     rbx, 8
	mov     rdi, [r15 + rbx]
	call    free wrt ..plt
	jmp     .free_words
.free_result:
	mov     rdi, [rsp]
	call    free wrt ..plt
	xor     rax, rax
	jmp     .exit

section .note.GNU-stack noalloc noexec
