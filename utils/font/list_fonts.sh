# Muxly Project

function __list_fonts__() {
    local folder="$muxlyroot/font"

    if [[ ! -d "$folder" ]]; then
        echo -e "${R}[!] ${N}Folder: ${GG}${folder} ${N}not found!"
        return 1
    fi

    command mapfile -t font < <(
        command ls "${folder}/" 2>/dev/null
    )

    echo -e "${B}[*] ${N}List available fonts style:"
    for i in "${font[@]}"; do
        local name="$(command basename "${i}" .ttf)"
        echo -e "${DG}* ${GG}${name}${N}"
    done

    return 0
}

# Copyright (c) 2026 Zeronetsec