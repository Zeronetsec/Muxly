# https://github.com/Zeronetsec/Muxly

module Color
    def N = "\x1b[0m".freeze
    def R = "\x1b[1;31m".freeze
    def B = "\x1b[1;34m".freeze
    def DG = "\x1b[1;90m".freeze
    def GG = "\x1b[0;32m".freeze
    def CC = "\x1b[0;36m".freeze
    def WW = "\x1b[0;37m".freeze
    module_function(
        :N, :R, :B, :DG, :GG, :CC, :WW,
    )
end

# Copyright (c) 2026 Zeronetsec