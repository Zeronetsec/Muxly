# https://github.com/Zeronetsec/Muxly

require 'utils/color'
require 'utils/variable'
require 'utils/setconf'

module ResetTranscriptRows
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
            |line| line =~ /^\s*terminal-transcript-rows\s*=/
        }

        lines << "# terminal-transcript-rows = 2000\n"
        File.write(Variable.PropPath, lines.join)
        system("termux-reload-settings")

        SetConf.execute("transcript-rows", "default")
        printf(
            "%s[*] %sResetting transcript rows\n",
            Color.B, Color.N,
        )
    end
end

# Copyright (c) 2026 Zeronetsec