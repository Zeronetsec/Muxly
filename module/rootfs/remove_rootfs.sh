# https://github.com/Zeronetsec/Muxly

function module::rootfs::RemoveRootfs() {
    if [[ ! -d "${rfspath}" ]]; then
        echo -e "${R}[!] ${N}Folder: ${GG}${rfspath} ${N}not found!"
        return 1
    fi

    if [[ -z "${1}" ]]; then
        utils::missingArgument
        return 1
    fi

    if [[ ! -d "${rfspath}/${1}" ]]; then
        echo -e "${R}[!] ${N}Rootfs: ${GG}${1} ${N}is not installed!"
        return 1
    fi

    command pd530 remove "${1}"
    return ${?}
}; readonly -f module::rootfs::RemoveRootfs

# Copyright (c) 2026 Zeronetsec