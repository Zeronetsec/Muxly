# https://github.com/Zeronetsec/Muxly

require 'utils/color'
require 'utils/variable'
require 'utils/setconf'
require 'utils/missing_argument'

module TranscriptRows
    def self.execute(args)
        args.shift
        value_str = args.first

        unless File.exist?(Variable.PropPath)
            printf(
                "%s[!] %sFile: %s%s %snot found!\n",
                Color.R, Color.N, Color.GG, Variable.PropPath, Color.N,
            )
            exit(1)
        end

        if value_str.nil? ||
            value_str.strip.empty?
                MissingArgument.execute()
                exit(1)
        end

        unless value_str =~ /^\d+$/ &&
            value_str.to_i.between?(1, 50000)
                printf(
                    "%s[!] %sInvalid value: %s%s%s\n",
                    Color.R, Color.N, Color.GG, value_str, Color.N,
                )

                printf(
                    "%s[!] %sAvailable: %s1 %s- %s50000%s\n",
                    Color.R, Color.N, Color.GG, Color.DG, Color.GG, Color.N,
                )
                exit(1)
        end

        value_int = value_str.to_i
        lines = File.readlines(Variable.PropPath)
        lines.reject! {
            |line| line =~ /^\s*terminal-transcript-rows\s*=/
        }

        lines << "terminal-transcript-rows = #{value_int}\n"
        File.write(Variable.PropPath, lines.join)
        system("termux-reload-settings")

        SetConf.execute("transcript-rows", value_str)
        printf(
            "%s[*] %sChange transcript rows: %s%s%s\n",
            Color.B, Color.N, Color.GG, value_str, Color.N,
        )
    end
end

# Copyright (c) 2026 Zeronetsec