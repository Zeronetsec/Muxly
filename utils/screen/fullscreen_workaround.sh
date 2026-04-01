# Muxly Project

function __fullscreen_workaround__() {
    if [[ ! -f "$proppath" ]]; then
        echo -e "${R}[!] ${N}File: ${GG}${proppath} ${N}not found!"
        return 1
    fi

    if [[ -z "$1" ]]; then
        echo -e "${R}[!] ${N}Missing arguments!"
        echo -e "${R}[!] ${N}Try: ${GG}muxly --help${N}"
        return 1
    fi

    if [[ "$1" != "true" && "$1" != "false" ]]; then
        echo -e "${R}[!] ${N}Invalid value: ${GG}${1}${N}"
        return 1
    fi

    command cat "${proppath}" | \
        command grep -vE '^\s*use-fullscreen-workaround = *' \
        > "${utemp}"

    echo -e "use-fullscreen-workaround = ${1}" \
        >> "${utemp}"

    command cat "${utemp}" \
        > "${proppath}"

    command rm -f "${utemp}"
    command termux-reload-settings

    __setconf__ "fullscreen-workaround" "${1}"

    echo -e "${B}[*] ${N}Change fullscreen workaround: ${GG}${1}${N}"
    echo -e "${B}[*] ${N}This may not take effect if ${GG}fullscreen ${N}is ${GG}false${N}"
    return 0
}

# Copyright (c) 2026 Zeronetsec