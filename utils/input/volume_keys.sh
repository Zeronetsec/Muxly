# Muxly Project

function __volume_keys__() {
    if [[ ! -f "$proppath" ]]; then
        echo -e "${R}[!] ${N}File: ${GG}${proppath} ${N}not found!"
        return 1
    fi

    if [[ -z "$1" ]]; then
        echo -e "${R}[!] ${N}Missing arguments!"
        echo -e "${R}[!] ${N}Try: ${GG}muxly --help${N}"
        return 1
    fi

    command cat "${proppath}" | \
        command grep -vE '^\s*volume-keys = *' \
        > "${utemp}"

    echo -e "volume-keys = ${1}" \
        >> "${utemp}"

    command cat "${utemp}" \
        > "${proppath}"

    command rm -f "${utemp}"
    command termux-reload-settings

    __setconf__ "volume-keys" "${1}"

    echo -e "${B}[*] ${N}Change volume keys: ${GG}${1}${N}"
    return 0
}

# Copyright (c) 2026 Zeronetsec