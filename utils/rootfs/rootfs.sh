# Muxly Project

function __rootfs__() {
    if [[ ! -d "$rfspath" ]]; then
        echo -e "${R}[!] ${N}Folder: ${GG}${rfspath} ${N}not found!"
        return 1
    fi

    if [[ -z "$1" ]]; then
        echo -e "${R}[!] ${N}Missing arguments!"
        echo -e "${R}[!] ${N}Try: ${GG}muxly --help${N}"
        return 1
    fi

    if [[ ! -d "$rfspath/$1" ]]; then
        echo -e "${R}[!] ${N}Rootfs: ${GG}${1} ${N}not found!"
        return 1
    fi

    exec proot-distro login "${1}"
}

# Copyright (c) 2026 Zeronetsec