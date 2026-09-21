#include <stdio.h>
#include "libft.h"
#include <unistd.h>
#include <stdint.h>


int	main(void)
{
	char *s;

	s = ft_strtrim("", " ");
	printf("strtrim %s\n", s);
	free(s);
	return (0);
}
