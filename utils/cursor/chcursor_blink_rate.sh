# Muxly Project

function __chcursor_blink_rate__() {
    if [[ ! -f "$proppath" ]]; then
        echo -e "${R}[!] ${N}File: ${GG}${proppath} ${N}not found!"
        return 1
    fi

    if [[ -z "$1" ]]; then
        echo -e "${R}[!] ${N}Missing arguments!"
        echo -e "${R}[!] ${N}Try: ${GG}muxly --help${N}"
        return 1
    fi

    if [[ "$1" -lt 0 || "$1" -gt 2000 ]]; then
        echo -e "${R}[!] ${N}Invalid value: ${GG}${1}${N}"
        echo -e "${R}[!] ${N}Available blink rate: ${GG}0 - 2000${N}"
        return 1
    fi

    command cat "${proppath}" | \
        command grep -vE '^\s*terminal-cursor-blink-rate = *' \
        > "${utemp}"

    echo -e "terminal-cursor-blink-rate = ${1}" \
        >> "${utemp}"

    command cat "${utemp}" \
        > "${proppath}"

    command rm -f "${utemp}"
    command termux-reload-settings

    __setconf__ "terminal-cursor-blink-rate" "${1}"

    echo -e "${B}[*] ${N}Change cursor blink rate: ${GG}${1}${N}"
    return 0
}

# Copyright (c) 2026 Zeronetsec