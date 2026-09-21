#include <stdio.h>
#include "libft.h"
#include <unistd.h>
#include <stdint.h>


int	main(void)
{
	char *s;

	s = ft_strtrim("lorem \n ipsum \t dolor \n sit \t amet", " ");
	printf("strtrim %s\n", s);
	free(s);
	return (0);
}
