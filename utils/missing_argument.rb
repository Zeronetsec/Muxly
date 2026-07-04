# https://github.com/Zeronetsec/Muxly

require 'utils/color'

module MissingArgument
    def self.execute(*)
        printf(
            "%s[!] %sMissing argument!\n",
            Color.R, Color.N,
        )

        printf(
            "%s[!] %sTry: %smuxly --help%s\n",
            Color.R, Color.N, Color.GG, Color.N,
        )
    end
end

# Copyright (c) 2026 Zeronetsec