# Muxly Project

function __list_installed_rootfs__() {
    if [[ ! -d "$rfspath" ]]; then
        echo -e "${R}[!] ${N}Folder: ${GG}${rfspath} ${N}not found!"
        return 1
    fi

    command mapfile -t installed < <(
        command ls "${rfspath}/" 2>/dev/null
    )

    if [[ "${#installed[@]}" -eq 0 ]]; then
        echo -e "${B}[*] ${N}No rootfs installed"
        return 0
    fi

    echo -e "${B}[*] ${N}List installed rootfs:"
    for distro in "${installed[@]}"; do
        echo -e "${DG}* ${GG}$(command basename "${distro}")${N}"
    done

    return 0
}

# Copyright (c) 2026 Zeronetsec