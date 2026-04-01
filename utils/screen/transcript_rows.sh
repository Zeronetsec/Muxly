# Muxly Project

function __transcript_rows__() {
    if [[ ! -f "$proppath" ]]; then
        echo -e "${R}[!] ${N}File: ${GG}${proppath} ${N}not found!"
        return 1
    fi

    if [[ -z "$1" ]]; then
        echo -e "${R}[!] ${N}Missing arguments!"
        echo -e "${R}[!] ${N}Try: ${GG}muxly --help${N}"
        return 1
    fi

    if [[ "$1" -lt 1 || "$1" -gt 50000 ]]; then
        echo -e "${R}[!] ${N}Invalid value: ${GG}${1}${N}"
        echo -e "${R}[!] ${N}Available: ${GG}1 - 50000${N}"
        return 1
    fi

    command cat "${proppath}" | \
        command grep -vE '^\s*terminal-transcript-rows = *' \
        > "${utemp}"

    echo -e "terminal-transcript-rows = ${1}" \
        >> "${utemp}"

    command cat "${utemp}" \
        > "${proppath}"

    command rm -f "${utemp}"
    command termux-reload-settings

    __setconf__ "transcript-rows" "${1}"

    echo -e "${B}[*] ${N}Change transcript rows: ${GG}${1}${N}"
    return 0
}

# Copyright (c) 2026 Zeronetsec