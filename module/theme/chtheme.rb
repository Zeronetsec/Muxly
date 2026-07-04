# https://github.com/Zeronetsec/Muxly

require 'fileutils'
require 'utils/color'
require 'utils/variable'
require 'utils/setconf'
require 'utils/missing_argument'

module Chtheme
    def self.execute(args)
        args.shift
        theme_name = args.first

        if theme_name.nil? ||
            theme_name.strip.empty?
                MissingArgument.execute()
                exit(1)
        end

        root_path = File.expand_path('../../', __dir__)
        theme_source = File.join(
            root_path, "style", "theme", theme_name,
        )

        unless File.exist?(theme_source)
            printf(
                "%s[!] %sInvalid theme style: %s%s%s\n",
                Color.R, Color.N, Color.GG, theme_name, Color.N,
            )
            exit(1)
        end

        target_path = Variable.ThPath
        if File.exist?(target_path) ||
            File.symlink?(target_path)
                begin
                    File.unlink(target_path)
                rescue
                    FileUtils.rm_rf(target_path)
                end
        end

        begin
            File.symlink(theme_source, target_path)
        rescue => e
            printf(
                "%s[!] %sFailed to link theme: %s%s%s\n",
                Color.R, Color.N, Color.GG, e.message, Color.N,
            )
            exit(1)
        end

        system("termux-reload-settings")
        SetConf.execute("theme-style", theme_name)
        printf(
            "%s[*] %sChange theme style: %s%s%s\n",
            Color.B, Color.N, Color.GG, theme_name, Color.N,
        )
    end
end

# Copyright (c) 2026 Zeronetsec