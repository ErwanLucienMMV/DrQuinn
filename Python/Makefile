PYTHON ?= python3

PROGRAMS = Colleen Grace
BYTECODE = $(PROGRAMS:=.pyc)

.DEFAULT_GOAL := all
.DELETE_ON_ERROR:
.PHONY: all clean fclean re $(PROGRAMS)

all: $(BYTECODE)

$(PROGRAMS): %: %.pyc

%.pyc: %.py
	$(PYTHON) -c "import py_compile; py_compile.compile('$<', cfile='$@', doraise=True)"

clean:
	$(RM) $(BYTECODE) Grace_kid.py Grace_kid.pyc

fclean: clean

re:
	$(MAKE) fclean
	$(MAKE) all
