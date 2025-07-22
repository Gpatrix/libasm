CASM	= nasm
CFLAGS	= -f elf64 -Wx -Werror

RM		= rm -f

NAME	= libasm.a

MANDATORY_SRCS_DIR = mandatory
MANDATORY_SRCS_FILE = ft_strlen.s ft_strcpy.s ft_strcmp.s ft_strdup.s ft_write.s ft_read.s
MANDATORY_SRCS = $(addprefix $(MANDATORY_SRCS_DIR)/, $(MANDATORY_SRCS_FILE))
MANDATORY_OBJS = $(MANDATORY_SRCS:.s=.o)

BONUS_SRCS_DIR = bonus
BONUS_SRCS_FILE = ft_list_push_front.s ft_list_size.s ft_list_sort.s ft_list_remove_if.s ft_atoi_base.s
BONUS_SRCS = $(addprefix $(BONUS_SRCS_DIR)/, $(BONUS_SRCS_FILE))
BONUS_OBJS = $(BONUS_SRCS:.s=.o)

BONUS_FLAG = .bonus_done

all: $(NAME)

$(MANDATORY_SRCS_DIR)/%.o: $(MANDATORY_SRCS_DIR)/%.s
	$(CASM) $(CFLAGS) -I mandatory/ -o $@ $<

$(BONUS_SRCS_DIR)/%.o: $(BONUS_SRCS_DIR)/%.s
	$(CASM) $(CFLAGS) -I bonus/ -o $@ $<

$(NAME): $(MANDATORY_OBJS)
	ar -rcs $@ $^
	ranlib $@

bonus: $(BONUS_FLAG)

$(BONUS_FLAG): $(MANDATORY_OBJS) $(BONUS_OBJS)
	ar -rcs $(NAME) $^
	ranlib $(NAME)
	@touch $(BONUS_FLAG)

tester: tester.c $(BONUS_FLAG)
	gcc -g -o tester tester.c -L. -l:libasm.a

clean:
	@$(RM) $(MANDATORY_OBJS)
	@$(RM) $(BONUS_OBJS)
	@$(RM) $(BONUS_FLAG)

fclean: clean
	@$(RM) $(NAME)
	@$(RM) tester

re: fclean all

.PHONY: all clean fclean re bonus