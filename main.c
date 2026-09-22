#include <stdio.h>
#include "libft.h"
#include <unistd.h>
#include <stdint.h>

char	f(unsigned int i, char c)
{
	(void)i;
	return (char)(ft_toupper(c));
}

int	main(void)
{
	char *s = "string to change";

	s = ft_strmapi(s, &f);
	printf("%s \n", s);
	free(s);
	return (0);
}