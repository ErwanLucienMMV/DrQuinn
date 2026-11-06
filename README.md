# Dr_Quine

C and NASM implementations for x86-64 Linux, tested on Fedora 44.

Install the build tools on Fedora:

```sh
sudo dnf install gcc make nasm python3
```

Each language directory has its own Makefile with `all`, `clean`, `fclean`,
and `re`. Objects remain available for incremental builds. Assembly uses
ELF64, the System V AMD64 ABI, position-independent addressing, and a
non-executable stack; it links with Fedora's default PIE toolchain.

## Colleen

```sh
make -C C
make -C ASM
(cd C && ./Colleen > /tmp/Colleen.c && diff Colleen.c /tmp/Colleen.c)
(cd ASM && ./Colleen > /tmp/Colleen.s && diff Colleen.s /tmp/Colleen.s)
```

Both programs print their own source without opening a source file. Each
has an entry point, a called helper, and comments inside and outside the
entry point. Failed output writes produce a nonzero exit status.

## Verification

Local tests build in temporary directories, compare output byte for byte,
remove original sources before running the programs again, check output
errors, and verify incremental builds and cleanup.

## C style

The C code follows 42 formatting where compatible with this subject.
Encoded quine strings exceed 80 columns, and Colleen must include a comment
inside `main`. These are explicit, local exceptions; full Norminette
compliance is not claimed. NASM is outside Norminette's C/header scope.

All source files use LF line endings, including on Windows. The subject
PDF, tests, `.gitattributes`, and `.gitignore` are intentionally excluded
from Git. Tests and attributes remain available in the local workspace.
