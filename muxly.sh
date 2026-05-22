#!/usr/bin/env bash
# https://github.com/Zeronetsec/Muxly

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
)' || exit 1

input="${1}"

case "${input}" in
    "")
        utils::invalidInput
        exit $?
        ;;
    "--info")
        utils::general::Info
        exit $?
        ;;
    "--chfont")
        utils::font::Chfont "${2}"
        exit $?
        ;;
    "--chtheme")
        utils::theme::Chtheme "${2}"
        exit $?
        ;;
    "--chcursor")
        utils::cursor::Chcursor "${2}"
        exit $?
        ;;
    "--chcursor-blink-rate")
        utils::cursor::ChcursorBlinkRate "${2}"
        exit $?
        ;;
    "--rootfs")
        export rfs="${2}"
        export -f utils::rootfs::Rootfs
        exec bash -c "utils::rootfs::Rootfs \"${rfs}\""
        ;;
    "--install-rootfs")
        utils::rootfs::InstallRootfs "${2}"
        exit $?
        ;;
    "--fullscreen")
        utils::screen::Fullscreen "${2}"
        exit $?
        ;;
    "--list-fonts")
        utils::font::ListFonts
        exit $?
        ;;
    "--list-themes")
        utils::theme::ListThemes "${2}"
        exit $?
        ;;
    "--list-rootfs")
        utils::rootfs::ListRootfs
        exit $?
        ;;
    "--list-installed-rootfs")
        utils::rootfs::ListInstalledRootfs
        exit $?
        ;;
    "--reset-font")
        utils::font::ResetFont
        exit $?
        ;;
    "--reset-theme")
        utils::theme::ResetTheme
        exit $?
        ;;
    "--reset-cursor")
        utils::cursor::ResetCursor
        exit $?
        ;;
    "--reset-cursor-blink-rate")
        utils::cursor::ResetCursorBlinkRate
        exit $?
        ;;
    "--shortcut-create-session")
        utils::shortcut::ShortcutCreateSession "${2}"
        exit $?
        ;;
    "--shortcut-next-session")
        utils::shortcut::ShortcutNextSession "${2}"
        exit $?
        ;;
    "--shortcut-previous-session")
        utils::shortcut::ShortcutPreviousSession "${2}"
        exit $?
        ;;
    "--shortcut-rename-session")
        utils::shortcut::ShortcutRenameSession "${2}"
        exit $?
        ;;
    "--reset-shortcut")
        utils::shortcut::ResetShortcut
        exit $?
        ;;
    "--volume-keys")
        utils::input::VolumeKeys "${2}"
        exit $?
        ;;
    "--disable-session-toast")
        utils::screen::DisableSessionToast "${2}"
        exit $?
        ;;
    "--transcript-rows")
        utils::screen::TranscriptRows "${2}"
        exit $?
        ;;
    "--fullscreen-workaround")
        utils::screen::FullscreenWorkaround "${2}"
        exit $?
        ;;
    "--force-black-ui")
        utils::theme::ForceBlackUI "${2}"
        exit $?
        ;;
    "--reset-transcript-rows")
        utils::screen::ResetTranscriptRows
        exit $?
        ;;
    "--remove-rootfs")
        utils::rootfs::RemoveRootfs "${2}"
        exit $?
        ;;
    "--reset-rootfs")
        utils::rootfs::ResetRootfs "${2}"
        exit $?
        ;;
    "--rootfs-command")
        utils::rootfs::RootfsCommand "${2}" "${3}"
        exit $?
        ;;
    "--symlink")
        utils::rootfs::Symlink "${2}" "${3}"
        exit $?
        ;;
    "--help")
        utils::general::Help
        exit $?
        ;;
    "--version")
        utils::general::Version
        exit $?
        ;;
    "--uwu")
        printf '\033[?25l'
        utils::general::Uwu
        ex=$?
        printf '\033[?25h'
        exit $ex
        ;;
    *)
        utils::unknownCommand "${input}"
        exit $?
        ;;
esac

# Copyright (c) 2026 Zeronetsec