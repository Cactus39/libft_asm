.PHONY: all re clean fclean
FILES = ft_isalnum.asm ft_isalpha.asm ft_isascii.asm ft_isdigit.asm ft_isprint.asm
NAME = a.out
OBJS = $(FILES:.asm=.o)
all: $(NAME)


$(NAME): $(OBJS)
	cc main.c $(OBJS) -o $@
%.o: %.asm
	nasm $< -f elf64 -g -F dwarf -o $@
clean:
	rm -f $(OBJS)
fclean: clean
	rm -f $(NAME)
re: fclean all