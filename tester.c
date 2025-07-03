#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include "mandatory/libasm.h"
#include "bonus/libasm_bonus.h"

int main(int argc, char const *argv[])
{
	char test[] = "test 54\n\0";
    int fd = 2;

    ssize_t ft_rc = ft_write(fd, test, ft_strlen(test));
    perror("ft_ ");
    ssize_t real_rc =  write(fd, test, ft_strlen(test));
    perror("real");
    printf("r : %li\nft: %li\n",real_rc, ft_rc);

    return (0);
}