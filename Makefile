CASM	= nasm
CFLAGS	= -f elf64 -Wx -Werror

RM		= rm -f

NAME	= libasm.a

MANDATORY_SRCS_DIR = mandatory

MANDATORY_SRCS_FILE = ft_strlen.s ft_strcpy.s ft_strcmp.s

MANDATORY_SRCS = $(addprefix $(MANDATORY_SRCS_DIR)/, $(MANDATORY_SRCS_FILE))

MANDATORY_OBJS	= $(MANDATORY_SRCS:.s=.o)

all: $(NAME)

%.o: %.s
	$(CASM) $(CFLAGS) -o $@ $<

$(NAME): $(MANDATORY_OBJS)
	ar -rcs $@ $^

bonus:

tester: $(NAME)
	cc -g -o tester tester.c -L. -l:libasm.a

clean:
	@$(RM) $(MANDATORY_OBJS)

fclean:		clean
	@$(RM) $(NAME)
	@$(RM) tester

re:			fclean $(NAME)

.PHONY:		all clean fclean re tester bonus
