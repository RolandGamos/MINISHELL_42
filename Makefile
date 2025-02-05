.SILENT:

#COLOR
RED =`tput setaf 1`
GREEN =`tput setaf 2`
CLEAR =`tput sgr0`

#GENERAL
CC = clang
FLAGS = -Wall -Werror -Wextra
RLFLAGS = -lreadline -L /Users/$(USER)/.brew/opt/readline/lib -I /Users/$(USER)/.brew/opt/readline/include
CD = cd
MV = mv
RM = rm -rf

#OS
UNAME = $(shell uname)

#PROJECT
EXEC = minishell
NAME = minishell.a
SRCS  =  srcs/builtins/cd.c srcs/builtins/echo.c srcs/builtins/env.c srcs/builtins/execpath.c srcs/builtins/exit.c srcs/builtins/export.c srcs/builtins/pwd.c srcs/builtins/unset.c\
		 srcs/cmd/error.c srcs/cmd/parse_cmd_array.c srcs/env/env_utils1.c srcs/env/env_utils2.c srcs/env/env_utils3.c\
		 srcs/filling/fill_cmd_array_utils.c srcs/filling/fill_cmd_array.c srcs/filling/split_args_utils.c srcs/filling/split_args.c\
		 srcs/lib/ft_split_slash.c srcs/lib/ft_itoa.c srcs/lib/ft_split.c srcs/lib/lib_utils1.c srcs/lib/lib_utils2.c srcs/lib/lib_utils3.c\
		 srcs/parsing/expand_env1.c srcs/parsing/expand_env2.c srcs/parsing/expand_env3.c srcs/parsing/remove_quotes1.c srcs/parsing/remove_quotes2.c srcs/parsing/save_quotes1.c srcs/parsing/save_quotes2.c srcs/parsing/parsing_utils1.c srcs/parsing/parsing_utils2.c srcs/parsing/parsing_utils3.c srcs/parsing/parse_command.c\
		 srcs/redirections/brackets.c srcs/redirections/pipe.c srcs/redirections/redirections_utils.c
OBJS = $(SRCS:.c=.o)

#RULES
.c.o:
	@$(CC) $(FLAGS) -c $< -o $@

all: $(NAME)

$(NAME): $(OBJS)
	@ar rcs $(NAME) $(OBJS)
	@ranlib $(NAME)
	@echo "$(GREEN)$(NAME) compiled with success.$(CLEAR)"
ifeq ($(UNAME), Darwin)
	@$(CC) minishell.c -o $(EXEC) $(RLFLAGS) $(NAME)
	@echo "$(GREEN)$(EXEC) compiled with success.$(CLEAR)"
endif
ifeq ($(UNAME), Linux)
	@$(CC) minishell.c -o $(EXEC) -lreadline $(NAME)
	@echo "$(GREEN)$(EXEC) compiled with success.$(CLEAR)"
endif

clean:
	@$(RM) $(OBJS)
	@echo "$(RED)$(EXEC)'s sources deleted with success.$(CLEAR)"

fclean:	clean
	@$(RM) $(NAME)
	@$(RM) minishell
	@echo "$(RED)$(NAME) & $(EXEC) deleted with success.$(CLEAR)"

re: fclean all