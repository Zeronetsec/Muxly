# https://github.com/Zeronetsec/Muxly

require 'date'
require 'utils/color'

module Birthday
    def self.execute(*)
        birth_date = "01-04"
        today = Time.now.strftime("%m-%d")
        if today == birth_date
            printf(
                "%s› %sHappy birthday for %sMuxly %s🎉\n",
                Color.R, Color.N, Color.GG, Color.N,
            )
            printf("\n")
        end
    end
end

# Copyright (c) 2026 Zeronetsec