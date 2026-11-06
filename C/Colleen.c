/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   Colleen.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: erwan <ultimemmv@gmail.com>                  +#+  +:+       +#+      */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2026/11/06 20:00:00 by erwan               #+#    #+#           */
/*   Updated: 2026/11/06 20:00:00 by erwan              ###   ########.fr     */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>

static int	ft_colleen(void)
{
	const char	*source;

	source = "/* ************************************************************************** */%1$c/*                                                                            */%1$c/*                                                        :::      ::::::::   */%1$c/*   Colleen.c                                          :+:      :+:    :+:   */%1$c/*                                                    +:+ +:+         +:+     */%1$c/*   By: erwan <ultimemmv@gmail.com>                  +#+  +:+       +#+      */%1$c/*                                                +#+#+#+#+#+   +#+           */%1$c/*   Created: 2026/11/06 20:00:00 by erwan               #+#    #+#           */%1$c/*   Updated: 2026/11/06 20:00:00 by erwan              ###   ########.fr     */%1$c/*                                                                            */%1$c/* ************************************************************************** */%1$c%1$c#include <stdio.h>%1$c%1$cstatic int%2$cft_colleen(void)%1$c{%1$c%2$cconst char%2$c*source;%1$c%1$c%2$csource = %3$c%4$s%3$c;%1$c%2$cif (printf(source, 10, 9, 34, source) < 0)%1$c%2$c%2$creturn (1);%1$c%2$cif (fflush(stdout) == EOF)%1$c%2$c%2$creturn (1);%1$c%2$creturn (0);%1$c}%1$c%1$cint%2$cmain(void)%1$c{%1$c%2$c/*%1$c%2$c%2$cPrint the encoded source without opening a source file.%1$c%2$c*/%1$c%2$creturn (ft_colleen());%1$c}%1$c";
	if (printf(source, 10, 9, 34, source) < 0)
		return (1);
	if (fflush(stdout) == EOF)
		return (1);
	return (0);
}

int	main(void)
{
	/*
		Print the encoded source without opening a source file.
	*/
	return (ft_colleen());
}
