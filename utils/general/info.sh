# https://github.com/Zeronetsec/Muxly

function utils::general::Info() {
    local terminal_cursor_style="$(utils::getconf "terminal-cursor-style")"
    local font_style="$(utils::getconf "font-style")"
    local theme_style="$(utils::getconf "theme-style")"
    local rootfs_installed="$(command ls "${rfspath}/" 2>/dev/null | command wc -l)"
    local terminal_cursor_blink_rate="$(utils::getconf "terminal-cursor-blink-rate")"
    local fullscreen="$(utils::getconf "fullscreen")"
    local shortcut_create_session="$(utils::getconf "shortcut-create-session")"
    local shortcut_next_session="$(utils::getconf "shortcut-next-session")"
    local shortcut_previous_session="$(utils::getconf "shortcut-previous-session")"
    local shortcut_rename_session="$(utils::getconf "shortcut-rename-session")"
    local volume_keys="$(utils::getconf "volume-keys")"
    local disable_session_toast="$(utils::getconf "disable-session-toast")"
    local transcript_rows="$(utils::getconf "transcript-rows")"
    local fullscreen_workaround="$(utils::getconf "fullscreen-workaround")"
    local force_black_ui="$(utils::getconf "force-black-ui")"

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