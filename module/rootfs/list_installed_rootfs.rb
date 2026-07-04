# https://github.com/Zeronetsec/Muxly

require 'utils/color'
require 'utils/variable'

module ListInstalledRootfs
    def self.execute(*)
        unless Dir.exist?(Variable.RfsPath)
            printf(
                "%s[!] %sFolder: %s%s %snot found!\n",
                Color.R, Color.N, Color.GG, Variable.RfsPath, Color.N,
            )
            exit(1)
        end

        installed = Dir.children(
            Variable.RfsPath,
        ).sort

        if installed.empty?
            printf(
                "%s[*] %sNo rootfs installed\n",
                Color.B, Color.N,
            )
            exit(0)
        end

        printf(
            "%s[*] %sList installed rootfs:\n",
            Color.B, Color.N,
        )

        installed.each do |distro|
            printf(
                "%s* %s%s%s\n",
                Color.DG, Color.GG, distro, Color.N,
            )
        end
    end
end

# Copyright (c) 2026 Zeronetsec