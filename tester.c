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
    if (out == NULL)
        return (perror("errno"), 1);

	printf("%s\n", out);

	free(out);
	return 0;
}