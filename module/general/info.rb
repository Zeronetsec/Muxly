# https://github.com/Zeronetsec/Muxly

require 'utils/color'
require 'utils/variable'
require 'utils/getconf'

module Info
    def self.execute(*)
        fullscreen = GetConf.execute(
            "fullscreen",
        )

        fullscreen_workaround = GetConf.execute(
            "fullscreen-workaround",
        )

        disable_session_toast = GetConf.execute(
            "disable-session-toast",
        )

        transcript_rows = GetConf.execute(
            "transcript-rows",
        )

        terminal_cursor_style = GetConf.execute(
            "terminal-cursor-style",
        )

        terminal_cursor_blink_rate = GetConf.execute(
            "terminal-cursor-blink-rate",
        )

        font_style = GetConf.execute(
            "font-style",
        )

        theme_style = GetConf.execute(
            "theme-style",
        )

        force_black_ui = GetConf.execute(
            "force-black-ui",
        )

        shortcut_create_session = GetConf.execute(
            "shortcut-create-session",
        )

        shortcut_next_session = GetConf.execute(
            "shortcut-next-session",
        )

        shortcut_previous_session = GetConf.execute(
            "shortcut-previous-session",
        )

        shortcut_rename_session = GetConf.execute(
            "shortcut-rename-session",
        )

        volume_keys = GetConf.execute(
            "volume-keys",
        )

        rootfs_installed = 0
        if Dir.exist?(Variable.RfsPath)
            rootfs_installed = Dir.children(
                Variable.RfsPath,
            ).count
        end

        printf(
            "%s[*] %sMuxly configuration info:\n",
            Color.B, Color.N,
        )

        printf(
            "%sFullscreen: %s%s%s\n",
            Color.WW, Color.GG,
            fullscreen, Color.N,
        )

        printf(
            "%sFullscreen workaround: %s%s%s\n",
            Color.WW, Color.GG,
            fullscreen_workaround, Color.N,
        )

        printf(
            "%sDisable session toast: %s%s%s\n",
            Color.WW, Color.GG,
            disable_session_toast, Color.N,
        )

        printf(
            "%sTranscript rows: %s%s%s\n",
            Color.WW, Color.GG,
            transcript_rows, Color.N,
        )

        printf(
            "%sCursor style: %s%s%s\n",
            Color.WW, Color.GG,
            terminal_cursor_style, Color.N,
        )

        printf(
            "%sCursor blink rate: %s%s%s\n",
            Color.WW, Color.GG,
            terminal_cursor_blink_rate, Color.N,
        )

        printf(
            "%sFont: %s%s%s\n",
            Color.WW, Color.GG,
            font_style, Color.N,
        )

        printf(
            "%sTheme: %s%s%s\n",
            Color.WW, Color.GG,
            theme_style, Color.N,
        )

        printf(
            "%sForce black ui: %s%s%s\n",
            Color.WW, Color.GG,
            force_black_ui, Color.N,
        )

        printf(
            "%sShortcut create session: %s%s%s\n",
            Color.WW, Color.GG,
            shortcut_create_session, Color.N,
        )

        printf(
            "%sShortcut next session: %s%s%s\n",
            Color.WW, Color.GG,
            shortcut_next_session, Color.N,
        )

        printf(
            "%sShortcut previous session: %s%s%s\n",
            Color.WW, Color.GG,
            shortcut_previous_session, Color.N,
        )

        printf(
            "%sShortcut rename session: %s%s%s\n",
            Color.WW, Color.GG,
            shortcut_rename_session, Color.N,
        )

        printf(
            "%sVolume keys: %s%s%s\n",
            Color.WW, Color.GG,
            volume_keys, Color.N,
        )

        printf(
            "%sInstalled rootfs: %s%s%s\n",
            Color.WW, Color.GG,
            rootfs_installed, Color.N,
        )
    end
end

# Copyright (c) 2026 Zeronetsec