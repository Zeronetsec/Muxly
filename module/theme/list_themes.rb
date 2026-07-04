# https://github.com/Zeronetsec/Muxly

require 'utils/color'

module ListThemes
    def self.execute(*)
        root_path = File.expand_path('../../', __dir__)
        theme_dir = File.join(root_path, "style", "theme")

        unless File.directory?(theme_dir)
            printf(
                "%s[!] %sFolder: %s%s %snot found!\n",
                Color.R, Color.N, Color.GG, theme_dir, Color.N,
            )
            exit(1)
        end

        begin
            themes = Dir.children(theme_dir).sort
        rescue => e
            printf(
                "%s[!] %sFailed to read themes directory: %s%s%s\n",
                Color.R, Color.N, Color.GG, e.message, Color.N,
            )
            exit(1)
        end

        printf(
            "%s[*] %sList available themes style:\n",
            Color.B, Color.N,
        )

        themes.each do |theme_file|
            theme_name = File.basename(theme_file, ".*")
            printf(
                "%s* %s%s%s\n",
                Color.DG, Color.GG, theme_name, Color.N,
            )
        end
    end
end

# Copyright (c) 2026 Zeronetsec