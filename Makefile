CC = clang

NAME = minishell.a

FLAGS = -Wall -Wextra -Werror

SRCS  =   main.c srcs/lib/lib_utils.c srcs/parsing/parsing.c srcs/cmd/cmd_utils.c \
 	srcs/cmd/fill_cmd_array.c  srcs/cmd/parse_cmd_array.c  srcs/cmd/cmd_utils.c\
	srcs/builtins/echo.c srcs/builtins/pwd.c srcs/builtins/execpath.c srcs/builtins/cd.c srcs/builtins/env.c \
	srcs/builtins/exit.c srcs/builtins/unset.c srcs/builtins/export.c

RM	= rm -f

OBJS = $(SRCS:.c=.o)

.c.o:
	$(CC) $(FLAGS) -c $< -o $@

all: $(NAME)

$(NAME): $(OBJS)
	@ar rcs $(NAME) $(OBJS)
	@ranlib $(NAME)
	@$(CC) minishell.c -o minishell -lreadline $(NAME)

clean:
	$(RM) $(OBJS)

fclean:	clean
	$(RM) $(NAME)
	$(RM) minishell

re: fclean all