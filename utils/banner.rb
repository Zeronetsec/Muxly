# https://github.com/Zeronetsec/Muxly

require 'utils/color'

module Banner
    def self.execute(*)
        file_path = File.expand_path(
            "../data/banner.txt",
            __dir__,
        )

        if File.exist?(file_path)
            content = File.read(file_path)
            printf(
                "%s%s%s\n",
                Color.B, content, Color.N,
            )
        else
            printf(
                "%s[!] %sFile: %s%s %snot found!\n",
                Color.R, Color.N, Color.GG, file_path, Color.N,
            )
        end
    end
end

# Copyright (c) 2026 Zeronetsec