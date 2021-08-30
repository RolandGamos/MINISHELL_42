/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   builtin.h                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: user42 <user42@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/06/16 21:58:19 by user42            #+#    #+#             */
/*   Updated: 2021/08/24 17:50:17 by user42           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef BUILTIN_H
# define BUILTIN_H

# include "minishell.h"

void		execpath(int index, t_cmd *cmd, char **env_list, bool pipe);
void		execpath_pipe(t_cmd *cmd, int i, char **env_list);
void		builtin_echo(int index, t_cmd *cmd, bool pipe);
void		builtin_cd(int index, t_cmd *cmd, bool pipe);
void		builtin_pwd(int index, t_cmd *cmd, bool pipe);
void		builtin_export(int index, t_cmd *cmd, t_env_l *env, bool pipe);
void		builtin_unset(int index, t_cmd *cmd, t_env_l *env, bool pipe);
void		builtin_env(int index, t_cmd *cmd, char **env_list, bool pipe);
void		builtin_exit(int index, t_cmd *cmd, bool pipe, char **env_list);

#endif