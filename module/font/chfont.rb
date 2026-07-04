# https://github.com/Zeronetsec/Muxly

require 'fileutils'
require 'utils/color'
require 'utils/setconf'
require 'utils/missing_argument'

module Chfont
    def self.execute(args)
        args.shift
        font_name = args.first

        root_path = File.expand_path("../..", __dir__)
        source_font = File.join(
            root_path, "style",
            "font", "#{font_name}.ttf",
        )

        if File.exist?(Variable.FontPath) ||
            File.symlink?(Variable.FontPath)
                begin
                    File.unlink(Variable.FontPath)
                rescue StandardError
                    File.delete(Variable.FontPath) rescue nil
                end
        end

        if font_name.nil?( ) ||
            font_name.strip.empty?( )
                MissingArgument.execute()
                exit(1)
        end

        unless File.exist?(source_font)
            printf(
                "%s[!] %sInvalid font style: %s%s%s\n",
                Color.R, Color.N, Color.GG, font_name, Color.N,
            )
            exit(1)
        end

        FileUtils.ln_sf(source_font, Variable.FontPath)
        system("termux-reload-settings")

        SetConf.execute("font-style", font_name)
        printf(
            "%s[*] %sChange font style: %s%s%s\n",
            Color.B, Color.N, Color.GG, font_name, Color.N,
        )
    end
end

# Copyright (c) 2026 Zeronetsec