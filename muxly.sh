#!/usr/bin/env bash
# Muxly Project

src="${BASH_SOURCE[0]}"
while [[ -h "$src" ]]; do
    dir="$(
        cd -P "$(
            command dirname "$src"
        )" >/dev/null 2>&1 && pwd
    )"

    src="$(command readlink "$src")"
    [[ "$src" != /* ]] && src="$dir/$src"
done

dir="$(
    cd -P "$(
        command dirname "$src"
    )" >/dev/null 2>&1 && pwd
)"

export muxlyroot="${dir}"
export config="${muxlyroot}/config/config.conf"
export proppath="${HOME}/.termux/termux.properties"
export rfspath="${PREFIX}/var/lib/proot-distro/installed-rootfs"
export cfgtmp="${PREFIX}/tmp/muxly_config_temporary.tmp"
export utemp="${PREFIX}/tmp/muxly_utils_temporary.tmp"
export fontpath="${HOME}/.termux/font.ttf"
export thpath="${HOME}/.termux/colors.properties"

input="${1}"
require=(
    "utils/color"
    "utils/setconf"
    "utils/getconf"
    "utils/cursor/chcursor"
    "utils/cursor/chcursor_blink_rate"
    "utils/cursor/reset_cursor"
    "utils/cursor/reset_cursor_blink_rate"
    "utils/font/chfont"
    "utils/font/list_fonts"
    "utils/font/reset_font"
    "utils/general/help"
    "utils/general/info"
    "utils/general/uwu"
    "utils/general/version"
    "utils/rootfs/install_rootfs"
    "utils/rootfs/list_installed_rootfs"
    "utils/rootfs/list_rootfs"
    "utils/rootfs/rootfs"
    "utils/rootfs/remove_rootfs"
    "utils/rootfs/reset_rootfs"
    "utils/screen/fullscreen"
    "utils/screen/transcript_rows"
    "utils/screen/disable_session_toast"
    "utils/screen/fullscreen_workaround"
    "utils/screen/reset_transcript_rows"
    "utils/shortcut/shortcut_create_session"
    "utils/shortcut/shortcut_next_session"
    "utils/shortcut/shortcut_previous_session"
    "utils/shortcut/shortcut_rename_session"
    "utils/shortcut/reset_shortcut"
    "utils/theme/chtheme"
    "utils/theme/list_themes"
    "utils/theme/reset_theme"
    "utils/theme/force_black_ui"
    "utils/input/volume_keys"
)

for i in "${require[@]}"; do
    source "${muxlyroot}/${i}.sh"
done

case "${input}" in
    "")
        echo -e "${R}[!] ${N}Invalid input!"
        echo -e "${R}[!] ${N}Try: ${GG}muxly --help${N}"
        exit 1
        ;;
    "--info")
        __info__
        exit $?
        ;;
    "--chfont")
        __chfont__ "${2}"
        exit $?
        ;;
    "--chtheme")
        __chtheme__ "${2}"
        exit $?
        ;;
    "--chcursor")
        __chcursor__ "${2}"
        exit $?
        ;;
    "--chcursor-blink-rate")
        __chcursor_blink_rate__ "${2}"
        exit $?
        ;;
    "--rootfs")
        export rfs="${2}"
        export -f __rootfs__
        exec bash -c "__rootfs__ \"${rfs}\""
        ;;
    "--install-rootfs")
        __install_rootfs__ "${2}"
        exit $?
        ;;
    "--fullscreen")
        __fullscreen__ "${2}"
        exit $?
        ;;
    "--list-fonts")
        __list_fonts__
        exit $?
        ;;
    "--list-themes")
        __list_themes__ "${2}"
        exit $?
        ;;
    "--list-rootfs")
        __list_rootfs__
        exit $?
        ;;
    "--list-installed-rootfs")
        __list_installed_rootfs__
        exit $?
        ;;
    "--reset-font")
        __reset_font__
        exit $?
        ;;
    "--reset-theme")
        __reset_theme__
        exit $?
        ;;
    "--reset-cursor")
        __reset_cursor__
        exit $?
        ;;
    "--reset-cursor-blink-rate")
        __reset_cursor_blink_rate__
        exit $?
        ;;
    "--shortcut-create-session")
        __shortcut_create_session__ "${2}"
        exit $?
        ;;
    "--shortcut-next-session")
        __shortcut_next_session__ "${2}"
        exit $?
        ;;
    "--shortcut-previous-session")
        __shortcut_previous_session__ "${2}"
        exit $?
        ;;
    "--shortcut-rename-session")
        __shortcut_rename_session__ "${2}"
        exit $?
        ;;
    "--reset-shortcut")
        __reset_shortcut__
        exit $?
        ;;
    "--volume-keys")
        __volume_keys__ "${2}"
        exit $?
        ;;
    "--disable-session-toast")
        __disable_session_toast__ "${2}"
        exit $?
        ;;
    "--transcript-rows")
        __transcript_rows__ "${2}"
        exit $?
        ;;
    "--fullscreen-workaround")
        __fullscreen_workaround__ "${2}"
        exit $?
        ;;
    "--force-black-ui")
        __force_black_ui__ "${2}"
        exit $?
        ;;
    "--reset-transcript-rows")
        __reset_transcript_rows__
        exit $?
        ;;
    "--remove-rootfs")
        __remove_rootfs__ "${2}"
        exit $?
        ;;
    "--reset-rootfs")
        __reset_rootfs__ "${2}"
        exit $?
        ;;
    "--help")
        __help__
        exit 0
        ;;
    "--version")
        __version__
        exit 0
        ;;
    "--uwu")
        printf '\033[?25l'
        __uwu__
        printf '\033[?25h'
        exit 0
        ;;
    *)
        echo -e "${R}[!] ${N}Unknown options: ${GG}${input}${N}"
        echo -e "${R}[!] ${N}Try: ${GG}muxly --help${N}"
        exit 1
        ;;
esac

# Copyright (c) 2026 Zeronetsec