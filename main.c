#include <stdio.h>
#include "libft.h"
#include <unistd.h>
#include <stdint.h>
#include <sys/uio.h>

int	main(void)
{
	// struct iovec iov[2] = {
		// [0].iov_base = "qwe",
		// [0].iov_len = 3,
		// [1].iov_base = "rty",
		// [1].iov_len = 3
	// };

	// writev(1, iov, 2);
	ft_putendl_fd("qwe", 1);
	return (0);
}