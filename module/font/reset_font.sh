# https://github.com/Zeronetsec/Muxly

function module::font::ResetFont() {
    if [[ ! -f "${fontpath}" ]]; then
        echo -e "${R}[!] ${N}File: ${GG}${fontpath} ${N}not found!"
        return 1
    fi

    command unlink "${fontpath}" 2>/dev/null
    command termux-reload-settings

    utils::setconf "font-style" "default"

    echo -e "${B}[*] ${N}Resetting font style"
    return 0
}

# Copyright (c) 2026 Zeronetsec