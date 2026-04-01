# Muxly Project

function __list_themes__() {
    local th="$muxlyroot/theme"

    if [[ ! -d "$th" ]]; then
        echo -e "${R}[!] ${N}Folder: ${GG}${th} ${N}not found!"
        return 1
    fi

    command mapfile -t theme < <(
        command ls "${th}" 2>/dev/null
    )

    echo -e "${B}[*] ${N}List available themes style:"
    for i in "${theme[@]}"; do
        echo -e "${DG}* ${GG}$(command basename "${i}")${N}"
    done

    return 0
}

# Copyright (c) 2026 Zeronetsec