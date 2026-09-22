#include <stdio.h>
#include "libft.h"
#include <unistd.h>
#include <stdint.h>

void	f(unsigned int i, char *c)
{
	(void)i;
	*c = ft_toupper(*c);
}

int	main(void)
{
	char s[] = "string to change";
	ft_striteri(s, &f);
	printf("%s \n", s);
	return (0);
}