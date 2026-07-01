# https://github.com/Zeronetsec/Muxly

function module::theme::ListThemes() {
    local th="${root}/style/theme"
    if [[ ! -d "${th}" ]]; then
        echo -e "${R}[!] ${N}Folder: ${GG}${th} ${N}not found!"
        return 1
    fi

    command mapfile -t theme < <(
        command ls "${th}" 2>/dev/null
    )

    echo -e "${B}[*] ${N}List available themes style:"
    for i in "${theme[@]}"; do
        echo -e "${DG}* ${GG}${i%%.*}${N}"
    done

    return 0
}; readonly -f module::theme::ListThemes

# Copyright (c) 2026 Zeronetsec