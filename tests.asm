
global _start

section .data
	ms db "message", 0xa
	ms_len equ $ - ms

section .text
_start:

	mov rbp, rsp
	xor rbx, rbx
copy:
	movzx rdx, byte [ms + rbx]
	push rdx
	inc rbx
	cmp rbx, ms_len
	jne copy

	xor rbx, rbx
;	mov rbp, rsp
	sub rsp, 2
print:
	neg rbx
	mov dl, byte [rbp + rbx * 8]
	neg rbx
	mov [rsp], dl
	mov byte [rsp + 1], 0xa
	mov rax, 1
	mov rdi, 1
	mov rsi, rsp
	mov rdx, 2
	inc rbx
	syscall
	cmp rbx, ms_len
	jne print
	add rsp, 2
	add rsp, ms_len
	mov rax, 0x3c
	xor rdi, rdi
	syscall
