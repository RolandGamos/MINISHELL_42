/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   execpath.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: user42 <user42@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/06/16 21:00:24 by user42            #+#    #+#             */
/*   Updated: 2021/07/06 17:25:23 by user42           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../includes/minishell.h"

static int	check_is_path(const char *str)
{
	int i;

	i = 0;
	while (str[i])
	{
		if (str[i] == '/')
			return (1);
		i++;
	}
	return (0);
}

static void	execve_with_path(t_cmd cmd, char **env_list)
{
	int			i;
	char		**split;
	struct stat *buf = NULL;

	i = 0;
	buf = malloc(sizeof(struct stat));
	split = ft_split(getenv("PATH"), ':');
	while (split[i])
	{
		if (stat((const char*)ft_strjoin(split[i], cmd.builtin), buf) == 0)
			execve(ft_strjoin(split[i], cmd.builtin), cmd.arg, env_list);
		i++;
	}
}

void	execpath(t_cmd cmd, char **env_list, bool pipe)
{
	pid_t		pid;

	if (pipe == false)
	{
		pid = fork();
		if (pid < 0)
			return ;
		if (pid == 0)
		{
			if (check_is_path(cmd.builtin) == 1)
				execve(cmd.builtin, cmd.arg, env_list);
			else
				execve_with_path(cmd, env_list);
			error_errno(&cmd, errno);
		}
		waitpid(pid, NULL, 0);
	}
	else if (pipe == true)
	{
		if (check_is_path(cmd.builtin) == 1)
			execve(cmd.builtin, cmd.arg, env_list);
			else
				execve_with_path(cmd, env_list);
		error_errno(&cmd, errno);
	}
}
