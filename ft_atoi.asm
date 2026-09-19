;int	ft_atoi(const char *str)
section .text
	global ft_atoi

ft_atoi:
	xor r8, r8 ; sign 0 for positive 1 for negative
	xor r9, r9 ; temp for number
	xor rax, rax ; result
	ZERO_CHR equ '0'
	NINE_CHR equ '9'
	SPACE_CHR equ ' '
	TAB_CHR equ 9 ; '\t'
	R_CHR equ 13 ; '\r'
	MINUS_CHR equ '-'
	PLUS_CHR equ '+'
.check_line:
	cmp byte [rdi], 0
	je .exit

	cmp byte [rdi], SPACE_CHR
	je .next
	cmp byte [rdi], TAB_CHR
	jl .sign
	cmp byte [rdi], R_CHR
	jg .sign
.next:
	inc rdi
	jmp .check_line

.sign:
	cmp byte [rdi], MINUS_CHR
	je .neg
	cmp byte [rdi], PLUS_CHR
	je .pos
	jmp .number
.neg:
	mov r8, 1
.pos:
	inc rdi

.number:
	cmp byte [rdi], ZERO_CHR
	jb .exit
	cmp byte [rdi], NINE_CHR
	ja .exit
	movzx r9d, byte [rdi]
	sub r9d, ZERO_CHR
	imul eax, 10
	add eax, r9d
	inc rdi
	jmp .number

.exit:
	cmp r8, 1
	jne .fin
	neg eax
.fin:
	ret

section .note.GNU-stack
