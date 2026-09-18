#include <stdio.h>
#include "libft.h"


int	main(void)
{
	char *str = ft_strdup("qwe");
	printf("ft_strdup qwerty %s\n", str);
	free(str);


	return (0);
}
