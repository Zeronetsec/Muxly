# Muxly Project

function __reset_theme__() {
    if [[ ! -f "$thpath" ]]; then
        echo -e "${R}[!] ${N}File: ${GG}${thpath} ${N}not found!"
        return 1
    fi

    command unlink "${thpath}" 2>/dev/null
    command termux-reload-settings

    __setconf__ "theme-style" "default"

    echo -e "${B}[*] ${N}Resetting theme style"
    return 0
}

# Copyright (c) 2026 Zeronetsec