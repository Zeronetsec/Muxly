#!/usr/bin/env python3

import sys
from pathlib import Path

ROOT_DIR = Path(__file__).resolve().parent.parent

input_file = ROOT_DIR / ".install" / "extern" / "python_packages.txt"
output_file = ROOT_DIR / "requirements.txt"
outvendor_file = ROOT_DIR / "vendor" / "pd530" / "requirements.txt"

try:
    content = input_file.read_text(encoding="utf-8")
    output_file.write_text(content, encoding="utf-8")
    print(f"[+] Generated: {output_file.name}")

    outvendor_file.parent.mkdir(
        parents=True, exist_ok=True,
    )

    outvendor_file.write_text(content, encoding="utf-8")
    print(f"[+] Generated: {outvendor_file.name}")
    sys.exit(0)

except FileNotFoundError:
    print(f"[!] File not found: {input_file}")
    sys.exit(1)

except Exception as e:
    print(f"[!] Error: {e}")
    sys.exit(1)