#!/usr/bin/env python3
# https://github.com/Zeronetsec/Muxly

import os
import glob
import json

N = "\033[0m"
R = "\033[1;31m"
GG = "\033[0;32m"
CC = "\033[0;36m"
DG = "\033[1;90m"
WW = "\033[0;37m"

target_metadata = os.getenv("metadata")

if not target_metadata:
    print(f"{R}[!] {N}Variable: {GG}metadata {N}not found!")
    exit(1)

search_dir_pattern = os.path.join(target_metadata, "*/")
directories = sorted(glob.glob(search_dir_pattern))

for idx, dir_path in enumerate(directories):
    if idx > 0:
        print()

    section = os.path.basename(os.path.dirname(dir_path))
    print(f"{N}{section.capitalize()} commands:")

    json_pattern = os.path.join(dir_path, "*.json")
    for file_path in sorted(glob.glob(json_pattern)):
        try:
            with open(file_path, 'r', encoding='utf-8') as f:
                data = json.load(f)

                command = data.get("Command", "")
                args = data.get("Args", "")
                desc = data.get("Description", "")

                if args:
                    fullcmd = f"{GG}{command} {CC}{args}{N}"
                else:
                    fullcmd = f"{GG}{command}{N}"

            print(f"    {R}› {fullcmd} {DG}- {WW}{desc}{N}")

        except (json.JSONDecodeError, KeyError, PermissionError):
            continue

# Copyright (c) 2026 Zeronetsec