# https://github.com/Zeronetsec/Muxly

function module::theme::Chtheme() {
    if [[ -z "${1}" ]]; then
        utils::missingArgument
        return 1
    fi

    if [[ ! -f "${root}/style/theme/${1}" ]]; then
        echo -e "${R}[!] ${N}Invalid theme style: ${GG}${1}${N}"
        return 1
    fi

    if [[ -e "${thpath}" ]]; then
        command unlink "${thpath}" 2>/dev/null || \
            command rm -rf "${thpath}" 2>/dev/null
    fi

    command ln -sf \
        "${root}/style/theme/${1}" \
        "${thpath}"

    command termux-reload-settings
    utils::setconf "theme-style" "${1}"

    echo -e "${B}[*] ${N}Change theme style: ${GG}${1}${N}"
    return 0
}; readonly -f module::theme::Chtheme

# Copyright (c) 2026 Zeronetsec