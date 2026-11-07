import sys


# The embedded template contains the complete program.
def show_source():
    source = 'import sys\n\n\n# The embedded template contains the complete program.\ndef show_source():\n    source = %(source)r\n    sys.stdout.buffer.write((source %% {"source": source}).encode("utf-8"))\n    sys.stdout.flush()\n\n\ndef main():\n    # Reproduce the source without opening a source file.\n    try:\n        show_source()\n    except OSError as error:\n        try:\n            sys.stdout.close()\n        except OSError:\n            pass\n        print(f"Colleen: {error}", file=sys.stderr)\n        return 1\n    return 0\n\n\nif __name__ == "__main__":\n    raise SystemExit(main())\n'
    sys.stdout.buffer.write((source % {"source": source}).encode("utf-8"))
    sys.stdout.flush()


def main():
    # Reproduce the source without opening a source file.
    try:
        show_source()
    except OSError as error:
        try:
            sys.stdout.close()
        except OSError:
            pass
        print(f"Colleen: {error}", file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
