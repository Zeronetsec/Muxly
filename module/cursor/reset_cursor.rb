# https://github.com/Zeronetsec/Muxly

require 'utils/color'
require 'utils/setconf'

module ResetCursor
    def self.execute(*)
        unless File.exist?(Variable.PropPath)
            printf(
                "%s[!] %sFile: %s%s %snot found!\n",
                Color.R, Color.N, Color.GG, Variable.PropPath, Color.N,
            )
            exit(1)
        end

        lines = File.readlines(
            Variable.PropPath,
        ).reject do |line|
            line.match?(/^\s*terminal-cursor-style\s*=/)
        end

        lines << "# terminal-cursor-style = block\n"
        File.write(Variable.PropPath, lines.join)
        system("termux-reload-settings")

        printf("\x1b[2 q")
        SetConf.execute("terminal-cursor-style", "default")
        printf(
            "%s[*] %sResetting cursor style\n",
            Color.B, Color.N,
        )
    end
end

# Copyright (c) 2026 Zeronetsec