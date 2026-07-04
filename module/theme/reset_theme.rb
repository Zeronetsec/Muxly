# https://github.com/Zeronetsec/Muxly

require 'utils/color'
require 'utils/variable'
require 'utils/setconf'

module ResetTheme
    def self.execute(*)
        target_path = Variable.ThPath
        unless File.exist?(target_path) ||
            File.symlink?(target_path)
                printf(
                    "%s[!] %sFile: %s%s %snot found!\n",
                    Color.R, Color.N, Color.GG, target_path, Color.N,
                )
                exit(1)
        end

        begin
            File.unlink(target_path)
        rescue => e
            printf(
                "%s[!] %sFailed to unlink theme: %s%s%s\n",
                Color.R, Color.N, Color.GG, e.message, Color.N,
            )
            exit(1)
        end

        system("termux-reload-settings")
        SetConf.execute("theme-style", "default")
        printf(
            "%s[*] %sResetting theme style\n",
            Color.B, Color.N,
        )
    end
end

# Copyright (c) 2026 Zeronetsec