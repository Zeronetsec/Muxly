# https://github.com/Zeronetsec/Muxly

function utils::missingArgument() {
    echo -e "${R}[!] ${N}Missing argument!"
    echo -e "${R}[!] ${N}Try: ${GG}muxly --help${N}"
    return 1
}

# Copyright (c) 2026 Zeronetsec