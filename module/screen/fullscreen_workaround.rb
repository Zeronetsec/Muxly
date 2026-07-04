# https://github.com/Zeronetsec/Muxly

require 'utils/color'
require 'utils/variable'
require 'utils/setconf'
require 'utils/missing_argument'

module FullscreenWorkaround
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
            "true",
            "false",
        ].include?(value)
            printf(
                "%s[!] %sInvalid value: %s%s%s\n",
                Color.R, Color.N, Color.GG, value, Color.N,
            )
            exit(1)
        end

        lines = File.readlines(Variable.PropPath)
        lines.reject! {
            |line| line =~ /^\s*use-fullscreen-workaround\s*=/
        }

        lines << "use-fullscreen-workaround = #{value}\n"
        File.write(Variable.PropPath, lines.join)
        system("termux-reload-settings")

        SetConf.execute("fullscreen-workaround", value)
        printf(
            "%s[*] %sChange fullscreen workaround: %s%s%s\n",
            Color.B, Color.N, Color.GG, value, Color.N,
        )

        printf(
            "%s[*] %sThis may not take effect if %sfullscreen %sis %sfalse%s\n",
            Color.B, Color.N, Color.GG, Color.N, Color.GG, Color.N,
        )
    end
end

# Copyright (c) 2026 Zeronetsec