#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <fcntl.h>
#include "mandatory/libasm.h"
#include "bonus/libasm_bonus.h"

// ft_list_sort
int main(int argc, char const *argv[])
{
    t_list *list = NULL;
    char v1[] = "50";
    char v2[] = "10";
    char v3[] = "42";

    ft_list_push_front(&list, &v1[0]);
    ft_list_push_front(&list, &v2[0]);
    ft_list_push_front(&list, &v3[0]);

    ft_list_sort(&list, ft_strcmp);

    printf("1: %s\n2: %s\n3: %s\n",
        (char*)list->data, (char*)list->next->data, (char*)list->next->next->data);

    return (0);
}

// // ft_list_push_front
// int main(int argc, char const *argv[])
// {
//     t_list *list = NULL;
//     int var = 42;
   

//     ft_list_push_front(&list, &var);
//     ft_list_push_front(&list, &var);
//     ft_list_push_front(&list, &var);
//     ft_list_push_front(&list, &var);
//     ft_list_push_front(&list, &var);

//     printf("%i\n", ft_list_size(list));

//     return (0);
// }


// ft_list_push_front
// int main(int argc, char const *argv[])
// {
//     t_list *list = NULL;
//     int var = 42;

//     ft_list_push_front(&list, &var);
//     int vv = 55;
//     ft_list_push_front(&list, &vv);

//     printf("data1: %i\n", *(int *)list->data);
//     printf("data2: %i\n", *(int *)list->next->data);

//     free(list->next);
//     free(list);
//     return (0);
// }

// //read
// int main(int argc, char const *argv[])
// {
// 	char real_string[20] = {0};
// 	char ft_string[20] = {0};
//     size_t read_size = 19;

//     int fd;

//     fd = open("links", O_RDONLY);
//     ssize_t ft_rc = ft_read(fd, ft_string, read_size);
//     perror("ft_ ");

//     close(fd);

//     fd = open("links", O_RDONLY);
//     ssize_t real_rc =  read(fd, real_string, read_size);
//     perror("real");
//     printf("ft_ : %li '%s'\nreal: %li '%s'\n", ft_rc, ft_string, real_rc, real_string);

//     return (0);
// }


// // write
// int main(int argc, char const *argv[])
// {
// 	char test[] = "test 54\n\0";
//     int fd = 2;

//     ssize_t ft_rc = ft_write(fd, test, ft_strlen(test));
//     perror("ft_ ");
//     ssize_t real_rc =  write(fd, test, ft_strlen(test));
//     perror("real");
//     printf("ft_ : %li\nreal: %li\n", ft_rc, real_rc);

//     return (0);
// }