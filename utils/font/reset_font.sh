# Muxly Project

function __reset_font__() {
    if [[ ! -f "$fontpath" ]]; then
        echo -e "${R}[!] ${N}File: ${GG}${fontpath} ${N}not found!"
        return 1
    fi

    command unlink "${fontpath}" 2>/dev/null
    command termux-reload-settings

    __setconf__ "font-style" "default"

    echo -e "${B}[*] ${N}Resetting font style"
    return 0
}

# Copyright (c) 2026 Zeronetsec