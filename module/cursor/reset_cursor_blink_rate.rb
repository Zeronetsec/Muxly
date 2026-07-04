# https://github.com/Zeronetsec/Muxly

require 'utils/color'
require 'utils/setconf'

module ResetCursorBlinkRate
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
            line.match?(/^\s*terminal-cursor-blink-rate\s*=/)
        end

        lines << "# terminal-cursor-blink-rate = 0\n"
        File.write(Variable.PropPath, lines.join)
        system("termux-reload-settings")

        SetConf.execute("terminal-cursor-blink-rate", "default")
        printf(
            "%s[*] %sResetting cursor blink rate\n",
            Color.B, Color.N,
        )
    end
end

# Copyright (c) 2026 Zeronetsec