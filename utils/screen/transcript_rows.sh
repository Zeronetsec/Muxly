# https://github.com/Zeronetsec/Muxly

function utils::screen::TranscriptRows() {
    if [[ ! -f "${proppath}" ]]; then
        echo -e "${R}[!] ${N}File: ${GG}${proppath} ${N}not found!"
        return 1
    fi

    if [[ -z "${1}" ]]; then
        utils::missingArguments
        return $?
    fi

    if [[ "${1}" -lt 1 || "${1}" -gt 50000 ]]; then
        echo -e "${R}[!] ${N}Invalid value: ${GG}${1}${N}"
        echo -e "${R}[!] ${N}Available: ${GG}1 - 50000${N}"
        return 1
    fi

    command cat "${proppath}" | \
        command grep -vE '^\s*terminal-transcript-rows = *' \
        > "${utemp}"

    echo -e "terminal-transcript-rows = ${1}" \
        >> "${utemp}"

    command cat "${utemp}" \
        > "${proppath}"

    command rm -f "${utemp}"
    command termux-reload-settings

    utils::setconf "transcript-rows" "${1}"

    echo -e "${B}[*] ${N}Change transcript rows: ${GG}${1}${N}"
    return 0
}

# Copyright (c) 2026 Zeronetsec