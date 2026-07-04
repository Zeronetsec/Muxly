# https://github.com/Zeronetsec/Muxly

module Pd530
    def self.execute(args)
        args.shift
        exec("pd530", *args)
    end
end

# Copyright (c) 2026 Zeronetsec