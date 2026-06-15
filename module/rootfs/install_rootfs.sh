# https://github.com/Zeronetsec/Muxly

function module::rootfs::InstallRootfs() {
    local rootfs="${root}/rootfs"
    if [[ -z "${1}" ]]; then
        utils::missingArgument
        return 1
    fi

    if [[ ! -d "${rootfs}/${1}" ]]; then
        echo -e "${R}[!] ${N}Invalid rootfs: ${GG}${1}${N}"
        return 1
    fi

    if [[ -d "${rootfs}/${1}" && ! -f "${rootfs}/${1}/install.sh" ]]; then
        echo -e "${R}[!] ${N}Rootfs: ${GG}${1} ${N}found, but missing ${GG}install.sh${N}"
        return 1
    fi

    if [[ -d "${rootfs}/${1}" && ! -f "${rootfs}/${1}/rootfs.sh" ]]; then
        echo -e "${R}[!] ${N}Rootfs: ${GG}${1} ${N}found, but missing ${GG}rootfs.sh${N}"
        return 1
    fi

    if [[ -d "${rfspath}/${1}" ]]; then
        echo -e "${R}[!] ${N}Rootfs: ${GG}${1} ${N}is already exist!"
        return 1
    fi

    command bash "${rootfs}/${1}/install.sh"
    return ${?}
}

# Copyright (c) 2026 Zeronetsec