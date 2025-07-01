#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include "mandatory/libasm.h"
#include "bonus/libasm_bonus.h"

int main(int argc, char const *argv[])
{
	char test[] = "hi all its me\0";

	char *out = ft_strdup(test);

	printf("%s\n", out);

	free(out);
	return 0;
}











// int	me_strcmp(const char *s1, const char *s2)
// {
// 	size_t	index;

// 	index = 0;
// 	while (s1[index] != '\0' || s2[index] != '\0')
// 	{
// 		if (s1[index] != s2[index])
// 		{
// 			return (((unsigned char)s1[index] - (unsigned char)s2[index]));
// 		}
// 		index++;
// 	}
// 	return (0);
// }

// int main(int argc, char **argv)
// {
// 	char *s1 = argv[1];
// 	char *s2 = argv[2];
// 	printf("real: %i\n", strcmp(s1, s2));
// 	printf("me  : %i\n", me_strcmp(s1, s2));
// 	printf("ft  : %i\n", ft_strcmp(s1, s2));
// 	// printf("dst: %s", dst);
// 	return 0;
// }
