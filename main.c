#include <stdio.h>
#include "libft.h"
#include <unistd.h>
#include <stdint.h>


int	main(void)
{
	char **s = NULL;

	s = ft_split("", ' ');
	char **f_copy = s;
	if (s)
	{
		while (*s)
		{
			printf("%s\n", *s);
			free(*s);
			s++;
		}
	}
	free(f_copy);
	return (0);
}