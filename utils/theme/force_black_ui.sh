# https://github.com/Zeronetsec/Muxly

function utils::theme::ForceBlackUI() {
    if [[ ! -f "${proppath}" ]]; then
        echo -e "${R}[!] ${N}File: ${GG}${proppath} ${N}not found!"
        return 1
    fi

    if [[ -z "${1}" ]]; then
        utils::missingArguments
        return $?
    fi

    if [[ "${1}" != "true" && "${1}" != "false" ]]; then
        echo -e "${R}[!] ${N}Invalid value: ${GG}${1}${N}"
        return 1
    fi

    command cat "${proppath}" | \
        command grep -vE '^\s*use-black-ui = *' \
        > "${utemp}"

    echo -e "use-black-ui = ${1}" \
        >> "${utemp}"

    command cat "${utemp}" \
        > "${proppath}"

    command rm -f "${utemp}"
    command termux-reload-settings

    utils::setconf "force-black-ui" "${1}"

    echo -e "${B}[*] ${N}Change force black ui: ${GG}${1}${N}"
    return 0
}

# Copyright (c) 2026 Zeronetsec