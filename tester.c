#include <stdio.h>
#include <string.h>
#include "mandatory/libasm.h"
#include "bonus/libasm_bonus.h"

int main(void)
{
	char src[10] = "le test 1\0";
	char dst[10];
	ft_strcpy(dst, src);
	printf("src: %s\n", src);
	// printf("dst: %s", dst);
	return 0;
}
