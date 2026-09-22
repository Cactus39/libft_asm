#include <stdio.h>
#include "libft.h"
#include <unistd.h>
#include <stdint.h>


int	main(void)
{
	char *s;
	// s = ft_itoa(1234);
	// printf("%s \n", s);
	s = ft_itoa(-1234);
	printf("%s \n", s);
	s = ft_itoa(-2147483648);
	printf("%s \n", s);
	s = ft_itoa(0x7FFFFFFF);
	printf("%s \n", s);
	return (0);
}