CC = cc
CFLAGS = -Wall -Wextra -Werror
NASM = nasm
ASFLAGS = -f elf64

PROGRAMS = Colleen Grace
OBJECTS = $(PROGRAMS:=.o)

.DEFAULT_GOAL := all
.DELETE_ON_ERROR:
.SECONDARY: $(OBJECTS)
.PHONY: all clean fclean re

all: $(PROGRAMS)

$(PROGRAMS): %: %.o
	$(CC) $(LDFLAGS) $< $(LDLIBS) -o $@

%.o: %.s
	$(NASM) $(ASFLAGS) $< -o $@

clean:
	$(RM) $(OBJECTS) Grace_kid.s

fclean: clean
	$(RM) $(PROGRAMS)

re:
	$(MAKE) fclean
	$(MAKE) all
