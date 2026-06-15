#!/usr/bin/env bash
# https://github.com/Zeronetsec/Muxly

set -o errexit

src="${BASH_SOURCE[0]}"
while [[ -h "${src}" ]]; do
    dir="$(
        cd -P "$(
            command dirname "${src}"
        )" > /dev/null 2>&1 && pwd
    )"
    src="$(command readlink "${src}")"
    [[ "${src}" != /* ]] && src="${dir}/${src}"
done

dir="$(
    cd -P "$(
        command dirname "${src}"
    )" > /dev/null 2>&1 && pwd
)"

export root="${dir}"
readonly root

source "${root}/utils/include.sh"
include : '(
    utils/variable
    utils/color
    utils/varlock
    utils/setconf
    utils/getconf
    utils/birthday
    utils/banner
    utils/invalid_option
    utils/missing_argument
    module/cursor/chcursor
    module/cursor/chcursor_blink_rate
    module/cursor/reset_cursor
    module/cursor/reset_cursor_blink_rate
    module/font/chfont
    module/font/list_fonts
    module/font/reset_font
    module/general/help
    module/general/info
    module/general/uwu
    module/general/version
    module/rootfs/install_rootfs
    module/rootfs/list_installed_rootfs
    module/rootfs/list_rootfs
    module/rootfs/rootfs
    module/rootfs/remove_rootfs
    module/rootfs/reset_rootfs
    module/rootfs/rootfs_command
    module/rootfs/symlink
    module/screen/fullscreen
    module/screen/transcript_rows
    module/screen/disable_session_toast
    module/screen/fullscreen_workaround
    module/screen/reset_transcript_rows
    module/shortcut/shortcut_create_session
    module/shortcut/shortcut_next_session
    module/shortcut/shortcut_previous_session
    module/shortcut/shortcut_rename_session
    module/shortcut/reset_shortcuts
    module/theme/chtheme
    module/theme/list_themes
    module/theme/reset_theme
    module/theme/force_black_ui
    module/input/volume_keys
    utils/fnclock
)'

case "${1}" in
    "")
        utils::missingArgument
        ;;
    "--info")
        module::general::Info
        ;;
    "--chfont")
        module::font::Chfont "${@:2}"
        ;;
    "--chtheme")
        module::theme::Chtheme "${@:2}"
        ;;
    "--chcursor")
        module::cursor::Chcursor "${@:2}"
        ;;
    "--chcursor-blink-rate")
        module::cursor::ChcursorBlinkRate "${@:2}"
        ;;
    "--rootfs")
        export rfs="${@:2}"
        export -f module::rootfs::Rootfs
        export -f utils::missingArgument
        exec bash -c "module::rootfs::Rootfs \"${rfs}\""
        ;;
    "--install-rootfs")
        module::rootfs::InstallRootfs "${@:2}"
        ;;
    "--fullscreen")
        module::screen::Fullscreen "${@:2}"
        ;;
    "--list-fonts")
        module::font::ListFonts
        ;;
    "--list-themes")
        module::theme::ListThemes "${@:2}"
        ;;
    "--list-rootfs")
        module::rootfs::ListRootfs
        ;;
    "--list-installed-rootfs")
        module::rootfs::ListInstalledRootfs
        ;;
    "--reset-font")
        module::font::ResetFont
        ;;
    "--reset-theme")
        module::theme::ResetTheme
        ;;
    "--reset-cursor")
        module::cursor::ResetCursor
        ;;
    "--reset-cursor-blink-rate")
        module::cursor::ResetCursorBlinkRate
        ;;
    "--shortcut-create-session")
        module::shortcut::ShortcutCreateSession "${@:2}"
        ;;
    "--shortcut-next-session")
        module::shortcut::ShortcutNextSession "${@:2}"
        ;;
    "--shortcut-previous-session")
        module::shortcut::ShortcutPreviousSession "${@:2}"
        ;;
    "--shortcut-rename-session")
        module::shortcut::ShortcutRenameSession "${@:2}"
        ;;
    "--reset-shortcuts")
        module::shortcut::ResetShortcuts
        ;;
    "--volume-keys")
        module::input::VolumeKeys "${@:2}"
        ;;
    "--disable-session-toast")
        module::screen::DisableSessionToast "${@:2}"
        ;;
    "--transcript-rows")
        module::screen::TranscriptRows "${@:2}"
        ;;
    "--fullscreen-workaround")
        module::screen::FullscreenWorkaround "${@:2}"
        ;;
    "--force-black-ui")
        module::theme::ForceBlackUI "${@:2}"
        ;;
    "--reset-transcript-rows")
        module::screen::ResetTranscriptRows
        ;;
    "--remove-rootfs")
        module::rootfs::RemoveRootfs "${@:2}"
        ;;
    "--reset-rootfs")
        module::rootfs::ResetRootfs "${@:2}"
        ;;
    "--rootfs-command")
        module::rootfs::RootfsCommand "${@:2}"
        ;;
    "--symlink")
        module::rootfs::Symlink "${@:2}"
        ;;
    "--help")
        module::general::Help
        ;;
    "--version")
        module::general::Version
        ;;
    "--uwu")
        printf '\x1b[?25l'
        module::general::Uwu
        printf '\x1b[?25h'
        ;;
    *)
        utils::invalidOption "${1}"
        ;;
esac

# Copyright (c) 2026 Zeronetsec