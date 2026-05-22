# https://github.com/Zeronetsec/Muxly

function utils::rootfs::ResetRootfs() {
    if [[ ! -d "${rfspath}" ]]; then
        echo -e "${R}[!] ${N}Folder: ${GG}${rfspath} ${N}not found!"
        return 1
    fi

    if [[ -z "${1}" ]]; then
        utils::missingArguments
        return $?
    fi

    if [[ ! -d "${rfspath}/${1}" ]]; then
        echo -e "${R}[!] ${N}Rootfs: ${GG}${1} ${N}is not installed!"
        return 1
    fi

    command proot-distro reset "${1}"
    return 0
}

# Copyright (c) 2026 Zeronetsec