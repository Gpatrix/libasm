CASM	= nasm
CFLAGS	= -f elf64 -Wx -Werror

RM		= rm -f

NAME	= libasm.a

MANDATORY_SRCS_DIR = mandatory

MANDATORY_SRCS_FILE = ft_strlen.s ft_strcpy.s ft_strcmp.s ft_strdup.s ft_write.s ft_read.s

MANDATORY_SRCS = $(addprefix $(MANDATORY_SRCS_DIR)/, $(MANDATORY_SRCS_FILE))

MANDATORY_OBJS	= $(MANDATORY_SRCS:.s=.o)

BONUS_SRCS_DIR = bonus

BONUS_SRCS_FILE = ft_list_push_front.s

BONUS_SRCS = $(addprefix $(BONUS_SRCS_DIR)/, $(BONUS_SRCS_FILE))

BONUS_OBJS	= $(BONUS_SRCS:.s=.o)

all: $(NAME)

%.o: %.s
	$(CASM) $(CFLAGS) -o $@ $<

$(NAME): $(MANDATORY_OBJS)
	ar -rcs $@ $^
	ranlib $@

bonus: $(NAME) $(BONUS_OBJS)
	ar -rcs $(NAME) $(BONUS_OBJS)
	ranlib $(NAME)

# TODO it relink
tester: bonus
	gcc -g -o tester tester.c -L. -l:libasm.a

clean:
	@$(RM) $(MANDATORY_OBJS)
	@$(RM) $(MANDATORY_OBJS)

fclean:		clean
	@$(RM) $(NAME)
	@$(RM) tester

re:			fclean $(NAME)

.PHONY:		all clean fclean re tester bonus
