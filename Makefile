.PHONY: all re clean fclean main
FILES = ft_isalnum.asm ft_isalpha.asm ft_isascii.asm ft_isdigit.asm ft_isprint.asm\
		ft_strlen.asm ft_memset.asm ft_bzero.asm
NAME = libft.a
OBJS = $(FILES:.asm=.o)
all: $(NAME)


$(NAME): $(OBJS)
	ar -rcs $@ $^
main: $(OBJS)
	cc main.c $(OBJS) -o a.out
%.o: %.asm
	nasm $< -f elf64 -g -F dwarf -o $@
clean:
	rm -f $(OBJS)
fclean: clean
	rm -f $(NAME) a.out
re: fclean all