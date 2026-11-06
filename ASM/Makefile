CC = cc
CFLAGS = -Wall -Wextra -Werror
NASM = nasm
ASFLAGS = -f elf64

PROGRAMS = Colleen Grace Sully
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
	$(RM) $(OBJECTS) Grace_kid.s Sully_*.s Sully_*.o

fclean: clean
	$(RM) $(PROGRAMS) Sully_[0-9]*

re:
	$(MAKE) fclean
	$(MAKE) all
