;char	*ft_itoa(int n)
section .rodata
	system_str  db "0123456789"
;	system_str  db "0123456789ABCDEF"
	system_len  equ $ - system_str

section .text
	global ft_itoa
	extern malloc

ft_itoa:
	push    rbp
	mov     rbp, rsp
	push    r12
	push    r13
	push    r14
	push    rbx

	mov     r12d, edi                       ; <- src int
	xor     r13, r13                        ; <- byte counter
	xor     r14, r14                        ; <- result
	xor     rdx, rdx
	mov     ebx, system_len
	mov     eax, r12d
	test    eax, eax
	jns      .count_len
	cmp     edi, 0x80000000
	je      .min_int_1
	neg     eax
.min_int_1:
	inc     r13

.count_len:
		div     ebx
		inc     r13
		xor     rdx, rdx
		test    eax, eax
		jnz     .count_len

	inc     r13
	mov     rdi, r13
	call    malloc wrt ..plt
	test    rax, rax
	jz      .exit
	dec     r13
	mov     r14, rax
	test    r12d, r12d
	jns      .positive
	mov     byte [r14], 45                 ; ascii code "-" 45 decimal
	cmp     r12d, 0x80000000
	je      .positive
	neg     r12d
.positive:
	mov     byte [r14 + r13], 0
	mov     eax, r12d
	dec     r13

.fill_number:
	div     ebx
	lea     r9, [rel system_str]
	mov     r8b, byte [r9 + rdx]
	mov     byte [r14 + r13], r8b
	dec     r13
	xor     rdx, rdx
	test    rax, rax
	jnz     .fill_number

	mov     rax, r14
.exit:
	pop     rbx
	pop     r14
	pop     r13
	pop     r12
	mov     rsp, rbp
	pop     rbp
	ret
.overflow:
	xor     rax, rax
	ret

section .note.GNU-stack noalloc noexec