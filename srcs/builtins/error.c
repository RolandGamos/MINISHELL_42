/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   error.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: lweglarz <lweglarz@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/06/25 21:47:42 by user42            #+#    #+#             */
/*   Updated: 2021/06/28 14:57:18 by lweglarz         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../includes/minishell.h"

void	error(t_cmd *cmd, int error_code)
{
	char	*error_msg;

	error_msg = strerror(error_code);
	write (2, error_msg, ft_strlen(error_msg));
	write(2, "\n", 1);
	if (cmd->arg)
		free(cmd->arg);
	if (cmd->builtin)
		free(cmd->builtin);
	exit(error_code);
}