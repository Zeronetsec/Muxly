# https://github.com/Zeronetsec/Muxly

require 'utils/color'
require 'utils/variable'
require 'utils/setconf'
require 'utils/missing_argument'

module ShortcutRenameSession
    def self.execute(args)
        args.shift
        shortcut_key = args.first

        unless File.exist?(Variable.PropPath)
            printf(
                "%s[!] %sFile: %s%s %snot found!\n",
                Color.R, Color.N, Color.GG, Variable.PropPath, Color.N,
            )
            exit(1)
        end

        if shortcut_key.nil? ||
            shortcut_key.strip.empty?
                MissingArgument.execute()
                exit(1)
        end

        lines = File.readlines(Variable.PropPath)
        lines.reject! {
            |line| line =~ /^\s*shortcut\.rename-session\s*=/
        }

        lines << "shortcut.rename-session = #{shortcut_key}\n"
        File.write(Variable.PropPath, lines.join)
        system("termux-reload-settings")

        SetConf.execute("shortcut-rename-session", shortcut_key)
        printf(
            "%s[*] %sChange shortcut rename session: %s%s%s\n",
            Color.B, Color.N, Color.GG, shortcut_key, Color.N,
        )
    end
end

# Copyright (c) 2026 Zeronetsec