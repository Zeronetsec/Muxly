# Muxly Project

function __chfont__() {
    if [[ -f "$fontpath" ]]; then
        command unlink "$fontpath" 2>/dev/null || \
            command rm -f "$fontpath" 2>/dev/null
    fi

    if [[ -z "$1" ]]; then
        echo -e "${R}[!] ${N}Missing arguments!"
        echo -e "${R}[!] ${N}Try: ${GG}muxly --help${N}"
        return 1
    fi

    if [[ ! -f "$muxlyroot/font/$1.ttf" ]]; then
        echo -e "${R}[!] ${N}Invalid font style: ${GG}${1}${N}"
        return 1
    fi

    command ln -sf \
        "${muxlyroot}/font/${1}.ttf" \
        "${fontpath}"

    command termux-reload-settings
    __setconf__ "font-style" "${1}"

    echo -e "${B}[*] ${N}Change font style: ${GG}${1}${N}"
    return 0
}

# Copyright (c) 2026 Zeronetsec