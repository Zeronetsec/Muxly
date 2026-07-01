# https://github.com/Zeronetsec/Muxly

function module::font::ListFonts() {
    local folder="${root}/style/font"
    if [[ ! -d "${folder}" ]]; then
        echo -e "${R}[!] ${N}Folder: ${GG}${folder} ${N}not found!"
        return 1
    fi

    command mapfile -t font < <(
        command ls "${folder}/" 2>/dev/null
    )

    echo -e "${B}[*] ${N}List available fonts style:"
    for i in "${font[@]}"; do
        echo -e "${DG}* ${GG}${i%%.*}${N}"
    done

    return 0
}; readonly -f module::font::ListFonts

# Copyright (c) 2026 Zeronetsec