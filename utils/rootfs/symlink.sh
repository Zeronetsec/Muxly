# https://github.com/Zeronetsec/Muxly

function __symlink__() {
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

    if [[ -e "${PREFIX}/bin/${2}" ]]; then
        echo -e "${R}[!] ${N}Command: ${GG}${2} ${N}is already exist!"
        return 1
    fi

    echo '#!/usr/bin/env bash' > "${PREFIX}/bin/${2}"
    echo -e "exec proot-distro login ${1} -- ${2}" >> "${PREFIX}/bin/${2}"

    command chmod +x "${PREFIX}/bin/${2}"
    return 0
}

# Copyright (c) 2026 Zeronetsec