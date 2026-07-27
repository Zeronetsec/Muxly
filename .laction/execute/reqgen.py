#!/usr/bin/env python3

import sys
from pathlib import Path

ROOT_DIR = Path(__file__).resolve().parent
project_root = ROOT_DIR.parent.parent

input_file = project_root / ".install" / "extern" / "python_packages.txt"
output_file = project_root / "requirements.txt"
outvendor_file = project_root / "vendor" / "pd530" / "requirements.txt"

try:
    content = input_file.read_text(encoding="utf-8")
    output_file.write_text(content, encoding="utf-8")
    print(f"\x1b[0;32m[+] \x1b[0mGenerated: \x1b[0;32m{output_file.name}\x1b[0m")

    outvendor_file.parent.mkdir(
        parents=True, exist_ok=True,
    )

    outvendor_file.write_text(content, encoding="utf-8")
    print(f"\x1b[0;32m[+] \x1b[0mGenerated: \x1b[0;32m{outvendor_file.name}\x1b[0m")

except FileNotFoundError:
    print(f"\x1b[1;31m[!] \x1b[0mFile: \x1b[0;32m{input_file} \x1b[0mnot found!")
    sys.exit(1)

except Exception as e:
    print(f"\x1b[1;31m[!] \x1b[0mError: \x1b[0;32m{e}\x1b[0m")
    sys.exit(1)