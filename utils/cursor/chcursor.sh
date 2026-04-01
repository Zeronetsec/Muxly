# Muxly Project

function __chcursor__() {
    if [[ ! -f "$proppath" ]]; then
        echo -e "${R}[!] ${N}File: ${GG}${proppath} ${N}not found!"
        return 1
    fi

    if [[ -z "$1" ]]; then
        echo -e "${R}[!] ${N}Missing arguments!"
        echo -e "${R}[!] ${N}Try: ${GG}muxly --help${N}"
        return 1
    fi

    if [[ "$1" != "block" && "$1" != "underline" && "$1" != "bar" ]]; then
        echo -e "${R}[!] ${N}Invalid cursor style: ${GG}${1}${N}"
        return 1
    fi

    command cat "${proppath}" | \
        command grep -vE '^\s*terminal-cursor-style = *' \
        > "${utemp}"

    echo -e "terminal-cursor-style = ${1}" \
        >> "${utemp}"

    command cat "${utemp}" \
        > "${proppath}"

    command rm -f "${utemp}"
    command termux-reload-settings

    case "$1" in
        "block") printf '\e[2 q' ;;
        "underline") printf '\e[4 q' ;;
        "bar") printf '\e[6 q' ;;
    esac

    __setconf__ "terminal-cursor-style" "${1}"

    echo -e "${B}[*] ${N}Change cursor style: ${GG}${1}${N}"
    return 0
}

# Copyright (c) 2026 Zeronetsec