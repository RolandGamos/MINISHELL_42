CC = clang

NAME = minishell.a

FLAGS = -Wall -Wextra -Werror

SRCS  =   main.c srcs/lib/lib_utils.c srcs/lib/lst_utils.c srcs/parsing_line.c srcs/builtins/echo.c srcs/builtins/pwd.c

RM	= rm -f

OBJS = $(SRCS:.c=.o)

.c.o:
	$(CC) $(FLAGS) -c $< -o $@

all: $(NAME)

$(NAME): $(OBJS)
	@ar rcs $(NAME) $(OBJS)
	@ranlib $(NAME)
	@$(CC) -lreadline main.c -o minishell $(NAME)

clean:
	$(RM) $(OBJS)

fclean:	clean
	$(RM) $(NAME)

re: fclean all