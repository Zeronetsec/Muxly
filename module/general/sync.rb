# https://github.com/Zeronetsec/Muxly

require 'utils/color'
require 'utils/variable'
require 'module/screen/fullscreen'
require 'module/screen/disable_session_toast'
require 'module/screen/transcript_rows'
require 'module/screen/reset_transcript_rows'
require 'module/screen/fullscreen_workaround'
require 'module/cursor/chcursor'
require 'module/cursor/reset_cursor'
require 'module/cursor/chcursor_blink_rate'
require 'module/cursor/reset_cursor_blink_rate'
require 'module/font/chfont'
require 'module/font/reset_font'
require 'module/theme/chtheme'
require 'module/theme/reset_theme'
require 'module/theme/force_black_ui'
require 'module/shortcut/shortcut_create_session'
require 'module/shortcut/shortcut_next_session'
require 'module/shortcut/shortcut_previous_session'
require 'module/shortcut/shortcut_rename_session'
require 'module/shortcut/reset_shortcuts'
require 'module/input/volume_keys'

module Sync
    def self.execute(*)
        config_path = Variable.Config
        unless File.exist?(config_path)
            printf(
                "%s[!] %sConfig file: %s%s %snot found!\n",
                Color.R, Color.N, Color.GG, config_path, Color.N,
            )
            exit(1)
        end

        printf(
            "%s[*] %sStarting synchronization from config...\n",
            Color.B, Color.N,
        )

        config_data = {}
        File.readlines(config_path).each do |line|
            next if line.strip.empty? ||
                line.strip.start_with?('#')

            if match = line.match(
                /^\s*([^=]+?)\s*=\s*(.+?)\s*$/,
            )
                key = match[1]
                val = match[2]
                config_data[key] = val
            end
        end

        resval = "<sync::reset>"
        ressc = false
        config_data.each do |key, val|
            next if val.downcase == "default"
            case key
                when "fullscreen"
                    Fullscreen.execute(["sync", val])

                when "terminal-cursor-style"
                    if val.downcase == resval
                        ResetCursor.execute()
                    else
                        Chcursor.execute(["sync", val])
                    end

                when "terminal-cursor-blink-rate"
                    if val.downcase == resval
                        ResetCursorBlinkRate.execute()
                    else
                        ChcursorBlinkRate.execute(["sync", val])
                    end

                when "font-style"
                    if val.downcase == resval
                        ResetFont.execute()
                    else
                        Chfont.execute(["sync", val])
                    end

                when "theme-style"
                    if val.downcase == resval
                        ResetTheme.execute()
                    else
                        Chtheme.execute(["sync", val])
                    end

                when "shortcut-create-session"
                    if val.downcase == resval
                        ressc = true
                    else
                        ShortcutCreateSession.execute(["sync", val])
                    end

                when "shortcut-next-session"
                    if val.downcase == resval
                        ressc = true
                    else
                        ShortcutNextSession.execute(["sync", val])
                    end

                when "shortcut-previous-session"
                    if val.downcase == resval
                        ressc = true
                    else
                        ShortcutPreviousSession.execute(["sync", val])
                    end

                when "shortcut-rename-session"
                    if val.downcase == resval
                        ressc = true
                    else
                        ShortcutRenameSession.execute(["sync", val])
                    end

                when "volume-keys"
                    VolumeKeys.execute(["sync", val])

                when "disable-session-toast"
                    DisableSessionToast.execute(["sync", val])

                when "transcript-rows"
                    if val.downcase == resval
                        ResetTranscriptRows.execute()
                    else
                        TranscriptRows.execute(["sync", val])
                    end

                when "fullscreen-workaround"
                    FullscreenWorkaround.execute(["sync", val])

                when "force-black-ui"
                    ForceBlackUI.execute(["sync", val])

                else
                    printf(
                        "%s[!] %sUnrecognized config key: %s%s %s(%svalue: %s%s%s)%s\n",
                        Color.R, Color.N, Color.GG, key, Color.DG,
                        Color.WW, Color.CC, val, Color.DG, Color.N,
                    )
            end
        end
        if ressc == true
            ResetShortcuts.execute()
        end

        printf(
            "%s[*] %sSync complete...\n",
            Color.B, Color.N,
        )
    end
end

# Copyright (c) 2026 Zeronetsec