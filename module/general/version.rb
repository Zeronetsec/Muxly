# https://github.com/Zeronetsec/Muxly

require 'utils/color'

module Version
    def self.execute(*)
        name = "Muxly".freeze
        version = "v0.1".freeze
        creator = "Zeronetsec".freeze
        homepage = "https://github.com/Zeronetsec/Muxly".freeze

        printf(
            "%sName: %s%s%s\n",
            Color.N, Color.GG, name, Color.N,
        )

        printf(
            "%sVersion: %s%s%s\n",
            Color.N, Color.GG, version, Color.N,
        )

        printf(
            "%sCreator: %s%s%s\n",
            Color.N, Color.GG, creator, Color.N,
        )

        printf(
            "%sHomepage: %s%s%s\n",
            Color.N, Color.GG, homepage, Color.N,
        )
    end
end

# Copyright (c) 2026 Zeronetsec