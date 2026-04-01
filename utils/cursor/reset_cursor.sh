# Muxly Project

function __reset_cursor__() {
    if [[ ! -f "$proppath" ]]; then
        echo -e "${R}[!] ${N}File: ${GG}${proppath} ${N}not found!"
        return 1
    fi

    command cat "${proppath}" | \
        command grep -vE '^\s*terminal-cursor-style = *' \
        > "${utemp}"

    echo -e "# terminal-cursor-style = block" \
        >> "${utemp}"

    command cat "${utemp}" \
        > "${proppath}"

    command rm -f "${utemp}"
    command termux-reload-settings
    printf '\e[2 q'

    __setconf__ "terminal-cursor-style" "default"

    echo -e "${B}[*] ${N}Resetting cursor style"
    return 0
}

# Copyright (c) 2026 Zeronetsec