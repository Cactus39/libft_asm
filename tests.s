
global _start

section .data
	ms db "message", 0xa
	ms_len equ $ - ms

section .text
_start:
	mov rax, 1
	mov rdi, 1
	mov rsi, ms
	mov rdx, ms_len
	syscall

	mov rax, 0x3c
	xor rdi, rdi
	syscall
