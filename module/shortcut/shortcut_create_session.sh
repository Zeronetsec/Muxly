# https://github.com/Zeronetsec/Muxly

function module::shortcut::ShortcutCreateSession() {
    if [[ ! -f "${proppath}" ]]; then
        echo -e "${R}[!] ${N}File: ${GG}${proppath} ${N}not found!"
        return 1
    fi

    if [[ -z "${1}" ]]; then
        utils::missingArgument
        return 1
    fi

    command cat "${proppath}" | \
        command grep -vE '^\s*shortcut.create-session = *' \
        > "${utemp}"

    echo -e "shortcut.create-session = ${1}" \
        >> "${utemp}"

    command cat "${utemp}" \
        > "${proppath}"

    command rm -f "${utemp}"
    command termux-reload-settings

    utils::setconf "shortcut-create-session" "${1}"

    echo -e "${B}[*] ${N}Change shortcut create session: ${GG}${1}${N}"
    return 0
}

# Copyright (c) 2026 Zeronetsecg