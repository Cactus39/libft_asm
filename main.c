#include <stdio.h>
#include "libft.h"
#include <unistd.h>
#include <stdint.h>


int	main(void)
{
	char **s = NULL;

	s = ft_split("A good string to split", ' ');
	if (s)
	{
		while (*s)
		{
			printf("%s\n", *s);
			free(*s);
			s++;
		}
	}
	free(s);
	return (0);
}