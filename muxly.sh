#!/usr/bin/env bash
# https://github.com/Zeronetsec/Muxly

set -o errexit

src="${BASH_SOURCE[0]}"
while [[ -h "${src}" ]]; do
    dir="$(
        cd -P "$(
            command dirname "${src}"
        )" >/dev/null 2>&1 && pwd
    )"

    src="$(command readlink "${src}")"
    [[ "${src}" != /* ]] && src="${dir}/${src}"
done

dir="$(
    cd -P "$(
        command dirname "${src}"
    )" >/dev/null 2>&1 && pwd
)"

export muxlyroot="${dir}"
readonly muxlyroot

source "${muxlyroot}/utils/include.sh"

include : '(
    utils/variable
    utils/color
    utils/varlock
    utils/setconf
    utils/getconf
    utils/birthday
    utils/invalid_input
    utils/missing_arguments
    utils/unknown_command
    utils/cursor/chcursor
    utils/cursor/chcursor_blink_rate
    utils/cursor/reset_cursor
    utils/cursor/reset_cursor_blink_rate
    utils/font/chfont
    utils/font/list_fonts
    utils/font/reset_font
    utils/general/help
    utils/general/info
    utils/general/uwu
    utils/general/version
    utils/rootfs/install_rootfs
    utils/rootfs/list_installed_rootfs
    utils/rootfs/list_rootfs
    utils/rootfs/rootfs
    utils/rootfs/remove_rootfs
    utils/rootfs/reset_rootfs
    utils/rootfs/rootfs_command
    utils/rootfs/symlink
    utils/screen/fullscreen
    utils/screen/transcript_rows
    utils/screen/disable_session_toast
    utils/screen/fullscreen_workaround
    utils/screen/reset_transcript_rows
    utils/shortcut/shortcut_create_session
    utils/shortcut/shortcut_next_session
    utils/shortcut/shortcut_previous_session
    utils/shortcut/shortcut_rename_session
    utils/shortcut/reset_shortcut
    utils/theme/chtheme
    utils/theme/list_themes
    utils/theme/reset_theme
    utils/theme/force_black_ui
    utils/input/volume_keys
    utils/fnclock
)'

input="${1}"
case "${input}" in
    "")
        utils::invalidInput
        ;;
    "--info")
        utils::general::Info
        ;;
    "--chfont")
        utils::font::Chfont "${2}"
        ;;
    "--chtheme")
        utils::theme::Chtheme "${2}"
        ;;
    "--chcursor")
        utils::cursor::Chcursor "${2}"
        ;;
    "--chcursor-blink-rate")
        utils::cursor::ChcursorBlinkRate "${2}"
        ;;
    "--rootfs")
        export rfs="${2}"
        export -f utils::rootfs::Rootfs
        exec bash -c "utils::rootfs::Rootfs \"${rfs}\""
        ;;
    "--install-rootfs")
        utils::rootfs::InstallRootfs "${2}"
        ;;
    "--fullscreen")
        utils::screen::Fullscreen "${2}"
        ;;
    "--list-fonts")
        utils::font::ListFonts
        ;;
    "--list-themes")
        utils::theme::ListThemes "${2}"
        ;;
    "--list-rootfs")
        utils::rootfs::ListRootfs
        ;;
    "--list-installed-rootfs")
        utils::rootfs::ListInstalledRootfs
        ;;
    "--reset-font")
        utils::font::ResetFont
        ;;
    "--reset-theme")
        utils::theme::ResetTheme
        ;;
    "--reset-cursor")
        utils::cursor::ResetCursor
        ;;
    "--reset-cursor-blink-rate")
        utils::cursor::ResetCursorBlinkRate
        ;;
    "--shortcut-create-session")
        utils::shortcut::ShortcutCreateSession "${2}"
        ;;
    "--shortcut-next-session")
        utils::shortcut::ShortcutNextSession "${2}"
        ;;
    "--shortcut-previous-session")
        utils::shortcut::ShortcutPreviousSession "${2}"
        ;;
    "--shortcut-rename-session")
        utils::shortcut::ShortcutRenameSession "${2}"
        ;;
    "--reset-shortcut")
        utils::shortcut::ResetShortcut
        ;;
    "--volume-keys")
        utils::input::VolumeKeys "${2}"
        ;;
    "--disable-session-toast")
        utils::screen::DisableSessionToast "${2}"
        ;;
    "--transcript-rows")
        utils::screen::TranscriptRows "${2}"
        ;;
    "--fullscreen-workaround")
        utils::screen::FullscreenWorkaround "${2}"
        ;;
    "--force-black-ui")
        utils::theme::ForceBlackUI "${2}"
        ;;
    "--reset-transcript-rows")
        utils::screen::ResetTranscriptRows
        ;;
    "--remove-rootfs")
        utils::rootfs::RemoveRootfs "${2}"
        ;;
    "--reset-rootfs")
        utils::rootfs::ResetRootfs "${2}"
        ;;
    "--rootfs-command")
        utils::rootfs::RootfsCommand "${2}" "${3}"
        ;;
    "--symlink")
        utils::rootfs::Symlink "${2}" "${3}"
        ;;
    "--help")
        utils::general::Help
        ;;
    "--version")
        utils::general::Version
        ;;
    "--uwu")
        printf '\033[?25l'
        utils::general::Uwu
        printf '\033[?25h'
        ;;
    *)
        utils::unknownCommand "${input}"
        ;;
esac

# Copyright (c) 2026 Zeronetsec