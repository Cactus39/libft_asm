global test2

section .text
test2:
	xor rax, rax
	cmp edi, 0
	jl .neg
	mov ax, 1
	ret
.neg:
	mov ax, -1
	ret
section .note.GNU-stack noexec noalloc