# https://github.com/Zeronetsec/Muxly

require 'utils/color'
require 'utils/variable'
require 'utils/setconf'
require 'utils/missing_argument'

module VolumeKeys
    def self.execute(args)
        args.shift
        mode = args.first

        unless File.exist?(Variable.PropPath)
            printf(
                "%s[!] %sFile: %s%s %snot found!\n",
                Color.R, Color.N, Color.GG, Variable.PropPath, Color.N,
            )
            exit(1)
        end

        if mode.nil? ||
            mode.strip.empty?
                MissingArgument.execute()
                exit(1)
        end

        lines = File.readlines(
            Variable.PropPath,
        ).reject do |line|
            line.match?(/^\s*volume-keys\s*=/)
        end

        lines << "volume-keys = #{mode}\n"
        File.write(Variable.PropPath, lines.join)
        system("termux-reload-settings")

        SetConf.execute("volume-keys", mode)
        printf(
            "%s[*] %sChange volume keys: %s%s%s\n",
            Color.B, Color.N, Color.GG, mode, Color.N,
        )
    end
end

# Copyright (c) 2026 Zeronetsec