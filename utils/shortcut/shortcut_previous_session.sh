# Muxly Project

function __shortcut_previous_session__() {
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
        command grep -vE '^\s*shortcut.previous-session = *' \
        > "${utemp}"

    echo -e "shortcut.previous-session = ${1}" \
        >> "${utemp}"

    command cat "${utemp}" \
        > "${proppath}"

    command rm -f "${utemp}"
    command termux-reload-settings

    __setconf__ "shortcut-previous-session" "${1}"

    echo -e "${B}[*] ${N}Change shortcut previous session: ${GG}${1}${N}"
    return 0
}

# Copyright (c) 2026 Zeronetsec