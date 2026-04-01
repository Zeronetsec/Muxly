# Muxly Project

function __setconf__() {
    [[ -z "$1" ]] && return 1
    [[ -z "$2" ]] && return 1

    command cat "${config}" | \
        command grep -v "^${1} =" \
        > "${cfgtmp}"

    echo -e "${1} = ${2}" \
        >> "${cfgtmp}"

    command cat "${cfgtmp}" \
        > "${config}"

    command rm -f "${cfgtmp}"
    return 0
}

# Copyright (c) 2026 Zeronetsec