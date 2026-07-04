# https://github.com/Zeronetsec/Muxly

require 'utils/color'

module ListFonts
    def self.execute(*)
        root_path = File.expand_path("../..", __dir__)
        folder = File.join(root_path, "style", "font")

        unless Dir.exist?(folder)
            printf(
                "%s[!] %sFolder: %s%s %snot found!\n",
                Color.R, Color.N, Color.GG, folder, Color.N,
            )
            exit(1)
        end

        fonts = Dir.children(folder).sort
        printf(
            "%s[*] %sList available fonts style:\n",
            Color.B, Color.N,
        )

        fonts.each do |font_file|
            font_name = File.basename(font_file, '.ttf')
            printf(
                "%s* %s%s%s\n",
                Color.DG, Color.GG, font_name, Color.N,
            )
        end
    end
end

# Copyright (c) 2026 Zeronetsec