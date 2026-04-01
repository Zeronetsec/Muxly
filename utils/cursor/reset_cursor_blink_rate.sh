# Muxly Project

function __reset_cursor_blink_rate__() {
    if [[ ! -f "$proppath" ]]; then
        echo -e "${R}[!] ${N}File: ${GG}${proppath} ${N}not found!"
        return 1
    fi

    command cat "${proppath}" | \
        command grep -vE '^\s*terminal-cursor-blink-rate = *' \
        > "${utemp}"

    echo -e "# terminal-cursor-blink-rate = 0" \
        >> "${utemp}"

    command cat "${utemp}" \
        > "${proppath}"

    command rm -f "${utemp}"
    command termux-reload-settings

    __setconf__ "terminal-cursor-blink-rate" "default"

    echo -e "${B}[*] ${N}Resetting cursor blink rate"
    return 0
}

# Copyright (c) 2026 Zeronetsec