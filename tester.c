#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <fcntl.h>
#include "mandatory/libasm.h"
#include "bonus/libasm_bonus.h"


// So if "12" is read in base "0123456789ABCDE", it should be:

//     '1' → value 1

//     '2' → value 2

//     Result: 1 * base + 2 = 1 * 15 + 2 = 17
int main(void)
{
    char nb[] = "-1E2";
    char base[] = "0123456789ABCDEF";
    printf("%s\n%s\n%i\n", nb, base, ft_atoi_base(nb, base));
    return 0;
}


// // ft_list_remove_if
// int is_not_equ(const int* a, const int* b)
// {
//     return (*a != *b);
// }

// void funct_free(void *ptr)
// {
//     free(ptr);
// }

// int main(int argc, char const *argv[])
// {
//     t_list *list = NULL;
//     t_list *tmp = NULL;
//     int ref = 42;
//     int *int_array[3];
//     int_array[0] = malloc(sizeof(int));
//     int_array[1] = malloc(sizeof(int));
//     int_array[2] = malloc(sizeof(int));

//     *int_array[0] = 42;
//     *int_array[1] = 24;
//     *int_array[2] = 42;

//     ft_list_push_front(&list, int_array[0]);
//     ft_list_push_front(&list, int_array[1]);
//     ft_list_push_front(&list, int_array[2]);

//     ft_list_remove_if(&list, &ref, is_not_equ, funct_free) ;

//     int index = 1;
//     while (list != NULL)
//     {
//         printf("%i: %i\n", index, *(int*)list->data);
//         index++;
//         tmp = list;
//         list = list->next;
//         free(tmp->data);
//         free(tmp);
//     }

//     return (0);
// }



// // ft_list_sort
// int is_sup(const int* a, const int* b)
// {
//     return (*a > *b);
// }

// int main(int argc, char const *argv[])
// {
//     t_list *list = NULL;
//     t_list *tmp = NULL;
//     int p3 = 2;
//     int p2 = 50;
//     int p1 = 1;

//     ft_list_push_front(&list, &p3);
//     ft_list_push_front(&list, &p2);
//     ft_list_push_front(&list, &p1);

//     ft_list_sort(&list, is_sup);

//     int index = 1;
//     while (list != NULL)
//     {
//         printf("%i: %i\n", index, *(int*)list->data);
//         index++;
//         tmp = list;
//         list = list->next;
//         free(tmp);
//     }

//     return (0);
// }

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