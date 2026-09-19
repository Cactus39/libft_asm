;char	*ft_strjoin(char const *s1, char const *s2)
section .text
	global ft_strjoin
	extern ft_strlen
	extern ft_calloc

ft_strjoin:
; --------------------------------------- ;
	cmp rdi, 0
	je .err
	cmp rsi, 0
	je .err
; --------------------------------------- ;
	push rdi
	push rsi
	push rbp



; --------------------------------------- ;
.err:
	xor rax, rax
	ret
; --------------------------------------- ;

section .note.GNU-stack noalloc noexec