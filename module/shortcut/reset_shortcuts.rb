# https://github.com/Zeronetsec/Muxly

require 'utils/color'
require 'utils/variable'
require 'utils/setconf'

module ResetShortcuts
    def self.execute(*)
        unless File.exist?(Variable.PropPath)
            printf(
                "%s[!] %sFile: %s%s %snot found!\n",
                Color.R, Color.N, Color.GG, Variable.PropPath, Color.N,
            )
            exit(1)
        end

        lines = File.readlines(Variable.PropPath)
        lines.reject! {
            |line| line =~ /^\s*shortcut\.(create|next|previous|rename)-session\s*=/
        }

        lines << "# shortcut.create-session = ctrl + t\n"
        lines << "# shortcut.next-session = ctrl + 2\n"
        lines << "# shortcut.previous-session = ctrl + 1\n"
        lines << "# shortcut.rename-session = ctrl + n\n"

        File.write(Variable.PropPath, lines.join)
        system("termux-reload-settings")
        shortcuts = [
            {
                key: "shortcut-create-session",
                msg: "Resetting shortcut create session"
            },

            {
                key: "shortcut-next-session",
                msg: "Resetting shortcut next session"
            },

            {
                key: "shortcut-previous-session",
                msg: "Resetting shortcut previous session"
            },

            {
                key: "shortcut-rename-session",
                msg: "Resetting shortcut rename session"
            },
        ]

        shortcuts.each do |shortcut|
            SetConf.execute(shortcut[:key], "default")
            printf(
                "%s[*] %s%s\n",
                Color.B, Color.N, shortcut[:msg],
            )
        end
    end
end

# Copyright (c) 2026 Zeronetsec