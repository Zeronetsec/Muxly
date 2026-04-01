# Muxly Project

function __info__() {
    local terminal_cursor_style="$(__getconf__ "terminal-cursor-style")"
    local font_style="$(__getconf__ "font-style")"
    local theme_style="$(__getconf__ "theme-style")"
    local rootfs_installed="$(command ls "${rfspath}/" 2>/dev/null | command wc -l)"
    local terminal_cursor_blink_rate="$(__getconf__ "terminal-cursor-blink-rate")"
    local fullscreen="$(__getconf__ "fullscreen")"
    local shortcut_create_session="$(__getconf__ "shortcut-create-session")"
    local shortcut_next_session="$(__getconf__ "shortcut-next-session")"
    local shortcut_previous_session="$(__getconf__ "shortcut-previous-session")"
    local shortcut_rename_session="$(__getconf__ "shortcut-rename-session")"
    local volume_keys="$(__getconf__ "volume-keys")"
    local disable_session_toast="$(__getconf__ "disable-session-toast")"
    local transcript_rows="$(__getconf__ "transcript-rows")"
    local fullscreen_workaround="$(__getconf__ "fullscreen-workaround")"
    local force_black_ui="$(__getconf__ "force-black-ui")"

    echo -e "${B}[*] ${N}Muxly configuration info:"
    echo -e "${WW}Fullscreen: ${GG}${fullscreen}${N}"
    echo -e "${WW}Fullscreen workaround: ${GG}${fullscreen_workaround}${N}"
    echo -e "${WW}Disable session toast: ${GG}${disable_session_toast}${N}"
    echo -e "${WW}Transcript rows: ${GG}${transcript_rows}${N}"
    echo -e "${WW}Cursor style: ${GG}${terminal_cursor_style}${N}"
    echo -e "${WW}Cursor blink rate: ${GG}${terminal_cursor_blink_rate}${N}"
    echo -e "${WW}Font: ${GG}${font_style}${N}"
    echo -e "${WW}Theme: ${GG}${theme_style}${N}"
    echo -e "${WW}Force black ui: ${GG}${force_black_ui}${N}"
    echo -e "${WW}Shortcut create session: ${GG}${shortcut_create_session}${N}"
    echo -e "${WW}Shortcut next session: ${GG}${shortcut_next_session}${N}"
    echo -e "${WW}Shortcut previous session: ${GG}${shortcut_previous_session}${N}"
    echo -e "${WW}Shortcut rename session: ${GG}${shortcut_rename_session}${N}"
    echo -e "${WW}Volume keys: ${GG}${volume_keys}${N}"
    echo -e "${WW}Installed rootfs: ${GG}${rootfs_installed}${N}"

    return 0
}

# Copyright (c) 2026 Zeronetsec