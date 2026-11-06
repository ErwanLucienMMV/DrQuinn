CC = cc
CFLAGS = -Wall -Wextra -Werror

PROGRAMS = Colleen
OBJECTS = $(PROGRAMS:=.o)

.DEFAULT_GOAL := all
.DELETE_ON_ERROR:
.SECONDARY: $(OBJECTS)
.PHONY: all clean fclean re

all: $(PROGRAMS)

$(PROGRAMS): %: %.o
	$(CC) $(CFLAGS) $(LDFLAGS) $< $(LDLIBS) -o $@

%.o: %.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@

clean:
	$(RM) $(OBJECTS)

fclean: clean
	$(RM) $(PROGRAMS)

re:
	$(MAKE) fclean
	$(MAKE) all
