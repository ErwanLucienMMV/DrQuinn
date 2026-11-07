import sys


# Constants and a function replace the three macros used in C.
SOURCE = 'import sys\n\n\n# Constants and a function replace the three macros used in C.\nSOURCE = %(source)r\nCHILD = "Grace_kid.py"\nMODE = "w"\n\n\ndef grace():\n    try:\n        with open(CHILD, MODE, encoding="utf-8", newline="\\n") as child:\n            child.write(SOURCE %% {"source": SOURCE})\n    except OSError as error:\n        print(f"Grace: {error}", file=sys.stderr)\n        return 1\n    return 0\n\n\nif __name__ == "__main__":\n    raise SystemExit(grace())\n'
CHILD = "Grace_kid.py"
MODE = "w"


def grace():
    try:
        with open(CHILD, MODE, encoding="utf-8", newline="\n") as child:
            child.write(SOURCE % {"source": SOURCE})
    except OSError as error:
        print(f"Grace: {error}", file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(grace())
