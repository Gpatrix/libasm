#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <fcntl.h>
#include "mandatory/libasm.h"
#include "bonus/libasm_bonus.h"

// Helper functions for bonus tests
void free_function(void *data) {
    free(data);
}

// Test function for ft_strlen
void test_ft_strlen() {
    printf("Testing ft_strlen:\n");
    printf("ft_strlen(\"Hello\"): %zu\n", ft_strlen("Hello"));
    printf("ft_strlen(\"\"): %zu\n", ft_strlen(""));
    printf("ft_strlen(\"123456789\"): %zu\n", ft_strlen("123456789"));
    printf("\n");
}

// Test function for ft_strcpy
void test_ft_strcpy() {
    printf("Testing ft_strcpy:\n");
    char dest[100];
    printf("ft_strcpy(dest, \"Hello\"): %s\n", ft_strcpy(dest, "Hello"));
    printf("ft_strcpy(dest, \"\"): %s\n", ft_strcpy(dest, ""));
    printf("\n");
}

// Test function for ft_strcmp
void test_ft_strcmp() {
    printf("Testing ft_strcmp:\n");
    printf("ft_strcmp(\"Hello\", \"Hello\"): %d\n", ft_strcmp("Hello", "Hello"));
    printf("ft_strcmp(\"Hello\", \"Hell\"): %d\n", ft_strcmp("Hello", "Hell"));
    printf("ft_strcmp(\"Hell\", \"Hello\"): %d\n", ft_strcmp("Hell", "Hello"));
    printf("\n");
}

// Test function for ft_strdup
void test_ft_strdup() {
    printf("Testing ft_strdup:\n");
    char *dup = ft_strdup("Hello");
    printf("ft_strdup(\"Hello\"): %s\n", dup);
    free(dup);
    dup = ft_strdup("");
    printf("ft_strdup(\"\"): %s\n", dup);
    free(dup);
    printf("\n");
}

// Test function for ft_write
void test_ft_write() {
    printf("Testing ft_write:\n");
    ft_write(1, "Hello, ft_write!\n", 17);
    ft_write(1, "", 0);
    printf("\n");
}

// Test function for ft_read
void test_ft_read() {
    printf("Testing ft_read:\n");
    char buffer[100];
    int ret = ft_read(0, buffer, 10); // Requires manual input
    if (ret >= 0) {
        buffer[ret] = '\0';
        printf("ft_read: %s\n", buffer);
    } else {
        perror("ft_read");
    }
    printf("\n");
}

// Test function for ft_list_push_front and ft_list_size
void test_ft_list_push_front_and_size() {
    printf("Testing ft_list_push_front and ft_list_size:\n");
    t_list *list = NULL;
    ft_list_push_front(&list, strdup("Node 1"));
    ft_list_push_front(&list, strdup("Node 2"));
    ft_list_push_front(&list, strdup("Node 3"));
    printf("List size: %d\n", ft_list_size(list));
    while (list) {
        printf("Node: %s\n", (char *)list->data);
        t_list *temp = list->next;
        free(list->data);
        free(list);
        list = temp;
    }
    printf("\n");
}

// Test function for ft_list_sort
void test_ft_list_sort() {
    printf("Testing ft_list_sort:\n");
    t_list *list = NULL;
    ft_list_push_front(&list, strdup("Zebra"));
    ft_list_push_front(&list, strdup("Apple"));
    ft_list_push_front(&list, strdup("Monkey"));
    ft_list_sort(&list, strcmp);
    while (list) {
        printf("Node: %s\n", (char *)list->data);
        t_list *temp = list->next;
        free(list->data);
        free(list);
        list = temp;
    }
    printf("\n");
}

// Test function for ft_list_remove_if
void test_ft_list_remove_if() {
    printf("Testing ft_list_remove_if:\n");
    t_list *list = NULL;
    ft_list_push_front(&list, strdup("Zebra"));
    ft_list_push_front(&list, strdup("Apple"));
    ft_list_push_front(&list, strdup("Monkey"));
    ft_list_remove_if(&list, "Apple", cmp_function, free_function);
    while (list) {
        printf("Node: %s\n", (char *)list->data);
        t_list *temp = list->next;
        free(list->data);
        free(list);
        list = temp;
    }
    printf("\n");
}

// Test function for ft_atoi_base
void test_ft_atoi_base() {
    printf("Testing ft_atoi_base:\n");
    printf("ft_atoi_base(\"1010\", \"01\"): %d\n", ft_atoi_base("1010", "01"));
    printf("ft_atoi_base(\"FF\", \"0123456789ABCDEF\"): %d\n", ft_atoi_base("FF", "0123456789ABCDEF"));
    printf("ft_atoi_base(\"-42\", \"0123456789\"): %d\n", ft_atoi_base("-42", "0123456789"));
    printf("\n");
}

int main() {
    test_ft_strlen();
    test_ft_strcpy();
    test_ft_strcmp();
    test_ft_strdup();
    test_ft_write();
    test_ft_read();
    test_ft_list_push_front_and_size();
    test_ft_list_sort();
    test_ft_list_remove_if();
    test_ft_atoi_base();
    return 0;
}


// // ft_atoi_base
// int main(void)
// {
//     char nb[] = "--101";
//     char base[] = "0123456789";
//     printf("%s\n%s\n%i\n", nb, base, ft_atoi_base(nb, base));
//     return 0;
// }

// ft_list_remove_if
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

//     ft_list_push_front(&list, ft_strdup("bread"));
//     ft_list_push_front(&list, ft_strdup("milk"));
//     ft_list_push_front(&list, ft_strdup("apple"));

//     ft_list_remove_if(&list, "milk", strcmp, funct_free);

//     int index = 1;
//     while (list != NULL)
//     {
//         printf("%i: %s\n", index, (char*)list->data);
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