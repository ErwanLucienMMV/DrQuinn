/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   Sully.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: erwan <ultimemmv@gmail.com>                  +#+  +:+       +#+      */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2026/11/06 20:00:00 by erwan               #+#    #+#           */
/*   Updated: 2026/11/06 20:00:00 by erwan              ###   ########.fr     */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static int	ft_counter(void)
{
	const char	*name;
	int			i;

	i = 5;
	if (i < 0)
		return (i);
	name = strrchr(__FILE__, '/');
	if (name == NULL)
		name = __FILE__;
	else
		name++;
	if (strcmp(name, "Sully.c") != 0)
		i--;
	return (i);
}

static int	ft_write_source(const char *name, int i)
{
	const char	*source;
	FILE		*file;
	int			failed;

	source = "/* ************************************************************************** */%1$c/*                                                                            */%1$c/*                                                        :::      ::::::::   */%1$c/*   Sully.c                                            :+:      :+:    :+:   */%1$c/*                                                    +:+ +:+         +:+     */%1$c/*   By: erwan <ultimemmv@gmail.com>                  +#+  +:+       +#+      */%1$c/*                                                +#+#+#+#+#+   +#+           */%1$c/*   Created: 2026/11/06 20:00:00 by erwan               #+#    #+#           */%1$c/*   Updated: 2026/11/06 20:00:00 by erwan              ###   ########.fr     */%1$c/*                                                                            */%1$c/* ************************************************************************** */%1$c%1$c#include <stdio.h>%1$c#include <stdlib.h>%1$c#include <string.h>%1$c%1$cstatic int%2$cft_counter(void)%1$c{%1$c%2$cconst char%2$c*name;%1$c%2$cint%2$c%2$c%2$ci;%1$c%1$c%2$ci = %5$d;%1$c%2$cif (i < 0)%1$c%2$c%2$creturn (i);%1$c%2$cname = strrchr(__FILE__, '/');%1$c%2$cif (name == NULL)%1$c%2$c%2$cname = __FILE__;%1$c%2$celse%1$c%2$c%2$cname++;%1$c%2$cif (strcmp(name, %3$cSully.c%3$c) != 0)%1$c%2$c%2$ci--;%1$c%2$creturn (i);%1$c}%1$c%1$cstatic int%2$cft_write_source(const char *name, int i)%1$c{%1$c%2$cconst char%2$c*source;%1$c%2$cFILE%2$c%2$c*file;%1$c%2$cint%2$c%2$c%2$cfailed;%1$c%1$c%2$csource = %3$c%4$s%3$c;%1$c%2$cfile = fopen(name, %3$cw%3$c);%1$c%2$cif (file == NULL)%1$c%2$c%2$creturn (1);%1$c%2$cfailed = (fprintf(file, source, 10, 9, 34, source, i) < 0);%1$c%2$cif (fclose(file) == EOF)%1$c%2$c%2$cfailed = 1;%1$c%2$creturn (failed);%1$c}%1$c%1$cstatic int%2$cft_compile_and_run(int i)%1$c{%1$c%2$cchar%2$ccommand[256];%1$c%2$cint%2$c%2$clength;%1$c%1$c%2$clength = snprintf(command, sizeof(command),%1$c%2$c%2$c%2$c%3$ccc -Wall -Wextra -Werror Sully_%%1$d.c -o Sully_%%1$d%3$c%1$c%2$c%2$c%2$c%3$c && ./Sully_%%1$d%3$c, i);%1$c%2$cif (length < 0 || (size_t)length >= sizeof(command))%1$c%2$c%2$creturn (1);%1$c%2$cif (system(command) != 0)%1$c%2$c%2$creturn (1);%1$c%2$creturn (0);%1$c}%1$c%1$cint%2$cmain(void)%1$c{%1$c%2$cchar%2$cname[64];%1$c%2$cint%2$c%2$ci;%1$c%2$cint%2$c%2$clength;%1$c%1$c%2$ci = ft_counter();%1$c%2$cif (i < 0)%1$c%2$c%2$creturn (0);%1$c%2$clength = snprintf(name, sizeof(name), %3$cSully_%%d.c%3$c, i);%1$c%2$cif (length < 0 || (size_t)length >= sizeof(name))%1$c%2$c%2$creturn (1);%1$c%2$cif (ft_write_source(name, i) != 0)%1$c%2$c%2$creturn (1);%1$c%2$creturn (ft_compile_and_run(i));%1$c}%1$c";
	file = fopen(name, "w");
	if (file == NULL)
		return (1);
	failed = (fprintf(file, source, 10, 9, 34, source, i) < 0);
	if (fclose(file) == EOF)
		failed = 1;
	return (failed);
}

static int	ft_compile_and_run(int i)
{
	char	command[256];
	int		length;

	length = snprintf(command, sizeof(command),
			"cc -Wall -Wextra -Werror Sully_%1$d.c -o Sully_%1$d"
			" && ./Sully_%1$d", i);
	if (length < 0 || (size_t)length >= sizeof(command))
		return (1);
	if (system(command) != 0)
		return (1);
	return (0);
}

int	main(void)
{
	char	name[64];
	int		i;
	int		length;

	i = ft_counter();
	if (i < 0)
		return (0);
	length = snprintf(name, sizeof(name), "Sully_%d.c", i);
	if (length < 0 || (size_t)length >= sizeof(name))
		return (1);
	if (ft_write_source(name, i) != 0)
		return (1);
	return (ft_compile_and_run(i));
}
