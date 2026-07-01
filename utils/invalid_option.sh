# https://github.com/Zeronetsec/Muxly

function utils::invalidOption() {
    echo -e "${R}[!] ${N}Invalid option: ${GG}${1}${N}"
    echo -e "${R}[!] ${N}Try: ${GG}muxly --help${N}"
    return 1
}; readonly -f utils::invalidOption

# Copyright (c) 2026 Zeronetsec