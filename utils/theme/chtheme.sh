# Muxly Project

function __chtheme__() {
    if [[ -f "$thpath" ]]; then
        command unlink "$thpath" 2>/dev/null || \
            command rm -f "$thpath" 2>/dev/null
    fi

    if [[ -z "$1" ]]; then
        echo -e "${R}[!] ${N}Missing arguments!"
        echo -e "${R}[!] ${N}Try: ${GG}muxly --help${N}"
        return 1
    fi

    if [[ ! -f "$muxlyroot/theme/$1" ]]; then
        echo -e "${R}[!] ${N}Invalid theme style: ${GG}${1}${N}"
        return 1
    fi

    command ln -sf \
        "${muxlyroot}/theme/${1}" \
        "${thpath}"

    command termux-reload-settings
    __setconf__ "theme-style" "${1}"

    echo -e "${B}[*] ${N}Change theme style: ${GG}${1}${N}"
    return 0
}

# Copyright (c) 2026 Zeronetsec