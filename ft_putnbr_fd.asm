;void	ft_putnbr_fd(int n, int fd)
section .text
	global ft_putnbr_fd

ft_putnbr_fd:
	push    rbp
	mov     rbp, rsp
	push    rbx
	push    r11
	sub     rsp, 16

	xor     r8, r8                              ; <- counter
	xor     r9, r9                              ; <- len
	mov     r11d, edi                            ; <- src int
	xor     rdx, rdx
	mov     ebx, 10
	mov     eax, edi
	test    eax, eax
	jns     .count_len
	inc     r8
	mov     byte [rsp], 45
	cmp     eax, 0x80000000
	je      .count_len
	neg     eax
	mov     r11d, eax

.count_len:
		div     ebx
		xor     rdx, rdx
		inc     r8
		cmp     eax, 0
		jne     .count_len

	mov     r9, r8
	dec     r8
	xor     rdx, rdx
	mov     eax, r11d

.fill_number:
		div     ebx
		add     dl, 48
		mov     byte [rsp + r8], dl
		xor     rdx, rdx
		dec     r8
		cmp     eax, 0
		jne     .fill_number

	mov     rax, 1
	mov     rdi, rsi
	mov     rsi, rsp
	mov     rdx, r9
	syscall
	add     rsp, 16
	pop     r11
	pop     rbx
	mov     rsp, rbp
	pop     rbp
	ret

section .note.GNU-stack noalloc noexec
