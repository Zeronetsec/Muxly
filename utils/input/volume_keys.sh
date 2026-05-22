# https://github.com/Zeronetsec/Muxly

function utils::input::VolumeKeys() {
    if [[ ! -f "${proppath}" ]]; then
        echo -e "${R}[!] ${N}File: ${GG}${proppath} ${N}not found!"
        return 1
    fi

    if [[ -z "${1}" ]]; then
        utils::missingArguments
        return $?
    fi

    command cat "${proppath}" | \
        command grep -vE '^\s*volume-keys = *' \
        > "${utemp}"

    echo -e "volume-keys = ${1}" \
        >> "${utemp}"

    command cat "${utemp}" \
        > "${proppath}"

    command rm -f "${utemp}"
    command termux-reload-settings

    utils::setconf "volume-keys" "${1}"

    echo -e "${B}[*] ${N}Change volume keys: ${GG}${1}${N}"
    return 0
}

# Copyright (c) 2026 Zeronetsec