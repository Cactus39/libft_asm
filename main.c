#include <stdio.h>

int	ft_isalpha(int c);
int ft_isdigit(int c);
int ft_isalnum(int c);
int ft_isascii(int c);
int ft_isprint(int c);

int	main(void)
{
	printf("isalpha A %d\n", ft_isalpha('A'));
	printf("isalpha a %d\n", ft_isalpha('a'));
	printf("isalpha z %d\n", ft_isalpha('z'));
	printf("isalpha Z %d\n", ft_isalpha('Z'));
	printf("isalpha q %d\n", ft_isalpha('q'));
	printf("isalpha Q %d\n", ft_isalpha('Q'));
	printf("isalpha 1 %d\n", ft_isalpha('1'));
	printf("isalpha ! %d\n", ft_isalpha('!'));
	printf("isalpha 0 %d\n", ft_isalpha('0'));
	printf("isdigit 0 %d\n", ft_isdigit('0'));
	printf("isdigit 9 %d\n", ft_isdigit('9'));
	printf("isdigit e %d\n", ft_isdigit('e'));
	printf("isalnum e %d\n", ft_isalnum('e'));
	printf("isalnum 1 %d\n", ft_isalnum('1'));
	printf("isalnum 123 %d\n", ft_isalnum(123));
	printf("isascii -1 %d\n", ft_isascii(-1));
	printf("isascii 129 %d\n", ft_isascii(129));
	printf("isascii 12 %d\n", ft_isascii(12));
	printf("isprint 31 %d\n", ft_isprint(31));
	printf("isprint 32 %d\n", ft_isprint(32));
	printf("isprint q %d\n", ft_isprint('q'));
	printf("isprint 127 %d\n", ft_isprint(127));


	return (0);
}
