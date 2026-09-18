global ft_strnstr
;char	*ft_strnstr(const char *big, const char *little, size_t len)
section .text
ft_strnstr:
	mov rax, rdi
	cmp byte [rsi], 0
	je .fin
	xor r9, r9

.big_loop:
	cmp rdx, 0
	je .exit
	cmp byte [rdi], 0
	je .exit

	xor rcx, rcx ; counter
	mov r8, rdx ; little loop len
.little_loop:
	mov r9b, byte [rdi + rcx]
	cmp r9b, byte [rsi + rcx]
	jne .next_big
	cmp r8, 0
	je .next_big

	cmp byte [rsi + rcx], 0
	je .found
	inc rcx
	dec r8
	cmp byte [rsi + rcx], 0
	je .found
	jmp .little_loop

.next_big:
	inc rdi
	dec rdx
	jmp .big_loop

.exit:
	xor rax, rax
	jmp .fin
.found:
	mov rax, rdi
.fin:
	ret

section .note.GNU-stack

