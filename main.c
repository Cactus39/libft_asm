#include <stdio.h>

int	ft_isalpha(int c);
int ft_isdigit(int c);
int ft_isalnum(int c);

int	main(void)
{
	printf("%d\n", ft_isalpha('A'));
	printf("%d\n", ft_isalpha('a'));
	printf("%d\n", ft_isalpha('z'));
	printf("%d\n", ft_isalpha('Z'));
	printf("%d\n", ft_isalpha('q'));
	printf("%d\n", ft_isalpha('Q'));
	printf("%d\n", ft_isalpha('1'));
	printf("%d\n", ft_isalpha('!'));
	printf("%d\n", ft_isalpha('0'));
	printf("%d\n", ft_isdigit('0'));
	printf("%d\n", ft_isdigit('9'));
	printf("%d\n", ft_isdigit('e'));
	printf("%d\n", ft_isalnum('e'));
	printf("%d\n", ft_isalnum('1'));
	printf("%d\n", ft_isalnum(123));


	return (0);
}
