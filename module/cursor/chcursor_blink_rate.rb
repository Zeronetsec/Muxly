# https://github.com/Zeronetsec/Muxly

require 'utils/color'
require 'utils/setconf'
require 'utils/missing_argument'

module ChcursorBlinkRate
    def self.execute(args)
        args.shift
        rate_str = args.first

        unless File.exist?(Variable.PropPath)
            printf(
                "%s[!] %sFile: %s%s %snot found!\n",
                Color.R, Color.N, Color.GG, Variable.PropPath, Color.N,
            )
            exit(1)
        end

        if rate_str.nil? ||
            rate_str.strip.empty?
                MissingArgument.execute()
                exit(1)
        end

        rate = rate_str.to_i
        if rate < 0 ||
            rate > 2000 ||
            rate_str.match?(/\D/)
                printf(
                    "%s[!] %sInvalid value: %s%s%s\n",
                    Color.R, Color.N, Color.GG, rate_str, Color.N,
                )

                printf(
                    "%s[!] %sAvailable blink rate: %s0 %s- %s2000%s\n",
                    Color.R, Color.N, Color.GG, Color.DG, Color.GG, Color.N,
                )
                exit(1)
        end

        lines = File.readlines(
            Variable.PropPath,
        ).reject do |line|
            line.match?(/^\s*terminal-cursor-blink-rate\s*=/)
        end

        lines << "terminal-cursor-blink-rate = #{rate}\n"
        File.write(Variable.PropPath, lines.join)
        system("termux-reload-settings")

        SetConf.execute("terminal-cursor-style-blink-rate", rate_str)
        printf(
            "%s[*] %sChange cursor blink rate: %s%s%s\n",
            Color.B, Color.N, Color.GG, rate_str, Color.N,
        )
    end
end

# Copyright (c) 2026 Zeronetsec