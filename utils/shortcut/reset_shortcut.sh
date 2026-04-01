# Muxly Project

function __reset_shortcut__() {
    if [[ ! -f "$proppath" ]]; then
        echo -e "${R}[!] ${N}File: ${GG}${proppath} ${N}not found!"
        return 1
    fi

    command cat "${proppath}" | \
        command grep -vE '^\s*shortcut.create-session = *' \
        > "${utemp}"

    echo -e "# shortcut.create-session = ctrl + t" \
        >> "${utemp}"

    command cat "${utemp}" \
        > "${proppath}"

    command rm -f "${utemp}"
    command termux-reload-settings

    __setconf__ "shortcut-create-session" "default"
    echo -e "${B}[*] ${N}Resetting shortcut create session"

    command cat "${proppath}" | \
        command grep -vE '^\s*shortcut.next-session = *' \
        > "${utemp}"

    echo -e "# shortcut.next-session = ctrl + 2" \
        >> "${utemp}"

    command cat "${utemp}" \
        > "${proppath}"

    command rm -f "${utemp}"
    command termux-reload-settings

    __setconf__ "shortcut-next-session" "default"
    echo -e "${B}[*] ${N}Resetting shortcut next session"

    command cat "${proppath}" | \
        command grep -vE '^\s*shortcut.previous-session = *' \
        > "${utemp}"

    echo -e "# shortcut.previous-session = ctrl + 1" \
        >> "${utemp}"

    command cat "${utemp}" \
        > "${proppath}"

    command rm -f "${utemp}"
    command termux-reload-settings

    __setconf__ "shortcut-previous-session" "default"
    echo -e "${B}[*] ${N}Resetting shortcut previous session"

    command cat "${proppath}" | \
        command grep -vE '^\s*shortcut.rename-session = *' \
        > "${utemp}"

    echo -e "# shortcut.rename-session = ctrl + n" \
        >> "${utemp}"

    command cat "${utemp}" \
        > "${proppath}"

    command rm -f "${utemp}"
    command termux-reload-settings

    __setconf__ "shortcut-rename-session" "default"
    echo -e "${B}[*] ${N}Resetting shortcut rename session"
    return 0
}

# Copyright (c) 2026 Zeronetsec