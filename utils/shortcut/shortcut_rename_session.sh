# Muxly Project

function __shortcut_rename_session__() {
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
        command grep -vE '^\s*shortcut.rename-session = *' \
        > "${utemp}"

    echo -e "shortcut.rename-session = ${1}" \
        >> "${utemp}"

    command cat "${utemp}" \
        > "${proppath}"

    command rm -f "${utemp}"
    command termux-reload-settings

    __setconf__ "shortcut-rename-session" "${1}"

    echo -e "${B}[*] ${N}Change shortcut rename session: ${GG}${1}${N}"
    return 0
}

# Copyright (c) 2026 Zeronetsec