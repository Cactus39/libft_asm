#include <stdio.h>
#include "libft.h"
#include <unistd.h>
#include <stdint.h>
#include <sys/uio.h>
#include <sys/wait.h>
#include <string.h>
struct s
{
	char	a;
	char	*b;
};
int	main(void)
{
	char *s = ft_strjoin("", "");
	printf("%s\n", s);
	// free(s);

	return (0);
}


// struct iovec iov[2] = {
// [0].iov_base = "qwe",
// [0].iov_len = 3,
// [1].iov_base = "rty",
// [1].iov_len = 3
// };

// writev(1, iov, 2);