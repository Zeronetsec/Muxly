# Muxly Project

function __reset_transcript_rows__() {
    if [[ ! -f "$proppath" ]]; then
        echo -e "${R}[!] ${N}File: ${GG}${proppath} ${N}not found!"
        return 1
    fi

    command cat "${proppath}" | \
        command grep -vE '^\s*terminal-transcript-rows = *' \
        > "${utemp}"

    echo -e "# terminal-transcript-rows = 2000" \
        >> "${utemp}"

    command cat "${utemp}" \
        > "${proppath}"

    command rm -f "${utemp}"
    command termux-reload-settings

    __setconf__ "transcript-rows" "default"

    echo -e "${B}[*] ${N}Resetting transcript rows"
    return 0
}

# Copyright (c) 2026 Zeronetsec