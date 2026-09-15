#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include "libft.h"

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
	printf("strlen qwe %lu\n", ft_strlen("qwe"));
	printf("strlen '' %lu\n", ft_strlen(""));
	printf("strlen qwe0 %lu\n", ft_strlen("qwe0"));
	char *mem = malloc(sizeof(char) * 12);
	ft_memset(mem, 'x', 12);
	mem[12] = 0;
	printf("memset x 12 %s\n", mem);
	free(mem);
	char *mem0 = malloc(sizeof(char) * 0xFFFFFFFF);
	ft_bzero(mem0, 0xFFFFFFFF);
	uint32_t i = 0;
	printf("bzero check\n");
	for (i = 0; i < 0xFFFFFFFF; i++)
	{
		if (mem0[i] != 0)
			break;
	}
	if (i == 0xFFFFFFFF)
		printf("bzero [OK]\n");
	else
		printf("[ERROR]\n");
	free(mem0);



	return (0);
}
