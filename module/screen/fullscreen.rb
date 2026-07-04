# https://github.com/Zeronetsec/Muxly

require 'utils/color'
require 'utils/variable'
require 'utils/setconf'
require 'utils/missing_argument'

module Fullscreen
    def self.execute(args)
        args.shift
        value = args.first

        unless File.exist?(Variable.PropPath)
            printf(
                "%s[!] %sFile: %s%s %snot found!\n",
                Color.R, Color.N, Color.GG, Variable.PropPath, Color.N,
            )
            exit(1)
        end

        if value.nil? ||
            value.strip.empty?
                MissingArgument.execute()
                exit(1)
        end

        unless [
            "true", "false",
        ].include?(value)
            printf(
                "%s[!] %sInvalid value: %s%s%s\n",
                Color.R, Color.N, Color.GG, value, Color.N,
            )
            exit(1)
        end

        lines = File.readlines(Variable.PropPath)
        lines.reject! {
            |line| line =~ /^\s*fullscreen\s*=/
        }

        lines << "fullscreen = #{value}\n"
        File.write(Variable.PropPath, lines.join)

        system("termux-reload-settings")
        SetConf.execute("fullscreen", value)
        printf(
            "%s[*] %sChange fullscreen mode: %s%s\n",
            Color.B, Color.N, Color.GG, value,
        )

        printf(
            "%s[*] %sPlease reload your termux\n",
            Color.B, Color.N,
        )
    end
end

# Copyright (c) 2026 Zeronetsec