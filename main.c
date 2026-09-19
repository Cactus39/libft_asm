#include <stdio.h>
#include "libft.h"
#include <unistd.h>
#include <stdint.h>


int	main(void)
{
	char *s;

	s = ft_substr("qweasdzxc", 33, 2);
	printf("substr %s\n", s);
	free(s);
	return (0);
}
