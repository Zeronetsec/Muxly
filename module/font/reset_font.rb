# https://github.com/Zeronetsec/Muxly

require 'utils/color'
require 'utils/setconf'

module ResetFont
    def self.execute(*)
        unless File.exist?(Variable.FontPath) ||
            File.symlink?(Variable.FontPath)
                printf(
                    "%s[!] %sFile: %s%s %snot found!\n",
                    Color.R, Color.N, Color.GG, Variable.FontPath, Color.N,
                )
                exit(1)
        end

        begin
            File.unlink(Variable.FontPath)
        rescue StandardError
            nil
        end

        system("termux-reload-settings")
        SetConf.execute("font-style", "default")
        printf(
            "%s[*] %sResetting font style\n",
            Color.B, Color.N,
        )
    end
end

# Copyright (c) 2026 Zeronetsec