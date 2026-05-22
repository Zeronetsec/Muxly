# https://github.com/Zeronetsec/Muxly

function utils::theme::ResetTheme() {
    if [[ ! -e "${thpath}" ]]; then
        echo -e "${R}[!] ${N}File: ${GG}${thpath} ${N}not found!"
        return 1
    fi

    command unlink "${thpath}" 2>/dev/null
    command termux-reload-settings

    utils::setconf "theme-style" "default"

    echo -e "${B}[*] ${N}Resetting theme style"
    return 0
}

# Copyright (c) 2026 Zeronetsec