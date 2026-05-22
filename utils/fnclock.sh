# https://github.com/Zeronetsec/Muxly

readonly -f utils::birthday
readonly -f utils::getconf
readonly -f utils::setconf
readonly -f utils::invalidInput
readonly -f utils::unknownCommand
readonly -f utils::missingArguments

readonly -f utils::cursor::Chcursor
readonly -f utils::cursor::ChcursorBlinkRate
readonly -f utils::cursor::ResetCursor
readonly -f utils::cursor::ResetCursorBlinkRate

readonly -f utils::font::Chfont
readonly -f utils::font::ListFonts
readonly -f utils::font::ResetFont

readonly -f utils::general::Help
readonly -f utils::general::Info
readonly -f utils::general::Uwu
readonly -f utils::general::Version

readonly -f utils::input::VolumeKeys

readonly -f utils::rootfs::InstallRootfs
readonly -f utils::rootfs::ListInstalledRootfs
readonly -f utils::rootfs::ListRootfs
readonly -f utils::rootfs::RemoveRootfs
readonly -f utils::rootfs::ResetRootfs
readonly -f utils::rootfs::Rootfs
readonly -f utils::rootfs::RootfsCommand
readonly -f utils::rootfs::Symlink

readonly -f utils::screen::DisableSessionToast
readonly -f utils::screen::Fullscreen
readonly -f utils::screen::FullscreenWorkaround
readonly -f utils::screen::ResetTranscriptRows
readonly -f utils::screen::TranscriptRows

readonly -f utils::shortcut::ResetShortcut
readonly -f utils::shortcut::ShortcutCreateSession
readonly -f utils::shortcut::ShortcutNextSession
readonly -f utils::shortcut::ShortcutPreviousSession
readonly -f utils::shortcut::ShortcutRenameSession

readonly -f utils::theme::Chtheme
readonly -f utils::theme::ForceBlackUI
readonly -f utils::theme::ListThemes
readonly -f utils::theme::ResetTheme

# Copyright (c) 2026 Zeronetsec