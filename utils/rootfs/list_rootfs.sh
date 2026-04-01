# Muxly Project

function __list_rootfs__() {
    local rfs="$muxlyroot/rootfs"

    if [[ ! -d "$rfs" ]]; then
        echo -e "${R}[!] ${N}Folder: ${GG}${rfs} ${N}not found!"
        return 1
    fi

    command mapfile -t fs < <(
        command ls "${rfs}" 2>/dev/null
    )

    echo -e "${B}[*] ${N}List available rootfs:"
    for i in "${fs[@]}"; do
        echo -e "${DG}* ${GG}$(command basename "${i}")${N}"
    done

    return 0
}

# Copyright (c) 2026 Zeronetsec