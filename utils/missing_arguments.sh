# https://github.com/Zeronetsec/Muxly

function utils::missingArguments() {
    echo -e "${R}[!] ${N}Missing arguments!"
    echo -e "${R}[!] ${N}Try: ${GG}muxly --help${N}"
    return 1
}

# Copyright (c) 2026 Zeronetsec