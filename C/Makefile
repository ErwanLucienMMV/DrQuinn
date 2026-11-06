CC = cc
CFLAGS = -Wall -Wextra -Werror

PROGRAMS = Colleen Grace Sully
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
	$(RM) $(OBJECTS) Grace_kid.c Sully_*.c

fclean: clean
	$(RM) $(PROGRAMS) Sully_[0-9]*

re:
	$(MAKE) fclean
	$(MAKE) all
