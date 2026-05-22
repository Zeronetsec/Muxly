# https://github.com/Zeronetsec/Muxly

function utils::unknownCommand() {
    local input="${1}"
    echo -e "${R}[!] ${N}Unknown command: ${GG}${input}${N}"
    echo -e "${R}[!] ${N}Try: ${GG}muxly --help${N}"
    return 1
}

# Copyright (c) 2026 Zeronetsec