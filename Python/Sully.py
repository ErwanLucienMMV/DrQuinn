import py_compile
import subprocess
import sys
from pathlib import Path


def reproduce(counter):
    source = 'import py_compile\nimport subprocess\nimport sys\nfrom pathlib import Path\n\n\ndef reproduce(counter):\n    source = %(source)r\n    child = Path(f"Sully_{counter}.py")\n    bytecode = child.with_suffix(".pyc")\n    with child.open("w", encoding="utf-8", newline="\\n") as stream:\n        stream.write(source %% {"source": source, "counter": counter})\n    py_compile.compile(str(child), cfile=str(bytecode), doraise=True)\n    subprocess.run([sys.executable, str(bytecode)], check=True)\n\n\ndef main():\n    counter = %(counter)d\n    if counter < 0:\n        return 0\n    if Path(__file__).stem != "Sully":\n        counter -= 1\n    if counter < 0:\n        return 0\n    try:\n        reproduce(counter)\n    except (OSError, py_compile.PyCompileError,\n            subprocess.CalledProcessError) as error:\n        print(f"Sully: {error}", file=sys.stderr)\n        return 1\n    return 0\n\n\nif __name__ == "__main__":\n    raise SystemExit(main())\n'
    child = Path(f"Sully_{counter}.py")
    bytecode = child.with_suffix(".pyc")
    with child.open("w", encoding="utf-8", newline="\n") as stream:
        stream.write(source % {"source": source, "counter": counter})
    py_compile.compile(str(child), cfile=str(bytecode), doraise=True)
    subprocess.run([sys.executable, str(bytecode)], check=True)


def main():
    counter = 5
    if counter < 0:
        return 0
    if Path(__file__).stem != "Sully":
        counter -= 1
    if counter < 0:
        return 0
    try:
        reproduce(counter)
    except (OSError, py_compile.PyCompileError,
            subprocess.CalledProcessError) as error:
        print(f"Sully: {error}", file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
