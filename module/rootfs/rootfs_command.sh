# https://github.com/Zeronetsec/Muxly

function module::rootfs::RootfsCommand() {
    if [[ ! -d "${rfspath}" ]]; then
        echo -e "${R}[!] ${N}Folder: ${GG}${rfspath} ${N}not found!"
        return 1
    fi

    if [[ -z "${1}" && -z "${2}" ]]; then
        utils::missingArgument
        return 1
    fi

    if [[ ! -d "${rfspath}/${1}" ]]; then
        echo -e "${R}[!] ${N}Rootfs: ${GG}${1} ${N}is not installed!"
        return 1
    fi

    command proot-distro login "${1}" -- "${2}"
    return ${?}
}

# Copyright (c) 2026 Zeronetsec