;char	*ft_substr(char const *s, unsigned int start, size_t len)
section .data
	empty_string db ""

section .text
	global ft_substr
	extern ft_strlen
	extern ft_strdup
	extern malloc

ft_substr:
	test    rdi, rdi
	jz      .err
	push    rdi                             ; src
	push    rsi                             ; start
	push    rdx                             ; len

	call    ft_strlen
	cmp     [rsp + 0x8], rax                ; start
	jae     .empty_line
	sub     rax, [rsp + 0x8]                ; start
	cmp     [rsp], rax
	jb      .len_lt_dest
	mov     rdi, rax                        ; src len
	jmp     .len_ge_dest

.len_lt_dest:
	mov     rdi, rdx                        ; len
.len_ge_dest:
	inc     rdi                             ; target for calloc + 1
	call    malloc wrt ..plt
	pop     r8                              ; len
	pop     rdi                             ; start
	pop     r9                              ; src
	test    rax, rax
	jz      .err
	xor     rcx, rcx                        ; counter

.copy:
		mov     r10b, byte [r9 + rdi]
		cmp     r10b, 0
		je      .fin
		cmp     rcx, r8
		je      .fin
		mov     byte [rax + rcx], r10b
		inc     rdi
		inc     rcx
		jmp     .copy

.fin:
	mov     byte [rax + rcx], 0
	ret

.err:
	xor     rax, rax
	ret

.empty_line:
	pop     rdx
	pop     rsi
	pop     rdi
	lea     rdi, [rel empty_string]
	jmp     ft_strdup

section .note.GNU-stack noalloc noexec
