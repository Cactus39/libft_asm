#include <stdio.h>
#include "libft.h"
#include <unistd.h>
#include <stdint.h>
#include <sys/uio.h>
#include <sys/wait.h>


int	main(void)
{
	// char *src = "S";
	void *res;
	char dest[100] = {'a'};
	printf("%p\n", dest);

	res = ft_memcpy(dest, NULL, 0);
	printf("%p\n", dest);
	printf("%p\n", res);
	// printf("%d", '-');
	return (0);
}


// struct iovec iov[2] = {
// [0].iov_base = "qwe",
// [0].iov_len = 3,
// [1].iov_base = "rty",
// [1].iov_len = 3
// };

// writev(1, iov, 2);