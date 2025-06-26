CC		= nasm
CFLAGS	= -f elf64 -Wx -Werror
LFLAGS	= -m elf_x86_64

RM		= rm -f

NAME	= libasm.a

FILE	= srcs/test.s

OBJS	= $(FILE:.s=.o)

all: $(NAME)

%.o: %.s
	$(CC) $(CFLAGS) -o $@ $<

$(NAME): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $(OBJS)
# ld -m elf_x86_64 test.o

clean:
	@$(RM) $(OBJS)

fclean:		clean
	@$(RM) $(NAME)

re:			fclean $(NAME)

.PHONY:		all clean fclean re
