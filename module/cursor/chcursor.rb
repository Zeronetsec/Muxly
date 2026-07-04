# https://github.com/Zeronetsec/Muxly

require 'utils/color'
require 'utils/setconf'
require 'utils/missing_argument'

module Chcursor
    def self.execute(args)
        args.shift
        style = args.first

        unless File.exist?(Variable.PropPath)
            printf(
                "%s[!] %sFile: %s%s %snot found!\n",
                Color.R, Color.N, Color.GG, Variable.PropPath, Color.N,
            )
            exit(1)
        end

        if style.nil? ||
            style.strip.empty?
                MissingArgument.execute()
                exit(1)
        end

        unless [
            "block",
            "underline",
            "bar",
        ].include?(style)
            printf(
                "%s[!] %sInvalid cursor style: %s%s%s\n",
                Color.R, Color.N, Color.GG, style, Color.N,
            )
            exit(1)
        end

        lines = File.readlines(
            Variable.PropPath,
        ).reject do |line|
            line.match?(/^\s*terminal-cursor-style\s*=/)
        end

        lines << "terminal-cursor-style = #{style}\n"
        File.write(Variable.PropPath, lines.join)
        system("termux-reload-settings")

        case style
            when "block"
                print "\x1b[2 q"
            when "underline"
                print "\x1b[4 q"
            when "bar"
                print "\x1b[6 q"
        end

        SetConf.execute("terminal-cursor-style", style)
        printf(
            "%s[*] %sChange cursor style: %s%s%s\n",
            Color.B, Color.N, Color.GG, style, Color.N,
        )
    end
end

# Copyright (c) 2026 Zeronetsec