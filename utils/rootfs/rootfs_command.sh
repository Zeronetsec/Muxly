# https://github.com/Zeronetsec/Muxly

function __rootfs_command__() {
    if [[ ! -d "${rfspath}" ]]; then
        echo -e "${R}[!] ${N}Folder: ${GG}${rfspath} ${N}not found!"
        return 1
    fi

    if [[ -z "${1}" ]]; then
        echo -e "${R}[!] ${N}Missing arguments!"
        echo -e "${R}[!] ${N}Try: ${GG}Muxly --help${N}"
        return 1
    fi

    if [[ -z "${2}" ]]; then
        echo -e "${R}[!] ${N}Missing arguments!"
        echo -e "${R}Try: ${GG}muxly --help${N}"
        return 1
    fi

    if [[ ! -d "${rfspath}/${1}" ]]; then
        echo -e "${R}[!] ${N}Rootfs: ${GG}${1} ${N}is not installed!"
        return 1
    fi

    command proot-distro login "${1}" -- "${2}"
    return $?
}

# Copyright (c) 2026 Zeronetsec