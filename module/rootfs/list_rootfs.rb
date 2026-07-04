# https://github.com/Zeronetsec/Muxly

require 'utils/color'
require 'utils/variable'

module ListRootfs
    def self.execute(*)
        root_path = File.expand_path("../..", __dir__)
        rfs_folder = File.join(root_path, "rootfs")

        unless Dir.exist?(rfs_folder)
            printf(
                "%s[!] %sFolder: %s%s %snot found!\n",
                Color.R, Color.N, Color.GG, rfs_folder, Color.N,
            )
            exit(1)
        end

        available_fs = Dir.children(rfs_folder).sort
        printf(
            "%s[*] %sList available rootfs:\n",
            Color.B, Color.N,
        )

        available_fs.each do |fs_name|
            printf(
                "%s* %s%s%s\n",
                Color.DG, Color.GG, fs_name, Color.N,
            )
        end
    end
end

# Copyright (c) 2026 Zeronetsec